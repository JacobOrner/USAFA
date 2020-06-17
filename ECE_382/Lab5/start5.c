//-----------------------------------------------------------------
// Name:	Coulston
// File:	lab5.c
// Date:	Fall 2014
// Purp:	Demo the decoding of an IR packet
//-----------------------------------------------------------------
#include <msp430g2553.h>
#include "start5.h"

#define UP 0x547AB8
#define DOWN 0x567A98
#define LEFT 0x578A87
int8	newIrPacket = FALSE;
int16	packetData[48];
int8	packetIndex = 0;

// -----------------------------------------------------------------------
// -----------------------------------------------------------------------
void main(void) {

	initMSP430();				// Set up MSP to process IR and buttons

	int i=0;

	while(1)  {
		if (packetIndex > 25) {
			packetIndex = 0;
			unsigned long result = 0x00000000;
			if(packetData[2] >1000 && packetData[2] < 8000){
				for(i=0; i <24; i++){
					result = result << 1;
					if(packetData[i+2] > 5000){
						result += 0x01;
					}
				}
				if(result == UP){
					P1OUT ^= (BIT0);
				}
				if(result == DOWN){
					P1OUT ^= (BIT6);
				}
				if(result == LEFT){
					P1OUT ^= (BIT0|BIT6);
				}
			}

		} // end if new IR packet arrived
	} // end infinite loop
} // end main

// -----------------------------------------------------------------------
// In order to decode IR packets, the MSP430 needs to be configured to
// tell time and generate interrupts on positive going edges.  The
// edge sensitivity is used to detect the first incoming IR packet.
// The P2.6 pin change ISR will then toggle the edge sensitivity of
// the interrupt in order to measure the times of the high and low
// pulses arriving from the IR decoder.
//
// The timer must be enabled so that we can tell how long the pulses
// last.  In some degenerate cases, we will need to generate a interrupt
// when the timer rolls over.  This will indicate the end of a packet
// and will be used to alert main that we have a new packet.
// -----------------------------------------------------------------------
void initMSP430() {

	WDTCTL=WDTPW+WDTHOLD; 		// stop WD

	BCSCTL1 = CALBC1_8MHZ;
	DCOCTL = CALDCO_8MHZ;

	P2SEL &= ~BIT6;						// This action takes
	P2SEL2 &= ~BIT6;					// three lines of code.
	P2DIR &= ~BIT6;						// Once again, this take three lines
										// to properly do

	P2IFG &= ~BIT6;						// Clear any interrupt flag on P2.3
	P2IE  |= BIT6;						// Enable P2.3 interrupt

	HIGH_2_LOW;							// check the header out.  P2IES changed.
	P1DIR |= BIT0|BIT6;					// Set LEDs as outputs
	P1OUT &= ~(BIT0|BIT6);						// And turn the LEDs off

	TA0CCR0 = 0x7D00;							// create a 16ms roll-over period
	TA0CTL &= ~TAIFG;							// clear flag before enabling interrupts = good practice
	TA0CTL = ID_2 | TASSEL_2 | MC_1 | TAIE;		// Use 1:8 prescalar off MCLK and enable interrupts

	_enable_interrupt();
}

// -----------------------------------------------------------------------
// Since the IR decoder is connected to P2.6, we want an interrupt
// to occur every time that the pin changes - this will occur on
// a positive edge and a negative edge.
//
// Negative Edge:
// The negative edge is associated with end of the logic 1 half-bit and
// the start of the logic 0 half of the bit.  The timer contains the
// duration of the logic 1 pulse, so we'll pull that out, process it
// and store the bit in the global irPacket variable. Going forward there
// is really nothing interesting that happens in this period, because all
// the logic 0 half-bits have the same period.  So we will turn off
// the timer interrupts and wait for the next (positive) edge on P2.6
//
// Positive Edge:
// The positive edge is associated with the end of the logic 0 half-bit
// and the start of the logic 1 half-bit.  There is nothing to do in
// terms of the logic 0 half bit because it does not encode any useful
// information.  On the other hand, we going into the logic 1 half of the bit
// and the portion which determines the bit value, the start of the
// packet, or if the timer rolls over, the end of the ir packet.
// Since the duration of this half-bit determines the outcome
// we will turn on the timer and its associated interrupt.
// -----------------------------------------------------------------------
#pragma vector = PORT2_VECTOR			// This is from the MSP430G2553.h file

__interrupt void pinChange (void) {

	int8	pin;
	int16	pulseDuration;			// The timer is 16-bits

	if (IR_PIN)		pin=1;	else pin=0;

	switch (pin) {					// read the current pin level
		case 0:						// !!!!!!!!!NEGATIVE EDGE!!!!!!!!!!
			pulseDuration = TA0R;	//**Note** If you don't specify TA1 or TA0 then TAR defaults to TA0R
			packetData[packetIndex++] = pulseDuration;
			LOW_2_HIGH; 				// Set up pin interrupt on positive edge
			break;

		case 1:							// !!!!!!!!POSITIVE EDGE!!!!!!!!!!!
			TA0R = 0x0000;						// time measurements are based at time 0
			HIGH_2_LOW; 						// Set up pin interrupt on falling edge
			break;
	} // end switch
	P2IFG &= ~BIT6;			// Clear the interrupt flag to prevent immediate ISR re-entry

} // end pinChange ISR

// -----------------------------------------------------------------------
//			0 half-bit	1 half-bit		TIMER A COUNTS		TIMER A COUNTS
//	Logic 0	xxx
//	Logic 1
//	Start
//	End
//
// -----------------------------------------------------------------------
#pragma vector = TIMER0_A1_VECTOR			// This is from the MSP430G2553.h file
__interrupt void timerOverflow (void) {

	TA0CTL &= ~TAIFG;
}

