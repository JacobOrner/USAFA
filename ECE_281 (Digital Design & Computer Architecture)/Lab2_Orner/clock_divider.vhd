library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_divider is
	port(
		clk_fast : in std_logic;
		reset    : in std_logic;
		clk_slow : out std_logic
	);
end clock_divider;

architecture horrible_method of clock_divider is
	signal clk_bus : unsigned(23 downto 0);
begin

	process (clk_fast, reset) is
	begin
		if reset = '1' then
			clk_bus <= (others => '0');
		elsif rising_edge(clk_fast) then
			clk_bus <= clk_bus + 1;
		end if;
	end process;
	
	clk_slow <= clk_bus(23);
end horrible_method;