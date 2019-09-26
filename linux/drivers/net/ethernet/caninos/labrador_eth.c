/*
 * drivers/net/ethernet/nxp/lpc_eth.c
 *
 * Author: Kevin Wells <kevin.wells@nxp.com>
 *
 * Copyright (C) 2010 NXP Semiconductors
 * Copyright (C) 2012 Roland Stigge <stigge@antcom.de>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 */

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/sched.h>
#include <linux/slab.h>
#include <linux/delay.h>
#include <linux/interrupt.h>
#include <linux/errno.h>
#include <linux/ioport.h>
#include <linux/crc32.h>
#include <linux/platform_device.h>
#include <linux/spinlock.h>
#include <linux/ethtool.h>
#include <linux/mii.h>
#include <linux/clk.h>
#include <linux/workqueue.h>
#include <linux/netdevice.h>
#include <linux/etherdevice.h>
#include <linux/skbuff.h>
#include <linux/phy.h>
#include <linux/dma-mapping.h>
#include <linux/of.h>
#include <linux/of_net.h>
#include <linux/types.h>

#include <mach/clkname.h>

#define MODNAME "labrador-eth"
#define DRV_VERSION "1.00"

#define RX_RING_SIZE 64
#define TX_RING_SIZE 128 
#define ETH_PKG_MAX 1518

#define EC_BMODE_SWR (0x1) // software reset
#define EC_CACHETHR_CPTL(x) (((x) & 0xFF) << 24) // cache pause threshold level
#define EC_CACHETHR_CRTL(x) (((x) & 0xFF) << 16) // cache restart threshold level
#define EC_CACHETHR_PQT(x)  ((x) & 0xFFFF) // flow control pause quanta time
#define EC_FIFOTHR_FPTL(x) (((x) & 0xFFFF) << 16) // fifo pause threshold level
#define EC_FIFOTHR_FRTL(x) ((x) & 0xFFFF) // fifo restart threshold level
#define EC_FLOWCTRL_ENALL (0x1F << 27)
#define EC_OPMODE_FD  (0x1 << 9) // full duplex mode
#define EC_OPMODE_SPEED(x) (((x) & 0x3) << 16) // eth speed selection
#define EC_OPMODE_PR (0x1 << 6) // promiscuous mode
#define EC_OPMODE_ST (0x1 << 13) // start or stop transmit command
#define EC_OPMODE_SR (0x1 << 1) // start or stop receive command
#define EC_OPMODE_10M (0x1 << 17) // set when work on 10M, otherwise 100M
#define EC_IEN_ALL (0x1CDE3) // TU interrupt disabled
#define EC_TXPOLL_ST (0x1) // leave suspended mode to running mode to start xmit
#define EC_RXPOLL_SR (0x1) // leave suspended to running mode

#define LABRADOR_MAC_CTRL(x)  (x + 0x00B0)

#define LABRADOR_INT_STATUS(x)  (x + 0x0028) //CSR5
#define LABRADOR_MAC_CSR6(x)  (x + 0x0030)
#define LABRADOR_INT_ENABLE(x)  (x + 0x0038) //CSR7
#define LABRADOR_MAC_CSR10(x)  (x + 0x0050)
#define LABRADOR_MAC_CSR11(x)  (x + 0x0058)
#define LABRADOR_MAC_CSR18(x)  (x + 0x0090)
#define LABRADOR_MAC_CSR19(x)  (x + 0x0098)
#define LABRADOR_MAC_CSR20(x)  (x + 0x00A0)

#define INFO_MSG(fmt,...) pr_info(MODNAME ": " fmt, ##__VA_ARGS__)
#define ERR_MSG(fmt,...) pr_err(MODNAME ": " fmt, ##__VA_ARGS__)

/*
 * Device driver data structure
 */
struct netdata_local {
    struct platform_device  *pdev;
    struct net_device   *ndev;
    spinlock_t      lock;
    void __iomem        *net_base;
    u32         msg_enable;
    // unsigned int        skblen[ENET_TX_DESC];
    unsigned int        last_tx_idx;
    unsigned int        num_used_tx_buffs;
    struct mii_bus      *mii_bus;
    struct clk      *clk;
    dma_addr_t      dma_buff_base_p;
    void            *dma_buff_base_v;
    size_t          dma_buff_size;
    struct txrx_desc_t  *tx_desc_v;
    u32         *tx_stat_v;
    void            *tx_buff_v;
    struct txrx_desc_t  *rx_desc_v;
    struct rx_status_t  *rx_stat_v;
    void            *rx_buff_v;
    int         link;
    int         speed;
    int         duplex;
    struct napi_struct  napi;
};

/*
 * Structure of a TX/RX descriptors and RX status
 */
struct txrx_desc_t {
    __le32 packet;
    __le32 control;
};
struct rx_status_t {
    __le32 statusinfo;
    __le32 statushashcrc;
};

static int ethernet_mac_setup(void __iomem *regbase)
{
    // hardware soft reset and set bus mode
    INFO_MSG("ethernet_mac_setup");
    
    writel(readl(regbase) | EC_BMODE_SWR, regbase);
    
    do {
        udelay(10);
    } while (readl(regbase) & EC_BMODE_SWR);
    
    // select clk input from external phy

    writel(readl(LABRADOR_MAC_CTRL(regbase)) | (0x1 << 1), LABRADOR_MAC_CTRL(regbase));
    
    writel(0, LABRADOR_MAC_CSR10(regbase));
    
    writel(0xcc000000, LABRADOR_MAC_CSR10(regbase));
    
    // set flow control mode and force transmiter to pause about 100ms
    
    writel(EC_CACHETHR_CPTL(0x0) | EC_CACHETHR_CRTL(0x0) | 
               EC_CACHETHR_PQT(0x4FFF), LABRADOR_MAC_CSR18(regbase));
    
    writel(EC_FIFOTHR_FPTL(0x40) | EC_FIFOTHR_FRTL(0x10), LABRADOR_MAC_CSR19(regbase));
    
    writel(EC_FLOWCTRL_ENALL, LABRADOR_MAC_CSR20(regbase));
    
    // always set to work as full duplex because of a MAC bug
    
    writel(readl(LABRADOR_MAC_CSR6(regbase)) | EC_OPMODE_FD, LABRADOR_MAC_CSR6(regbase)); //Full-duplex
    
    writel(readl(LABRADOR_MAC_CSR6(regbase)) & ~EC_OPMODE_10M, LABRADOR_MAC_CSR6(regbase)); //100M
    
    writel(readl(LABRADOR_MAC_CSR6(regbase)) & (~EC_OPMODE_PR), LABRADOR_MAC_CSR6(regbase));
    
    //interrupt mitigation control register
    //NRP =7, RT =1, CS=0
    
    writel(0x004e0000, LABRADOR_MAC_CSR11(regbase));
    
    // stop tx and rx and disable interrupts
    
    writel(readl(LABRADOR_MAC_CSR6(regbase)) & (~(EC_OPMODE_ST | EC_OPMODE_SR)), LABRADOR_MAC_CSR6(regbase));
    writel(0, LABRADOR_INT_ENABLE(regbase));
    
    return 0;
}

static int labrador_eth_open(struct net_device *ndev)
{
    INFO_MSG("labrador_eth_open!");
    struct netdata_local *pldat = netdev_priv(ndev);
    int ret;

    if (netif_msg_ifup(pldat))
        dev_dbg(&pldat->pdev->dev, "enabling %s\n", ndev->name);

    ret = clk_prepare_enable(pldat->clk);
    if (ret)
        return ret;

    /* Suspended PHY makes LPC ethernet core block, so resume now */
    phy_resume(ndev->phydev);

    /* Reset and initialize */
    ethernet_mac_setup(pldat);

    /* schedule a link state check */
    phy_start(ndev->phydev);
    netif_start_queue(ndev);
    napi_enable(&pldat->napi);

    return 0;
}


static void labrador_eth_disable_int(void __iomem *regbase)
{
    INFO_MSG("labrador_eth_disable_int!");
    writel(0, LABRADOR_INT_ENABLE(regbase));
}

static irqreturn_t __labrador_eth_interrupt(int irq, void *dev_id)
{
    INFO_MSG("labrador_eth_drv_interrupt!");
    struct net_device *ndev = dev_id;
    struct netdata_local *pldat = netdev_priv(ndev);
    u32 tmp;

    spin_lock(&pldat->lock);

    tmp = readl(LABRADOR_INT_STATUS(pldat->net_base));
    /* Clear interrupts */
    writel(tmp, LABRADOR_INT_STATUS(pldat->net_base));
    
    labrador_eth_disable_int(pldat->net_base);
    if (likely(napi_schedule_prep(&pldat->napi)))
        __napi_schedule(&pldat->napi);

    spin_unlock(&pldat->lock);

    return IRQ_HANDLED;
}

static const struct ethtool_ops labrador_eth_ethtool_ops = {
    // .get_drvinfo    = labrador_eth_ethtool_getdrvinfo,
    // .get_msglevel    = labrador_eth_ethtool_getmsglevel,
    // .set_msglevel    = labrador_eth_ethtool_setmsglevel,
    // .get_link    = ethtool_op_get_link,
    // .get_link_ksettings = phy_ethtool_get_link_ksettings,
    // .set_link_ksettings = phy_ethtool_set_link_ksettings,
};

static const struct net_device_ops labrador_netdev_ops = {
    .ndo_open        = labrador_eth_open
    // .ndo_stop        = labrador_eth_close,
    // .ndo_start_xmit        = labrador_eth_hard_start_xmit,
    // .ndo_set_rx_mode    = labrador_eth_set_multicast_list,
    // .ndo_do_ioctl        = labrador_eth_ioctl,
    // .ndo_set_mac_address    = labrador_set_mac_address,
    // .ndo_validate_addr    = eth_validate_addr,
};

static int labrador_eth_drv_probe(struct platform_device *pdev)
{
    INFO_MSG("labrador_eth_drv_probe");
    struct resource *res;
    struct net_device *ndev;
    struct netdata_local *pldat;
    struct phy_device *phydev;
    dma_addr_t dma_handle;
    int irq, ret;
    u32 tmp;


    /* Get platform resources */
    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
    irq = platform_get_irq(pdev, 0);
    if (!res || irq < 0) {
        dev_err(&pdev->dev, "error getting resources.\n");
        ret = -ENXIO;
        goto err_exit;
    }

    /* Allocate net driver data structure */
    ndev = alloc_etherdev(sizeof(struct netdata_local));
    if (!ndev) {
        dev_err(&pdev->dev, "could not allocate device.\n");
        ret = -ENOMEM;
        goto err_exit;
    }

    SET_NETDEV_DEV(ndev, &pdev->dev);

    pldat = netdev_priv(ndev);
    pldat->pdev = pdev;
    pldat->ndev = ndev;

    spin_lock_init(&pldat->lock);

    /* Save resources */
    ndev->irq = irq;

    /* Get clock for the device */
    pldat->clk = clk_get(&pdev->dev, CLKNAME_CMUMOD_ETHERNET);
    if (IS_ERR    (pldat->clk)) {
        dev_err(&pdev->dev, "error getting clock.\n");
        ret = PTR_ERR(pldat->clk);
        goto err_out_free_dev;
    }

    /* Enable network clock */
    ret = clk_prepare_enable(pldat->clk);
    if (ret)
        goto err_out_clk_put;

    /* Map IO space */
    pldat->net_base = ioremap(res->start, resource_size(res));
    if (!pldat->net_base) {
        dev_err(&pdev->dev, "failed to map registers\n");
        ret = -ENOMEM;
        goto err_out_disable_clocks;
    }
    ret = request_irq(ndev->irq, __labrador_eth_interrupt, IRQF_TRIGGER_HIGH, ndev->name, ndev);
    if (ret) {
        dev_err(&pdev->dev, "error requesting interrupt.\n");
        goto err_out_iounmap;
    }

    // /* Setup driver functions */
    // ndev->netdev_ops = &labrador_netdev_ops;
    // ndev->ethtool_ops = &labrador_eth_ethtool_ops;
    // ndev->watchdog_timeo = msecs_to_jiffies(2500);

    //  Get size of DMA buffers/descriptors region 
    // pldat->dma_buff_size = (TX_RING_SIZE + RX_RING_SIZE) * (ETH_PKG_MAX +
    //     sizeof(struct txrx_desc_t) + sizeof(struct rx_status_t));
    // pldat->dma_buff_base_v = 0;

    return 0;
    
err_out_unregister_netdev:
    unregister_netdev(ndev);
// err_out_dma_unmap:
//     if (!use_iram_for_net(&pldat->pdev->dev) ||
//         pldat->dma_buff_size > lpc32xx_return_iram_size())
//         dma_free_coherent(&pldat->pdev->dev, pldat->dma_buff_size,
//                   pldat->dma_buff_base_v,
//                   pldat->dma_buff_base_p);
err_out_free_irq:
    free_irq(ndev->irq, ndev);
err_out_iounmap:
    iounmap(pldat->net_base);
err_out_disable_clocks:
    clk_disable_unprepare(pldat->clk);
err_out_clk_put:
    clk_put(pldat->clk);
err_out_free_dev:
    free_netdev(ndev);
err_exit:
    pr_err("%s: not found (%d).\n", MODNAME, ret);
    return ret;
}

static bool use_iram_for_net(struct device *dev)
{
    if (dev && dev->of_node)
        return of_property_read_bool(dev->of_node, "use-iram");
    return false;
}

static int labrador_eth_drv_remove(struct platform_device *pdev)
{
    INFO_MSG("labrador_eth_drv_remove!");
    struct net_device *ndev = platform_get_drvdata(pdev);
    struct netdata_local *pldat = netdev_priv(ndev);

    if (ndev == NULL) INFO_MSG("ndev NULL");
    if (pldat == NULL) INFO_MSG("pldat NULL");

    // unregister_netdev(ndev);

    // if (!use_iram_for_net(&pldat->pdev->dev) ||
    //     pldat->dma_buff_size > lpc32xx_return_iram_size())
    //     dma_free_coherent(&pldat->pdev->dev, pldat->dma_buff_size,
    //               pldat->dma_buff_base_v,
    //               pldat->dma_buff_base_p);
    INFO_MSG("free_irq");
    free_irq(ndev->irq, ndev);
    INFO_MSG("iounmap");
    iounmap(pldat->net_base);
    // mdiobus_unregister(pldat->mii_bus);
    // mdiobus_free(pldat->mii_bus);
    // clk_disable_unprepare(pldat->clk);
    // clk_put(pldat->clk);
    INFO_MSG("free_netdev");
    free_netdev(ndev);

    return 0;
}

#ifdef CONFIG_OF
static const struct of_device_id labrador_eth_match[] = {
    { .compatible = "caninos,labrador-eth" },
    { }
};
MODULE_DEVICE_TABLE(of, labrador_eth_match);
#endif

static struct platform_driver labrador_eth_driver = {
    .probe        = labrador_eth_drv_probe,
    .remove        = labrador_eth_drv_remove,
    .driver        = {
        .name    = MODNAME,
        .of_match_table = of_match_ptr(labrador_eth_match),
    },
};

module_platform_driver(labrador_eth_driver);

MODULE_AUTHOR("Bruno Carneiro <brunocarneirodacunha@usp.br>");
MODULE_AUTHOR("Daniel Martinez <danielsmartinez@usp.br>");
MODULE_AUTHOR("Edgar Bernardi Righi <>");
MODULE_DESCRIPTION("Labrador Ethernet Driver");
MODULE_LICENSE("GPL");
