LIBRARY ieee;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alu_tb IS
END alu_tb;
 
ARCHITECTURE behavior OF alu_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)

	component alu
	port(
		a, b : in signed(31 downto 0);
		f    : in std_logic_vector(2 downto 0);
		y    : out signed(31 downto 0);
		zero : out std_logic
	);
	end component;
	
	signal a : signed(31 downto 0) := (others => '0');
	signal b : signed(31 downto 0) := (others => '0');
	signal f : std_logic_vector(2 downto 0) := (others => '0');
	
 	--Outputs
	signal y : signed(31 downto 0) := (others => '0');
   signal zero : std_logic := '0';

BEGIN 

	uut : alu port map(
			a => a,
			b => b,
			f => f,
			y => y,
			zero => zero
		);
	
	stim_proc: process
	begin
		wait for 10 ns;
		a <= x"FFFFFFFF";	b <= x"FFFFFFFF";	f <= "000";
			wait for 20 ns;
		a <= x"FFFFFFFF";	b <= x"12345678";	f <= "000";
			wait for 20 ns;
		a <= x"12345678";	b <= x"87654321";	f <= "000";
			wait for 20 ns;
		a <= x"00000000";	b <= x"FFFFFFFF";	f <= "000";
			wait for 20 ns;
			
		a <= x"FFFFFFFF";	b <= x"FFFFFFFF";	f <= "001";
			wait for 20 ns;
		a <= x"12345678";	b <= x"87654321";	f <= "001";
			wait for 20 ns;
		a <= x"00000000";	b <= x"FFFFFFFF";	f <= "001";
			wait for 20 ns;
		a <= x"00000000";	b <= x"00000000";	f <= "001";
			wait for 20 ns;
			
		a <= x"00000000"; b <= x"00000000"; f <= "010";
			wait for 20 ns;
		a <= x"00000000"; b <= x"FFFFFFFF";	f <= "010";
			wait for 20 ns;
		a <= x"00000001";	b <= x"FFFFFFFF";	f <= "010";
			wait for 20 ns;
		a <= x"000000FF"; b <= x"00000001"; f <= "010";
			wait for 20 ns;
			
		a <= x"FFFFFFFF";	b <= x"FFFFFFFF";	f <= "100";
			wait for 20 ns;
		a <= x"FFFFFFFF";	b <= x"12345678";	f <= "100";
			wait for 20 ns;
		a <= x"12345678";	b <= x"87654321";	f <= "100";
			wait for 20 ns;
		a <= x"00000000";	b <= x"FFFFFFFF";	f <= "100";
			wait for 20 ns;
		
		a <= x"FFFFFFFF";	b <= x"FFFFFFFF";	f <= "101";
			wait for 20 ns;
		a <= x"12345678";	b <= x"87654321";	f <= "101";
			wait for 20 ns;
		a <= x"00000000";	b <= x"FFFFFFFF";	f <= "101";
			wait for 20 ns;
		a <= x"00000000";	b <= x"00000000";	f <= "101";
			wait for 20 ns;
		
		a <= x"00000000";	b <= x"00000000";	f <= "110";
			wait for 20 ns;
		a <= x"00000000";	b <= x"FFFFFFFF";	f <= "110";
			wait for 20 ns;
		a <= x"00000001";	b <= x"00000001";	f <= "110";
			wait for 20 ns;
		a <= x"00000100";	b <= x"00000001";	f <= "110";
			wait for 20 ns;
			
		a <= x"00000000";	b <= x"00000000";	f <= "111";
			wait for 20 ns;
		a <= x"00000000";	b <= x"00000001";	f <= "111";
			wait for 20 ns;
		a <= x"00000000";	b <= x"FFFFFFFF";	f <= "111";
			wait for 20 ns;
		a <= x"00000001";	b <= x"00000000";	f <= "111";
			wait for 20 ns;
		a <= x"FFFFFFFF";	b <= x"00000000";	f <= "111";
			wait for 20 ns;
		
		a <= x"00000000"; b <= x"00000000"; f <= "000";
			
		wait;
	end process;	
END;
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			