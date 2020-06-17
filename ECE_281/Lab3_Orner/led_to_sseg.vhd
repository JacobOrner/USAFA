-- ------------------------------------------------------------------
--Name:			Jacob Orner

--Date:			16 March 2016

--Course:			ECE 281

--File:			ICE_top.vhd

--HW:				ICE 2

--Purp:			This program tests the schematic drawn for the computer exercise.

--Documentation:	None

--Academic Integrity Statement: I certify that, while others may have 
--assisted me in brain storming, debugging and validating this program, 
--the program itself is my own work. I understand that submitting code 
--which is the work of other individuals is a violation of the honor   
--code.  I also understand that if I knowingly give my original work to 
--another individual is also a violation of the honor code. 

-- ------------------------------------------------------------------
LIBRARY ieee;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity led_to_sseg is
    Port ( clk : in  STD_LOGIC;
			  reset : in STD_LOGIC;
			  stop : in STD_LOGIC;
			  up_down : in  STD_LOGIC;
			  leds : out STD_LOGIC_VECTOR (7 downto 0)
			  );
			  
end led_to_sseg;

architecture Behavioral of led_to_sseg is

--Below you create a new variable type! You also define what values that 
--variable type can take on. Now you can assign a signal as 
--"floor_state_type" the same way you'd assign a signal as std_logic 
type led_state_type is (led1, led2, led3, led4, led5, led6, led7, led8);

--Here you create a variable "floor_state" that can take on the values
--defined above. Neat-o!
signal led_state : led_state_type;

begin
---------------------------------------------
--Below you will code your next-state process
---------------------------------------------

--This line will set up a process that is sensitive to the clock
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
				
				--This line accounts for phantom states
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
			
			
			
			
--flooragain <= "0000" when (floor_state = floor1) else
--			"0000" when (floor_state = floor2) else
--			"0000" when (floor_state = floor3) else
--			"0000" when (floor_state = floor4) else
--			"0000" when (floor_state = floor5) else
--			"0000" when (floor_state = floor6) else
--			"0000" when (floor_state = floor7) else
--			"0000" when (floor_state = floor8) else
--			"0000";
end Behavioral;


