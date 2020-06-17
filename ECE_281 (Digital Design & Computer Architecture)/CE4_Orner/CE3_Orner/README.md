## Elevator Controller Shell ##

### Purpose ###
The purpose of this exercise is to create and simulate a synchronous sequential logic system. The logic system will be designed using VHDL, and tested by writing a testbench for a sybchronous system to fully simulate the state machine's operation. 

### State Machine Overview ###
The elevator controller will traverse four floors. The machine has two external inputs, _updown_ and _stop_. When _updown_ is active and _stop_ is inactive, the elvator will move up until it reaches the top floor at a pace of one floor per clock cycle. On the same pace, when _updown_ and _stop_ are both inactive, the elevator will move down until it reaches the bottom floor. When _stop_ is active, the system stops at the current floor. When the elevator is at the top floor, it will stay there until _updown_ and _stop_ both go inactive. Similarly, when at the bottom floor, the elevator will stay there until _updown_ is active and _stop_ is inactive. The system outputs the floor it is on as a four-bit binary number.

### Code Written ###
The VHDL program for the Moore machine elevator controller shell was created using the state machine overview given in the lab. In the code given on the course website, the programming for the controller shell contained bad syntax. The main poor syntax was contained in the output code in which a semicolon was contained in the parentheses causing the line of code to throw an error due to premature closing of a line. This line was corrected while the code given was filled in to program the state assignments for floors 2,3, and 4. Below is a picture of the code written for the Moore machine shell.

	floor_state_machine: process(clk)
	begin
	clk'event and clk='1' is VHDL-speak for a rising edge
	if clk'event and clk='1' then
		--reset is active high and will return the elevator to floor1
		--Question: is reset synchronous or asynchronous?
		if reset='1' then
			floor_state <= floor1;
		--now we will code our next-state logic
		else
			case floor_state is
				--when our current state is floor1
				when floor1 =>
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						--floor2 right?? This makes sense!
						floor_state <= floor2;
					--otherwise we're going to stay at floor1
					else
						floor_state <= floor1;
					end if;
				--when our current state is floor2				
				when floor2 => 
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						floor_state <= floor3;
					--if up_down is set to "go down" and stop is set to 
					--"don't stop" which floor do we want to go to?
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor1;
					--otherwise we're going to stay at floor2
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

	end Behavioral;

The second part of the exercise called for the elevator controller shell to be created using a Mealy machine. Below is a picture of the code written for the Mealy machine shell.

	floor_state_machine: process(clk)
	begin
	clk'event and clk='1' is VHDL-speak for a rising edge
	if clk'event and clk='1' then
		--reset is active high and will return the elevator to floor1
		--Question: is reset synchronous or asynchronous?
		if reset='1' then
			floor_state <= floor1;
		--now we will code our next-state logic
		else
			case floor_state is
				--when our current state is floor1
				when floor1 =>
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						--floor2 right?? This makes sense!
						floor_state <= floor2;
					--otherwise we're going to stay at floor1
					else
						floor_state <= floor1;
					end if;
				--when our current state is floor2
				when floor2 => 
					--if up_down is set to "go up" and stop is set to 
					--"don't stop" which floor do we want to go to?
					if (up_down='1' and stop='0') then 
						floor_state <= floor3;
					--if up_down is set to "go down" and stop is set to 
					--"don't stop" which floor do we want to go to?
					elsif (up_down='0' and stop='0') then 
						floor_state <= floor1;
					--otherwise we're going to stay at floor2
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
			
	nextfloor <= "0001" when (floor_state = floor1) else
			"0010" when (floor_state = floor2) else
			"0011" when (floor_state = floor3) else
			"0100" when (floor_state = floor4) else
			"0001";

	end Behavioral;



The test benches were written for each controller shell were identical to one another. Below is the code written and used in those test benches. This code properly puts the elevator controller shells through the process described in the lab document through use of the reset switch as well as timing constraints laid out for the use of the _updown_ input being set to high and the _stop_ input being high. These assignments allowed the elevator to stop at each floor for at least two clock cycles until it reached the top, then the elevator lowered until it reached the first floor once again.

   	begin		
      -- hold reset state for 100 ns.
		reset <='1'; stop <= '0'; up_down <= '0';
			wait for clk_period*2;
			
		reset <='0'; stop <= '0'; up_down <='1';
			wait for clk_period;
		reset <='0'; stop <= '1'; up_down <='1';
			wait for clk_period*3;
			
		reset <='0'; stop <= '0'; up_down <='1';
			wait for clk_period;
		reset <='0'; stop <= '1'; up_down <='1';
			wait for clk_period*3;
			
		reset <='0'; stop <= '0'; up_down <='1';
			wait for clk_period;
		reset <='0'; stop <= '1'; up_down <='1';
			wait for clk_period*3;
			
		reset <='0'; stop <= '0'; up_down <='0';
			wait for clk_period*5;
			
      wait for clk_period*10;

      -- insert stimulus here 

      wait;

### Testing ###
The testing was conducted using the ISim program with the files that were generated from each of the finished VHDL program files. Below is the testing of the Moore elevator controller shell from the ISim program. This picture proves the testing fulfilled the objectives set out in the lab document as when the _updown_ input is high and the _stop_ input is low, the elevator rises a floor per clock cycle, and when the _stop_ input is high the elevator stops at the floor until the _stop_ input is set to low once again. Once the elevator is at the top floor and both inputs are set to low, the elevator descends a floor per clock cycle until it reaches the bottom floor.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/4e1c70b92853f1b38b3f90b470f8dded6ee21e6d/CE3_Orner/Moore_ISim_Simulation.png?token=036e70dd763bbd13667deccd8be456d17455f59f)

The same ISim program was used for testing the Mealy elevator controller shell, and outputted similar results pertaining to the constraints given in the lab document. Below is a picture of the results of the testing. As seen below, the same outputs are given with respect to the _floor_ output as in the Moore elevator controller shell. The same outputs are given from the _nextfloor_ output, which was expected given the type of finite state machine being created.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/4e1c70b92853f1b38b3f90b470f8dded6ee21e6d/CE3_Orner/Mealy_ISim_Simulation.png?token=26ace26d36ea3b3adf123fa4c39d7afa54aec8ae)


### Conclusions ###
Given the task of creating two finite state machines given a state diagram and instructions pertaining to the inputs and the processes which each machine would follow given different outputs proved challenging. However, the creation of the two state machines went well and it was interesting to experience the thought process necessary in order to create two machines with the same functions given different types of creation.

In conclusion, the lab was executed as laid out in the lab documents and the designed elevator controller shell displayed the correct outputs as expected from the next state and output specification given in the lab document. In working on this lab it was learned how to design and implement finite state machines through VHDL coding.

### Documentation ###
None.