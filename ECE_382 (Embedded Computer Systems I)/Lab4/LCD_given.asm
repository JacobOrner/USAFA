;-------------------------------------------------------------------------------
; MSP430 Assembler Code Template for use with TI Code Composer Studio
; This is copied from LCD_move_block file LCD_ori_main_read.asm
; Then it was modified.  Muahahahahaha.
; Now there is no main loop.   This is meant to be called from C.
; TO DO: delete main loop.
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file

;-------------------------------------------------------------------------------
UCBxTXBUF: 		.equ UCB0TXBUF
UCBxRXBUF:		.equ UCB0RXBUF
UCBxSTAT: 		.equ UCB0STAT
UCBxBR0:		.equ UCB0BR0
LCD_SCLK_PIN:	.equ	0x0020
LCD_CS_PIN:		.equ	0x0001
LCD_MOSI_PIN:	.equ	0x0080
LCD_MISO_PIN:	.equ	0x0040
LCD_DC_PIN:		.equ	0x0010
COMMAND:		.equ	0x0000
DATA:			.equ	0x0001
PWRCTRLA:		.equ	0xCB
PWRCTRLB:		.equ	0xCF
DTCTRLA1:		.equ	0xE8
DTCTRLB:		.equ	0xEA
POSC:			.equ	0xED
PRC:			.equ	0xF7
ILIPC1:			.equ	0xC0
ILIPC2:			.equ	0xC1
ILIVC1:			.equ	0xC5
ILIVC2:			.equ	0xC7
ILIMAC:			.equ	0x36
COLMOD:			.equ	0x3A
ILIFCNM:		.equ	0xB1
ILIDFC:			.equ	0xB6
ILIGFD:			.equ	0xF2
ILIGS:			.equ	0x26
ILIPGC:			.equ	0xE0
ILINGC:			.equ	0xE1
RAMWRP:     	.equ	0x2C
DISPON:    		.equ	0x29
SLEEPOUT:		.equ	0x11
CASETP:     	.equ	0x2A
PASETP:      	.equ	0x2B
LCD_HEIGHT:		.equ	320
LCD_WIDTH:		.equ	240
COLOR1:			.equ	0x4416	;steel blue
ORIENT:			.equ	0x88	;;this sets default screen orientation. other values are 0x48, 0xE8, 0x88, 0x28. Origin at upper L corner.
BOX_WIDTH:		.equ	0x0A

;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section
            .retainrefs                     ; Additionally retain any sections
                                            ; that have references to current
                                            ; section
			.global		initMSP
			.global		initLCD
			.global		clearScreen
			.global		drawBox
			.global		drawBall
			.global 	drawLine
			.global		drawNumber
			.global		Delay40ms
			.global		Delay160ms

gamma1:		.byte		0x0F, 0x31, 0x2B, 0x0C, 0x0E, 0x08, 0x4E, 0xF1
			.byte		0x37, 0x07, 0x10, 0x03, 0x0E, 0x09, 0x00	;yes, there are only 15 parameters
gamma2:		.byte		0x00, 0x0E, 0x14, 0x03, 0x11, 0x07, 0x31, 0xC1
			.byte		0x48, 0x08, 0x0F, 0x0C, 0x31, 0x36, 0x0F

ball:		.byte		0x3C, 0x7E, 0xFF, 0xFF, 0xFF, 0xFF, 0x7E, 0x3C


;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer


;-------------------------------------------------------------------------------
;	Name: initMSP
;	Inputs: none
;	Outputs: none
;	Purpose: initialize the SPI on the MSP430
;	Registers: none
;-------------------------------------------------------------------------------
initMSP:
		mov	#CALBC1_8MHZ, &BCSCTL1		;now we can use the 8MHz clock signal
		mov	#CALDCO_8MHZ, &DCOCTL

		; let's set up the movement - initialize buttons P2.0, 2.1, 2.2, 2.3 - input, resistor enabled and it is pull up ; buttons active low
	    bic.b  #BIT0, &P2DIR	;S2 = left
        bis.b  #BIT0, &P2REN
        bis.b  #BIT0, &P2OUT

       	bic.b  #BIT1, &P2DIR	;S3 = down
        bis.b  #BIT1, &P2REN
        bis.b  #BIT1, &P2OUT

        bic.b  #BIT2, &P2DIR	;S4 = up
        bis.b  #BIT2, &P2REN
        bis.b  #BIT2, &P2OUT

        bic.b  #BIT3, &P2DIR	;S5 = right
        bis.b  #BIT3, &P2REN
        bis.b  #BIT3, &P2OUT

        bic.b  	#BIT3, &P1DIR	;S1 = other random switch
        bis.b  	#BIT3, &P1REN
        bis.b  	#BIT3, &P1OUT

		bis	#LCD_SCLK_PIN, &P1OUT
		bis	#LCD_SCLK_PIN, &P1DIR
		bis #LCD_CS_PIN, &P1OUT
		bis #LCD_CS_PIN, &P1DIR
		bis #LCD_MOSI_PIN, &P1OUT
		bis #LCD_MOSI_PIN, &P1DIR
		bis	#LCD_DC_PIN, &P1OUT
		bis #LCD_DC_PIN, &P1DIR

		bis	#LCD_SCLK_PIN|LCD_MOSI_PIN|LCD_MISO_PIN, &P1SEL
		bis	#LCD_SCLK_PIN|LCD_MOSI_PIN|LCD_MISO_PIN, &P1SEL2
		mov #UCCKPH|UCMSB|UCMST|UCSYNC, &UCB0CTL0
		bis #UCSSEL_2, &UCB0CTL1
		bis #BIT0, &UCB0BR0
		clr	&UCB0BR1
		bic	#UCSWRST, &UCB0CTL1
		ret

;-------------------------------------------------------------------------------
;	Name: initLCD
;	Inputs: none
;	Outputs: none
;	Purpose: tell the ILI9340 to get the LCD ready
;	Registers: r5, r6, r7, r12 destroyed
;-------------------------------------------------------------------------------
initLCD:
	mov.b	#PWRCTRLA, r12
	call	#writeCommand
	mov.b	#0x39, r12
	call	#writeData
	mov.b	#0x2C, r12
	call	#writeData
	mov.b	#0x00, r12
	call	#writeData
	mov.b	#0x34, r12
	call	#writeData
	mov.b	#0x02, r12
	call	#writeData

	mov.b	#PWRCTRLB, r12
	call	#writeCommand
	mov.b	#0x00, r12
	call	#writeData
	mov.b	#0xC1, r12
	call	#writeData
	mov.b	#0x30, r12
	call	#writeData

	mov.b	#DTCTRLA1, r12
	call	#writeCommand
	mov.b	#0x85, r12
	call	#writeData
	mov.b	#0x00, r12
	call	#writeData
	mov.b	#0x78, r12
	call	#writeData

	mov.b	#DTCTRLB, r12
	call	#writeCommand
	mov.b	#0x00, r12
	call	#writeData
	mov.b	#0x00, r12
	call	#writeData

	mov.b	#POSC, r12
	call	#writeCommand
	mov.b	#0x64, r12
	call	#writeData
	mov.b	#0x03, r12
	call	#writeData
	mov.b	#0x12, r12
	call	#writeData
	mov.b	#0x81, r12
	call	#writeData

	mov.b	#PRC, r12
	call	#writeCommand
	mov.b	#0x20, r12
	call	#writeData

	mov.b	#ILIPC1, r12
	call	#writeCommand
	mov.b	#0x23, r12
	call	#writeData
	mov.b	#ILIPC2, r12
	call	#writeCommand
	mov.b	#0x10, r12
	call	#writeData
	mov.b	#ILIVC1, r12
	call	#writeCommand
	mov.b	#0x3E, r12
	call	#writeData
	mov.b	#0x28, r12
	call	#writeData
	mov.b	#ILIVC2, r12
	call	#writeCommand
	mov.b	#0x86, r12
	call	#writeData

	mov.b	#ILIMAC, r12
	call	#writeCommand
	mov.b	#ORIENT, r12
	call	#writeData

	mov.b	#COLMOD, r12
	call	#writeCommand
	mov.b	#0x55, r12
	call	#writeData

	mov.b	#ILIFCNM, r12
	call	#writeCommand
	mov.b	#0x00, r12
	call	#writeData
	mov.b	#0x18, r12
	call	#writeData

	mov.b	#ILIDFC, r12
	call	#writeCommand
	mov.b	#0x08, r12
	call	#writeData
	mov.b	#0x82, r12
	call	#writeData
	mov.b	#0x27, r12
	call	#writeData

	mov.b	#ILIGFD, r12
	call	#writeCommand
	mov.b	#0x00, r12
	call	#writeData
	mov.b	#ILIGS, r12
	call	#writeCommand
	mov.b	#0x01, r12
	call	#writeData

	mov.b	#ILIPGC, r12
	call	#writeCommand
	mov		#gamma1, r5		;r5 holds address of array
	mov		#15, r6			;r6 holds count loop

PGammaCorr:
	mov.b	@r5+, r12
	call	#writeData
	dec		r6
	jnz		PGammaCorr

	mov.b	#ILINGC, r12
	call	#writeCommand
	mov		#gamma2, r5		;r5 holds address of array
	mov		#15, r6			;r6 holds count loop

NGammaCorr:
	mov.b	@r5+, r12
	call	#writeData
	dec		r6
	jnz		NGammaCorr

	mov.b	#SLEEPOUT, r12
	call	#writeCommand

	;need 120ms afterSLEEPOUT command
	call	#Delay160ms

	mov.b	#DISPON, r12
	call	#writeCommand
	mov.b	#RAMWRP, r12
	call	#writeCommand

	ret

;-------------------------------------------------------------------------------
;	Name: writeCommand
;	Inputs: command
;	Outputs: none
;	Purpose:
;	Registers: r12 contains the command
;-------------------------------------------------------------------------------
writeCommand:
	push	r12
	bic 	#LCD_CS_PIN, &P1OUT
	bic		#LCD_DC_PIN, &P1OUT
	mov.b	 r12, &UCB0TXBUF

pollC:
	bit		#UCBUSY, &UCB0STAT	;while UCBxSTAT & UCBUSY
	jnz		pollC

	bis		#LCD_CS_PIN, &P1OUT
	pop		r12
	ret

;-------------------------------------------------------------------------------
;	Name: writeData
;	Inputs: r12 - data to be written
;	Outputs: none
;	Purpose:
;	Registers: r12 preserved
;-------------------------------------------------------------------------------
writeData:
	push	r12
	bic 	#LCD_CS_PIN, &P1OUT
	bis		#LCD_DC_PIN, &P1OUT
	mov.b 	r12, &UCBxTXBUF

pollD:
	bit	#UCBUSY, &UCBxSTAT	;while UCBxSTAT & UCBUSY
	jnz	pollD

	bis	#LCD_CS_PIN, &P1OUT
	pop	r12
	ret

;-------------------------------------------------------------------------------
;	Name: clearScreen
;	Inputs: none
;	Outputs: none
;	Purpose:  clear LCD screen
;	Registers: r6, r7, r8, r12, r13, r14, r15 used and preserved
;-------------------------------------------------------------------------------
clearScreen:
	push	r6
	push	r7
	push	r8
	push	r12
	push	r13
	push	r14
	push	r15
	mov		#0x00, r12
	mov		#0x00, r13
	mov		#LCD_WIDTH, r14	 ;240 pixels wide
	dec		r14
	mov		#LCD_HEIGHT, r15	;320 pixels tall
	dec		r15
	call	#setArea
	mov		#0x0000, r12	;0x0000 for black or 0xFFFFF for white; other colors in between
	call	#splitColor	;returns r12 with MSB of color, r13 the LSB

	mov		#LCD_WIDTH, r7
	mov		#LCD_HEIGHT, r8
paintPix:
	call	#writeData
	mov.b	r12, r6
	mov.b 	r13, r12
	call	#writeData
	mov.b	r6, r12		;r12 returned for color MSB preservation
	dec		r7
	jnz		paintPix	;paint all columns
	mov		#LCD_WIDTH, r7
	dec		r8
	jnz		paintPix	;paint each row, too
	pop		r15
	pop		r14
	pop		r13
	pop		r12
	pop		r8
	pop		r7
	pop		r6
	ret

;-------------------------------------------------------------------------------
;	Name: setArea
;	Inputs: xStart in r12, yStart in r13, xEnd in r14, yEnd in r15
;	Outputs: none
;	Purpose:
;	Registers: r10, r12, 13, 14, 15 preserved
;-------------------------------------------------------------------------------
setArea:
	push 	r10
	push	r12
	push	r13
	push	r14
	push	r15
	mov 	r12, r10
	mov.b	#CASETP, r12	;CASETEP - column address set.  sounds like x. but if we are sideways, it must be y.
	call	#writeCommand
	swpb	r10
	mov.b	r10, r12 ;xStartMSB
	call	#writeData
	swpb	r10
	mov.b	r10, r12 ;xStart other half
	call	#writeData
	mov		r14, r10
	swpb	r10
	mov.b	r10, r12	; xEndMSB
	call	#writeData
	swpb	r10
	mov.b	r10, r12
	call	#writeData	;xEnd other half

	mov.b	#PASETP, r12
	call	#writeCommand
	mov		r13, r10
	swpb	r10
	mov.b	r10, r12	;yStartMSB
	call	#writeData
	swpb	r10
	mov.b	r10, r12	;yStart other half
	call	#writeData

	mov		r15, r10
	swpb	r10
	mov.b	r10, r12	;yEndMSB
	call	#writeData
	swpb	r10
	mov.b	r10, r12	;yEnd other half
	call	#writeData

	mov.b	#RAMWRP, r12
	call	#writeCommand

	pop		r15
	pop		r14
	pop		r13
	pop		r12
	pop		r10
	ret

;-------------------------------------------------------------------------------
;	Name: splitColor
;	Inputs: desired  color in r12
;	Outputs: color MSB in r12, bkgd color LSB in r13
;	Purpose:
;	Registers: r12, r13 modified
;-------------------------------------------------------------------------------
splitColor:
	mov.b	r12, r13
	swpb	r12
	and		#0x00FF, r12	;clear upper byte of r12
	ret

;-------------------------------------------------------------------------------
;	Name: drawLine
;	Inputs: xStart in r12, yStart in r13, xEnd in r14, yEnd in r15
;	Outputs: none
;	Purpose: draw a line on the LCD
;	Registers: all registers preserved
;-------------------------------------------------------------------------------
drawLine:
	push	r4
	push	r5
	push	r6
	push	r7
	push	r8
	push	r9
	push	r10
	push	r11
	push	r12
	push	r13
	push	r14
	push	r15

	mov.w	r12,	r10
	mov.w	r14,	r11		;move color to r11 so drawPixel can use it
	mov.w	r12,	r8		;r8 and r9 are max x and y respectively
	mov.w	r13,	r9
	add.w	#BOX_WIDTH,	r8
	dec.w	r8

loopDrawLine:
	cmp		r12,	r8
	jl		resetXLine
	cmp		r13,	r9
	jl		linedrawEnd

	call	#drawPixel
	inc		r12
	jmp		loopDrawLine

resetXLine:
	mov.w	r10,	r12
	inc		r13
	jmp		loopDrawLine

linedrawEnd:
	pop		r15
	pop		r14
	pop		r13
	pop		r12
	pop		r11
	pop		r10
	pop		r9
	pop		r8
	pop		r7
	pop		r6
	pop		r5
	pop		r4
	ret

;-------------------------------------------------------------------------------
;	Name: drawBox
;	Inputs: xStart in r12, yStart in r13, box color in r14
;	Outputs: none
;	Purpose: draw a 10x10 box
;	Registers:
;-------------------------------------------------------------------------------
drawBox:
	push	r4
	push	r5
	push	r6
	push	r7
	push	r8
	push	r9
	push	r10
	push	r11
	push	r12
	push	r13
	push	r14
	push	r15

	mov.w	r12,	r10
	mov.w	r14,	r11		;move color to r11 so drawPixel can use it
	mov.w	r12,	r8		;r8 and r9 are max x and y respectively
	mov.w	r13,	r9
	add.w	#BOX_WIDTH,	r8
	add.w	#BOX_WIDTH,	r9
	dec.w	r8
	dec.w	r9

loopDraw:
	cmp		r12,	r8
	jl		resetX
	cmp		r13,	r9
	jl		boxdrawEnd

	call	#drawPixel
	inc		r12
	jmp		loopDraw

resetX:
	mov.w	r10,	r12
	inc		r13
	jmp		loopDraw

boxdrawEnd:
	pop		r15
	pop		r14
	pop		r13
	pop		r12
	pop		r11
	pop		r10
	pop		r9
	pop		r8
	pop		r7
	pop		r6
	pop		r5
	pop		r4
	ret

;-------------------------------------------------------------------------------
;	Name: drawBall
;	Inputs: xStart in r12, yStart in r13, ball color in r14
;	Outputs: none
;	Purpose: draw an 8x8 ball
;	Registers: all registers preserved
;-------------------------------------------------------------------------------
drawBall:
	push	r4
	push	r5
	push	r6
	push	r7
	push	r8
	push	r9
	push	r10
	push	r11
	push	r12
	push	r13
	push	r14
	push	r15

	mov.w	r12,	r10
	mov.w	r14,	r11		;move color to r11 so drawPixel can use it
	mov.w	r12,	r6		;r8 and r9 are max x and y respectively
	mov.w	r13,	r7
	add.w	#7,	r6
	add.w	#7,	r7

	mov.w	#ball,  r8
	mov.b	@r8+,	r9

loopBall:
	cmp		r12,	r6
	jl		ball_resetX
	cmp		r13,	r7
	jl		balldrawEnd

	bit.b	#0x01,	r9
	jz		skip
	call	#drawPixel
skip:
	rra.b	r9
	inc		r12
	jmp		loopBall

ball_resetX:
	mov.w	r10,	r12
	inc		r13
	mov.b	@r8+,	r9
	jmp		loopBall

balldrawEnd:
	pop		r15
	pop		r14
	pop		r13
	pop		r12
	pop		r11
	pop		r10
	pop		r9
	pop		r8
	pop		r7
	pop		r6
	pop		r5
	pop		r4
	ret

;-------------------------------------------------------------------------------
;	Name: drawNumber
;	Inputs: xStart in r12, yStart in r13, ball color in r14, data pointer in r15
;	Outputs: none
;	Purpose: draw an 8x8 ball
;	Registers: all registers preserved
;-------------------------------------------------------------------------------
drawNumber:
	push	r4
	push	r5
	push	r6
	push	r7
	push	r8
	push	r9
	push	r10
	push	r11
	push	r12
	push	r13
	push	r14
	push	r15

	;mov.b	#ILIMAC, r12
	;call	#writeCommand
	;mov.b	#ORIENT, r12
	;call	#writeData

	mov.w	r12,	r10
	mov.w	r14,	r11		;move color to r11 so drawPixel can use it
	mov.w	r12,	r6		;r6 and r7 are max x and y respectively
	mov.w	r13,	r7
	add.w	#7,	r6
	add.w	#5,	r7

	mov.w	r15,  r8
	mov.b	@r8+,	r9

loopNumber:
	cmp		r12,	r6
	jl		number_resetX
	cmp		r13,	r7
	jl		numberdrawEnd

	bit.b	#0x01,	r9
	jz		num_skip
	call	#drawPixel
num_skip:
	rra.b	r9
	inc		r12
	jmp		loopNumber

number_resetX:
	mov.w	r10,	r12
	inc		r13
	mov.b	@r8+,	r9
	jmp		loopNumber

numberdrawEnd:
	;mov.b	#ILIMAC, r12
	;call	#writeCommand
	;mov.b	#ORIENT, r12
	;call	#writeData

	pop		r15
	pop		r14
	pop		r13
	pop		r12
	pop		r11
	pop		r10
	pop		r9
	pop		r8
	pop		r7
	pop		r6
	pop		r5
	pop		r4
	ret

;-------------------------------------------------------------------------------
;	Name: drawPixel
;	Inputs: color in r11, x in r12, y in r13, where (x, y) is the coordinate of the pixel
;	Outputs: none
;	Purpose: draws a pixel in a particular spot
;	Registers: r11, r12, 13, 14, 15 preserved
;-------------------------------------------------------------------------------
drawPixel:
	push	r11
	push	r12
	push	r13
	push	r14
	push	r15
	mov.w	r12, r14
	mov.w	r13, r15
	call	#setArea
	mov		r11, r12
	call	#splitColor
	call	#writeData
	mov		r13, r12
	call	#writeData
	pop		r15
	pop		r14
	pop		r13
	pop		r12
	pop		r11
	ret

;-------------------------------------------------------------------------------
;	Name: Delay40ms - updated for 8MHz clock
;	Inputs: none
;	Outputs: none
;	Purpose: this is a 40ms delay.
;	Registers: r7 preserved
;-------------------------------------------------------------------------------
Delay40ms:
	push	r7
	mov		#0xD154, r7		;should be ~20ms, based on 8MHz clock - plenty of room for error
delay:
	dec		r7
	jnz		delay
	mov		#0xD154, r7		;should be ~20ms, based on 8MHz clock - plenty of room for error
delay2:
	dec		r7
	jnz		delay2
	pop		r7
	ret

;-------------------------------------------------------------------------------
;	Name: Delay160ms - updated for 8 MHz clock
;	Inputs: none
;	Outputs: none
;	Purpose: creates ~160ms delay
;	Registers: r7 preserved
;-------------------------------------------------------------------------------
Delay160ms:
		push	r7
		call	#Delay40ms
		call	#Delay40ms
		call	#Delay40ms
		call	#Delay40ms
		pop		r7
		ret
;-------------------------------------------------------------------------------
;           Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect 	.stack

;-------------------------------------------------------------------------------
;           Interrupt Vectors
;-------------------------------------------------------------------------------
   ;         .sect   ".reset"                ; MSP430 RESET Vector
    ;        .short  RESET
