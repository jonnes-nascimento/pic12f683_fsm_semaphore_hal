#ifndef _PIC12F683_H
#define _PIC12F683_H

volatile unsigned char * const GPIO   = (unsigned char *) 0x05;
volatile unsigned char * const CMCON0 = (unsigned char *) 0x19;
volatile unsigned char * const ADCON0 = (unsigned char *) 0x1F;
volatile unsigned char * const TRISIO = (unsigned char *) 0x85;
volatile unsigned char * const OSCCON = (unsigned char *) 0x8F;
volatile unsigned char * const ANSEL  = (unsigned char *) 0x9F;

#endif //_PIC12F683_H
