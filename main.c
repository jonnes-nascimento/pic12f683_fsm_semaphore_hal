/* ==============================================================================================
	
	Programa: 
        FSM Semaphore PIC12F683
	
	Descricao: 
        Implementacao de uma maquina de estados para controle de um semaforo utilizando
        biblioteca HAL.
	
	Autor:           Eng. Jonnes Nascimento
	Local, Data:     Santos, 16/12/2021
	Data de Revisao: --
	
================================================================================================*/

/* ==============================================================================================
    Configuracoes
================================================================================================*/
#if defined (__XC8__)
    #pragma config FOSC     = INTOSCCLK // Oscillator Selection bits (INTOSC oscillator: CLKOUT function on RA4/OSC2/CLKOUT pin, I/O function on RA5/OSC1/CLKIN)
    #pragma config WDTE     = OFF       // Watchdog Timer Enable bit (WDT disabled)
    #pragma config PWRTE    = OFF       // Power-up Timer Enable bit (PWRT disabled)
    #pragma config MCLRE    = OFF       // MCLR Pin Function Select bit (MCLR pin function is disabled)
    #pragma config CP       = OFF       // Code Protection bit (Program memory code protection is disabled)
    #pragma config CPD      = OFF       // Data Code Protection bit (Data memory code protection is disabled)
    #pragma config BOREN    = OFF       // Brown Out Detect (BOR enabled)
    #pragma config IESO     = OFF       // Internal External Switchover bit (Internal External Switchover mode is enabled)
    #pragma config FCMEN    = OFF       // Fail-Safe Clock Monitor Enabled bit (Fail-Safe Clock Monitor is enabled)
#else
    #error Configs not defined due compiler is not foreseen
#endif

/* ==============================================================================================
	Bibliotecas 
================================================================================================*/
#include <xc.h>
#include "gpio.h"

/* ==============================================================================================
	Definicoes de Tipos de Dados e Estruturas
================================================================================================*/
#define _XTAL_FREQ 8000000


/* ==============================================================================================
	Constantes e Definicoes
================================================================================================*/
#define ST_VERDE     0
#define ST_AMARELO   1
#define ST_VERMELHO  2
#define ST_APAGADO   3

#define LED_VERDE    0x04
#define LED_AMARELO  0x02
#define LED_VERMELHO 0x01
#define LED_APAGADO  0x00

typedef struct sState
{
    uint8_t  saida;
    uint16_t tempo;
    uint8_t  prox_estado[2];
} State;

const State FSM[4] = {
    [ST_VERDE]    = { LED_VERDE,    1500, {ST_AMARELO,  ST_AMARELO} },
    [ST_AMARELO]  = { LED_AMARELO,  500, {ST_VERMELHO, ST_APAGADO} },
    [ST_VERMELHO] = { LED_VERMELHO, 1500, {ST_VERDE,    ST_AMARELO} },
    [ST_APAGADO]  = { LED_APAGADO,  500, {ST_AMARELO,  ST_AMARELO} }
};


/* ==============================================================================================
	Variaveis Globais
================================================================================================*/


/* ==============================================================================================
	Prototipos de Funcoes Auxiliares
================================================================================================*/
void delay_ms(uint16_t tempo);


/* ==============================================================================================
	Funcao Principal
================================================================================================*/
void main(void) 
{
    const GpioConfig_t * config = GpioConfigGet();
    Gpio_Init(config);
    
    uint8_t estado = 0;
    GpioPort_t port;
    
    while(1)
    {
        port.Byte = FSM[estado].saida;
        Gpio_Write_Register(port);
        
        delay_ms(FSM[estado].tempo);
        
        estado = FSM[estado].prox_estado[!GP3];
    }
} /* main */


/* ==============================================================================================
	Funcoes Auxiliares
================================================================================================*/
void delay_ms(uint16_t tempo)
{
    while (tempo > 0)
    {
        __delay_ms(1);        
        tempo--;
    }
}


/* ==============================================================================================
	Fim do Programa
================================================================================================*/

