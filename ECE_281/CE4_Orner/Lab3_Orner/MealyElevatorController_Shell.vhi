
-- VHDL Instantiation Created from source file MealyElevatorController_Shell.vhd -- 19:33:16 04/03/2016
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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
		clk => ,
		reset => ,
		stop => ,
		up_down => ,
		floor => ,
		nextfloor => 
	);


