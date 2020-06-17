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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nibble_to_sseg is
    Port ( nibble : in  STD_LOGIC_VECTOR (3 downto 0);
           sseg : out  STD_LOGIC_VECTOR (7 downto 0));
end nibble_to_sseg;

architecture Behavioral of nibble_to_sseg is

begin
--	process(x)
--	begin
--	
--	case x is:
--		when X"0000" => sseg <= "00000001"
--		when X"0001" => sseg <= "01001111"
--		when X"0010" => sseg <= "00010010"
--		when X"0011" => sseg <= "00000110"
--		when X"0100" => sseg <= "01001100"
--		when X"0101" => sseg <= "00100100"
--		when X"0110" => sseg <= "00100000"
--		when X"0111" => sseg <= "00001101"
--		when X"1000" => sseg <= "00000000"
--		when X"1001" => sseg <= "00000100"
--		when X"1010" => sseg <= "00001000"
--		when X"1011" => sseg <= "01100000"
--		when X"1100" => sseg <= "00110001"
--		when X"1101" => sseg <= "01000010"
--		when X"1110" => sseg <= "00110000"
--		when X"1111" => sseg <= "00111000"
--		when others => sseg <= "11111110"
--	end case;
--end process;

	sseg(7) <= '0';	
	
	sseg(0) <= '0' when nibble = "0000" else
		'1' when nibble = "0001" else
		'0' when nibble = "0010" else
		'0' when nibble = "0011" else
		'1' when nibble = "0100" else
		'0' when nibble = "0101" else
		'0' when nibble = "0110" else
		'0' when nibble = "0111" else
		'0' when nibble = "1000" else
		'0' when nibble = "1001" else
		
		'0' when nibble = "1010" else
		'1' when nibble = "1011" else
		'1' when nibble = "1100" else
		'1' when nibble = "1101" else
		'0' when nibble = "1110" else
		'0' when nibble = "1111" else
		'1';
		
	sseg(1) <= '0' when nibble = "0000" else
		'0' when nibble = "0001" else
		'0' when nibble = "0010" else
		'0' when nibble = "0011" else
		'0' when nibble = "0100" else
		'1' when nibble = "0101" else
		'1' when nibble = "0110" else
		'0' when nibble = "0111" else
		'0' when nibble = "1000" else
		'0' when nibble = "1001" else
		
		'0' when nibble = "1010" else
		'1' when nibble = "1011" else
		'1' when nibble = "1100" else
		'0' when nibble = "1101" else
		'1' when nibble = "1110" else
		'1' when nibble = "1111" else
		'1';
		
	sseg(2) <= '0' when nibble = "0000" else
		'0' when nibble = "0001" else
		'1' when nibble = "0010" else
		'0' when nibble = "0011" else
		'0' when nibble = "0100" else
		'0' when nibble = "0101" else
		'0' when nibble = "0110" else
		'0' when nibble = "0111" else
		'0' when nibble = "1000" else
		'0' when nibble = "1001" else
		
		'0' when nibble = "1010" else
		'0' when nibble = "1011" else
		'1' when nibble = "1100" else
		'0' when nibble = "1101" else
		'1' when nibble = "1110" else
		'1' when nibble = "1111" else
		'1';
		
	sseg(3) <= '0' when nibble = "0000" else
		'1' when nibble = "0001" else
		'0' when nibble = "0010" else
		'0' when nibble = "0011" else
		'1' when nibble = "0100" else
		'0' when nibble = "0101" else
		'0' when nibble = "0110" else
		'1' when nibble = "0111" else
		'0' when nibble = "1000" else
		'1' when nibble = "1001" else
		
		'1' when nibble = "1010" else
		'0' when nibble = "1011" else
		'0' when nibble = "1100" else
		'0' when nibble = "1101" else
		'0' when nibble = "1110" else
		'1' when nibble = "1111" else
		'1';
		
	sseg(4) <= '0' when nibble = "0000" else
		'1' when nibble = "0001" else
		'0' when nibble = "0010" else
		'1' when nibble = "0011" else
		'1' when nibble = "0100" else
		'1' when nibble = "0101" else
		'0' when nibble = "0110" else
		'1' when nibble = "0111" else
		'0' when nibble = "1000" else
		'1' when nibble = "1001" else
		
		'0' when nibble = "1010" else
		'0' when nibble = "1011" else
		'0' when nibble = "1100" else
		'0' when nibble = "1101" else
		'0' when nibble = "1110" else
		'0' when nibble = "1111" else
		'1';
		
	sseg(5) <= '0' when nibble = "0000" else
		'1' when nibble = "0001" else
		'1' when nibble = "0010" else
		'1' when nibble = "0011" else
		'0' when nibble = "0100" else
		'0' when nibble = "0101" else
		'0' when nibble = "0110" else
		'1' when nibble = "0111" else
		'0' when nibble = "1000" else
		'0' when nibble = "1001" else
		
		'0' when nibble = "1010" else
		'0' when nibble = "1011" else
		'1' when nibble = "1100" else
		'1' when nibble = "1101" else
		'0' when nibble = "1110" else
		'0' when nibble = "1111" else
		'1';
	
	sseg(6) <= '1' when nibble = "0000" else
		'1' when nibble = "0001" else
		'0' when nibble = "0010" else
		'0' when nibble = "0011" else
		'0' when nibble = "0100" else
		'0' when nibble = "0101" else
		'0' when nibble = "0110" else
		'1' when nibble = "0111" else
		'0' when nibble = "1000" else
		'0' when nibble = "1001" else
		
		'0' when nibble = "1010" else
		'0' when nibble = "1011" else
		'0' when nibble = "1100" else
		'0' when nibble = "1101" else
		'0' when nibble = "1110" else
		'0' when nibble = "1111" else
		'1';
		
end Behavioral;

