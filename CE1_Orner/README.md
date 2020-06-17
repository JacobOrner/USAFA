## Implementing a Simple Design ##

### Purpose ###
The purpose of this exercise is to install the required software for the ECE 281 course, learn about using Git and BitBucket, as well as creating, simulating, and implementing a basic circuit with the FPGA.

### Prelab ###
Prior to beginning any calculations or work on the exercise, it was required that the Program Xilinx be downloaded in order to create schematics, run tests, and download these on the FPGA device. After downloading Xilinx, MarkdownPad 2 was also downloaded in order to allow for a README file to be written in order to show the procedure and results of the exercise. After these programs were downloaded, the equation to be implemented, AB' + BC = F, was given and a truth table was created.
### Truth Table ###
| A | B| C | expected F | actual F |
|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 |
| 0 | 1 | 1 | 1 | 1 |
| 1 | 0 | 0 | 1 | 1 |
| 1 | 0 | 1 | 1 | 1 |
| 1 | 1 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 | 1 |

### Schematics ###
After the truth table was created, schematics of the circuit were drawn to show a diagram of the circuit.

![](http://bytebucket.org/Orner_Jacob/ece281/raw/d0330be65d3ab6ba2b0c0a1315d64e31a7a2b8b1/CE1_Orner/Schematic_Picture.png?token=4bfb9ec4a28971e135315ffa1e8953a9c0ca2caa)

### Code written ###

The code that was written for the exercise was used on the test bench in order to test each possible input combination to check if the correct outputs were reached.

--------------------------------------------------------------------
Name:			Jacob Orner

Date:			11 January 2016

Course:			ECE 281

File:			CE1_Orner_tb.vhd

HW:				CE1 Computer Exercise 1

Purp:			This program tests the schematic drawn for the computer exercise.

Documentation:	None

Academic Integrity Statement: I certify that, while others may have 
assisted me in brain storming, debugging and validating this program, 
the program itself is my own work. I understand that submitting code 
which is the work of other individuals is a violation of the honor   
code.  I also understand that if I knowingly give my original work to 
another individual is also a violation of the honor code. 

--------------------------------------------------------------------

	BEGIN
			sw7 <= '0'; sw6 <= '0'; sw5 <= '0';
	
			wait for 10 ns;
	
			sw7 <= '0'; sw6 <= '0'; sw5 <= '1'; 
	
			wait for 10 ns;
		
			sw7 <= '0'; sw6 <= '1'; sw5 <= '0'; 
	
			wait for 10 ns;
			
			sw7 <= '0'; sw6 <= '1'; sw5 <= '1'; 
	
			wait for 10 ns;
			
			sw7 <= '1'; sw6 <= '0'; sw5 <= '0'; 
	
			wait for 10 ns;
			
			sw7 <= '1'; sw6 <= '0'; sw5 <= '1'; 
	
			wait for 10 ns;
			
			sw7 <= '1'; sw6 <= '1'; sw5 <= '0'; 
	
			wait for 10 ns;
			
			sw7 <= '1'; sw6 <= '1'; sw5 <= '1'; 
	
			wait for 10 ns;
      WAIT; -- will wait forever

### Debugging ###
Throughout the process, the only bugs that were faced was a problem with the top schematic not being shown in the implementation menu in the ISE Design Suite Program. In order to fix this bug, in the file menu the top schematic file view association was changed from being only shown in Implementation to being shown in All menus.   

### Testing ###
The testing was conducted using the ISim program with the files that were generated from the top schematic. Included in this section is a screen clipping taken from the ISim program.


![](http://bytebucket.org/Orner_Jacob/ece281/raw/25acc4fda09843f39fd8badf25fed49f4ddc9767/CE1_Orner/ISim_CE1_Simulation.png?token=b7fb6c3181d439197ee6692ca89710850bba19ed)


The next set of testing was done on the FPGA system, in which the program was run through the system automatically using the ISE iMPACT program as well as manually by have the tester flip the switches on the FPGA board to simulate the different input scenarios. The circuit returned an output of one for the inputs A'BC, AB'C', AB'C, and ABC, while is returned an output of zero for the inputs A'B'C', A'B'C, A'BC', and ABC'. These results were expected, and matched the equation given in the prelab exactly. This means that the circuit that was created and implemented in the lab performed exactly as hoped. 

### Observations and Conclusions ###
Throughout the multiple tests run on the schematic overview and program to simulate the circuit, it was observed that the expected F values for each input scenario were the same as the actual values when tested using the ISim and ISE iMPACT programs as well as through manual testing of the circuit. In conclusion, the lab was executed as laid out in the guide and the designed circuit outputted the same figures as shown in the equation given in the prelab, thus allowing for a precise recreation of the equation given. In working on this lab, the necessary programs for completing future computer exercises were downloaded, and users were acquainted with these programs to help with future use.

### Documentation ###
None.





