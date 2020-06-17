## Computer Exercise 2 ##

### Pseudocode Algorithm in C ###
	int num = 8,
	int guess = 0;

	while(guess != num){
		scanf("%d", guess);
		fflush(stdin);
		if(guess < num){	
			print("L");	
		} 
		else if(guess > num){	
			print("H");	
		}
	}
	print("W");

### Testing of program ###
Test 1
[Test 1]()

Test 2
[Test 2]()

### Questions ###
1. What addressing modes did you use in your program? Give an example line for each type used.

	Base Addressing was used in this program, shown below.
		
		lw $s0, 0xFFFF0004

	Also used was immediate addressing, shown below.

		addi $v0, $v0, 1
	PC-relative addressing was also used, again shown below.

		beq $s0, $t0, right
	Finally, pseudo-direct addressing was also used.

		j loop

2. Were there any instructions or pseudo instruction that would have been useful for you program? Which ones and why?

	In my opinion, this program worked fine without pseudo instructions. My code was only 30 lines long, including a 6 line code header. Because of this, I believe that not other instructions or pseudo instruction would have been necessary or overtly helpful overall.

3. Would subroutines have been useful in your program? Why or why not?
	
	Subroutines were very useful in the program for having separate loops through which to use if depending on the result of the user's guess compared to the number which they were trying to guess. Ultimately, subroutines were used to create an if-else type statement and allowed for a smooth, short, and efficient program.