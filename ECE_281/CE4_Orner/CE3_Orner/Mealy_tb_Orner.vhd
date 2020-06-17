-- ------------------------------------------------------------------
--Name:			Jacob Orner

--Date:			15 March 2016

--Course:			ECE 281

--File:			Mealy_tb_Orner.vhd

--HW:				CE 3

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
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Mealy_tb_Orner IS
END Mealy_tb_Orner;
 
ARCHITECTURE behavior OF Mealy_tb_Orner IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MealyElevatorController_Shell
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         stop : IN  std_logic;
         up_down : IN  std_logic;
         floor : OUT  std_logic_vector(3 downto 0);
         nextfloor : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal stop : std_logic := '0';
   signal up_down : std_logic := '0';

 	--Outputs
   signal floor : std_logic_vector(3 downto 0);
   signal nextfloor : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MealyElevatorController_Shell PORT MAP (
          clk => clk,
          reset => reset,
          stop => stop,
          up_down => up_down,
          floor => floor,
          nextfloor => nextfloor
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
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
   end process;

END;
