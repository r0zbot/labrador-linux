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

#define ENET_RX_DESC 64
#define ENET_TX_DESC 128 
#define ENET_MAXF_SIZE 1518

#define NAPI_WEIGHT 16

/*
 * Ethernet MAC controller Register offsets
 */
#define LAB_ENET_BUSMODE(x)             (x + 0x0000)
#define LAB_ENET_TRANSMIT(x)            (x + 0x0008)
#define LAB_ENET_RECEIVE(x)             (x + 0x0010)
#define LAB_ENET_RXDESCRIPTOR(x)        (x + 0x0018)
#define LAB_ENET_TXDESCRIPTOR(x)        (x + 0x0020)
#define LAB_ENET_STATUS(x)              (x + 0x0028)
#define LAB_ENET_OPMODE(x)              (x + 0x0030)
#define LAB_ENET_INTENABLE(x)           (x + 0x0038)
#define LAB_ENET_OVERFLOW(x)            (x + 0x0040)
#define LAB_ENET_MII_MNGT(x)            (x + 0x0048)
#define LAB_ENET_MII_SERIAL_MNGT(x)     (x + 0x0050)
#define LAB_ENET_TIMER(x)               (x + 0x0058)
#define LAB_ENET_MAC_LOW(x)             (x + 0x0080)
#define LAB_ENET_MAC_HIGH(x)            (x + 0x0088)
#define LAB_ENET_CACHE_CTRL(x)          (x + 0x0090)
#define LAB_ENET_FIFO(x)                (x + 0x0098)
#define LAB_ENET_FLOW_CTRL(x)           (x + 0x00A0)
#define LAB_ENET_MAC_CTRL(x)            (x + 0x00B0)

/*
 * Bus Mode register definitions
 */
#define LAB_BUSMODE_RESET               (1 << 0)

/*
 * Transmit Poll register definitions
 */
#define LAB_TRANSMIT_ENABLE             (1 << 0)

/*
 * Receive Poll register definitions
 */
#define LAB_RECEIVE_ENABLE              (1 << 0)

/*
 * Status register definitions
 */
#define LAB_STATUS_TI_CLEAR             (1 << 0)
#define LAB_STATUS_TPS_CLEAR            (1 << 1)
#define LAB_STATUS_TU_CLEAR             (1 << 2)
#define LAB_STATUS_UNF_CLEAR            (1 << 5)
#define LAB_STATUS_RI_CLEAR             (1 << 6)
#define LAB_STATUS_RU_CLEAR             (1 << 7)
#define LAB_STATUS_RPS_CLEAR            (1 << 8)
#define LAB_STATUS_ETI_CLEAR            (1 << 10)
#define LAB_STATUS_GTE_CLEAR            (1 << 11)
#define LAB_STATUS_ERI_CLEAR            (1 << 14)
#define LAB_STATUS_AIS_CLEAR            (1 << 15)
#define LAB_STATUS_NIS_CLEAR            (1 << 16)

/*
 * Operation Mode register definitions
 */
#define LAB_OPMODE_RX_START             (1 << 1)
#define LAB_OPMODE_RX_STOP              (0 << 1)
#define LAB_OPMODE_PB_ENABLE            (1 << 3)
#define LAB_OPMODE_PB_DISABLE           (0 << 3)
#define LAB_OPMODE_PR_ENABLE            (1 << 6)
#define LAB_OPMODE_PR_DISABLE           (0 << 6)
#define LAB_OPMODE_PM_ENABLE            (1 << 7)
#define LAB_OPMODE_PM_DISABLE           (0 << 7)
#define LAB_OPMODE_FULL_DUPLEX          (1 << 9)
#define LAB_OPMODE_HALF_DUPLEX          (0 << 9)
#define LAB_OPMODE_LPBK_NORMAL          (0 << 10)
#define LAB_OPMODE_LPBK_INTERNAL        (1 << 10)
#define LAB_OPMODE_TX_START             (1 << 13)
#define LAB_OPMODE_TX_STOP              (0 << 13)
#define LAB_OPMODE_SPEED_10M            (1 << 17)
#define LAB_OPMODE_SPEED_100M           (0 << 17)
#define LAB_OPMODE_SF_ENABLE            (1 << 21)
#define LAB_OPMODE_SF_DISABLE           (0 << 21)
#define LAB_OPMODE_TTM_10M              (1 << 22)
#define LAB_OPMODE_TTM_100M             (0 << 22)
#define LAB_OPMODE_RCV_ALL_ENABLE       (1 << 30)
#define LAB_OPMODE_RCV_ALL_DISABLE      (0 << 30)

/*
 * Interrupt enable register definitions
 */
#define LAB_INTENABLE_TIE               (1 << 0)
#define LAB_INTENABLE_TSE               (1 << 1)
#define LAB_INTENABLE_TUE               (1 << 2)
#define LAB_INTENABLE_UNF               (1 << 5)
#define LAB_INTENABLE_RIE               (1 << 6)
#define LAB_INTENABLE_RUE               (1 << 7)
#define LAB_INTENABLE_RSE               (1 << 8)
#define LAB_INTENABLE_ETE               (1 << 10)
#define LAB_INTENABLE_GTE               (1 << 11)
#define LAB_INTENABLE_ERE               (1 << 14)
#define LAB_INTENABLE_AIE               (1 << 15)
#define LAB_INTENABLE_NIE               (1 << 16)

/*
 * MII Management and SROM register definitions
 */
#define LAB_MII_OPMODE_READ             (1 << 18)
#define LAB_MII_OPMODE_WRITE            (0 << 18)

/*
 * MII Serial Management register definitions
 */
#define LAB_MII_SERIAL_START            (1 << 31)
#define LAB_MII_SERIAL_BUSY             (1 << 31)
#define LAB_MII_SERIAL_FREE             (0 << 31)
#define LAB_MII_SERIAL_OPCODE_DISABLE   (0 << 26)
#define LAB_MII_SERIAL_OPCODE_WRITE     (1 << 26)
#define LAB_MII_SERIAL_OPCODE_READ      (2 << 26)
#define LAB_MII_SERIAL_OPCODE_CLOCKSET  (3 << 26)

/*
 * Pause time & Cache Threshold register definitions
 */
#define LAB_CACHE_CTRL_CPTL(x)          (((x) & 0xFF) << 24)
#define LAB_CACHE_CTRL_CRTL(x)          (((x) & 0xFF) << 16)
#define LAB_CACHE_CTRL_PQT(x)           ((x) & 0xFFFF)

/*
 * FIFO threshold register definitions
 */
#define LAB_FIFO_FPTL(x)                (((x) & 0xFFFF) << 16) 
#define LAB_FIFO_FRTL(x)                ((x) & 0xFFFF)

/*
 * Flow control setup & status register definitions
 */
#define LAB_FLOW_CTRL_BPE               (1 << 27)

/*
 * MAC CTRL register definitions
 */
#define LAB_MAC_CTRL_RMII               (0 << 0)
#define LAB_MAC_CTRL_SMII               (1 << 0)
#define LAB_MAC_REF_CLK_NORMAL          (0 << 1)
#define LAB_MAC_REF_CLK_INVERT          (1 << 1)
#define LAB_MAC_REF_CLK_INTERNAL        (0 << 8)
#define LAB_MAC_REF_CLK_EXTERNAL        (1 << 8)

/*
 * TX Descriptor definitions
 */
#define TX_DESC_STAT_OWN                (1 << 31)
#define TX_DESC_STAT_ES                 (1 << 15)      
#define TX_DESC_STAT_LO                 (1 << 11)      
#define TX_DESC_STAT_NC                 (1 << 10)
#define TX_DESC_STAT_LC                 (1 << 9)
#define TX_DESC_STAT_EC                 (1 << 8)  
#define TX_DESC_STAT_CC(x)              (((x) >> 3) & 0xF)
#define TX_DESC_STAT_UF                 (1 << 1)        
#define TX_DESC_STAT_DE                 (1 << 0)         
#define TX_DESC_CTRL_IC                 (1 << 31)
#define TX_DESC_CTRL_LS                 (1 << 30) 
#define TX_DESC_CTRL_FS                 (1 << 29)
#define TX_DESC_CTRL_SET                (1 << 27)
#define TX_DESC_CTRL_TER                (1 << 25)   
#define TX_DESC_CTRL_TBS1(x)            ((x) & 0x7FF)

/*
 * RX Descriptor definitions
 */
#define RX_DESC_STAT_OWN                (1 << 31)
#define RX_DESC_STAT_FF                 (1 << 30)       
#define RX_DESC_STAT_FL(x)              (((x) >> 16) & 0x3FFF)  
#define RX_DESC_STAT_ES                 (1 << 15)       
#define RX_DESC_STAT_DE                 (1 << 14)       
#define RX_DESC_STAT_RF                 (1 << 11)       
#define RX_DESC_STAT_MF                 (1 << 10)       
#define RX_DESC_STAT_FS                 (1 << 9)        
#define RX_DESC_STAT_LS                 (1 << 8)        
#define RX_DESC_STAT_TL                 (1 << 7)        
#define RX_DESC_STAT_CS                 (1 << 6)        
#define RX_DESC_STAT_FT                 (1 << 5)        
#define RX_DESC_STAT_RE                 (1 << 3)        
#define RX_DESC_STAT_DB                 (1 << 2)        
#define RX_DESC_STAT_CE                 (1 << 1)        
#define RX_DESC_CTRL_RER                (1 << 25) 
#define RX_DESC_CTRL_RBS1(x)            ((x) & 0x7FF) 

#define INFO_MSG(fmt,...) pr_info(MODNAME ": " fmt, ##__VA_ARGS__)
#define ERR_MSG(fmt,...) pr_err(MODNAME ": " fmt, ##__VA_ARGS__)


/*
 * Device driver data structure
 */
struct netdata_local {
    struct platform_device  *pdev;
    struct net_device       *ndev;
    char                    batata[16];
    spinlock_t              lock;
    void __iomem            *net_base;
    u32                     msg_enable;
    unsigned int            skblen[ENET_TX_DESC];
    unsigned int            last_tx_idx;
    unsigned int            txidx;
    unsigned int            num_used_tx_buffs;
    unsigned int            rxidx;
    struct mii_bus          *mii_bus;
    struct clk              *clk;
    dma_addr_t              dma_buff_base_p;
    void                    *dma_buff_base_v;
    size_t                  dma_buff_size;
    struct txrx_desc_t      *tx_desc_v;
    void                    *tx_buff_v;
    struct txrx_desc_t      *rx_desc_v;
    void                    *rx_buff_v;
    int                     link;
    int                     speed;
    int                     duplex;
    struct napi_struct      napi;
};

/*
 * Structure of a TX/RX descriptors and RX status
 */
struct txrx_desc_t {
    __le32 status;
    __le32 control;
    __le32 buf_addr1;
    __le32 buf_addr2;
};

static inline phys_addr_t 
__va_to_pa(void *addr, struct netdata_local *pldat)
{
    INFO_MSG("__va_to_pa");
    phys_addr_t phaddr;

    phaddr = addr - pldat->dma_buff_base_v;
    phaddr += pldat->dma_buff_base_p;

    return phaddr;
}

static void 
__labrador_params_setup(struct netdata_local *pldat)
{
    INFO_MSG("__labrador_params_setup");

    u32 tmp;

    tmp = readl(LAB_ENET_OPMODE(pldat->net_base));
    /* puts tx/rx processes in stopped states */
    writel(LAB_OPMODE_TX_STOP | LAB_OPMODE_RX_STOP | tmp, LAB_ENET_OPMODE(pldat));

    if (pldat->duplex == DUPLEX_FULL) 
        tmp |= LAB_OPMODE_FULL_DUPLEX;
    else 
        tmp |= LAB_OPMODE_FULL_DUPLEX;

    if (pldat->speed == SPEED_100)
        tmp |= LAB_OPMODE_SPEED_100M;
    else
        tmp |= LAB_OPMODE_SPEED_10M;

    /* puts tx/rx processes in running states */
    writel(LAB_OPMODE_TX_START | LAB_OPMODE_RX_START | tmp, LAB_ENET_OPMODE(pldat));
}

static int 
__labrador_mii_mngt_reset(struct netdata_local *pldat)
{
    INFO_MSG("__labrador_mii_mngt_reset");
    /* pode estar errado */
    writel(0, LAB_ENET_MII_SERIAL_MNGT(pldat->net_base));
    writel(0xcc000000, LAB_ENET_MII_SERIAL_MNGT(pldat->net_base));

    return 0;
}

static int 
labrador_mdio_reset(struct mii_bus *bus)
{
    INFO_MSG("labrador_mdio_reset");

    return __labrador_mii_mngt_reset((struct netdata_local *)bus->priv);
}


static phy_interface_t 
labrador_phy_interface_mode(struct device *dev)
{
    INFO_MSG("labrador_phy_interface_mode");

    if (dev && dev->of_node) {
        const char *mode = of_get_property(dev->of_node,
                           "phy-mode", NULL);
        if (mode && strcmp(mode, "smii") == 0)
            return PHY_INTERFACE_MODE_SMII;
    }
    return PHY_INTERFACE_MODE_RMII;
}

static void 
__labrador_eth_reset(struct netdata_local *pldat)
{
    INFO_MSG("__labrador_eth_reset");
    writel(readl(pldat->net_base) | LAB_BUSMODE_RESET, pldat->net_base);
    do {
        udelay(10);
    } while (readl(pldat->net_base) & LAB_BUSMODE_RESET);
}

static void 
labrador_eth_enable_int(void __iomem *regbase)
{
    INFO_MSG("labrador_eth_enable_int");

    writel(LAB_INTENABLE_TIE | LAB_INTENABLE_RIE | LAB_INTENABLE_NIE,
           LAB_ENET_INTENABLE(regbase));
}

/* Setup TX/RX descriptors */
static void 
__labrador_txrx_desc_setup(struct netdata_local *pldat)
{
    INFO_MSG("__labrador_txrx_desc_setup");

    void *tbuff;
    int i;
    struct txrx_desc_t *ptxrxdesc;

    tbuff = PTR_ALIGN(pldat->dma_buff_base_v, 16);

    /* Setup TX descriptors, status, and buffers */
    pldat->tx_desc_v = tbuff;
    tbuff += sizeof(struct txrx_desc_t) * ENET_TX_DESC;

    pldat->tx_buff_v = tbuff;
    tbuff += ENET_MAXF_SIZE * ENET_TX_DESC;

    tbuff = PTR_ALIGN(tbuff, 16);
    /* Setup RX descriptors, status, and buffers */
    pldat->rx_desc_v = tbuff;
    tbuff += sizeof(struct txrx_desc_t) * ENET_RX_DESC;

    pldat->rx_buff_v = tbuff;
    tbuff += ENET_MAXF_SIZE * ENET_RX_DESC;

    /* Map the TX descriptors to the TX buffers in hardware */
    for (i = 0; i < ENET_TX_DESC; i++) {
        ptxrxdesc = &pldat->tx_desc_v[i];
        ptxrxdesc->status = 0;
        ptxrxdesc->control = 0;
        ptxrxdesc->buf_addr1 = __va_to_pa(
                pldat->tx_buff_v + i * ENET_MAXF_SIZE, pldat);
        ptxrxdesc->buf_addr2 = 0;
    }

    /* Map the RX descriptors to the RX buffers in hardware */
    for (i = 0; i < ENET_RX_DESC; i++) {
        ptxrxdesc = &pldat->rx_desc_v[i];
        ptxrxdesc->status = 0;
        ptxrxdesc->control = 0;
        ptxrxdesc->buf_addr1 = __va_to_pa(
                pldat->rx_buff_v + i * ENET_MAXF_SIZE, pldat);
        ptxrxdesc->buf_addr2 = 0;
    }

    /* Setup base addresses in hardware to point to buffers and
     * descriptors
     */
    writel(__va_to_pa(pldat->tx_desc_v, pldat),
           LAB_ENET_TXDESCRIPTOR(pldat->net_base));
    writel(__va_to_pa(pldat->rx_desc_v, pldat),
           LAB_ENET_RXDESCRIPTOR(pldat->net_base));
}


static void 
labrador_eth_init(struct netdata_local *pldat)
{
    u32 tmp;
    INFO_MSG("labrador_eth_init");
    
    /* ref_clk phase invert */
    writel(readl(LAB_ENET_MAC_CTRL(pldat->net_base)) | LAB_MAC_REF_CLK_INVERT, 
           LAB_ENET_MAC_CTRL(pldat->net_base));

    __labrador_mii_mngt_reset(pldat);
    /* Setup TX and RX descriptors */
    __labrador_txrx_desc_setup(pldat);
    
    /* set flow control mode and force transmiter to pause about 100ms */
    writel(LAB_CACHE_CTRL_CPTL(0x0) | LAB_CACHE_CTRL_CRTL(0x0) | 
               LAB_CACHE_CTRL_PQT(0x4FFF), LAB_ENET_CACHE_CTRL(pldat->net_base));
    writel(LAB_FIFO_FPTL(0x40) | LAB_FIFO_FRTL(0x10), 
        LAB_ENET_FIFO(pldat->net_base));
    writel(LAB_FLOW_CTRL_BPE, LAB_ENET_FLOW_CTRL(pldat->net_base));

    __labrador_params_setup(pldat);

    /* Get the next TX buffer output index */
    pldat->num_used_tx_buffs = 0;
    pldat->last_tx_idx = 0;
    pldat->txidx = 0;
    pldat->rxidx = 0;

    /* interrupt mitigation control register
     * NRP =7, RT =1, CS=0
     */
    writel(0x004e0000, LAB_ENET_TIMER(pldat->net_base));

    /* Clear and enable interrupts */
    tmp = readl(LAB_ENET_STATUS(pldat->net_base));
    /* Clear interrupts */
    writel(tmp, LAB_ENET_STATUS(pldat->net_base));
    smp_wmb();
    labrador_eth_enable_int(pldat->net_base);

    /* Enable controller */
    writel(readl(LAB_ENET_OPMODE(pldat->net_base)) | LAB_OPMODE_TX_START | LAB_OPMODE_RX_START,
            LAB_ENET_OPMODE(pldat->net_base));
}

static int 
labrador_eth_open(struct net_device *ndev)
{
    struct netdata_local *pldat = netdev_priv(ndev);
    int ret;
    INFO_MSG("labrador_eth_open!");

    if (netif_msg_ifup(pldat))
        dev_dbg(&pldat->pdev->dev, "enabling %s\n", ndev->name);

    ret = clk_prepare_enable(pldat->clk);
    if (ret)
        return ret;

    /* Suspended PHY makes LPC ethernet core block, so resume now */
    phy_resume(ndev->phydev);

    /* Reset and initialize */
    __labrador_eth_reset(pldat);
    labrador_eth_init(pldat);

    /* schedule a link state check */
    phy_start(ndev->phydev);
    netif_start_queue(ndev);
    napi_enable(&pldat->napi);

    return 0;
}


static void 
labrador_eth_disable_int(void __iomem *regbase)
{
    INFO_MSG("labrador_eth_disable_int!");
    writel(0, LAB_ENET_INTENABLE(regbase));
}

static irqreturn_t 
__labrador_eth_interrupt(int irq, void *dev_id)
{
    struct net_device *ndev = dev_id;
    struct netdata_local *pldat = netdev_priv(ndev);
    u32 tmp;
    INFO_MSG("labrador_eth_drv_interrupt");

    spin_lock(&pldat->lock);

    tmp = readl(LAB_ENET_STATUS(pldat->net_base));
    /* Clear interrupts */
    writel(tmp, LAB_ENET_STATUS(pldat->net_base));
    
    labrador_eth_disable_int(pldat->net_base);
    if (likely(napi_schedule_prep(&pldat->napi)))
        __napi_schedule(&pldat->napi);

    spin_unlock(&pldat->lock);

    return IRQ_HANDLED;
}

static int 
labrador_eth_close(struct net_device *ndev)
{
    INFO_MSG("labrador_eth_close");

    unsigned long flags;
    struct netdata_local *pldat = netdev_priv(ndev);
    INFO_MSG("labrador_eth_close");

    if (netif_msg_ifdown(pldat))
        dev_dbg(&pldat->pdev->dev, "shutting down %s\n", ndev->name);

    napi_disable(&pldat->napi);
    netif_stop_queue(ndev);

    if (ndev->phydev)
        phy_stop(ndev->phydev);

    spin_lock_irqsave(&pldat->lock, flags);
    netif_stop_queue(ndev);
    netif_carrier_off(ndev);
    spin_unlock_irqrestore(&pldat->lock, flags);

    clk_disable_unprepare(pldat->clk);

    return 0;
}


static int 
labrador_eth_hard_start_xmit(struct sk_buff *skb, struct net_device *ndev)
{
    INFO_MSG("labrador_eth_hard_start_xmit");

    struct netdata_local *pldat = netdev_priv(ndev);
    struct txrx_desc_t *ptxrxdesc;

    spin_lock_irq(&pldat->lock);

    if (pldat->num_used_tx_buffs >= (ENET_TX_DESC - 1)) {
        /* This function should never be called when there are no
           buffers */
        netif_stop_queue(ndev);
        spin_unlock_irq(&pldat->lock);
        WARN(1, "BUG! TX request when no free TX buffers!\n");
        return NETDEV_TX_BUSY;
    } 

    /* Setup control for the transfer */
    ptxrxdesc = &pldat->tx_desc_v[pldat->txidx];
    ptxrxdesc->control = TX_DESC_CTRL_TBS1(skb->len);
    ptxrxdesc->control |= TX_DESC_CTRL_FS | TX_DESC_CTRL_LS | TX_DESC_CTRL_IC;
    mb();
    ptxrxdesc->status = TX_DESC_STAT_OWN;

    /* Copy data to the DMA buffer */
    memcpy(pldat->tx_buff_v + pldat->txidx * ENET_MAXF_SIZE, skb->data, skb->len);

    /* Save the buffer and increment the buffer counter */
    pldat->skblen[pldat->txidx] = skb->len;
    pldat->num_used_tx_buffs++;
    
    pldat->txidx++;
    if (pldat->txidx >= ENET_TX_DESC) {
        pldat->txidx = 0;
        ptxrxdesc->control |= TX_DESC_CTRL_TER;
    }

    /* Start transmit */
    writel(LAB_TRANSMIT_ENABLE, LAB_ENET_TRANSMIT(pldat->net_base));

    /* Stop queue if no more TX buffers */
    if (pldat->num_used_tx_buffs >= (ENET_TX_DESC - 1))
        netif_stop_queue(ndev);

out:    
    dev_kfree_skb(skb);
    spin_unlock_irq(&pldat->lock);

    return NETDEV_TX_OK;
}

/*
 * MAC support functions
 */
static int __labrador_set_mac(struct netdata_local *pldat, u8 *mac)
{
    INFO_MSG("__labrador_set_mac");

    u32 tmp;

    /* Set station address */
    tmp = mac[0] | ((u32)mac[1] << 8) | ((u32)mac[2] << 16) | ((u32)mac[3] << 24);
    writel(tmp, LAB_ENET_MAC_LOW(pldat->net_base));
    tmp = mac[4] | ((u32)mac[5] << 8);
    writel(tmp, LAB_ENET_MAC_HIGH(pldat->net_base));

    netdev_dbg(pldat->ndev, "Ethernet MAC address %pM\n", mac);
    return 0;
}

static int labrador_set_mac_address(struct net_device *ndev, void *p)
{
    INFO_MSG("labrador_set_mac_address");

    struct sockaddr *addr = p;
    struct netdata_local *pldat = netdev_priv(ndev);
    unsigned long flags;

    if (!is_valid_ether_addr(addr->sa_data))
        return -EADDRNOTAVAIL;
    memcpy(ndev->dev_addr, addr->sa_data, ETH_ALEN);

    spin_lock_irqsave(&pldat->lock, flags);

    /* Set station address */
    __labrador_set_mac(pldat, ndev->dev_addr);

    spin_unlock_irqrestore(&pldat->lock, flags);

    return 0;
}

static void __labrador_get_mac(struct netdata_local *pldat, u8 *mac)
{
    INFO_MSG("__labrador_get_mac");

    u32 tmp;

    /* Get station address */
    tmp = readl(LAB_ENET_MAC_LOW(pldat->net_base));
    mac[0] = tmp;
    mac[1] = tmp >> 8;
    mac[2] = tmp >> 16;
    mac[3] = tmp >> 24;
    tmp = readl(LAB_ENET_MAC_HIGH(pldat->net_base));
    // mac[4] = tmp & 0xFF;
    mac[4] = tmp;
    mac[5] = tmp >> 8;
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
    .ndo_open        = labrador_eth_open,
    .ndo_stop        = labrador_eth_close,
    .ndo_start_xmit  = labrador_eth_hard_start_xmit,
    //.ndo_set_rx_mode    = labrador_eth_set_multicast_list,
    // .ndo_do_ioctl        = labrador_eth_ioctl,
    .ndo_set_mac_address    = labrador_set_mac_address
    // .ndo_validate_addr    = eth_validate_addr,
};

static void 
__labrador_eth_shutdown(struct netdata_local *pldat)
{
    INFO_MSG("__labrador_eth_shutdown");


    /* Reset ethernet and power down PHY */
    __labrador_eth_reset(pldat);
    // writel(0, LPC_ENET_MAC1(pldat->net_base));
    // writel(0, LPC_ENET_MAC2(pldat->net_base));
}

static void 
__labrador_handle_xmit(struct net_device *ndev)
{
    INFO_MSG("__labrador_handle_xmit");

    struct netdata_local *pldat = netdev_priv(ndev);
    u32 txstat;

    while (pldat->last_tx_idx != pldat->txidx) {
        unsigned int skblen = pldat->skblen[pldat->last_tx_idx];

        /* Get buffer status */
        txstat = pldat->tx_desc_v[pldat->last_tx_idx].status;

        /* Next buffer and decrement used buffer counter */
        pldat->num_used_tx_buffs--;
        pldat->last_tx_idx++;
        if (pldat->last_tx_idx >= ENET_TX_DESC)
            pldat->last_tx_idx = 0;

        /* Update collision counter */
        ndev->stats.collisions += TX_DESC_STAT_CC(txstat);

        /* Any errors occurred? */
        if (txstat & TX_DESC_CTRL_LS & TX_DESC_STAT_ES) {
            if (txstat & TX_DESC_STAT_UF) {
                /* FIFO underrun */
                ndev->stats.tx_fifo_errors++;
            }
            if (txstat & TX_DESC_STAT_LC) {
                /* Late collision */
                ndev->stats.tx_aborted_errors++;
            }
            if (txstat & TX_DESC_STAT_EC) {
                /* Excessive collision */
                ndev->stats.tx_aborted_errors++;
            }
            if (txstat & TX_DESC_STAT_DE) {
                /* Defer limit */
                ndev->stats.tx_aborted_errors++;
            }
            ndev->stats.tx_errors++;
        } else {
            /* Update stats */
            ndev->stats.tx_packets++;
            ndev->stats.tx_bytes += skblen;
        }
    }

    if (pldat->num_used_tx_buffs <= ENET_TX_DESC/2) {
        if (netif_queue_stopped(ndev))
            netif_wake_queue(ndev);
    }
}

/*
 * MAC<--->PHY support functions
 */
static int 
labrador_mdio_read(struct mii_bus *bus, int phy_id, int phyreg)
{
    INFO_MSG("labrador_mdio_read");

    struct netdata_local *pldat = bus->priv;
    unsigned long timeout = jiffies + msecs_to_jiffies(100);
    int lps;

    /* devo colocar isso embaixo do check de busy? */
    writel(((phy_id << 21) | (phyreg << 16)), LAB_ENET_MII_SERIAL_MNGT(pldat->net_base));

    /* Wait for unbusy status */
    while (readl(LAB_ENET_MII_SERIAL_MNGT(pldat->net_base)) & LAB_MII_SERIAL_BUSY) {
        if (time_after(jiffies, timeout))
            return -EIO;
        cpu_relax();
    }

    writel(LAB_MII_SERIAL_START | LAB_MII_SERIAL_OPCODE_READ, LAB_ENET_MII_SERIAL_MNGT(pldat->net_base));

    /* aguardar novamente o busy? */

    lps = readl(LAB_ENET_MII_SERIAL_MNGT(pldat->net_base));
    /* estamos sobre-escrevendo o clock divider settings aqui? */
    writel(0, LAB_ENET_MII_SERIAL_MNGT(pldat->net_base));

    return lps;
}

static int labrador_mdio_write(struct mii_bus *bus, int phy_id, int phyreg,
            u16 phydata)
{
    INFO_MSG("labrador_mdio_write");

    struct netdata_local *pldat = bus->priv;
    unsigned long timeout = jiffies + msecs_to_jiffies(100);

    writel(((phy_id << 21) | (phyreg << 16)), LAB_ENET_MII_SERIAL_MNGT(pldat->net_base));
    writel(phydata, LAB_ENET_MII_SERIAL_MNGT(pldat->net_base));

    /* Wait for completion */
    while (readl(LAB_ENET_MII_SERIAL_MNGT(pldat->net_base)) & LAB_MII_SERIAL_BUSY) {
        if (time_after(jiffies, timeout))
            return -EIO;
        cpu_relax();
    }

    return 0;
}

static void 
labrador_handle_link_change(struct net_device *ndev)
{
    INFO_MSG("labrador_handle_link_change");

    struct netdata_local *pldat = netdev_priv(ndev);
    struct phy_device *phydev = ndev->phydev;
    unsigned long flags;

    bool status_change = false;

    spin_lock_irqsave(&pldat->lock, flags);

    if (phydev->link) {
        if ((pldat->speed != phydev->speed) ||
            (pldat->duplex != phydev->duplex)) {
            pldat->speed = phydev->speed;
            pldat->duplex = phydev->duplex;
            status_change = true;
        }
    }

    if (phydev->link != pldat->link) {
        if (!phydev->link) {
            pldat->speed = 0;
            pldat->duplex = -1;
        }
        pldat->link = phydev->link;

        status_change = true;
    }

    spin_unlock_irqrestore(&pldat->lock, flags);

    if (status_change)
        __labrador_params_setup(pldat);
}

static int 
labrador_mii_probe(struct net_device *ndev)
{
    INFO_MSG("labrador_mii_probe");

    struct netdata_local *pldat = netdev_priv(ndev);
    struct phy_device *phydev = phy_find_first(pldat->mii_bus);

    if (!phydev) {
        netdev_err(ndev, "no PHY found\n");
        return -ENODEV;
    }

    /* Attach to the PHY */
    if (labrador_phy_interface_mode(&pldat->pdev->dev) == PHY_INTERFACE_MODE_SMII)
        netdev_info(ndev, "using SMII interface\n");
    else
        netdev_info(ndev, "using RMII interface\n");
    phydev = phy_connect(ndev, phydev_name(phydev),
                 &labrador_handle_link_change,
                 labrador_phy_interface_mode(&pldat->pdev->dev));

    if (IS_ERR(phydev)) {
        netdev_err(ndev, "Could not attach to PHY\n");
        return PTR_ERR(phydev);
    }

    /* mask with MAC supported features */
    phydev->supported &= PHY_BASIC_FEATURES;

    phydev->advertising = phydev->supported;

    pldat->link = 0;
    pldat->speed = 0;
    pldat->duplex = -1;

    phy_attached_info(phydev);

    return 0;
}

static int 
labrador_mii_init(struct netdata_local *pldat)
{
    INFO_MSG("labrador_mii_init");

    int err = -ENXIO;

    pldat->mii_bus = mdiobus_alloc();
    if (!pldat->mii_bus) {
        err = -ENOMEM;
        goto err_out;
    }

    /* Setup MII mode */
    if (labrador_phy_interface_mode(&pldat->pdev->dev) == PHY_INTERFACE_MODE_SMII)
        writel(LAB_MAC_CTRL_SMII, LAB_ENET_MAC_CTRL(pldat->net_base));
    else 
        writel(LAB_MAC_CTRL_RMII, LAB_ENET_MAC_CTRL(pldat->net_base));

    pldat->mii_bus->name = "lab_mii_bus";
    pldat->mii_bus->read = &labrador_mdio_read;
    pldat->mii_bus->write = &labrador_mdio_write;
    pldat->mii_bus->reset = &labrador_mdio_reset;
    snprintf(pldat->mii_bus->id, MII_BUS_ID_SIZE, "%s-%x",
             pldat->pdev->name, pldat->pdev->id);
    pldat->mii_bus->priv = pldat;
    pldat->mii_bus->parent = &pldat->pdev->dev;

    // platform_set_drvdata(pldat->pdev, pldat->mii_bus);

    if (mdiobus_register(pldat->mii_bus))
        goto err_out_unregister_bus;

    if (labrador_mii_probe(pldat->ndev) != 0)
        goto err_out_unregister_bus;

    return 0;

err_out_unregister_bus:
    mdiobus_unregister(pldat->mii_bus);
    mdiobus_free(pldat->mii_bus);
err_out:
    return err;
}

static int __labrador_handle_recv(struct net_device *ndev, int budget)
{
    INFO_MSG("__labrador_handle_recv");

    struct netdata_local *pldat = netdev_priv(ndev);
    struct sk_buff *skb;
    u32 len, rxstat;
    int rx_done = 0;

    while (rx_done < budget) {
        /* Get pointer to receive status */
        rxstat = pldat->rx_desc_v[pldat->rxidx].status;
        len = RX_DESC_STAT_FL(rxstat);

        if (rxstat & RX_DESC_STAT_ES) {
            if (rxstat & RX_DESC_STAT_DE) {
                /* Overrun error */
                ndev->stats.rx_fifo_errors++;
            } else if (rxstat & RX_DESC_STAT_CE) {
                /* CRC error */
                ndev->stats.rx_crc_errors++;
            } else if (rxstat & RX_DESC_STAT_TL) {
                /* Length error */
                ndev->stats.rx_length_errors++;
            } else if (rxstat & (RX_DESC_STAT_CS | RX_DESC_STAT_RF)) {
                /* Collision error */
                ndev->stats.collisions++;
            }
            ndev->stats.rx_errors++;
        } else {
            /* Packet is good */
            skb = dev_alloc_skb(len);
            if (!skb) {
                ndev->stats.rx_dropped++;
            } else {
                /* Copy packet from buffer */
                skb_put_data(skb,
                         pldat->rx_buff_v + pldat->rxidx * ENET_MAXF_SIZE,
                         len);

                /* Pass to upper layer */
                skb->protocol = eth_type_trans(skb, ndev);
                netif_receive_skb(skb);
                ndev->stats.rx_packets++;
                ndev->stats.rx_bytes += len;
            }
        }

        /* Increment consume index */
        pldat->rxidx++;
        if (pldat->rxidx >= ENET_RX_DESC)
            pldat->rxidx = 0;
        rx_done++;
    }

    return rx_done;
}

static int labrador_eth_poll(struct napi_struct *napi, int budget)
{
    INFO_MSG("labrador_eth_poll");

    struct netdata_local *pldat = container_of(napi, struct netdata_local, napi);
    struct net_device *ndev = pldat->ndev;
    int rx_done = 0;
    struct netdev_queue *txq = netdev_get_tx_queue(ndev, 0);

    __netif_tx_lock(txq, smp_processor_id());
    __labrador_handle_xmit(ndev);
    __netif_tx_unlock(txq);
    rx_done = __labrador_handle_recv(ndev, budget);

    if (rx_done < budget) {
        napi_complete_done(napi, rx_done);
        labrador_eth_enable_int(pldat->net_base);
    }

    return rx_done;
}

static bool 
use_iram_for_net(struct device *dev)
{
    INFO_MSG("use_iram_for_net");
    if (dev && dev->of_node)
        return of_property_read_bool(dev->of_node, "use-iram");
    return false;
}

static int 
labrador_eth_drv_probe(struct platform_device *pdev)
{
    struct resource *res;
    struct net_device *ndev;
    struct netdata_local *pldat;
    struct phy_device *phydev;
    dma_addr_t dma_handle;
    int irq, ret;
    INFO_MSG("labrador_eth_drv_probe");


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
    ndev->netdev_ops = &labrador_netdev_ops;
    // ndev->ethtool_ops = &labrador_eth_ethtool_ops;
    ndev->watchdog_timeo = msecs_to_jiffies(2500);

    /* Get size of DMA buffers/descriptors region */
    pldat->dma_buff_size = (ENET_TX_DESC + ENET_RX_DESC) * (ENET_MAXF_SIZE +
        sizeof(struct txrx_desc_t));
    pldat->dma_buff_base_v = 0;

    if (pldat->dma_buff_base_v == 0) {
        ret = dma_coerce_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
        if (ret)
            goto err_out_free_irq;

        pldat->dma_buff_size = PAGE_ALIGN(pldat->dma_buff_size);

        /* Allocate a chunk of memory for the DMA ethernet buffers
           and descriptors */
        pldat->dma_buff_base_v =
            dma_alloc_coherent(&pldat->pdev->dev,
                       pldat->dma_buff_size, &dma_handle,
                       GFP_KERNEL);
        if (pldat->dma_buff_base_v == NULL) {
            ret = -ENOMEM;
            goto err_out_free_irq;
        }
    }
    pldat->dma_buff_base_p = dma_handle;

    netdev_dbg(ndev, "IO address space     :%pR\n", res);
    netdev_dbg(ndev, "IO address size      :%d\n", resource_size(res));
    netdev_dbg(ndev, "IO address (mapped)  :0x%p\n",
            pldat->net_base);
    netdev_dbg(ndev, "IRQ number           :%d\n", ndev->irq);
    netdev_dbg(ndev, "DMA buffer size      :%d\n", pldat->dma_buff_size);
    netdev_dbg(ndev, "DMA buffer P address :0x%08x\n",
            pldat->dma_buff_base_p);
    netdev_dbg(ndev, "DMA buffer V address :0x%p\n",
            pldat->dma_buff_base_v);

    /* Get MAC address from current HW setting (POR state is all zeros) */
    __labrador_get_mac(pldat, ndev->dev_addr);

    if (!is_valid_ether_addr(ndev->dev_addr)) {
        const char *macaddr = of_get_mac_address(pdev->dev.of_node);
        if (macaddr)
            memcpy(ndev->dev_addr, macaddr, ETH_ALEN);
    }
    if (!is_valid_ether_addr(ndev->dev_addr))
        eth_hw_addr_random(ndev);

    /* Reset the ethernet controller */
    __labrador_eth_reset(pldat);

    //  then shut everything down to save power 
    // __labrador_eth_shutdown(pldat);

    /* Set default parameters */
    pldat->msg_enable = NETIF_MSG_LINK;

    /* Force an MII interface reset and clock setup */
    __labrador_mii_mngt_reset(pldat);

    //  Force default PHY interface setup in chip, this will probably be
    //    changed by the PHY driver 
    pldat->link = 0;
    pldat->speed = 100;
    pldat->duplex = DUPLEX_FULL;
    __labrador_params_setup(pldat);

    netif_napi_add(ndev, &pldat->napi, labrador_eth_poll, NAPI_WEIGHT);

    ret = register_netdev(ndev);
    if (ret) {
        dev_err(&pdev->dev, "Cannot register net device, aborting.\n");
        goto err_out_dma_unmap;
    }
    platform_set_drvdata(pdev, ndev);
    ret = labrador_mii_init(pldat);

    if (ret)
        goto err_out_unregister_netdev;

    netdev_info(ndev, "LABRADOR MAC at 0x%08x irq %d\n",
           res->start, ndev->irq);

    phydev = ndev->phydev;

    device_init_wakeup(&pdev->dev, 1);

    device_set_wakeup_enable(&pdev->dev, 0);


    strcpy(pldat->batata, "batatinha");

    INFO_MSG("fim do probe %s %s - estado reg_state %i - %s",pldat->batata, ndev->name, ndev->reg_state, netdev_reg_state(ndev));
    INFO_MSG("pdev name: %s", pdev->name);
    INFO_MSG("pdev addr: %p", pdev);
    INFO_MSG("ndev addr: %p", ndev);
    struct net_device * ndev2 = platform_get_drvdata(pdev);
    INFO_MSG("ndev2 addr: %p", platform_get_drvdata(pdev));
    INFO_MSG("reg_state de %s:  %i - %s", ndev2->name, ndev2->reg_state, netdev_reg_state(ndev2));

    return 0;

err_out_unregister_netdev:
    unregister_netdev(ndev);
err_out_dma_unmap:
    // if (!use_iram_for_net(&pldat->pdev->dev) ||
    //     pldat->dma_buff_size > lpc32xx_return_iram_size())
    //     dma_free_coherent(&pldat->pdev->dev, pldat->dma_buff_size,
    //               pldat->dma_buff_base_v,
    //               pldat->dma_buff_base_p);
    if (!use_iram_for_net(&pldat->pdev->dev))
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

static int 
labrador_eth_drv_remove(struct platform_device *pdev)
{
    struct net_device *ndev = platform_get_drvdata(pdev);
    struct netdata_local *pldat = netdev_priv(ndev);
    INFO_MSG("labrador_eth_drv_remove!");
    INFO_MSG("Nossa batata esta: %s", pldat->batata);
    INFO_MSG("pdev name: %p", pdev->name);
    INFO_MSG("pdev addr: %p", pdev);
    INFO_MSG("ndev addr: %p", ndev);
    INFO_MSG("reg_state de %s:  %i - %s", ndev->name, ndev->reg_state, netdev_reg_state(ndev));
    INFO_MSG("estado reg_state: %i",ndev->reg_state);

    if (ndev == NULL) INFO_MSG("ndev NULL");
    if (pldat == NULL) INFO_MSG("pldat NULL");

    unregister_netdev(ndev);

    if (!use_iram_for_net(&pldat->pdev->dev))
        dma_free_coherent(&pldat->pdev->dev, pldat->dma_buff_size,
                  pldat->dma_buff_base_v,
                  pldat->dma_buff_base_p);
    INFO_MSG("free_irq");
    free_irq(ndev->irq, ndev);
    INFO_MSG("iounmap");
    iounmap(pldat->net_base);
    mdiobus_unregister(pldat->mii_bus);
    mdiobus_free(pldat->mii_bus);
    clk_disable_unprepare(pldat->clk);
    clk_put(pldat->clk);
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
