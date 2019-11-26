#include <linux/module.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__attribute__((section(".gnu.linkonce.this_module"))) = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

static const struct modversion_info ____versions[]
__used
__attribute__((section("__versions"))) = {
	{ 0x1658979b, __VMLINUX_SYMBOL_STR(module_layout) },
	{ 0x8e99acd7, __VMLINUX_SYMBOL_STR(phy_ethtool_set_link_ksettings) },
	{ 0x6002852, __VMLINUX_SYMBOL_STR(phy_ethtool_get_link_ksettings) },
	{ 0x2cb41473, __VMLINUX_SYMBOL_STR(ethtool_op_get_link) },
	{ 0xd687380c, __VMLINUX_SYMBOL_STR(platform_driver_unregister) },
	{ 0xf1712aa1, __VMLINUX_SYMBOL_STR(__platform_driver_register) },
	{ 0xe7680e3f, __VMLINUX_SYMBOL_STR(netif_receive_skb) },
	{ 0x3de6e726, __VMLINUX_SYMBOL_STR(eth_type_trans) },
	{ 0xb93e0130, __VMLINUX_SYMBOL_STR(skb_put) },
	{ 0xdc0a2a83, __VMLINUX_SYMBOL_STR(__netdev_alloc_skb) },
	{ 0xb38bd9f5, __VMLINUX_SYMBOL_STR(netif_tx_wake_queue) },
	{ 0xc917e655, __VMLINUX_SYMBOL_STR(debug_smp_processor_id) },
	{ 0xaec90aa6, __VMLINUX_SYMBOL_STR(device_set_wakeup_enable) },
	{ 0x46314ab3, __VMLINUX_SYMBOL_STR(device_init_wakeup) },
	{ 0x56fffd95, __VMLINUX_SYMBOL_STR(phy_attached_info) },
	{ 0x19d74fad, __VMLINUX_SYMBOL_STR(phy_connect) },
	{ 0xce12b0c2, __VMLINUX_SYMBOL_STR(netdev_info) },
	{ 0x87df7bb, __VMLINUX_SYMBOL_STR(netdev_err) },
	{ 0xbe1aaf2f, __VMLINUX_SYMBOL_STR(phy_find_first) },
	{ 0x9fd0dbe5, __VMLINUX_SYMBOL_STR(__mdiobus_register) },
	{ 0xb81960ca, __VMLINUX_SYMBOL_STR(snprintf) },
	{ 0xe4db1f6c, __VMLINUX_SYMBOL_STR(mdiobus_alloc_size) },
	{ 0x5dbcd444, __VMLINUX_SYMBOL_STR(register_netdev) },
	{ 0xd91b795d, __VMLINUX_SYMBOL_STR(netif_napi_add) },
	{ 0x79aa04a2, __VMLINUX_SYMBOL_STR(get_random_bytes) },
	{ 0x4ca620f7, __VMLINUX_SYMBOL_STR(of_get_mac_address) },
	{ 0x8173265c, __VMLINUX_SYMBOL_STR(dma_alloc_from_dev_coherent) },
	{ 0xd6b8e852, __VMLINUX_SYMBOL_STR(request_threaded_irq) },
	{ 0x79c5a9f0, __VMLINUX_SYMBOL_STR(ioremap) },
	{ 0x21029ba7, __VMLINUX_SYMBOL_STR(gpiod_set_raw_value) },
	{ 0xe0ee75b, __VMLINUX_SYMBOL_STR(gpiod_direction_output_raw) },
	{ 0x393f73b0, __VMLINUX_SYMBOL_STR(gpio_to_desc) },
	{ 0x316711af, __VMLINUX_SYMBOL_STR(devm_gpio_request) },
	{ 0x495f6ee8, __VMLINUX_SYMBOL_STR(of_get_named_gpio_flags) },
	{ 0x76d9b876, __VMLINUX_SYMBOL_STR(clk_set_rate) },
	{ 0x43f81957, __VMLINUX_SYMBOL_STR(clk_round_rate) },
	{ 0x73733326, __VMLINUX_SYMBOL_STR(clk_get) },
	{ 0xc7f7c06, __VMLINUX_SYMBOL_STR(alloc_etherdev_mqs) },
	{ 0x59851f6b, __VMLINUX_SYMBOL_STR(dev_err) },
	{ 0xea4412d8, __VMLINUX_SYMBOL_STR(platform_get_irq) },
	{ 0xf7010087, __VMLINUX_SYMBOL_STR(platform_get_resource) },
	{ 0xe2d5255a, __VMLINUX_SYMBOL_STR(strcmp) },
	{ 0x54835b84, __VMLINUX_SYMBOL_STR(of_get_property) },
	{ 0x49ebacbd, __VMLINUX_SYMBOL_STR(_clear_bit) },
	{ 0x2c08d864, __VMLINUX_SYMBOL_STR(phy_start) },
	{ 0x815588a6, __VMLINUX_SYMBOL_STR(clk_enable) },
	{ 0x7c9a7371, __VMLINUX_SYMBOL_STR(clk_prepare) },
	{ 0x8e865d3c, __VMLINUX_SYMBOL_STR(arm_delay_ops) },
	{ 0x4f3f9783, __VMLINUX_SYMBOL_STR(module_reset) },
	{ 0x5fc56a46, __VMLINUX_SYMBOL_STR(_raw_spin_unlock) },
	{ 0xa0385ceb, __VMLINUX_SYMBOL_STR(__napi_schedule) },
	{ 0xe869704f, __VMLINUX_SYMBOL_STR(napi_schedule_prep) },
	{ 0x9c0bd51f, __VMLINUX_SYMBOL_STR(_raw_spin_lock) },
	{ 0xd063f03f, __VMLINUX_SYMBOL_STR(netif_carrier_off) },
	{ 0xd1c540bc, __VMLINUX_SYMBOL_STR(phy_stop) },
	{ 0xb6422fcf, __VMLINUX_SYMBOL_STR(napi_disable) },
	{ 0xd0a83ba5, __VMLINUX_SYMBOL_STR(__dynamic_dev_dbg) },
	{ 0xe4b0dd4, __VMLINUX_SYMBOL_STR(consume_skb) },
	{ 0x9d669763, __VMLINUX_SYMBOL_STR(memcpy) },
	{ 0x1e047854, __VMLINUX_SYMBOL_STR(warn_slowpath_fmt) },
	{ 0x1a1431fd, __VMLINUX_SYMBOL_STR(_raw_spin_unlock_irq) },
	{ 0x676bbc0f, __VMLINUX_SYMBOL_STR(_set_bit) },
	{ 0x3507a132, __VMLINUX_SYMBOL_STR(_raw_spin_lock_irq) },
	{ 0x73e20c1c, __VMLINUX_SYMBOL_STR(strlcpy) },
	{ 0x526c3a6c, __VMLINUX_SYMBOL_STR(jiffies) },
	{ 0x51d559d1, __VMLINUX_SYMBOL_STR(_raw_spin_unlock_irqrestore) },
	{ 0xe7845bb, __VMLINUX_SYMBOL_STR(__dynamic_netdev_dbg) },
	{ 0x822137e2, __VMLINUX_SYMBOL_STR(arm_heavy_mb) },
	{ 0x598542b2, __VMLINUX_SYMBOL_STR(_raw_spin_lock_irqsave) },
	{ 0x5beeb8f2, __VMLINUX_SYMBOL_STR(free_netdev) },
	{ 0x2e1ca751, __VMLINUX_SYMBOL_STR(clk_put) },
	{ 0xb077e70a, __VMLINUX_SYMBOL_STR(clk_unprepare) },
	{ 0xb6e6d99d, __VMLINUX_SYMBOL_STR(clk_disable) },
	{ 0xc84a901f, __VMLINUX_SYMBOL_STR(mdiobus_free) },
	{ 0xb54d8f27, __VMLINUX_SYMBOL_STR(mdiobus_unregister) },
	{ 0xedc03953, __VMLINUX_SYMBOL_STR(iounmap) },
	{ 0xc1514a3b, __VMLINUX_SYMBOL_STR(free_irq) },
	{ 0x8d31a4e0, __VMLINUX_SYMBOL_STR(dma_release_from_dev_coherent) },
	{ 0x16305289, __VMLINUX_SYMBOL_STR(warn_slowpath_null) },
	{ 0xd9a3ba6a, __VMLINUX_SYMBOL_STR(arm_dma_ops) },
	{ 0x49f78c2d, __VMLINUX_SYMBOL_STR(unregister_netdev) },
	{ 0xa2032569, __VMLINUX_SYMBOL_STR(of_find_property) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0xb1ad28e0, __VMLINUX_SYMBOL_STR(__gnu_mcount_nc) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("of:N*T*Ccaninos,labrador-eth");
MODULE_ALIAS("of:N*T*Ccaninos,labrador-ethC*");
