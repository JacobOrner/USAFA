LIBRARY ieee;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;

entity alu is
	port(
		a, b : in std_logic_vector(31 downto 0);
		f    : in std_logic_vector(2 downto 0);
		y    : out std_logic_vector(31 downto 0);
		zero : out std_logic
	);
end alu;

architecture Behavioral of alu is

signal q,r,s: std_logic_vector(31 downto 0) := (others => '0');

begin
q <= a;
r <= b;
y <= s;

process(q, r, s, f)
begin

	case f is
		when "000" =>
			s <= q and r;
		when "001" =>
			s <= q or r;
		when "010" =>
			s <= q + r;
		when "100" =>
			s <= q and not r;
		when "101" =>
			s <= q or not r;
		when "110" =>
			s <= q - r;
		when "111" =>
			if(q < r) then
				s <= x"00000001";
			else 
				s <= x"00000000";
			end if;
		when others => 
			s <= x"00000000";
	end case;
	
	if(s = x"00000000") then
		zero <= '1';
	else 
		zero <= '0';
	end if;
end process;

end Behavioral;