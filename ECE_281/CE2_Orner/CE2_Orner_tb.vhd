-- Vhdl test bench created from schematic C:\Users\C18Jacob.Orner\Documents\Schoolwork\Spring_2016\ECE_281\Labs_and_CEs\CE2_Orner\CE2_Orner_HA.sch - Thu Jan 21 21:18:16 2016
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

--Date:			26 January 2016

--Course:			ECE 281

--File:			CE2_Orner_tb.vhd

--HW:				CE2 Computer Exercise 2

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
ENTITY CE2_Orner_HA_CE2_Orner_HA_sch_tb IS
END CE2_Orner_HA_CE2_Orner_HA_sch_tb;
ARCHITECTURE behavioral OF CE2_Orner_HA_CE2_Orner_HA_sch_tb IS 

   COMPONENT CE2_Orner_HA
   PORT( B	:	IN	STD_LOGIC; 
          A	:	IN	STD_LOGIC; 
          C_out	:	OUT	STD_LOGIC; 
          S	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL B	:	STD_LOGIC;
   SIGNAL A	:	STD_LOGIC;
   SIGNAL C_out	:	STD_LOGIC;
   SIGNAL S	:	STD_LOGIC;

BEGIN

   UUT: CE2_Orner_HA PORT MAP(
		B => B, 
		A => A, 
		C_out => C_out, 
		S => S
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		A <= '0'; B <= '0'; 
	
		wait for 10 ns;
	
		A <= '0'; B <= '1';
		
		wait for 10 ns;

		A <= '1'; B <= '0';
	
		wait for 10 ns;
	
		A <= '1'; B <= '1';
		
		wait for 10 ns;

      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
