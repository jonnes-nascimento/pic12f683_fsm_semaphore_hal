# 1 "gpio.c"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 288 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "D:/Program Files/Microchip/MPLABX/v5.50/packs/Microchip/PIC10-12Fxxx_DFP/1.4.56/xc8\\pic\\include\\language_support.h" 1 3
# 2 "<built-in>" 2
# 1 "gpio.c" 2
# 1 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\stdio.h" 1 3



# 1 "D:/Program Files/Microchip/MPLABX/v5.50/packs/Microchip/PIC10-12Fxxx_DFP/1.4.56/xc8\\pic\\include\\__size_t.h" 1 3



typedef unsigned size_t;
# 4 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\stdio.h" 2 3

# 1 "D:/Program Files/Microchip/MPLABX/v5.50/packs/Microchip/PIC10-12Fxxx_DFP/1.4.56/xc8\\pic\\include\\__null.h" 1 3
# 5 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\stdio.h" 2 3






# 1 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\stdarg.h" 1 3






typedef void * va_list[1];

#pragma intrinsic(__va_start)
extern void * __va_start(void);

#pragma intrinsic(__va_arg)
extern void * __va_arg(void *, ...);
# 11 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\stdio.h" 2 3
# 43 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\stdio.h" 3
struct __prbuf
{
 char * ptr;
 void (* func)(char);
};
# 85 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\stdio.h" 3
# 1 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\conio.h" 1 3







# 1 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\errno.h" 1 3
# 29 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\errno.h" 3
extern int errno;
# 8 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\conio.h" 2 3




extern void init_uart(void);

extern char getch(void);
extern char getche(void);
extern void putch(char);
extern void ungetch(char);

extern __bit kbhit(void);



extern char * cgets(char *);
extern void cputs(const char *);
# 85 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\stdio.h" 2 3



extern int cprintf(char *, ...);
#pragma printf_check(cprintf)



extern int _doprnt(struct __prbuf *, const register char *, register va_list);
# 180 "D:\\Program Files\\Microchip\\xc8\\v2.32\\pic\\include\\c90\\stdio.h" 3
#pragma printf_check(vprintf) const
#pragma printf_check(vsprintf) const

extern char * gets(char *);
extern int puts(const char *);
extern int scanf(const char *, ...) __attribute__((unsupported("scanf() is not supported by this compiler")));
extern int sscanf(const char *, const char *, ...) __attribute__((unsupported("sscanf() is not supported by this compiler")));
extern int vprintf(const char *, va_list) __attribute__((unsupported("vprintf() is not supported by this compiler")));
extern int vsprintf(char *, const char *, va_list) __attribute__((unsupported("vsprintf() is not supported by this compiler")));
extern int vscanf(const char *, va_list ap) __attribute__((unsupported("vscanf() is not supported by this compiler")));
extern int vsscanf(const char *, const char *, va_list) __attribute__((unsupported("vsscanf() is not supported by this compiler")));

#pragma printf_check(printf) const
#pragma printf_check(sprintf) const
extern int sprintf(char *, const char *, ...);
extern int printf(const char *, ...);
# 1 "gpio.c" 2

# 1 "./pic12f683.h" 1



volatile unsigned char * const GPIO = (unsigned char *) 0x05;
volatile unsigned char * const CMCON0 = (unsigned char *) 0x19;
volatile unsigned char * const ADCON0 = (unsigned char *) 0x1F;
volatile unsigned char * const TRISIO = (unsigned char *) 0x85;
volatile unsigned char * const OSCCON = (unsigned char *) 0x8F;
volatile unsigned char * const ANSEL = (unsigned char *) 0x9F;
# 2 "gpio.c" 2

# 1 "./gpio.h" 1



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
# 4 "./gpio.h" 2


void Gpio_Init(const GpioConfig_t * const Config);
void Gpio_Write_Byte(uint8_t byte);
# 3 "gpio.c" 2
# 17 "gpio.c"
static unsigned char volatile * const SystemOscilator = {
        (unsigned char *) OSCCON
};

static unsigned char volatile * const SystemComparator = {
        (unsigned char *) CMCON0
};

static unsigned char volatile * const SystemADConverters = {
        (unsigned char *) ADCON0
};


static unsigned char volatile * const GpioPort[1u] = {
        (unsigned char *) GPIO
};

static unsigned char volatile * const GpioDirection[1u] = {
        (unsigned char *) TRISIO
};

static unsigned char volatile * const GpioFunction[1u] = {
        (unsigned char *) ANSEL
};

void Gpio_Init(const GpioConfig_t * const Config)
{

    *SystemOscilator = 0x70;
    *SystemComparator = 0x07;
    *SystemADConverters = 0x00;

    for (uint8_t port = 0; port < 1u; port++)
    {
        *GpioPort[port] = 0x00;


        for (uint8_t i = 0; i < GPIO_MAX_PIN_NUMBER; i++)
        {
           *GpioDirection[port] = (unsigned char) (Config[i].Direction << i);

           *GpioPort[port] = (unsigned char) (Config[i].State << i);

           if (Config[i].Function == GPIO_PIN_FUNCTION_ANALOG && Config[i].Direction == GPIO_PIN_DIRECTION_INPUT)
           {
               *GpioFunction[port] = (unsigned char) (Config[i].Direction << i);
           }
           else
           {
               *GpioFunction[port] |= (unsigned char) (0 << i);
           }
        }
    }
}

void Gpio_Write_Byte(uint8_t byte)
{
    *GpioPort[0] = byte;
}
