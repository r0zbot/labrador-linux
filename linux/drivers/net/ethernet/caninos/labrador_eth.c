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

#define MODNAME "labrador-eth"
#define DRV_VERSION "1.00"


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
    unsigned int        skblen[ENET_TX_DESC];
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

static int labrador_eth_drv_remove(struct platform_device *pdev)
{
    INFO_MSG("labrador_eth_drv_remove!");
}

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


    return 0;
    
err_out_unregister_netdev:
    unregister_netdev(ndev);
err_out_dma_unmap:
    if (!use_iram_for_net(&pldat->pdev->dev) ||
        pldat->dma_buff_size > lpc32xx_return_iram_size())
        dma_free_coherent(&pldat->pdev->dev, pldat->dma_buff_size,
                  pldat->dma_buff_base_v,
                  pldat->dma_buff_base_p);
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
