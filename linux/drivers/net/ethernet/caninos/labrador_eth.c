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

static int labrador_eth_drv_remove(struct platform_device *pdev)
{
    INFO_MSG("REMOVE!");
}

static int labrador_eth_drv_probe(struct platform_device *pdev)
{
    INFO_MSG("PROBE!");
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
