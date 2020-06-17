-- ------------------------------------------------------------------
--Name:			Jacob Orner

--Date:			12 May 2016

--Course:			ECE 281

--File:			top_tb.vhd

--HW:				Lab 4

--Purp:			This program tests the microprocessor made for the lab.

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
 
ENTITY top_tb IS
END top_tb;
 
ARCHITECTURE behavior OF top_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         writedata : INOUT  std_logic_vector(31 downto 0);
         dataadr : INOUT  std_logic_vector(31 downto 0);
         memwrite : INOUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

	--BiDirs
   signal writedata : std_logic_vector(31 downto 0);
   signal dataadr : std_logic_vector(31 downto 0);
   signal memwrite : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top PORT MAP (
          clk => clk,
          reset => reset,
          writedata => writedata,
          dataadr => dataadr,
          memwrite => memwrite
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
		reset <= '1';
			wait for 10 ns;

      -- insert stimulus here 		
		reset <= '0';
      wait;
   end process;

END;
