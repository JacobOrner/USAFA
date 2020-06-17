# A Simple Calculator - Lab #1 - Assembly Language

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
The objective of this lab was to write a complete assembly language program using what has been learned in class. Using the instruction set, addressing modes, conditional jumps, status register flags, assembler directives, the assembly process, this lab will give an opportunity to practice using assembly to implement higher-level if/then/else and looping constructs.


###Preliminary design
In order to design the calculator, I will initially store the instructions into ROM, and assign a block in RAM which will be used to store the results. I will use registers containing pointers in order to keep track of the current place in the instructions and in the results portions of memory. I will store the first operand into memory, increment the pointer, check the operator, increment the pointer, and perform the proper mathematical operation with the next operand contained in the pointer. After storing the result in memory, I will increment the results pointer and store the second operand in that point in memory. I will continue this process until and END_OP instruction (0x55) is given. If an invalid operator is given, I will increment the instruction pointer and check for a valid operator until one is found. Below is the initial code used to load the instruction and memory pointers. In the code, myProgram is initialized to the input data given to the calculator, and myResults is a pointer to the memory block reserved beginning at 0x0200. This code stores the first operand into memory and increments the instruction pointer.

#####Setup Code:
	mov 	#myProgram, r4		;program instruction pointer
    mov.w	#myResults, r7
	mov.b 	@r4, &myResults		;move the first operand into 0x0200
	inc 	r4					;increment the point in r4 to the operator

Following the setup code, the program begins the main loop, which stores the operand into r5 and performs if/else statements until the operand matches one of the operations

#####Main Loop:
	mov.b 	@r4+, r5			;move the operator into r5
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

Once the correct operand is found, the program jumps to the appropriate section for that operand. Below is the addition and subtraction sections.

#####Add and Sub Code:
	add:		add.b 	@r4, 0(r7)		;add the operand into memory
				jc		over			;if a carry occured, send to 'over' label

				jmp 	return


	sub:		sub.b 	@r4, 0(r7)		;subtract the operand from the data in memory
				jnc		negative		;if there is no carry, send to 'negative' label

				jmp 	return

I also used a 'return' subroutine which allowed the add, subtract, and multiply areas to jump to in order to clean up the code and take up less memory on the board. Below is the return subsection.

#####Return Code:
	return:		mov.b	0(r7), r8		;move the operand in memory to r8
				mov.b	r8, 1(r7)		;move the operand into the next memory slot
				inc		r4				;increment r4 and r7 - the program instruction and memory pointer
				inc 	r7
				jmp		main

###Software flow chart or algorithms
The main algorithm necessary for this program was the main loop. The code is contained above and the flowchart explaining it is below. Another algorithm used was the multiplication algorithm, in which I initially took the double of the first operand and added it into memory for each multiple of two contained in the second operand.

![Flowchart](https://bytebucket.org/Orner_Jacob/ece_382/raw/d65f2e8005b58a633e1c0b91be31bdc10706c48a/Lab1/images/Flowchart.png?token=27092a51becd09eee6906a51c29a84c0d68e8783)

###Debugging
One of the main issues I ran into while implementing the calculator was ensuring the pointers were being incremented correctly in order to store the proper values into memory and not skip over operands or operators. After a few initial attempts, I decided to create the return section mentioned above as it gave a centralized location to increment the pointers without having to change the code at the end of the add, subtract, and multiply sections each time an error was realized. Another problem I ran into was the implementation of the substitution of 0xFF if the operation carried and 0x00 if the operation resulted in a negative number. In order to fix this, I took an in-depth look at the code and found that I had forgotten to add the necessary check to the multiplication section and had implemented the wrong check in the subtraction section.

###Testing methodology or results
For testing the program, I used the test cases given below. I used the first line as the instructions given to the calculator and the result was checked against the memory shown after running the program in CSS. Below each block of code is a screen-shot of the corresponding memory block after running the program.

#####Required functionality
	0x11, 0x11, 0x11, 0x11, 0x11, 0x44, 0x22, 0x22, 0x22, 0x11, 0xCC, 0x55
	Result: 0x22, 0x33, 0x00, 0x00, 0xCC

![Memory Dump](https://bytebucket.org/Orner_Jacob/ece_382/raw/d65f2e8005b58a633e1c0b91be31bdc10706c48a/Lab1/images/Required%20Functionality.png?token=d0cbd4edab2bd1f6c83e7c75da22facf6d827ec6)
##### Figure 1: Memory Dump Required Functionality

#####B functionality
	0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0xDD, 0x44, 0x08, 0x22, 0x09, 0x44, 0xFF, 0x22, 0xFD, 0x55
	Result: 0x22, 0x33, 0x44, 0xFF, 0x00, 0x00, 0x00, 0x02

![Memory Dump](https://bytebucket.org/Orner_Jacob/ece_382/raw/d65f2e8005b58a633e1c0b91be31bdc10706c48a/Lab1/images/B%20Functionality.png?token=9e07aaaee3bed783e4475682e9f670bdc19153e6)
##### Figure 2: Memory Dump B Functionality

#####A functionality
	0x22, 0x11, 0x22, 0x22, 0x33, 0x33, 0x08, 0x44, 0x08, 0x22, 0x09, 0x44, 0xff, 0x11, 0xff, 0x44, 0xcc, 0x33, 0x02, 0x33, 0x00, 0x44, 0x33, 0x33, 0x08, 0x55
	Result: 0x44, 0x11, 0x88, 0x00, 0x00, 0x00, 0xff, 0x00, 0xff, 0x00, 0x00, 0xff

![A Functionality Screenshot](https://bytebucket.org/Orner_Jacob/ece_382/raw/d65f2e8005b58a633e1c0b91be31bdc10706c48a/Lab1/images/A%20Functionality.png?token=62f892d06f7e83b02f6c22832e04f8a9c861b89c)
##### Figure 3: Memory Dump A Functionality

Along with the given test cases for required functionality, I also created multiple test cases which tested subtracting below zero and both adding and multiplying to get results above 0xFF.

#####Test Case 1
	0xF0, 0x11, 0x10, 0x44, 0x0A, 0x33, 0x0A, 0x33, 0xA0, 0x55
	Result: 0xFF, 0x00, 0x64, 0xFF, 0x0F, 0xAF

![Test Case 1](https://bytebucket.org/Orner_Jacob/ece_382/raw/6066ac4193264d77bb4c096449352a17f7d47f48/Lab1/images/Test%20Case%201.png?token=8e8c1a1a4a46d32e030361c66f62493ba57a65cf)
##### Figure 4: Memory Dump Test Case 1

#####Test Case 2
	0x14, 0x22, 0x15, 0x44, 0xA8, 0x11, 0x08, 0x22, 0xE0, 0x44, 0x55
	Result: 0x00, 0x00, 0xB0, 0x00

![Test Case 2](https://bytebucket.org/Orner_Jacob/ece_382/raw/6066ac4193264d77bb4c096449352a17f7d47f48/Lab1/images/Test%20Case%202.png?token=e1bd1882b416c6565f5162e87b91daaffa7d71f1)
##### Figure 5: Memory Dump Test Case 2

As can be seen from the screen-shots above, all test cases outputted the expected results and worked as planned. Ensuring that everything worked correctly took time, but each case was tested until they all tested correctly. 

### Observations and Conclusions
The purpose of this lab was to create a program using the assembly language and more specifically using the instruction set, addressing modes, conditional jumps, status register flags, assembler directives, the assembly process, and much more. I believe that this objective was met as the program contains all of these concepts and I learned a lot while creating and tweaking the program to ensure it worked correctly. I noticed that it is necessary to create a flowchart or pseudocode before beginning creating a program as large as this because if there is no plan when the program is started, then the code can get very messy and confusing. I can use this knowledge for future labs as it will enable me to plan ahead and ensure that the processes and subroutines I am creating. This will help to avoid confusing code and complicated processes and will simplify future programs.
 
### Documentation
Talked with Captain Warner about what jump instruction is necessary in order to successfully identify a carry when adding operands.