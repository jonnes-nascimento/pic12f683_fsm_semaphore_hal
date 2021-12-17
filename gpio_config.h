#ifndef _GPIO_CFG_H_
#define _GPIO_CFG_H_

#define ARCH_ADDR_SIZE  unsigned char

typedef unsigned char uint8_t;

typedef enum
{
    GPIO_PORT,
    NUMBER_OF_PORTS
} Port_t;

typedef union
{
    uint8_t Byte;        /**< Gpio port byte */

    uint8_t      : 2;    /**< Gpio port unused bits (reads 0) */
    uint8_t Bit5 : 1;    /**< Gpio port bit 5 (GP5) */
    uint8_t Bit4 : 1;    /**< Gpio port bit 4 (GP4) */
    uint8_t Bit3 : 1;    /**< Gpio port bit 3 (GP3) */
    uint8_t Bit2 : 1;    /**< Gpio port bit 2 (GP2) */
    uint8_t Bit1 : 1;    /**< Gpio port bit 1 (GP1) */
    uint8_t Bit0 : 1;    /**< Gpio port bit 0 (GP0) */
} GpioPort_t;

typedef enum
{
    CHANNEL_GP0,                /**< GP0 */
    CHANNEL_GP1,                /**< GP1 */
    CHANNEL_GP2,                /**< GP2 */
    CHANNEL_GP3,                /**< GP3 */
    CHANNEL_GP4,                /**< GP4 */
    CHANNEL_GP5,                /**< GP5 */
    GPIO_MAX_PIN_NUMBER /**< Number of gpio ports */
} GpioChannel_t;

typedef enum
{
    GPIO_PIN_DIRECTION_OUTPUT,  /**< Pin is output */
    GPIO_PIN_DIRECTION_INPUT    /**< Pin is input */
} GpioPinDirection_t;

typedef enum
{
    GPIO_PIN_FUNCTION_DIGITAL,           /**< Pin is digital mode */
    GPIO_PIN_FUNCTION_ANALOG,            /**< Pin is analog mode */
    GPIO_PIN_FUNCTION_COMPARATOR,        /**< Pin is comparator mode */
    GPIO_PIN_FUNCTION_TIMER,             /**< Pin is timer enabled */
    GPIO_PIN_FUNCTION_CAPTURE_COMPARE,   /**< Pin is capture/compare mode */
    GPIO_PIN_FUNCTION_INTERRUPT,         /**< Pin is interrupt enabled */
} GpioPinFunction_t;

typedef enum
{
    GPIO_PIN_PULLUP_DISABLED,  /**< Pin pull-up is disabled */
    GPIO_PIN_PULLUP_ENABLED    /**< Pin pull-up is enabled */
} GpioPinPullUp_t;

typedef enum
{
    GPIO_PIN_INTERRUPT_ON_CHANGE_DISABLED,  /**< Pin is digital mode */
    GPIO_PIN_INTERRUPT_ON_CHANGE_ENABLED    /**< Pin is analog mode */
} GpioPinInterruptOnChange_t;

typedef enum
{
    GPIO_PIN_STATE_LOW,    /**< Low pin state */
    GPIO_PIN_STATE_HIGH,   /**< High pin state */
    GPIO_PIN_MAX_STATES    /**< Max pin states */
} GpioPinState_t;


typedef struct
{
    GpioChannel_t      Channel;     /**< Name of gpio pin */
    GpioPinFunction_t  Function;    /**< Function of gpio pin */
    GpioPinDirection_t Direction;   /**< Direction of gpio pin */
    GpioPinPullUp_t    PullUp;      /**< Pull-Up resistor of gpio pin */
    GpioPinState_t     State;       /**< Pin state */
} GpioConfig_t;

const GpioConfig_t * const GpioConfigGet(void);

#endif //_GPIO_CFG_H_