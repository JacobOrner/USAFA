
-- VHDL Instantiation Created from source file led_to_sseg.vhd -- 16:39:59 04/04/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT led_to_sseg
	PORT(
		clk : IN std_logic;
		up_down : IN std_logic;          
		leds : OUT std_logic_vector(7 downto 0)
		);
	END COMPONENT;

	Inst_led_to_sseg: led_to_sseg PORT MAP(
		clk => ,
		up_down => ,
		leds => 
	);


