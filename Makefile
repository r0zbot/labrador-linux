.PHONY : all
.PHONY : clean
CURDIR=$(shell pwd)
CPUS=$$(($(shell cat /sys/devices/system/cpu/present | awk -F- '{ print $$2 }')+1))

all: config kernel

config:
	$(Q)mkdir -p $(CURDIR)/build
	$(Q)$(MAKE) -C $(CURDIR)/linux O=$(CURDIR)/build CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm caninos_labrador_defconfig
	
menuconfig:
	$(Q)$(MAKE) -C $(CURDIR)/linux O=$(CURDIR)/build CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm menuconfig
	
kernel:
	$(Q)$(MAKE) -C $(CURDIR)/linux O=$(CURDIR)/build CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm dtbs
	$(Q)$(MAKE) -C $(CURDIR)/linux O=$(CURDIR)/build CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm -j$(CPUS) uImage modules
	$(Q)$(MAKE) -C $(CURDIR)/linux O=$(CURDIR)/build CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm -j$(CPUS) INSTALL_MOD_PATH=$(CURDIR)/build modules_install
	$(Q)rm -rf $(CURDIR)/output
	$(Q)mkdir $(CURDIR)/output
	$(Q)mkdir $(CURDIR)/output/lib
	$(Q)cp -rf $(CURDIR)/build/lib/modules $(CURDIR)/output/lib/; find $(CURDIR)/output/lib/ -type l -exec rm -f {} \;
	$(Q)cp $(CURDIR)/build/arch/arm/boot/uImage $(CURDIR)/output/
	$(Q)cp $(CURDIR)/build/arch/arm/boot/dts/caninos_labrador.dtb $(CURDIR)/output/kernel.dtb

dts:
	$(Q)$(MAKE) -C $(CURDIR)/linux O=$(CURDIR)/build CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm dtbs
	$(Q)cp $(CURDIR)/build/arch/arm/boot/dts/caninos_labrador.dtb $(CURDIR)/output/kernel.dtb

ethernet:
	$(Q)$(MAKE) -C $(CURDIR)/linux O=$(CURDIR)/build M=$(CURDIR)/linux/drivers/net/ethernet/caninos CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm

phy:
	$(Q)$(MAKE) -C $(CURDIR)/linux O=$(CURDIR)/build M=$(CURDIR)/linux/drivers/net/phy CROSS_COMPILE=arm-linux-gnueabihf- ARCH=arm

clean:
	$(Q)rm -rf build output
