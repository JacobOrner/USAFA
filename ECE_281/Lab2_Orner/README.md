## Thunderbird Turn Signal ##

### Purpose ###
The purpose of this exercise is to design, write, test, and implement a 1965 Thunderbird turn signal system on the Nexys2 Development Board with the FPGA which takes a left and right turn signal value input and correctly begins the sequence.

### Prelab ###
The prelab for this exercise included creating a state transition diagram for the turn signal in the form of a Moore machine.

#### State Transition Table ####
| Reset | A | B | C | L | R | A* | B* | C* |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 1 |
| 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 | 0 |
| 0 | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 1 |
| 0 | 0 | 0 | 1 | X | X | 0 | 1 | 0 |
| 0 | 0 | 1 | 0 | X | X | 0 | 1 | 1 |
| 0 | 0 | 1 | 1 | X | X | 0 | 0 | 0 |
| 0 | 1 | 0 | 0 | X | X | 1 | 0 | 1 |
| 0 | 1 | 0 | 1 | X | X | 1 | 1 | 0 |
| 0 | 1 | 1 | 0 | X | X | 0 | 0 | 0 |
| 0 | 1 | 1 | 1 | X | X | 0 | 0 | 0 |
| 1 | X | X | X | X | X | 0 | 0 | 0 |

#### Output Table ####
| A | B | C | Lc | Lb | La | Ra | Rb | Rc |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
| 0 | 0 | 1 | 0 | 0 | 0 | 1 | 0 | 0 |
| 0 | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
| 0 | 1 | 1 | 0 | 0 | 0 | 1 | 1 | 1 |
| 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 0 | 1 | 1 | 0 | 0 | 0 |
| 1 | 1 | 0 | 1 | 1 | 1 | 0 | 0 | 0 |
| 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |

#### Simplified Next State Equations ####
A* = X'A'B'C'L + X'AB'

B* = X'A'B'C'LR + X'B'C + X'ABC'

C* = X'A'B'C'R + X'A'BC' + X'AB'C


#### Simplified Output Equations ####
Lc = AB

Lb = AC + ABC'

La = A

Ra = ABC + A'B + A'C

Rb = A'B + ABC

Rc = BC


### Schematics ###
The schematic for the Thunderbird turn signal was created using the truth table created based on the state transition diagram from the prelab. The schematics of the circuit were drawn to match the truth table. The turn signal takes the input given through the switches and proceeds through the sequence until reaching the base state or until the state machine is reset. Below is a picture of the schematic for the thunderbird turn signal.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/8a58689388b6861e369e14a76870ad30f8dcae2c/Lab2_Orner/thunderbird_fsm_schematic.png?token=32bf889477f72de8566e0109906699f09a2fc192)

Also used with the thunderbird turn signal schematics was a clock divider schematic which slowed the clock within the FPGA board in order for the outputs to be seen by the human eye on the board. This schematic was connected to the turn signal schematic in order to create the top schematic for the turn signal circuit. Below is a picture of the top schematic using an abstracted piece to clearly show the input for the thunderbird_fsm schematic pictured above.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/8a58689388b6861e369e14a76870ad30f8dcae2c/Lab2_Orner/top_schematic.png?token=49ffa28ffc513119f9285e1fbf48aa3b20329528)

The clock divider used in the top schematic is designed using a process in VDHL coding which, if the signal is high for the reset, the clock divider then sets the clock components to low until the reset is put back to high, after which the clock resumes and advances. This process stops the clock from continuing while the reset switch is high in order to reset the clock if a ghost state has been reached.

### Code written ###
For the exercise there was only one test bench used. It was used for testing the tunderbird_fsm schematic to ensure the circuit was processing through the sequence correctly, and responded correctly to reset inputs as well as hazard inputs.

		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '1'; right<= '0';
		wait for 10 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '1'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '0';
		wait for 10 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '1'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '0';
		wait for 20 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '1'; right<= '0';
		wait for 30 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '1';
		wait for 10 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '1';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '0';
		wait for 10 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '1';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '0';
		wait for 20 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '1';
		wait for 30 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '1'; right<= '1';
		wait for 30 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
      WAIT; -- will wait forever

### Debugging ###
Throughout the process of this lab, no bugs were found in the technology being used. There was a mistake made in the initial work on the thunderbird_fsm schematic in which a B input was used in to calculate C* in an AND gate instead of B' but the error was quickly found and fixed accordingly.

### Testing ###
The testing was conducted using the ISim program with the files that were generated from each of the original schematics. Below is the testing of the thunderbird_fsm display decoder from the ISim program.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/8a58689388b6861e369e14a76870ad30f8dcae2c/Lab2_Orner/ISim_Simulation.png?token=13f7105548dc03e01564e6390ea4980d14cc8af0)

After the ISim testing was completed, the Lab 1 constraints file was downloaded from the course website in order to assign the inputs and outputs represented in the schematic to components on the FPGA board. The next set of testing was done on the FPGA system, in which the program was run through the system automatically using the ISE iMPACT program as well as programmed onto the FPGA board in order to allow the tester manually flip the switches on the FPGA board to simulate the different input scenarios. Below is a link to a video of the physical testing of the FPGA board.

[Thunderbird Turn Signal Testing Video](https://youtu.be/6SfGIdgMvQc)

The circuit reset switches worked correctly as expected. The first reset is used on the thunderbird_fsm logical gate which is intended to stop the process of the signals and reset the output to low for all led output lights. The second reset is for the clock, and is meant to reset the clock if it is put into a ghost state upon powering on of the circuit. When this reset gives a high signal, all processes in the entire circuit are stopped in place until the reset gives a low signal. 

The circuit returned displayed the expected outputs for all possible input combinations. By doing so, it translated the two turn signal inputs correctly as well as correctly responded to both the reset input for the turn signals as well as the reset signal for the clock. This means that the circuit that was created and implemented in the lab performed exactly as hoped. 

### Observations and Conclusions ###
Throughout the multiple tests run on the schematic overview and program to simulate the circuit, it was observed that the expected values for outputs on the thunderbird turn signal system were correct given each input scenario. These outputs were correct when the inputs were tested using the ISim and ISE iMPACT programs as well as through manual testing of the circuit. 

In conclusion, the lab was executed as laid out in the lab documents and the designed thunderbird turn signal displayed the correct outputs as expected from the next state and outputs table completed in the prelab, thus allowing for a precise recreation of the equations which were simplified for each input scenario. In working on this lab it was learned how to design and implement finite state machines Also learned was how to create constraints files to translate inputs from switches and buttons on the FPGA board to be displayed on the led lights of the FPGA board. In working on this lab, custom logical gates were created, and users were further acquainted with these programs used to create and test circuits to help with future use.

### Documentation ###
None.