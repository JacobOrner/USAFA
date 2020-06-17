;-------------------------------------------------------------------------------
; Insert your code header here
;
;
;-------------------------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file

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

encryptedMessage:      	.byte	0x35,0xdf,0x00,0xca,0x5d,0x9e,0x3d,0xdb,0x12,0xca,0x5d,0x9e,0x32,0xc8,0x16,0xcc,0x12,0xd9,0x16,0x90,0x53,0xf8,0x01,0xd7,0x16,0xd0,0x17,0xd2,0x0a,0x90,0x53,0xf9,0x1c,0xd1,0x17,0x90,0x53,0xf9,0x1c,0xd1,0x17,0x9e
key:					.byte	0x00, 0x00
messageLength:			.byte	0x2A
keyLength:				.byte	0x02

                		.data
decryptedMessage:      .space	100                         ; reserving 100 bytes of space
;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer

;-------------------------------------------------------------------------------
                                            ; Main loop here
;-------------------------------------------------------------------------------
main:
            mov 	#encryptedMessage, r4	;load r4 with address of first byte of message.
            mov.b	messageLength, r5		;load the message length into r5.
			add		#0x0200, r5				;add the starting memory space for the decrypted message to ensure the key does not get overwritten.
            mov.b	messageLength, r6		;move the message length into r6.
            mov.b	keyLength, r7			;move the key length into r7.
            mov 	#decryptedMessage, r15	;load registers with necessary info for decryptMessage here.

			mov.b 	@r4+, r8		;load a byte of the message into r8
			mov.b 	@r5, r9			;load a byte of the key into r9
			mov.b	#0x00, r12		;move 0 into r12

			call	#find_key		;find the first byte of the key
			call 	#find_key		;find the second byte of the key
			decd	r5				;double decrement r5 to ensure it is pointing to the first byte of the key
			dec		r4				;decrement r4 to ensure it is pointing to the beginning of the encrypted message
            call    #decryptMessage	;call the decrypt message function.

forever:    jmp     forever

;-------------------------------------------------------------------------------
                                            ; Subroutines
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
;Subroutine Name: decryptMessage
;Author:
;Function: Decrypts a string of bytes and stores the result in memory.  Accepts
;           the address of the encrypted message, address of the key, and address
;           of the decrypted message (pass-by-reference).  Accepts the length of
;           the message by value.  Uses the decryptCharacter subroutine to decrypt
;           each byte of the message.  Stores theresults to the decrypted message
;           location.
;Inputs: r5, r6, r7
;Outputs: r8, r9
;Registers destroyed:
;-------------------------------------------------------------------------------

decryptMessage:		mov.b 	@r4+, r8		;load a byte of the message into r8
					mov.b 	@r5, r9			;load a byte of the key into r9



					call #decryptCharacter	;call the next subroutine

					dec		r6				;decrement r6, the count on the length of the message
					inc		r5				;increment r5, the address of the key
					dec		r7				;decrement the length of the key

					cmp		#0x00, r7		;if the length of the key is zero, reset the pointer to the beginning of the key.
					jnz		no_reset

					mov.b	keyLength, r7
					decd	r5

no_reset:			cmp		#0x00, r6		;if message length = 0, return
					jnz		decryptMessage

					ret


;-------------------------------------------------------------------------------
;Subroutine Name: decryptCharacter
;Author:
;Function: Decrypts a byte of data by XORing it with a key byte.  Returns the
;           decrypted byte in the same register the encrypted byte was passed in.
;           Expects both the encrypted data and key to be passed by value.
;Inputs: r8, r9
;Outputs: 0(r15)
;Registers destroyed: r15
;-------------------------------------------------------------------------------

decryptCharacter:	xor.b 	r9, r8			;xor the key and the encrypted byte
					mov.b	r8, 0(r15)		;move the decrypted byte into memory
					inc		r15				;increment the memory pointer


            		ret
;-------------------------------------------------------------------------------
;Subroutine Name: find_key
;Author:
;Function: Decrypts a byte of data by XORing it with a key byte.  Returns the
;           decrypted byte in the same register the encrypted byte was passed in.
;           Expects both the encrypted data and key to be passed by value.
;Inputs: r8, r9
;Outputs: 0x0200+keyLength
;Registers destroyed: r4, r5, r8, r9,
;-------------------------------------------------------------------------------

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


return:		mov		#encryptedMessage, r4
			add		r12, r4
			mov.b	@r4, r8
			mov		#decryptedMessage, r15
			add		r12, r15
			inc.b 	r9
			mov.b	messageLength, r6
			jmp 	find_key


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

;-------------------------------------------------------------------------------
;           Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect    .stack

;-------------------------------------------------------------------------------
;           Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
