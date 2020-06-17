## Lab 3 ##

### Purpose ###
The purpose of this lab was to synthesize and implement VHDL code on a FPGA. It involved testing and debugging an elevator controller shell created in an earlier exercise and configuring both a Mealy and a Moore state machine on an FPGA. Following this, the code was modified as to allow the state machines to perform more complex and diverse actions.

### Prelab ###
Approach: Use VHDL coding to create a Mealy and Moore Machine elevator controller on the Nexys2 board. Use knowledge learned from class to design and implement a Mealy and a Moore elevator controller shell. The inputs for the shell are the clock, 4 button inputs, 8 switch inputs, nibble input. The outputs for the shell are 8 LED lights, 4 LED positions, and SSEG outputs.

![](https://bytebucket.org/Orner_Jacob/ece281/raw/b68da2cec13c6cb1be7e3333e9fac9364b3a24d2/Lab3_Orner/Schematic.jpg?token=f3959ff756f7285cbd65c04d90ecf8589693fc49)

### Schematics ###
For this lab, no schematics were drawn as the state machines and shell for the module were created using VHDL code.

### Code written ###
For the initial part of the lab, a Moore elevator controller was created and implemented on the FPGA. Below is the final code for the Moore Controller Shell in the initial lab setup. 

		floor_state_machine: process(clk)
	begin
	if clk'event and clk='1' then
		if reset='1' then
			floor_state <= floor1;
		else
			case floor_state is
				when floor1 =>
					if (up_down='1' and stop='0') then 
						floor_state <= floor2;
					else
						floor_state <= floor1;
					end if;
				when floor2 => 
					if (up_down='1' and stop='0') then 
						floor_state <= floor3;
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor1;
					else
						floor_state <= floor2;
					end if;
				when floor3 =>
					if (up_down='1' and stop='0') then 
						floor_state <= floor4;
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor2;	
					else
						floor_state <= floor3;	
					end if;
				when floor4 =>
					if (up_down='0' and stop='0') then 
						floor_state <= floor3;	
					else 
						floor_state <= floor4;	
					end if;
				
				--This line accounts for phantom states
				when others =>
					floor_state <= floor1;
			end case;
		end if;
	else
		floor_state <= floor_state;
	end if;
	end process;

	floor <= "0001" when (floor_state = floor1) else
			"0010" when (floor_state = floor2) else
			"0011" when (floor_state = floor3) else
			"0100" when (floor_state = floor4) else
			"0001";

Using this as the shell for the controller, the controller was then declared and instantiated in the overall shell for the FPGA to use. Below is the declaration and instantiation used to create the shell on the FPGA board. 

	COMPONENT MooreElevatorController_Shell
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		stop : IN std_logic;
		up_down : IN std_logic;          
		floor : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	Inst_MooreElevatorController_Shell: MooreElevatorController_Shell PORT MAP(
		clk => ClockBus_sig(25),
		reset => btn(3),
		stop => switch(1),
		up_down => switch(0),
		floor => nibble0
	);
Along with the declaration and instantiation, the assignments of the nibble vectors were also changed to correspond with the creation of the Moore shell. The code for this is shown below.

	--nibble0 <= "0000";
	nibble1 <= "0000";
	nibble2 <= "0000";
	nibble3 <= "0000";

In the code above, the assignment of nibble0 is commented out as it is already assigned a value in the instantiation of the Moore Controller. For the second part of the lab exercise, a Mealy Controller was to be created and implemented. Below is the code used in the Mealy Elevator Controller Shell.

	floor_state_machine: process(clk)
	begin
	if clk'event and clk='1' then
		if reset='1' then
			floor_state <= floor1;
		else
			case floor_state is
				when floor1 =>
					if (up_down='1' and stop='0') then 
						floor_state <= floor2;
					else
						floor_state <= floor1;
					end if;	
				when floor2 => 
					if (up_down='1' and stop='0') then 
						floor_state <= floor3;
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor1;
					else
						floor_state <= floor2;
					end if;
				when floor3 =>
					if (up_down='1' and stop='0') then 
						floor_state <= floor4;
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor2;	
					else
						floor_state <= floor3;	
					end if;
				when floor4 =>
					if (up_down='0' and stop='0') then 
						floor_state <= floor3;	
					else 
						floor_state <= floor4;	
					end if;
				when others =>
					floor_state <= floor1;
			end case;
		end if;
	else
		floor_state <= floor_state;
	end if;
	end process;

	floor <= "0001" when (floor_state = floor1) else
			"0010" when (floor_state = floor2) else
			"0011" when (floor_state = floor3) else
			"0100" when (floor_state = floor4) else
			"0001";
			
	nextfloor <= "0001" when (reset = '1') else
			"0010" when (floor_state = floor1 and up_down = '1') else
			"0001" when (floor_state = floor2 and up_down = '0') else
			"0011" when (floor_state = floor2 and up_down = '1') else
			"0010" when (floor_state = floor3 and up_down = '0') else
			"0100" when (floor_state = floor3 and up_down = '1') else
			"0011" when (floor_state = floor4 and up_down = '0') else
			"0100" when (floor_state = floor4 and up_down = '1') else
			"0001";

This code creates the Mealy elevator controller which outputs the current floor as well as the next floor depending on the current floor and the state of the up_down input. This shell was then declared and instantiated in the top shell to be implemented on the FPGA board. Below is the declaration and instantiation of the Mealy controller shell.

	COMPONENT MealyElevatorController_Shell
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		stop : IN std_logic;
		up_down : IN std_logic;          
		floor : OUT std_logic_vector(3 downto 0);
		nextfloor : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;

	Inst_MealyElevatorController_Shell: MealyElevatorController_Shell PORT MAP(
		clk => ClockBus_sig(25),
		reset => btn(3),
		stop => switch(1),
		up_down => switch(0),
		floor => nibble0,
		nextfloor => nibble1
	);

Along with the declaration and instantiation of the Mealy controller, similar to the Moore controller, the assignment of the nibble signals was changed in order to align with the instantiation. Below is the code.

	--nibble0 <= "0000";
	--nibble1 <= "0000";
	nibble2 <= "0000";
	nibble3 <= "0000";

Following the successful creation and implementation of the Mealy controller shell, the next step of the lab exercise was to create the Moore controller with 8 floors instead of 4, and with the floors being the first 8 prime numbers. The only changes made to the Moore Controller were in the output section, as a second digit was necessary for floors higher than 9. Below is the code which programmed this two-digit output.

	floor <= "0010" when (floor_state = floor1) else
			"0011" when (floor_state = floor2) else
			"0101" when (floor_state = floor3) else
			"0111" when (floor_state = floor4) else
			"0001" when (floor_state = floor5) else
			"0011" when (floor_state = floor6) else
			"0111" when (floor_state = floor7) else
			"1001" when (floor_state = floor8) else
			"0000";

	flooragain <= "0000" when (floor_state = floor1) else
			"0000" when (floor_state = floor2) else
			"0000" when (floor_state = floor3) else
			"0000" when (floor_state = floor4) else
			"0001" when (floor_state = floor5) else
			"0001" when (floor_state = floor6) else
			"0001" when (floor_state = floor7) else
			"0001" when (floor_state = floor8) else
			"0000";

Because a second digit was necessary to display the first 8 prime numbers, the declaration and instantiation in the overall shell also needed to be changed to account for this.

	COMPONENT MooreElevatorController_Shell
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		stop : IN std_logic;
		up_down : IN std_logic;          
		floor : OUT std_logic_vector(3 downto 0);
		flooragain : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	Inst_MooreElevatorController_Shell: MooreElevatorController_Shell PORT MAP(
		clk => ClockBus_sig(25),
		reset => btn(3),
		stop => switch(1),
		up_down => switch(0),
		floor => nibble0,
		flooragain => nibble1
	);

Because the second digit of the floors was assigned to nibble1, there was no need to change the preexisting code pertaining to the assignment of the nibble data as it was coded for the Mealy machine.

Following the prime numbers assignment, the next step was to change the inputs which the elevator controller took in as well as assigning the floors the numbers 0-7 instead of the prime numbers. Below is the code from the Moore elevator controller adapted to fulfill these requirements. 

	floor_state_machine: process(clk)
	begin
	if clk'event and clk='1' then
		if reset='1' then
			floor_state <= floor1;
		else
			case floor_state is
				when floor1 =>
					if (newfloor > "000") then 
						floor_state <= floor2;
					else
						floor_state <= floor1;
					end if;
				when floor2 => 
					if (newfloor > "001") then 
						floor_state <= floor3;
					elsif (newfloor < "001") then 
						floor_state <= floor1;
					else
						floor_state <= floor2;
					end if;
				when floor3 =>
					if (newfloor > "010") then 
						floor_state <= floor4;
					elsif (newfloor < "010") then 
						floor_state <= floor2;	
					else
						floor_state <= floor3;	
					end if;
				when floor4 =>
					if (newfloor > "011") then 
						floor_state <= floor5;
					elsif (newfloor < "011") then 
						floor_state <= floor3;	
					else
						floor_state <= floor4;	
					end if;
				when floor5 =>
					if (newfloor > "100") then 
						floor_state <= floor6;
					elsif (newfloor < "100") then 
						floor_state <= floor4;	
					else
						floor_state <= floor5;	
					end if;
				when floor6 =>
					if (newfloor > "101") then 
						floor_state <= floor7;
					elsif (newfloor < "101") then 
						floor_state <= floor5;	
					else
						floor_state <= floor6;	
					end if;
				when floor7 =>
					if (newfloor > "110") then 
						floor_state <= floor8;
					elsif (newfloor < "110") then 
						floor_state <= floor6;	
					else
						floor_state <= floor7;	
					end if;
				when floor8 =>
					if (newfloor < "111") then 
						floor_state <= floor7;	
					else 
						floor_state <= floor8;	
					end if;
				when others =>
					floor_state <= floor1;
			end case;
		end if;
	else
		floor_state <= floor_state;
	end if;
	end process;

	floor <= "0000" when (floor_state = floor1) else
			"0001" when (floor_state = floor2) else
			"0010" when (floor_state = floor3) else
			"0011" when (floor_state = floor4) else
			"0100" when (floor_state = floor5) else
			"0101" when (floor_state = floor6) else
			"0110" when (floor_state = floor7) else
			"0111" when (floor_state = floor8) else
			"0000";

This code takes in a bus of three switch inputs to express the floor which the elevator should move to. Because the inputs were changed, the declaration and instantiation of the shell were also different. Below is the code which was used in the top shell for instantiating this specific code.

	COMPONENT MooreElevatorController_Shell
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		newfloor : IN std_logic_vector(2 downto 0);
		floor : OUT std_logic_vector(3 downto 0)
		);
	END COMPONENT;
	Inst_MooreElevatorController_Shell: MooreElevatorController_Shell PORT MAP(
		clk => ClockBus_sig(25),
		reset => btn(3),
		newfloor(2) => switch(2),
		newfloor(1) => switch(1),
		newfloor(0) => switch(0),
		floor => nibble0
	);

Because the output for this part of the exercise only necessitated one nibble data piece, the assignment of nibble1 was rewritten, and nibble1 was assigned to display 0 similar to the original Moore machine above.

The final part of the lab which was completed required the led lights on the FPGA board to light up in sequence pertaining to whether the elevator was moving up or down. In order to program this, a new shell was created which was a state machine which followed this sequence. Below is the code which created this state machine.

	led_state_machine : process(clk)
	begin
	if clk'event and clk='1' then
		if reset='1' then
			led_state <= led1;
		else
			case led_state is
				when led1 =>
					if (up_down='1' and stop ='0') then 
						led_state <= led2;
					elsif (up_down='0' and stop='0') then 
						led_state <= led8;
					else
						led_state <= led1;
					end if;			
				when led2 => 
					if (up_down='1' and stop='0') then 
						led_state <= led3;
					elsif (up_down='0' and stop='0') then 
						led_state <= led1;
					else
						led_state <= led2;
					end if;
				when led3 =>
					if (up_down='1' and stop='0') then 
						led_state <= led4;
					elsif (up_down='0' and stop='0') then 
						led_state <= led2;	
					else
						led_state <= led3;	
					end if;
				when led4 =>
					if (up_down='1' and stop='0') then 
						led_state <= led5;
					elsif (up_down='0' and stop='0') then 
						led_state <= led3;	
					else
						led_state <= led4;	
					end if;
				when led5 =>
					if (up_down='1' and stop='0') then 
						led_state <= led6;
					elsif (up_down='0' and stop='0') then 
						led_state <= led4;	
					else
						led_state <= led5;	
					end if;
				when led6 =>
					if (up_down='1' and stop='0') then 
						led_state <= led7;
					elsif (up_down='0' and stop='0') then 
						led_state <= led5;	
					else
						led_state <= led6;	
					end if;
				when led7 =>
					if (up_down='1' and stop='0') then 
						led_state <= led8;
					elsif (up_down='0' and stop='0') then 
						led_state <= led6;	
					else
						led_state <= led7;	
					end if;
				when led8 =>
					if (up_down='1' and stop='0') then 
						led_state <= led1;
					elsif (up_down='0' and stop='0') then 
						led_state <= led7;							
					else 
						led_state <= led8;	
					end if;
				when others =>
					led_state <= led1;
			end case;
		end if;
	else
		led_state <= led_state;
	end if;
	end process; -- Here you define your output logic. Finish the statements below


	leds <= "00000001" when (led_state = led1) else
			"00000011" when (led_state = led2) else
			"00000111" when (led_state = led3) else 
			"00001111" when (led_state = led4) else
			"00011111" when (led_state = led5) else 
			"00111111" when (led_state = led6) else
			"01111111" when (led_state = led7) else 
			"11111111" when (led_state = led8) else
			"00000000";

This state machine outputted the necessary data to the top shell in order to light the LED lights in sequence. Below is the declaration and instantiation of the led state machine in the top shell. 


	COMPONENT led_to_sseg
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		stop : IN std_logic;
		up_down : IN std_logic;          
		leds : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;
	Inst_led_to_sseg: led_to_sseg PORT MAP(
		clk => ClockBus_sig(23),
		reset => btn(3),
		stop => switch(1),
		up_down => switch(0),
		leds => LED
	);

This instantiation allows for the LED sequence to be shown on the FPGA board.

### Debugging ###
Throughout the lab there were several different problems reached in trying to output correctly onto the FPGA board. The first of which occurred in the creation of the prime numbered floors section. This occurred as it was believed that a double digit number could be outputted to the sseg system. However, in order to fix this problem, a second output was assigned which was then routed to the second digit of the SSEG on the FPGA board. The next problem reached was during the changed input part of the lab. This occurred because the three inputs switches were written as a bus, however, in the instantiation of the state machine in the top shell, each of the inputs needed to be assigned individually. Once these inputs were assigned individually, the elevator controller worked as described in the lab document.


### Testing ###
The testing for this lab was very in depth. The Moore elevator controller shell was tested in depth using the reset, up_down, and stop inputs. Through the testing done this part of the lab was found to match that described in the lab document exactly. The second set of testing was performed on the Mealy controller shell. Through thorough testing using the same inputs as found on the Moore controller shell, the output for the current floor and the next floor were found to match the description in the lab document as well. The third set of testing was done on the prime numbered floors shell. The same testing that was performed on the Moore shell was performed on this shell, and the outputs were correct in outputting the first eight prime numbered floors. The next set of testing was performed on the different input controller shell. This testing was very in-depth and involved testing the different inputs as well as using the reset input to test that the outputs were correct. Through this testing it was found that the board outputted correctly according to the lab document. The final set of testing was performed on the LED sequence controller. It was performed using the same testing procedures as the original Moore elevator controller, and ensuring the LED sequence proceeded as described in the lab document. The LED sequence also stopped when the stop input was given a high signal, thus the LED light shell worked as described in the lab document. Overall, the testing for each of the different scenarios worked as described in the lab document.

### Observations and Conclusions ###
Throughout the multiple tests run on the FPGA board after being programmed by the files written in VHDL code, it was observed that the expected values for outputs on the elevator controller shell were correct given each input scenario. These outputs were correct when the inputs were tested manually on the FPGA circuit. 

In conclusion, the lab was executed as laid out in the lab documents and the designed elevator controller shells displayed the correct outputs as expected for each of the different designs created per the lab document. In working on this lab it was learned how to design and implement Moore and Mealy state machines  in VHDL code. It was also learned was how to create constraints files to translate inputs from switches and buttons on the FPGA board to be displayed on the led lights and SSEG display of the FPGA board. In working on this lab, custom VHDL files were created, and users were acquainted with coding VHDL files to create state machines to be programmed onto the FPGA board.

### Documentation ###
None.