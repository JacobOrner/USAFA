# XOR Encryption - Lab #2 - Assembly Language and Subroutines

## By C2C Jake Orner

## Table of Contents
1. [Objectives](#objectives)
2. [Preliminary Design](#preliminary-design)
3. [Software flow chart or algorithms](#software-flow-chart-or-algorithms)
4. [Debugging](#debugging)
5. [Testing methodology or results](#testing-methodology-or-results)
6. [Observations and Conclusions](#observations-and-conclusions)
7. [Documentation](#documentation)


###Objectives
The objective of this lab was to write a complete assembly language program using what has been learned in class as well as subroutines. Using both the call-by-value and call-by-reference techniques to pass arguments to the subroutines, a program was created which took an encrypted message and XORed the message with either a known key, or found a key and decrypted the message. The decrypted message was stored in memory.


###Preliminary design
In order to design the program, I will initially store the encrypted message, key, message length, and key length values into ROM, and assign a block in RAM which will be used to store the decrypted message. I will use registers containing pointers in order to keep track of the current place in the encrypted message and in the decrypted message portion of memory. I will store a pointer to the encrypted message and a pointer to the key in memory and call the decryptMessage subroutine. Within this routine, I will store the value of the encrytped message byte and the value of the key in registers and call the decryptByte subroutine. This subroutine will decrypt the byte and store the decrypted byte in memory. The program will loop continously performing these operations until the end of the message is reached.

#####Setup Code:
	mov 	#encryptedMessage, r4	;load r4 with address of first byte of message.
    mov.b	messageLength, r5		;load the message length into r5.
	add		#0x0200, r5				;add the starting memory space for the decrypted message to ensure the key does not get overwritten.
    mov.b	messageLength, r6		;move the message length into r6.
    mov.b	keyLength, r7			;move the key length into r7.
    mov 	#decryptedMessage, r15	;load registers with necessary info for decryptMessage here.

	mov.b 	@r4+, r8				;load a byte of the message into r8
	mov.b 	@r5, r9					;load a byte of the key into r9
	mov.b	#0x00, r12				;move 0 into r12


Following the setup code, the program begins the decryption loop, which calls the decryptMessage function and begins the process of decryption without a given key.

#####Decryption Loop:
	call	#find_key		;find the first byte of the key
	call 	#find_key		;find the second byte of the key
	decd	r5				;double decrement r5 to ensure it is pointing to the first byte of the key
	dec		r4				;decrement r4 to ensure it is pointing to the beginning of the encrypted message
    call    #decryptMessage	;call the decrypt message function.

The code for the find_key subroutine is below. This code uses an if/elif/else heirarchy to brute-force the encrypted message with possible key combinations until a suitable key is found. We knew the decrypted message would contain only ASCII letters, periods, and spaces, which is where the values being compared to the decrypted bytes were found.

#####find_key Code:
	find_key:	xor.b 	r9, r8				;xor the possible key and the encrypted byte

	cmp.b	#0x20, r8			;if the decrypted byte is an appropriate ASCII
	jz		good_match			;character, advances 2 bytes and test until
	cmp.b	#0x2E, r8			;the end of the message is reached successfully
	jz		good_match			;or the key does not properly decrypt the byte.
	cmp.b	#0x41, r8
	jlo		return
	cmp.b	#0x5B, r8
	jlo		good_match
	cmp.b	#0x61, r8
	jlo 	return
	cmp.b	#0x7B, r8
	jlo		good_match


If an acceptable ASCII character was created using the current key, the program jumped to the _good_match subroutine. This subroutine incremented the memory pointers containing the location of the encrypted message, and used the current possible key on the next portion. If the key was valid for the entire message, then the key_found subroutine was called and the key was stored in memory. Below is the code for the good_match and key_found subroutines.

#####Correct Key Code:
	good_match: decd	r6
			cmp.b	#0x00, r6
			jz		key_found

			incd	r4
			mov.b	@r4, r8
			jmp 	find_key

	key_found:	mov		#encryptedMessage, r4
			inc		r4
			mov		#decryptedMessage, r15
			mov.b	messageLength, r6
			mov.b	r9, 0(r5)
			inc		r5
			inc 	r12
			ret

If the current tested key was not correct, then the return subroutine was called. This subroutine incremented the tested key and returned the pointer back to the beginning of the message in order to test the new key on the entire message. Below is the code for the return subroutine.
#####Return Code:
	return:		mov		#encryptedMessage, r4
			add		r12, r4
			mov.b	@r4, r8
			mov		#decryptedMessage, r15
			add		r12, r15
			inc.b 	r9
			mov.b	messageLength, r6
			jmp 	find_key


###Software flow chart or algorithms
The main algorithm necessary for this program was the within the decryptMessage subroutine. However, the program was started through the main routine. Below is the flowchart for the main routine.

![Main Flowchart](https://bytebucket.org/Orner_Jacob/ece_382/raw/4436ed27061cfa37f1de0099e440b20d86665869/Lab2/images/Main.png?token=4cef54a0c98d5de72296b0fbf917dedf7753cf31)

In the main program, when the decryptMessage subroutine is called, the program progresses through the stored encrypted message and stores the values in a register and the key bytes are stored in a register as well. Below is the flowchart for the decryptMessage subroutine.

![decryptMessage Flowchart](https://bytebucket.org/Orner_Jacob/ece_382/raw/4436ed27061cfa37f1de0099e440b20d86665869/Lab2/images/DecryptMessage.png?token=f4e93b421a2def543ac901e89251745535cc1370)

Within the decryptMessage subroutine, the decryptByte subroutine is called in order to decrypt individual bytes in the message. The decryptByte subroutine uses values passed in registers and stores the decrypted bytes in memory. Below is the flowchart for the decryptByte algorithm.

![decryptByte Flowchart](https://bytebucket.org/Orner_Jacob/ece_382/raw/4436ed27061cfa37f1de0099e440b20d86665869/Lab2/images/DecryptByte.png?token=802063ad0b74e509a51156f70ea4a18b4bd06163)

###Debugging
One of the main issues I ran into while implementing the decryption program was in the A functionality portion. This portion required the program to decrypt the message without a given key. As the program cannot write into ROM, a portion of memory had to be reserved to hold the possible keys. Once this was realized, the programming went well and the solution was reached. Another portion that took time to implement was after the first byte of the key was found. This then required that the pointers to the location of the message in memory be changed to accompany the fact that every other byte in the message had to be decrypted using a different byte of a key. In order to do this, the find_key subroutine had to be called a second time with different pointers to ensure that the program was running as necessary. Once this was implemented, the program successfully decrypted the message.

###Testing methodology or results
For testing the program, I used the test cases given below for the required, B, and A functionality. I entered the encrypted message into the appropriate place in ROM as well as the key, and checked the output in the memory block in CSS. Once the program finished running, I checked to ensure the output was readable and made sense. Below is the encrypted messages, given keys, and corresponding outputs in memory following the completion of the program.

#####Required functionality
	0xef,0xc3,0xc2,0xcb,0xde,0xcd,0xd8,0xd9,0xc0,0xcd,0xd8,0xc5,0xc3,0xc2,0xdf,0x8d,0x8c,0x8c,0xf5,0xc3,0xd9,0x8c,0xc8,0xc9,0xcf,0xde,0xd5,0xdc,0xd8,0xc9,0xc8,0x8c,0xd8,0xc4,0xc9,0x8c,0xe9,0xef,0xe9,0x9f,0x94,0x9e,0x8c,0xc4,0xc5,0xc8,0xc8,0xc9,0xc2,0x8c,0xc1,0xc9,0xdf,0xdf,0xcd,0xcb,0xc9,0x8c,0xcd,0xc2,0xc8,0x8c,0xcd,0xcf,0xc4,0xc5,0xc9,0xda,0xc9,0xc8,0x8c,0xde,0xc9,0xdd,0xd9,0xc5,0xde,0xc9,0xc8,0x8c,0xca,0xd9,0xc2,0xcf,0xd8,0xc5,0xc3,0xc2,0xcd,0xc0,0xc5,0xd8,0xd5,0x8f
	
	Key: 0xAC

![Required Functionality Memory Dump](https://bytebucket.org/Orner_Jacob/ece_382/raw/dd454b6e3084659a2533aca14e9c30857f6fde1e/Lab2/images/RequiredFunctionality.png?token=9e2e730beea9bbeeaf497b310bc31c07513905aa)
##### Figure 1: Memory Dump Required Functionality

#####B functionality
	0xf8,0xb7,0x46,0x8c,0xb2,0x46,0xdf,0xac,0x42,0xcb,0xba,0x03,0xc7,0xba,0x5a,0x8c,0xb3,0x46,0xc2,0xb8,0x57,0xc4,0xff,0x4a,0xdf,0xff,0x12,0x9a,0xff,0x41,0xc5,0xab,0x50,0x82,0xff,0x03,0xe5,0xab,0x03,0xc3,0xb1,0x4f,0xd5,0xff,0x40,0xc3,0xb1,0x57,0xcd,0xb6,0x4d,0xdf,0xff,0x4f,0xc9,0xab,0x57,0xc9,0xad,0x50,0x80,0xff,0x53,0xc9,0xad,0x4a,0xc3,0xbb,0x50,0x80,0xff,0x42,0xc2,0xbb,0x03,0xdf,0xaf,0x42,0xcf,0xba,0x50
	
	Key: 0xACDF23

![B Functionality Memory Dump](https://bytebucket.org/Orner_Jacob/ece_382/raw/dd454b6e3084659a2533aca14e9c30857f6fde1e/Lab2/images/BFunctionality.png?token=499a3227004e1b81278e415c3650fc24d24c697f)
##### Figure 2: Memory Dump B Functionality

#####A functionality
	0x35,0xdf,0x00,0xca,0x5d,0x9e,0x3d,0xdb,0x12,0xca,0x5d,0x9e,0x32,0xc8,0x16,0xcc,0x12,0xd9,0x16,0x90,0x53,0xf8,0x01,0xd7,0x16,0xd0,0x17,0xd2,0x0a,0x90,0x53,0xf9,0x1c,0xd1,0x17,0x90,0x53,0xf9,0x1c,0xd1,0x17,0x9e
	
	Key: 0x????

![A Functionality Memory Dump](https://bytebucket.org/Orner_Jacob/ece_382/raw/dd454b6e3084659a2533aca14e9c30857f6fde1e/Lab2/images/AFunctionality.png?token=4de9d2d72f33c0ff386053f590821b112c074243)
##### Figure 3: Memory Dump A Functionality


As can be seen from the screen-shots above, all test cases outputted viable results and worked as planned. Given the nature of the outputs, it can be expected that these were the correct results. Ensuring that everything worked correctly took time, but each case was tested until they all tested correctly. 


### Observations and Conclusions
The objective of this lab was to write a complete assembly language program using what has been learned in class as well as subroutines. Using both the call-by-value and call-by-reference techniques to pass arguments to the subroutines, a program was created which took an encrypted message and XORed the message with either a known key, or found a key and decrypted the message. The decrypted message was stored in memory. I believe these objectives were met as I did in fact learn a lot about Assembly language subroutines and also honed my assembly program instruction skills. I relearned the importance of thinking through each individual process before trying to implement in a program. Also, I learned quite a bit about modularity, which allows a function to be called in different scenarios given that the inputs are valid. This was important as the decryptMessage and decryptByte functions were called whether a key was given or not. I can use this knowledge for future labs as it will enable me to plan ahead and ensure that the processes and subroutines I am creating are useful for many different scenarios. This will help to avoid confusing code and complicated processes and will simplify future programs.
 
### Documentation
None.