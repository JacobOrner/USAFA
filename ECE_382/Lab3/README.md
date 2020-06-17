# Serial Peripheral Introduction - Lab #3 - I/O

## By C2C Jake Orner

###Objectives
The objective of this lab was to write a complete assembly language program that outputs a 10x10 pixel square onto the LCD boosterpack using what has been learned in class including subroutines and serial peripheral input and output. Using Serial Peripheral input and output, the user pushes the buttons on the LCD boosterpack and the square shown on the screen moves in response.

###Mega-Prelab 
For this lab, a large prelab was required. This was to ensure an understanding of the given code and give users a chance to understand what is happening before being challenged to make changes themselves.

##### Delay Subroutine
A header for a subroutine which would delay the input from the user for 160 ms was given. And it was part of the assignment to create a loop which would perform the delay. Below is the code and calculations given for the timing of that delay.
	
	Delay160ms:
		push   r5                      ; 3 cycles
		push   r6					   ; 3 cycles
    	mov.w  #0xf9ff, r5             ; 2 cycles
	    mov.w  #0x0004, r6			   ; 2 cycles

	delay:  
		dec           r5               ; 1 cycle
		inc			  r5			   ; 1 cycle
		dec			  r5			   ; 1 cycle
        jnz           delay            ; 2 cycles
	    
        dec			  r6			   ; 1 cycle
		jnz			  delay			   ; 2 cycles

        pop           r5               ; 2 cycles
		pop			  r6			   ; 2 cycles
        ret                            ; 3 cycles
	
	3+3+2+2+(((1+1+1+2)*0xf9ff)*4+(1+2)*4)+2+2+3 = 1279997 cycles
	1279997/8000000 = 159.99 ms

##### ILI9341 LCD BoosterPack 
The below table shows the pin number (1 - 20) that signal connects to on the MSP 430, and the PX.X is the pin and port it connects to (e.g. P1.0).

| Name | Pin # | PX.X|
|:-: | :-: |:-: |
| S1  |  5  |  P1.3 |
| S2  |  8  |  P2.0 |
| S3  |  9  |  P2.1 |
| S4  | 10  |  P2.2 |
| S5  | 11  |  P2.3 |
| MOSI| 15  |  P1.7 | 
| CS  |  2  |  P1.0 |
| DC  |  6  |  P1.4 |
| MISO| 14  |  P1.6 |

In order for the signals to be properly configured, hex values needed to be combined with registers and either a bis or bic instruction. If the register is not affected, an N/A was used. Below is a table of the signals and corresponding registers.

|Signal|PxDIR|PxREN|PxOUT|PxSEL|PxSEL2|
|:-:|:-:|:-:|:-:|:-:|:-:|
| S1 | bic #BIT3 | bis #BIT3 | bis #BIT3 | bic #BIT3 | bic #BIT3 |
|MOSI|    N/A    | bic #BIT7 | bis #BIT7 | bis #BIT7 | bis #BIT7 |
| CS | bis #BIT0 |    N/A    | bic #BIT0 | bic #BIT0 | bis #BIT0 |



#### Configure the MSP430
Below is a table of the pins initialized on port 1 for the configuration of the MSP430, along with their respective pin numbers and function.

| Name | Pin # | Function |
|:-:|:-:|:-:|
| SCLK | 1.5 |     Serial Clock    |
|  CS  | 1.0 |   LCD Chip Select   |
| MOSI | 1.7 | Master Out Slave In |
|  DC  | 1.4 |   Command Select    |

Below the pin configuration code are some lines of code from the lab3_given.asm file (lines 134 - 141) to properly configure the SPI subsystem.  This code was used to answer the next two questions.

	1:		bis.b	#UCSWRST, &UCB0CTL1
	2:		mov 	#UCCKPH|UCMSB|UCMST|UCSYNC, &UCB0CTL0
	3:		bis 	#UCSSEL_2, &UCB0CTL1
	4:		bis 	#BIT0, &UCB0BR0
	5:		clr	&UCB0BR1
	6:		bis	#LCD_SCLK_PIN|LCD_MOSI_PIN|LCD_MISO_PIN, &P1SEL
	7:		bis	#LCD_SCLK_PIN|LCD_MOSI_PIN|LCD_MISO_PIN, &P1SEL2
	8:		bic	#UCSWRST, &UCB0CTL1

Fill in the chart below with the function that is enabled by the lines 6&7 of the above code.  Your device-specific datasheet can help.

| Pin name | Function | 
|:-:|:-:|
| P1.5 | Serial Clock Enabled |
| P1.7 | Master In Slave Out Enabled|
| P1.6 | Master Out Slave In Enabled|

Next, describe specifically what happens in each of the eight lines of code above.  Line 1 and 3 have been done for you as an example.

	Line 1: Setting the UCSWRST bit in the CTL1 register resets the subsystem into a known state until it is cleared. <br>
	Line 2: Sets the appropriate bits in the control registers to have data capture on the second edge, use the MSB first, use master mode, and synchronous mode.
	Line 3: The UCSSEL_2 setting for the UCB0CTL1 register has been chosen, selecting the SMCLK (sub-main clock) as the bit rate source clock for when the MSP 430 is in master mode. <br>
	Line 4: Set the bit for the numerator in the SMCLK.
	Line 5: Clear the bit for the denominator in the SMCLK, thus making it not scale.
	Line 6: Multiplexes the P1SEL pin to enable the SCLK, MOSI, and MISO.
	Line 7: Multiplexes the P1SEL2 pin to enable the SCLK, MOSI, and MISO.
	Line 8: Turns off the reset to enable the changes made to the system.

#### Communicate with the LCD
The following code (lines 293 - 333) sends one byte (either data or command) to the TM022HDH26 display using its 8-bit protocol.  

	;----------------------------------------------------------------------------
	;	Name: writeCommand
	;	Inputs: command in r12
	;	Outputs: none
	;	Purpose: send a command to the LCD
	;	Registers: r12 preserved
	;----------------------------------------------------------------------------
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
	
	;----------------------------------------------------------------------------
	;	Name: writeData
	;	Inputs: data to be written in r12
	;	Outputs: none
	;	Purpose: send data to the LCD
	;	Registers: r12 preserved
	;----------------------------------------------------------------------------
	writeData:
		push	r12
		bic 	#LCD_CS_PIN, &P1OUT
		bis	#LCD_DC_PIN, &P1OUT
		mov.b 	r12, &UCBxTXBUF
	
	pollD:
		bit	#UCBUSY, &UCBxSTAT	;while UCBxSTAT & UCBUSY
		jnz	pollD
	
		bis	#LCD_CS_PIN, &P1OUT
		pop	r12
		ret


This code was used to draw two timing diagrams (one for each subroutine) of the expected behavior of LCD_CS_PIN, LCD_DC_PIN, LCD_SCLK_PIN, and UCBxTXBUF from the begining of these subroutines to the end.  They are shown below.
![Write Command](https://bytebucket.org/Orner_Jacob/ece_382/raw/8cef25bf3e5070cd4d1bf8683995919edb8fcb33/Lab3/images/WriteCommand.png?token=8d8e49cd33a5d94188ce493bc06b2eef1bb6c9ce)

![Write Data](https://bytebucket.org/Orner_Jacob/ece_382/raw/8cef25bf3e5070cd4d1bf8683995919edb8fcb33/Lab3/images/WriteData.png?token=2697b8e3be3236fe0ba169dc0c8f7210e6cb0c6a)


#### Draw a pixel
The following code (lines 541 - 565) draws a pixel of a predetermined color at the coordinate (R12, R13).  Four subroutines are called to execute this seemingly simple task.  Below is a table with each subroutine and its corresponding task.

|Subroutine| Purpose|
|:-:|:-:|
|setArea| Defines the area the LCD will write to |
|splitColor| Splits the color word into color bytes |
|writeData| Sends data to the LCD to tell it the MSB of the color of the pixel|
|writeData| Sends data to the LCD to tell it the LSB of the color of the pixel|


	;----------------------------------------------------------------------------
	;	Name: drawPixel
	;	Inputs: x in r12, y in r13, where (x, y) is the pixel coordinate
	;	Outputs: none
	;	Purpose: draws a pixel in a particular spot
	;	Registers: r12, 13, 14, 15 preserved
	;----------------------------------------------------------------------------
	drawPixel:
		push	r12
		push	r13
		push	r14
		push	r15
		mov.b	r12, r14
		mov.b	r13, r15
		call	#setArea
		mov		#COLOR1, r12
		call	#splitColor
		call	#writeData
		mov		r13, r12
		call	#writeData
		pop		r15
		pop		r14
		pop		r13
		pop		r12
		ret

#### Preliminary design
In order to design the program, I will modify the given code by creating a new function called draw_square. I will call this function to draw the initial square. Then, I will poll the buttons on the LCD Boosterpack and depending on the button, will add or subtract the square height from the coordinates for the previous square, clear the screen, and draw the new square at the proper place on the screen. After the new square is drawn, I will loop back to the polling and continue checking for input.

#####Setup Code:
	call 	#initMSP
	call	#Delay160ms
	call 	#initLCD
	call	#Delay160ms
	call	#clearScreen

	bic.b  	#0x0F, &P2DIR	;prepare S2, S3, S4, and S5 for polling
    bis.b  	#0x0F, &P2REN
    bis.b  	#0x0F, &P2OUT
    clr		r6
	mov		#XSTART, r12
	mov		#YSTART, r13
	mov		#SQUAREHEIGHT, r11

This code initializes the MSP board and the LCD Boosterpack. It then clears the screen of the Boosterpack and prepares the buttons for polling. After this, it moves the starting coordinates XSTART and YSTART and the SQUAREHEIGHT value into registers.

The code for polling the buttons for input loops until an input is received. Once input is given, the loop jumps to the corresponding subroutine for that button. Below is the code for the polling of the buttons.

#####Polling Loop:
	polling:
		bit.b	#BIT0, &P2IN	; Poll S2
		jz		left			; button is active low
		bit.b	#BIT1, &P2IN	; Poll S3
		jz		down			; button is active low
		bit.b	#BIT2, &P2IN	; Poll S4
		jz		up				; button is active low
		bit.b	#BIT3, &P2IN	; Poll S5
		jz		right			; button is active low

		jmp		poll_s1

Once input has been received, the program jumps to the corresponding direction code the square will move in. This is either left, right, up, or down depending on the input. Below is the code that moves the square.

#####Moving Code:
	left:
		call	#clearScreen
		cmp		#10, r12
		jlo		far_left

		sub		#SQUAREHEIGHT, r12		;allows the line to change its x position
		sub		#SQUAREHEIGHT, r13
		mov		#SQUAREHEIGHT, r11
		jmp		draw_square

	right:
		call	#clearScreen
		sub		#SQUAREHEIGHT, r13
		cmp		#230, r12
		jhs		far_right

		add		#SQUAREHEIGHT, r12		;allows the line to change its x position
		mov		#SQUAREHEIGHT, r11
		jmp		draw_square

	up:
		call	#clearScreen
		sub		#SQUAREHEIGHT, r13		;allows the line to change its y position
		cmp		#5, r13
		jlo		far_up

		sub		#SQUAREHEIGHT, r13
		mov		#SQUAREHEIGHT, r11
		jmp		draw_square

	down:
		call	#clearScreen
		cmp		#320, r13
		jhs		far_down

		mov		#SQUAREHEIGHT, r11
		jmp		draw_square

The draw square code is the main piece of this program. It it a loop which draws ten lines thus forming a square on the LCD. A register is loaded with the value of the height of the square and the program draws a line and decrements the register each time through the loop. When the value of the register reaches 0, the routine jumps to the polling loop. Below is the code for the draw square routine.

#####Draw Square Code:
	draw_square:
		cmp		#0x00, r11
		jz		polling

		mov		r12, r14
		mov		r13, r15
		add		#XLINELEN, r14
		call	#drawLine
		dec		r11
		inc		r13
		jmp		draw_square
	
###Software flow chart or algorithms
The main algorithm necessary for this program included the polling loop. While the program was not actively drawing or clearing the screen, it was polling the buttons waiting for input. Below is the flowchart for the main routine.

![Main Flowchart](https://bytebucket.org/Orner_Jacob/ece_382/raw/ef07c6c86a58a33408af55b75a873558fd35ff08/Lab3/images/MainFlowchart.png?token=96d9a22905f9d144417b26f075c6ea581835f047)

In the main program, when the draw_square subroutine is called, the program progresses through the draw_square loop and outputs the square onto the LCD board in a 10x10 box of pixels in the specified x and y coordinates passed to the subroutine. Below is the flowchart for the draw_square routine.

![draw_square Flowchart](https://bytebucket.org/Orner_Jacob/ece_382/raw/3ebf0efcc60b1145949d1df964e9b4b58eec7a3d/Lab3/images/DrawSquareFlowchart.png?token=1fc54e7b737570075c45c002207e7667352c1faf)


###Logic Analyzer
When S1 is detected as being pressed and released (lines 100 - 102), the drawLine subroutine is called.  The MSP430 generates several packets of data that are sent to the LCD, causing a horizontal bar to be drawn. The logic analyzer was configured to capture the waveform generated when the S1 button was pressed and released, and the data bits of each 8-bit waveform were decoded. 

|Packet|Line|Command/Data|8-bit packet|Meaning of packet|
|:-:|:-:|:-:|:-:|
|1|396|Command|0x2A|Column Address Set|
|2|397| Data |0x00| No Operation|
|3|398| Data |0x0D| Read Display Image Format|
|4|399| Data |0x00| No Operation|
|5|400| Data |0x12| Partial Mode On|
|6|401|Command|0x2B|Page Address Set|
|7|402| Data |0x00| No Operation |
|8|403| Data |0x07| X Coordinate |
|9|404| Data |0x00| No Operation |
|10|405| Data |0x07| Y Coordinate|
|11|406|Command|0x2C|Memory Write|

Below are screenshots from the Logic Analyzer when the aforementioned program was run. The caption for each contains the 8-bit packet in hex and the packet number.

![Screenshot 1](https://bytebucket.org/Orner_Jacob/ece_382/raw/f9693c609d82b6924b814e29d13e77301d91eebe/Lab3/images/LA1.jpg?token=82802bbdf520bc56ab23809d0338872197ff1a74)
##### Figure 1: Packet 1 0x2A

![Screenshot 2](https://bytebucket.org/Orner_Jacob/ece_382/raw/f9693c609d82b6924b814e29d13e77301d91eebe/Lab3/images/LA2.jpg?token=c29e9475194bc0f7fe3adb9458af742bc0a2eaa2)
##### Figure 2: Packet 2 0x00

![Screenshot 3](https://bytebucket.org/Orner_Jacob/ece_382/raw/f9693c609d82b6924b814e29d13e77301d91eebe/Lab3/images/LA3.jpg?token=f7b11b414bebcf1add1443100d6d78da71e3fe90)
##### Figure 3: Packet 3 0x0D

![Screenshot 4](https://bytebucket.org/Orner_Jacob/ece_382/raw/0d99efaf2f846d96223f13eb87509eb3fa93acea/Lab3/images/LA4.jpg?token=3eb869fba4c968a5a7abf452969993b94f88f6dc)
##### Figure 4: Packet 4 0x00

![Screenshot 5](https://bytebucket.org/Orner_Jacob/ece_382/raw/45a93f9656757bc7bf799ad741d0b395acbf0667/Lab3/images/LA5.jpg?token=f9e292cf6acfecad0799df33dfa15ba616703243)
##### Figure 5: Packet 5 0x12

![Screenshot 6](https://bytebucket.org/Orner_Jacob/ece_382/raw/f9693c609d82b6924b814e29d13e77301d91eebe/Lab3/images/LA6.jpg?token=4650b9d7be049ce9390979db628b52e3cd7dbd24)
##### Figure 6: Packet 6 0x2B

![Screenshot 7](https://bytebucket.org/Orner_Jacob/ece_382/raw/f9693c609d82b6924b814e29d13e77301d91eebe/Lab3/images/LA7.jpg?token=446b6014fde823e6cd8e592d7d9402ea371d0df7)
##### Figure 7: Packet 7 0x00

![Screenshot 8](https://bytebucket.org/Orner_Jacob/ece_382/raw/f9693c609d82b6924b814e29d13e77301d91eebe/Lab3/images/LA8.jpg?token=a93cdb192bf4cdfb68ef321954206696734816e7)
##### Figure 8: Packet 8 0x07

![Screenshot 9](https://bytebucket.org/Orner_Jacob/ece_382/raw/f9693c609d82b6924b814e29d13e77301d91eebe/Lab3/images/LA9.jpg?token=99a0893f03b46dffd9ce77b7d388988884ba16f6)
##### Figure 9: Packet 9 0x00

![Screenshot 10](https://bytebucket.org/Orner_Jacob/ece_382/raw/f9693c609d82b6924b814e29d13e77301d91eebe/Lab3/images/LA10.png?token=3ff91bc7c81d8bdcb7e346aa9c572f117261ed3d)
##### Figure 10: Packet 10 0x07

![Screenshot 11](https://bytebucket.org/Orner_Jacob/ece_382/raw/f9693c609d82b6924b814e29d13e77301d91eebe/Lab3/images/LA_11.jpg?token=c0fd429c378c4eb53406795085434528aad1ae60)
##### Figure 11: Packet 11 0x2C


###Writing modes
The native write operation to our LCD will not overwrite any information that is on the display unless it is within the region defined in setArea.  However, that may not be the best course of action in the application.  The new bits being added to the image may be merged using the AND, OR, XOR operators.  To do this treat a black pixel as a logic 1 and a white pixel as a logic 0.  The pixel values from the same locations are combined using a logical operator and placed at the corresponding location in the destination imaged. Below is the completed image when the operators are applied to the below bitmaps.
![xor picture](https://bytebucket.org/Orner_Jacob/ece_382/raw/870a49f67c374f4c55b9bc41d7faecde1d81f4ba/Lab3/images/bitblock.bmp?token=a388babc3e5b1e47f53eb0623d92d108f8619a67)

###Debugging
One of the main issues I ran into while implementing the drawing program was in the A functionality portion. This portion required an ability to move the square depending on the input given by the user to the buttons on the LCD boosterpack. In order to do this, the original polling sequence had to be rewritten in order to accept the input of four buttons instead of just one. In order to erase the previously drawn square, the call screen function had to be called in order to erase the old square before the new one was drawn. By doing this, only one square was drawn on the board and the program worked correctly. Another issue I ran into was in the A functionality if the square went off the edge of the LCD screen. In order to prevent this, I instituted checks of the x and y coordinates depending on the movement of the square, and if the square was going to go off the edge of the screen, its coordinates were realigned to appear on the opposite edge of the board as if it had gone off one edge and fallen onto the other.

###Testing methodology or results
For testing the program, I programmed the board and LCD boosterpack with the main.asm file created for the lab, powered them on and used a series of test to ensure that the program ran correctly. I used various combinations of inputs in sequence, testing the cases where the square went off the edge of the screen to ensure the program handled that correctly. I also tested hitting an input multiple times in rapid succession to test that the delay routine worked correctly. Through the testing, the program ran as expected and was then shown to Captain Warner for functionality approval.

### Observations and Conclusions
The objective of this lab was to write a complete assembly language program that outputs a 10x10 pixel square onto the LCD boosterpack using what has been learned in class including subroutines and serial peripheral input and output. Using Serial Peripheral input and output, the user pushes the buttons on the LCD boosterpack and the square shown on the screen moves in response.I believe these objectives were met as the program successfully outputted the expected results of the 10x10 pixel box onto the LCD boosterpack and took input from the user and responded correctly.I can use this knowledge for future labs as it will enable me to use the LCD boosterpack and gave me an understanding of the necessary instructions used to output onto the screen and take input from the buttons on the board. This will help me to work more efficiently and use this knowledge on future labs that require output onto the screen or inputs from the board.
 
### Documentation
None.