#include <linux/gpio.h>
#include <stdlib.h>
#include <stdio.h>

typedef struct{
	int phy_reset_gpio;
	int phy_power_gpio;
}  phy_gpio;

static void
reset()
{
	u32 cnt, phy_id;
    INFO_MSG(" ethernet_phy_setup(void)");
    static phy_gpio global_phy_gpio;
	u16 reg_val;
	int ret;

	global_phy_gpio.phy_reset_gpio = 
		of_get_named_gpio(dev->of_node, "phy-reset-gpio", 0);
	
	if (!gpio_is_valid(global_phy_gpio.phy_reset_gpio))
	{
		dev_err(dev, "could not get reset gpio\n");
		return -ENODEV;
	}
	global_phy_gpio.phy_power_gpio = 
		of_get_named_gpio(dev->of_node, "phy-power-gpio", 0);
	
	if (!gpio_is_valid(global_phy_gpio.phy_power_gpio))
	{
		dev_err(dev, "could not get power gpio\n");
		return -ENODEV;
	}
    
    ret = devm_gpio_request(dev, global_phy_gpio.phy_reset_gpio, "phy_reset");
	
	if (ret)
	{
		dev_err(dev, "could not request reset gpio\n");
		return ret;
	}
    ret = devm_gpio_request(dev, global_phy_gpio.phy_power_gpio, "phy_power");
	
	if (ret)
	{
		dev_err(dev, "could not request power gpio\n");
		return ret;
	}
	
    
    gpio_direction_output(global_phy_gpio.phy_reset_gpio, 0);
	gpio_direction_output(global_phy_gpio.phy_power_gpio, 0);
    gpio_set_value(global_phy_gpio.phy_power_gpio, 0);
 
    gpio_set_value(global_phy_gpio.phy_reset_gpio, 0);
	
	if (gpio_is_valid(global_phy_gpio.phy_power_gpio))
	{ 
		gpio_set_value(global_phy_gpio.phy_power_gpio, 1);	
	}
	else{
		puts("phy_power_gpio is no Valid");
		return 1;
	}
	
	if (gpio_is_valid(global_phy_gpio.phy_reset_gpio))
	{		
		gpio_set_value(global_phy_gpio.phy_reset_gpio, 1);
		mdelay(150);//time for power up
		gpio_set_value(global_phy_gpio.phy_reset_gpio, 0);
		mdelay(12);//time for reset
		gpio_set_value(global_phy_gpio.phy_reset_gpio, 1);

		INFO_MSG("Reset_Done");	
	}else{
		ERR_MSG("phy_reset_gpio is no Valid");
		return -ENOMEM;
	}
	//time required to access registers
	mdelay(150);
	return 0;
}