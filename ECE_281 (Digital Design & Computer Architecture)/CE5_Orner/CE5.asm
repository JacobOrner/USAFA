# Program File: CE5.asm
# Author: Jake Orner
# Class: ECE 281
# Project: CE 5
# Hi-Lo Game
# Documentation: None
.text
main:
	addi $t0, $t0, 56			# Sets register $t2 to 8.
	addi $v0, $v0, 1			# Sets register $v0 to 1
	addi $t5, $t5, 72 			# Sets register $t5 to ascii value of H
	addi $t6, $t6, 76			# Sets register $t6 to ascii value of L
	addi $t7, $t7, 87 			# Sets register $$t7 to ascii value of W
	
loop:
	lw $s0, 0xFFFF0004			# Reads in the user input
	beq $s0, $t0, right			# Checks to see if the user was correct, if so, goes to the right loop
	slt $t1, $t0, $s0			# Checks if the user's guess was high or low, if low, goes to the low loop
	beq $t1, $v0, high			# If the guess was high, goes to the high loop
	j low
	
high:
	sw $t5, 0xFFFF000C			# Outputs 'H' to the screen
	j loop					# Goes back to main loop

low:
	sw $t6, 0xFFFF000C			# Outputs 'L' to the screen
	j loop					# Goes back to main loop

right: 
	sw $t7, 0xFFFF000C			# Outputs 'W' to the screen
		
