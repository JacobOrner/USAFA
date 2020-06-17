## Half-Adder Implementation ##

### Purpose ###
The purpose of this exercise is to create, test, and implement a half-adder on the Nexys2 Development Board. with the FPGA.

### Prelab ###
The prelab for this exercise included examining the truth table given for a half-adder, as shown below.
#### Truth Table ####
| A | B | C_out | S |
|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 0 |
| 0 | 1 | 0 | 1 |
| 1 | 0 | 0 | 1 |
| 1 | 1 | 1 | 0 |

The prelab also involved creating files in ISE Design Suite in which the half-adder would be created, implemented, and tested.
### Schematics ###
The schematic for the half-adder was created using the truth table given in the exercise. The schematics of the circuit were drawn to match the truth table 

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/8f9cca643afab139da06c20b84d656b88cd78aa0/CE2_Orner/CE2_HalfAdder_Schematic.png?token=23d7ec17b5f107a2a5a7874c1e6fc1c8be895632)

### Code written ###
The code that was written for the exercise was used on the test bench in order to test each possible input combination to check if the correct outputs were reached.

		A <= '0'; B <= '0'; 
	
		wait for 10 ns;
	
		A <= '0'; B <= '1';
		
		wait for 10 ns;

		A <= '1'; B <= '0';
	
		wait for 10 ns;
	
		A <= '1'; B <= '1';
		
		wait for 10 ns;

      WAIT; -- will wait forever

### Debugging ###
Throughout the process of this computer exercise, no bugs were found in the technology being used. However, there was some user error as the code assigned the inputs to switches 0 and 1, while the tester was trying to use switches 6 and 7 to test the code on the FPGA board.

### Testing ###
The testing was conducted using the ISim program with the files that were generated from the top schematic. Included in this section is a screen clipping taken from the ISim program.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/8f9cca643afab139da06c20b84d656b88cd78aa0/CE2_Orner/ISim_Simulation_CE2.png?token=002d41d6e6e4f227ec9210982d5e24e6ddaeb79a)

After the ISim testing was completed, the CE2 constraints file was downloaded from the course website in order to assign the inputs and outputs represented in the schematic to components on the FPGA board. The next set of testing was done on the FPGA system, in which the program was run through the system automatically using the ISE iMPACT program as well as manually by having the tester flip the switches on the FPGA board to simulate the different input scenarios. Below is a link to a video of the physical testing of the FPGA board.

![](https://youtu.be/rdwuII54wNs)
The circuit returned an output of one pertaining to the S output and an output of zero pertaining to the C_out output for the inputs A'B and AB, while it returned an output of zero for both outputs given the inputs AB, and an output of zero for S and one for C_out given the input A'B'. These results were expected, and matched the truth table given in the prelab exactly. This means that the circuit that was created and implemented in the lab performed exactly as hoped. 

### Observations and Conclusions ###
Throughout the multiple tests run on the schematic overview and program to simulate the circuit, it was observed that the expected values for outputs S and C_out given each input scenario were the same as the actual values when tested using the ISim and ISE iMPACT programs as well as through manual testing of the circuit. In conclusion, the lab was executed as laid out in the guide and the designed circuit outputted the same figures as shown in the equation given in the prelab, thus allowing for a precise recreation of the equation given. In working on this lab it was learned how half-adders work as well as further knowledge of the ISE Design Suite system including designing and creating logical gates to be available for use. In working on this lab, the necessary programs for completing future computer exercises were downloaded, and users were acquainted with these programs to help with future use.

### Documentation ###
None.