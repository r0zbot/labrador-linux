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
	{ 0x16667892, __VMLINUX_SYMBOL_STR(genphy_read_status) },
	{ 0xe4d05dd6, __VMLINUX_SYMBOL_STR(genphy_suspend) },
	{ 0x885a3887, __VMLINUX_SYMBOL_STR(genphy_soft_reset) },
	{ 0x7890c3eb, __VMLINUX_SYMBOL_STR(phy_drivers_unregister) },
	{ 0xe2eefb07, __VMLINUX_SYMBOL_STR(phy_drivers_register) },
	{ 0x59851f6b, __VMLINUX_SYMBOL_STR(dev_err) },
	{ 0x4a74ab35, __VMLINUX_SYMBOL_STR(genphy_resume) },
	{ 0x4baf8d2, __VMLINUX_SYMBOL_STR(genphy_config_aneg) },
	{ 0x92cddb51, __VMLINUX_SYMBOL_STR(mdiobus_write) },
	{ 0x8cb0f852, __VMLINUX_SYMBOL_STR(mdiobus_read) },
	{ 0xb1ad28e0, __VMLINUX_SYMBOL_STR(__gnu_mcount_nc) },
};

static const char __module_depends[]
__used
__attribute__((section(".modinfo"))) =
"depends=";

MODULE_ALIAS("mdio:0001001000110100110101000000????");
