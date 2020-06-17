## Seven-Segment Display Decoder ##

### Purpose ###
The purpose of this exercise is to create, test, and implement a seven-segment display decoder on the Nexys2 Development Board with the FPGA which takesa four-bit value input and displays the correct hex digit.

### Prelab ###
The prelab for this exercise included creating a truth table for a seven-segment display decoder, deciding if SOP or POS would rather be implement to solve each output, and solving a simplified equation for each output. Below is the completed truth table and output equations.
#### Truth Table ####
|Hex Display|D3|D2|D1|D0|Sg|Sf|Se|Sd|Sc|Sb|Sa|In Hex|
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 0 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 40 |
| 1 | 0 | 0 | 0 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 1 | 79 |
| 2 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 39 |
| 3 | 0 | 0 | 1 | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 30 |
| 4 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | 1 | 19 |
| 5 | 0 | 1 | 0 | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 0 | 12 |
| 6 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 |  2 |
| 7 | 0 | 1 | 1 | 1 | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 78 |
| 8 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |  0 |
| 9 | 1 | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 0 | 0 | 0 | 18 |
| A | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 1 | 0 | 0 | 0 |  8 |
| B | 1 | 0 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 1 |  3 |
| C | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 1 | 27 |
| D | 1 | 1 | 0 | 1 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 21 |
| E | 1 | 1 | 1 | 0 | 0 | 0 | 0 | 0 | 1 | 1 | 0 |  6 |
| F | 1 | 1 | 1 | 1 | 0 | 0 | 0 | 1 | 1 | 1 | 0 |  E |

#### Simplified Output Equations ####
Sg = D3'D2'D1' + D3'D2D1D0

Sf = D3'D2'D0 + D3'D2'D1 + D3'D1D0 + D3D2D1'

Se = D3'D0 + D3'D2D1' + D2'D1'D0

Sd = D3'D2'D1'D0 + D3'D2D1'D0' + D3'D2D1D0 + D3D2D1'D0 + D3D2D1D0' + D3D2'D1D0

Sc = D3'D2'D1D0' + D3D2D1'D0' + D3D2D1

Sb = D3'D1D0' + D3'D2D1'D0 + D3D2D1'D0' + D3D2D1 + D3D1D0 

Sa = D3'D2'D1'D0 + D3'D2'D1'D0 + D3'D2'D1D0' + D2D1'D0' + D3D2D1' + D3D2'D1D0

### Schematics ###
The schematic for the seven-segment display decoder was created using the truth table created in the prelab. The schematics of the circuit were drawn to match the truth table. The decoder takes the input given through the buttons and displays the output on the FPGA seven-segment display. The decoder used six LUT4 gates, which take an INIT value, which is written in hexadecimal and corresponds to reading the binary outputs from bottom to top. The LUT4 uses this INIT value in deciding what value will be outputted depending on the values inputted to the gate. Below is a picture of the schematic for the seven-segment display decoder.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/47811b6a625b27ac04f52de1ba882a9783994ede/ECE281_Lab1_Orner/Seven_Segment_Display_Decoder_Schematic.png?token=074c0835b6f0361e7a7b56ac7710642e625e8200)

Also created with the seven segment display decoder schematics was a display schematic which inverted the inputs given by the user in order to tell the board which part of the display decoder was to be powered on and displaying inputs.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/47811b6a625b27ac04f52de1ba882a9783994ede/ECE281_Lab1_Orner/Display_en_schematic.png?token=f9a9426dd9f1bc5c21428cf7d937598941c97c9e)

When abstracted for simplification, the top schematic for the seven-segment display decoder is shown below.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/d469d64c00de8a924b45885affa58881c779e599/ECE281_Lab1_Orner/Orner_Top_Schematic.png?token=e4c74ffb541894c14b695ba24cca3f5c27552100)

### Code written ###
For the exercise there were two test benches used. The first was used for testing the seven-segment display decoder, and was used to test that the outputs for each set of inputs matched those expected in the truth table.

		D3 <= '0'; D2 <= '0'; D1<= '0'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '0'; D2 <= '0'; D1<= '0'; D0 <= '1';
		wait for 10 ns;

		D3 <= '0'; D2 <= '0'; D1<= '1'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '0'; D2 <= '0'; D1<= '1'; D0 <= '1';
		wait for 10 ns;
	
		D3 <= '0'; D2 <= '1'; D1<= '0'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '0'; D2 <= '1'; D1<= '0'; D0 <= '1';
		wait for 10 ns;

		D3 <= '0'; D2 <= '1'; D1<= '1'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '0'; D2 <= '1'; D1<= '1'; D0 <= '1';
		wait for 10 ns;
		
		D3 <= '1'; D2 <= '0'; D1<= '0'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '1'; D2 <= '0'; D1<= '0'; D0 <= '1';
		wait for 10 ns;

		D3 <= '1'; D2 <= '0'; D1<= '1'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '1'; D2 <= '0'; D1<= '1'; D0 <= '1';
		wait for 10 ns;
	
		D3 <= '1'; D2 <= '1'; D1<= '0'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '1'; D2 <= '1'; D1<= '0'; D0 <= '1';
		wait for 10 ns;

		D3 <= '1'; D2 <= '1'; D1<= '1'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '1'; D2 <= '1'; D1<= '1'; D0 <= '1';
		wait for 10 ns;

The second section of code was written to test that the display schematic outputted the inverted inputs it received given all possible inputs.

		sseg_sel3 <= '0'; sseg_sel2 <= '0'; sseg_sel1 <= '0'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '0'; sseg_sel2 <= '0'; sseg_sel1 <= '0'; sseg_sel0 <= '1';
		wait for 10 ns;

		sseg_sel3 <= '0'; sseg_sel2 <= '0'; sseg_sel1 <= '1'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '0'; sseg_sel2 <= '0'; sseg_sel1 <= '1'; sseg_sel0 <= '1';
		wait for 10 ns;
		
		sseg_sel3 <= '0'; sseg_sel2 <= '1'; sseg_sel1 <= '0'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '0'; sseg_sel2 <= '1'; sseg_sel1 <= '0'; sseg_sel0 <= '1';
		wait for 10 ns;

		sseg_sel3 <= '0'; sseg_sel2 <= '1'; sseg_sel1 <= '1'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '0'; sseg_sel2 <= '1'; sseg_sel1 <= '1'; sseg_sel0 <= '1';
		wait for 10 ns;
		
		sseg_sel3 <= '1'; sseg_sel2 <= '0'; sseg_sel1 <= '0'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '1'; sseg_sel2 <= '0'; sseg_sel1 <= '0'; sseg_sel0 <= '1';
		wait for 10 ns;

		sseg_sel3 <= '1'; sseg_sel2 <= '0'; sseg_sel1 <= '1'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '1'; sseg_sel2 <= '0'; sseg_sel1 <= '1'; sseg_sel0 <= '1';
		wait for 10 ns;
		
		sseg_sel3 <= '1'; sseg_sel2 <= '1'; sseg_sel1 <= '0'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '1'; sseg_sel2 <= '1'; sseg_sel1 <= '0'; sseg_sel0 <= '1';
		wait for 10 ns;

		sseg_sel3 <= '1'; sseg_sel2 <= '1'; sseg_sel1 <= '1'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '1'; sseg_sel2 <= '1'; sseg_sel1 <= '1'; sseg_sel0 <= '1';
		wait for 10 ns;

### Debugging ###
Throughout the process of this lab, no bugs were found in the technology being used. There was a mistake made in the initial work on the prelab in which the outputs for Sa and Sb were incorrect for the hexadecimal digit 2. These mistakes were corrected before the prelab was completed.

### Testing ###
The testing was conducted using the ISim program with the files that were generated from each of the original schematics. Below is the testing of the seven-segment display decoder from the ISim program.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/d469d64c00de8a924b45885affa58881c779e599/ECE281_Lab1_Orner/Orner_sseg_decoder_ISim_Simulation.png?token=dfc384f36f229db023263641bba3c32d046dd681)

This picture shows the testing for all possible inputs with the correct outputs according to the truth table from the prelab. Below is a picture of the testing of the display schematic which outputs the inverted inputs it receives.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/d469d64c00de8a924b45885affa58881c779e599/ECE281_Lab1_Orner/Orner_display_en_ISim_Simulation.png?token=f7bacc1ac7248f11dc671217df242b059322fc19)

After the ISim testing was completed, the Lab 1 constraints file was downloaded from the course website in order to assign the inputs and outputs represented in the schematic to components on the FPGA board. The next set of testing was done on the FPGA system, in which the program was run through the system automatically using the ISE iMPACT program as well as programmed onto the FPGA board in order to allow the tester manually flip the switches on the FPGA board to simulate the different input scenarios. Below is a link to a video of the physical testing of the FPGA board.

[Seven Segment Display Testing Video](https://youtu.be/VNle_sIBjmk)

The circuit returned displayed the expected outputs for all possible input combinations. By doing so, it translated the 4-bit input from binary into hexidecimal. The circuit also powered on the correct part of the display screen pertaining to each connected switch. This means that the circuit that was created and implemented in the lab performed exactly as hoped. 

### Observations and Conclusions ###
Throughout the multiple tests run on the schematic overview and program to simulate the circuit, it was observed that the expected values for outputs on the seven-segment display decoder were correct given each input scenario. These outputs were correct when the inputs were tested using the ISim and ISE iMPACT programs as well as through manual testing of the circuit. 

In conclusion, the lab was executed as laid out in the lab documents and the designed seven-segment display decoder displayed the correct hexadecimal digits as expected from the truth table completed in the prelab, thus allowing for a precise recreation of the equations which were simplified for each outputs. In working on this lab it was learned how seven-segment display decoders work as well as further knowledge of the ISE Design Suite system including designing and creating logical gates to be available for use. Also learned was how to translate inputs from switches and buttons on the FPGA board to be displayed on the display of the FPGA board. In working on this lab, custom logical gates were created, and users were further acquainted with these programs used to create and test circuits to help with future use.

### Documentation ###
None.