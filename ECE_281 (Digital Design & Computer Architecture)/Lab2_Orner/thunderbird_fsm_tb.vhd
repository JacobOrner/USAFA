-- Vhdl test bench created from schematic C:\Users\C18Jacob.Orner\Documents\Schoolwork\Spring_2016\ECE_281\Labs_and_CEs\Lab2_Orner\thunderbird_fsm.sch - Tue Mar 01 21:48:07 2016
--
-- Notes: 
-- 1) This testbench template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the unit under test.
-- Xilinx recommends that these types always be used for the top-level
-- I/O of a design in order to guarantee that the testbench will bind
-- correctly to the timing (post-route) simulation model.
-- 2) To use this template as your testbench, change the filename to any
-- name of your choice with the extension .vhd, and use the "Source->Add"
-- menu in Project Navigator to import the testbench. Then
-- edit the user defined section below, adding code to generate the 
-- stimulus for your design.
--
-- ------------------------------------------------------------------
--Name:			Jacob Orner

--Date:			4 March 2016

--Course:			ECE 281

--File:			Lab2_Orner_tb.vhd

--HW:				Lab 2

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
USE ieee.numeric_std.ALL;
LIBRARY UNISIM;
USE UNISIM.Vcomponents.ALL;
ENTITY thunderbird_fsm_thunderbird_fsm_sch_tb IS
END thunderbird_fsm_thunderbird_fsm_sch_tb;
ARCHITECTURE behavioral OF thunderbird_fsm_thunderbird_fsm_sch_tb IS 

   COMPONENT thunderbird_fsm
   PORT( clk	:	IN	STD_LOGIC; 
          Reset	:	IN	STD_LOGIC; 
          lights_L	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0); 
          left	:	IN	STD_LOGIC; 
          right	:	IN	STD_LOGIC; 
          lights_R	:	OUT	STD_LOGIC_VECTOR (2 DOWNTO 0));
   END COMPONENT;

   SIGNAL clk	:	STD_LOGIC;
   SIGNAL Reset	:	STD_LOGIC;
   SIGNAL lights_L	:	STD_LOGIC_VECTOR (2 DOWNTO 0);
   SIGNAL left	:	STD_LOGIC;
   SIGNAL right	:	STD_LOGIC;
   SIGNAL lights_R	:	STD_LOGIC_VECTOR (2 DOWNTO 0);

BEGIN

   UUT: thunderbird_fsm PORT MAP(
		clk => clk, 
		Reset => Reset, 
		lights_L => lights_L, 
		left => left, 
		right => right, 
		lights_R => lights_R
   );
	process
	begin
		clk <= '0';
		wait for 5 ns;
		clk <= '1';
		wait for 5 ns;
	end process;

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '1'; right<= '0';
		wait for 10 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '1'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '0';
		wait for 10 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '1'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '0';
		wait for 20 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '1'; right<= '0';
		wait for 30 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '1';
		wait for 10 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '1';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '0';
		wait for 10 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '1';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '0';
		wait for 20 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '0'; right<= '1';
		wait for 30 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
		Reset <= '0'; left <= '1'; right<= '1';
		wait for 30 ns;
		
		Reset <= '1'; left <= '0'; right<= '0';
		wait for 10 ns;
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
