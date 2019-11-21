
EXTRA_CFLAGS += -DDEF_LINUX 

ifeq ($(CONFIG_MII),y)
EXTRA_CFLAGS += -DMII
endif
obj-$(CONFIG_LABRADOR_ENET)	+= ethernet.o
ethernet-objs := ec_phy.o des.o ethctrl.o

