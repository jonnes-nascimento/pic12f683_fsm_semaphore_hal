# 1 "gpio_config.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "D:/Program Files/Microchip/MPLABX/v5.50/packs/Microchip/PIC10-12Fxxx_DFP/1.4.56/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "gpio_config.c" 2
# 1 "./gpio_config.h" 1






typedef unsigned char uint8_t;

typedef struct
{
    uint8_t Byte;

    uint8_t : 2;
    uint8_t Bit5 : 1;
    uint8_t Bit4 : 1;
    uint8_t Bit3 : 1;
    uint8_t Bit2 : 1;
    uint8_t Bit1 : 1;
    uint8_t Bit0 : 1;
} GpioPort_t;

typedef enum
{
    CHANNEL_GP0,
    CHANNEL_GP1,
    CHANNEL_GP2,
    CHANNEL_GP3,
    CHANNEL_GP4,
    CHANNEL_GP5,
    GPIO_MAX_PIN_NUMBER
} GpioChannel_t;

typedef enum
{
    GPIO_PIN_DIRECTION_OUTPUT,
    GPIO_PIN_DIRECTION_INPUT
} GpioPinDirection_t;

typedef enum
{
    GPIO_PIN_FUNCTION_DIGITAL,
    GPIO_PIN_FUNCTION_ANALOG,
    GPIO_PIN_FUNCTION_COMPARATOR,
    GPIO_PIN_FUNCTION_TIMER,
    GPIO_PIN_FUNCTION_CAPTURE_COMPARE,
    GPIO_PIN_FUNCTION_INTERRUPT,
} GpioPinFunction_t;

typedef enum
{
    GPIO_PIN_PULLUP_DISABLED,
    GPIO_PIN_PULLUP_ENABLED
} GpioPinPullUp_t;

typedef enum
{
    GPIO_PIN_INTERRUPT_ON_CHANGE_DISABLED,
    GPIO_PIN_INTERRUPT_ON_CHANGE_ENABLED
} GpioPinInterruptOnChange_t;

typedef enum
{
    GPIO_PIN_STATE_LOW,
    GPIO_PIN_STATE_HIGH,
    GPIO_PIN_MAX_STATES
} GpioPinState_t;


typedef struct
{
    GpioChannel_t Channel;
    GpioPinFunction_t Function;
    GpioPinDirection_t Direction;
    GpioPinPullUp_t PullUp;
    GpioPinState_t State;
} GpioConfig_t;

const GpioConfig_t * const GpioConfigGet(void);
# 1 "gpio_config.c" 2


static const GpioConfig_t GpioConfig[] = {
        {CHANNEL_GP0, GPIO_PIN_FUNCTION_DIGITAL, GPIO_PIN_DIRECTION_OUTPUT, GPIO_PIN_PULLUP_DISABLED, GPIO_PIN_STATE_HIGH},
        {CHANNEL_GP1, GPIO_PIN_FUNCTION_DIGITAL, GPIO_PIN_DIRECTION_INPUT, GPIO_PIN_PULLUP_DISABLED, GPIO_PIN_STATE_LOW},
        {CHANNEL_GP2, GPIO_PIN_FUNCTION_DIGITAL, GPIO_PIN_DIRECTION_OUTPUT, GPIO_PIN_PULLUP_DISABLED, GPIO_PIN_STATE_HIGH},
        {CHANNEL_GP3, GPIO_PIN_FUNCTION_DIGITAL, GPIO_PIN_DIRECTION_INPUT, GPIO_PIN_PULLUP_DISABLED, GPIO_PIN_STATE_LOW},
        {CHANNEL_GP4, GPIO_PIN_FUNCTION_DIGITAL, GPIO_PIN_DIRECTION_OUTPUT, GPIO_PIN_PULLUP_DISABLED, GPIO_PIN_STATE_HIGH},
        {CHANNEL_GP5, GPIO_PIN_FUNCTION_DIGITAL, GPIO_PIN_DIRECTION_OUTPUT, GPIO_PIN_PULLUP_DISABLED, GPIO_PIN_STATE_HIGH}
};

const GpioConfig_t * const GpioConfigGet(void)
{
    return (const GpioConfig_t *) &GpioConfig[0];
}
