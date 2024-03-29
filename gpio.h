#ifndef _GPIO_H_
#define _GPIO_H_

#include "gpio_config.h"

void Gpio_Init(const GpioConfig_t * const Config);
void Gpio_Write_Register(GpioPort_t Port);

#endif //_GPIO_H_
