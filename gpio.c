#include <stdio.h>
#include "pic12f683.h"
#include "gpio.h"

#define BYTE_TO_BINARY_PATTERN "%c%c%c%c%c%c%c%c"
#define BYTE_TO_BINARY(byte)  \
  (byte & 0x80 ? '1' : '0'), \
  (byte & 0x40 ? '1' : '0'), \
  (byte & 0x20 ? '1' : '0'), \
  (byte & 0x10 ? '1' : '0'), \
  (byte & 0x08 ? '1' : '0'), \
  (byte & 0x04 ? '1' : '0'), \
  (byte & 0x02 ? '1' : '0'), \
  (byte & 0x01 ? '1' : '0')

/** This is for test only - this code must be moved */
static ARCH_ADDR_SIZE volatile * const SystemOscilator = {
        (ARCH_ADDR_SIZE *) OSCCON
};

static ARCH_ADDR_SIZE volatile * const SystemComparator = {
        (ARCH_ADDR_SIZE *) CMCON0
};

static ARCH_ADDR_SIZE volatile * const SystemADConverters = {
        (ARCH_ADDR_SIZE *) ADCON0
};
/**************************************************************************/

static ARCH_ADDR_SIZE volatile * const GpioPort[NUMBER_OF_PORTS] = {
        (ARCH_ADDR_SIZE *) GPIO
};

static ARCH_ADDR_SIZE volatile * const GpioDirection[NUMBER_OF_PORTS] = {
        (ARCH_ADDR_SIZE *) TRISIO
};

static ARCH_ADDR_SIZE volatile * const GpioFunction[NUMBER_OF_PORTS] = {
        (ARCH_ADDR_SIZE *) ANSEL
};

void Gpio_Init(const GpioConfig_t * const Config)
{
    /** This is for test only - this code must be moved */
    *SystemOscilator    = 0x70; /**< Switch to 8 MHz system clock */
    *SystemComparator   = 0x07; /**< Comparators off */
    *SystemADConverters = 0x00; /**< AD Converters off */

    for (uint8_t port = 0; port < NUMBER_OF_PORTS; port++)
    {
        *GpioPort[port] = 0x00; /**< Resets all GPIO pins */

        /** Sets the GPIOs */
        for (uint8_t i = 0; i < GPIO_MAX_PIN_NUMBER; i++)
        {
           *GpioDirection[port] = (ARCH_ADDR_SIZE) (Config[i].Direction << i);

           *GpioPort[port] = (ARCH_ADDR_SIZE) (Config[i].State << i);

           if (Config[i].Function == GPIO_PIN_FUNCTION_ANALOG && Config[i].Direction == GPIO_PIN_DIRECTION_INPUT)
           {
               *GpioFunction[port] = (ARCH_ADDR_SIZE) (Config[i].Direction << i);
           }
           else
           {
               *GpioFunction[port] |= (ARCH_ADDR_SIZE) (0 << i);
           }
        }
    }
}

void Gpio_Write_Register(GpioPort_t Port)
{
    *GpioPort[GPIO_PORT] = Port.Byte;
}