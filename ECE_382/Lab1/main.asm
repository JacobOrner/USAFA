;-------------------------------------------------------------
; Assignment 3 - Introduction to the MSP430 and Code Composer Studio
; C2C Jacob Orner, USAFA / 7 Sep 2016 / 9 Sep 2016
;
;This program runs the program described in the Assignment 3 document.
;-------------------------------------------------------------
            .cdecls C,LIST,"msp430.h"       ; Include device header file
            
;-------------------------------------------------------------------------------
            .def    RESET                   ; Export program entry-point to
                                            ; make it known to linker.
;-------------------------------------------------------------------------------
            .text                           ; Assemble into program memory.
            .retain                         ; Override ELF conditional linking
                                            ; and retain current section.
            .retainrefs                     ; And retain any sections that have
                                            ; references to current section.

myProgram:      .byte	0x22, 0x11, 0x22, 0x22, 0x33, 0x33, 0x08, 0x44, 0x08, 0x22, 0x09, 0x44, 0xff, 0x11, 0xff, 0x44, 0xcc, 0x33, 0x02, 0x33, 0x00, 0x44, 0x33, 0x33, 0x08, 0x55


ADD_OP:			.equ	0x11
SUB_OP:			.equ	0x22
MUL_OP:			.equ	0x33
CLR_OP:			.equ	0x44
END_OP:			.equ	0x55
MAX:			.equ	0xFF
MIN:			.equ	0x00
MEM_LOC:		.equ	0x0200

                .data
myResults:      .space      20                          ; reserving 20 bytes of space

;-------------------------------------------------------------------------------
RESET       mov.w   #__STACK_END,SP         ; Initialize stackpointer
StopWDT     mov.w   #WDTPW|WDTHOLD,&WDTCTL  ; Stop watchdog timer


;-------------------------------------------------------------------------------
; Main loop here
;-------------------------------------------------------------------------------
            mov 	#myProgram, r4		;program instruction pointer
            mov.w	#myResults, r7
			mov.b 	@r4, &myResults		;move the first operand into 0x0200
			inc 	r4					;increment the point in r4 to the operator

main:		mov.b 	@r4+, r5			;move the operator into r5
            cmp.b 	#ADD_OP, r5			;check if ADD_OP is called
            jz 		add
            cmp.b 	#SUB_OP, r5			;check if SUB_OP is called
            jz 		sub
            cmp.b	#MUL_OP, r5			;check if MUL_OP is called
            jz 		load_mul
            cmp.b 	#CLR_OP, r5			;check if CLR_OP is called
            jz 		clr
            cmp.b 	#END_OP, r5			;check if END_OP is called
            jz 		kill
            inc		r4
            jmp		main

add:		add.b 	@r4, 0(r7)		;add the operand into memory
			jc		over			;if a carry occured, send to 'over' label

			jmp 	return


sub:		sub.b 	@r4, 0(r7)		;subtract the operand from the data in memory
			jnc		negative		;if there is no carry, send to 'negative' label

			jmp 	return

load_mul:	mov.b	@r4, r8			;move the second operand into r8
			mov.b	0(r7), r6		;move the first operand into r6
			mov.b	0(r7), r9		;move the first operand into r9
			rla		r9				;double the size of the operand in r9
			cmp.b	#0x00, r8
			jz		mult_zero
			dec.b	r8

mul:		cmp.b	#0x02, r8		;compares 0x02 to r8
			jhs		mult_loop		;if r8 > 2, jump to the mult_loop

			cmp.b	#0x00, r8		;if r8 = 0, jump to the return
			jz		return

			add.b	r6,0(r7)		;add r6 to 0(r7) and check if carry occurred.
			jc		over

			jmp return

mult_loop:	add.b	r9, 0(r7)		;add r9 to the memory position at 0(r7)
			jc		over			;check if a carry occurred.

			decd.b	r8				;double decrement r8
			jmp 	mul

mult_zero:	mov.b	#0x00, 0(r7)	;move 0x00 into memory if a multiply be zero has been performed
			jmp return

clr:		mov.b	#0x00, 0(r7)	;insert 0x00 into memory if a CLR_OP is called
			mov.b	@r4+, 1(r7)		;insert the next operand into memory
			inc r7					;increment the program instruction
			jmp main

over:		mov.b	#0xFF, 0(r7)	;insert 0xFF if the answer was over 255
			jmp 	return

negative:	mov.b	#0x00, 0(r7)	;insert 0x00 if the answer was negative

return:		mov.b	0(r7), r8		;move the operand in memory to r8
			mov.b	r8, 1(r7)		;move the operand into the next memory slot
			inc		r4				;increment r4 and r7 - the program instruction and memory pointer
			inc 	r7
			jmp		main


kill:		mov.b	#0x00, 0(r7)	;insert 0x00 into memory where the second operand was stored for another instruction

end:		jmp end

;-------------------------------------------------------------------------------
; Stack Pointer definition
;-------------------------------------------------------------------------------
            .global __STACK_END
            .sect   .stack
            
;-------------------------------------------------------------------------------
; Interrupt Vectors
;-------------------------------------------------------------------------------
            .sect   ".reset"                ; MSP430 RESET Vector
            .short  RESET
            
