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
	{ 0xd687380c, __VMLINUX_SYMBOL_STR(platform_driver_unregister) },
	{ 0xf1712aa1, __VMLINUX_SYMBOL_STR(__platform_driver_register) },
	{ 0xedc03953, __VMLINUX_SYMBOL_STR(iounmap) },
	{ 0xb6e6d99d, __VMLINUX_SYMBOL_STR(clk_disable) },
	{ 0x59851f6b, __VMLINUX_SYMBOL_STR(dev_err) },
	{ 0xd6b8e852, __VMLINUX_SYMBOL_STR(request_threaded_irq) },
	{ 0x79c5a9f0, __VMLINUX_SYMBOL_STR(ioremap) },
	{ 0x5beeb8f2, __VMLINUX_SYMBOL_STR(free_netdev) },
	{ 0x2e1ca751, __VMLINUX_SYMBOL_STR(clk_put) },
	{ 0x73733326, __VMLINUX_SYMBOL_STR(clk_get) },
	{ 0xc7f7c06, __VMLINUX_SYMBOL_STR(alloc_etherdev_mqs) },
	{ 0xea4412d8, __VMLINUX_SYMBOL_STR(platform_get_irq) },
	{ 0xf7010087, __VMLINUX_SYMBOL_STR(platform_get_resource) },
	{ 0xb077e70a, __VMLINUX_SYMBOL_STR(clk_unprepare) },
	{ 0xd0a83ba5, __VMLINUX_SYMBOL_STR(__dynamic_dev_dbg) },
	{ 0x49ebacbd, __VMLINUX_SYMBOL_STR(_clear_bit) },
	{ 0x2c08d864, __VMLINUX_SYMBOL_STR(phy_start) },
	{ 0x8e865d3c, __VMLINUX_SYMBOL_STR(arm_delay_ops) },
	{ 0xc45ebc63, __VMLINUX_SYMBOL_STR(phy_resume) },
	{ 0x815588a6, __VMLINUX_SYMBOL_STR(clk_enable) },
	{ 0x7c9a7371, __VMLINUX_SYMBOL_STR(clk_prepare) },
	{ 0x5fc56a46, __VMLINUX_SYMBOL_STR(_raw_spin_unlock) },
	{ 0xa0385ceb, __VMLINUX_SYMBOL_STR(__napi_schedule) },
	{ 0xe869704f, __VMLINUX_SYMBOL_STR(napi_schedule_prep) },
	{ 0x822137e2, __VMLINUX_SYMBOL_STR(arm_heavy_mb) },
	{ 0x9c0bd51f, __VMLINUX_SYMBOL_STR(_raw_spin_lock) },
	{ 0x27e1a049, __VMLINUX_SYMBOL_STR(printk) },
	{ 0xb1ad28e0, __VMLINUX_SYMBOL_STR(__gnu_mcount_nc) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("of:N*T*Ccaninos,labrador-eth");
MODULE_ALIAS("of:N*T*Ccaninos,labrador-ethC*");
