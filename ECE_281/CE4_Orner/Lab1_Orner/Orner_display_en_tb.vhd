-- Vhdl test bench created from schematic C:\Users\C18Jacob.Orner\Documents\Schoolwork\Spring_2016\ECE_281\Labs_and_CEs\ECE281_Lab1_Orner\Orner_display_en.sch - Tue Feb 02 13:48:43 2016
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

--Date:			4 February 2016

--Course:		ECE 281

--File:			Orner_display_en_tb.vhd

--HW:				Lab 1

--Purp:			This program tests the schematic drawn for the display in the lab.

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
ENTITY Orner_display_en_Orner_display_en_sch_tb IS
END Orner_display_en_Orner_display_en_sch_tb;
ARCHITECTURE behavioral OF Orner_display_en_Orner_display_en_sch_tb IS 

   COMPONENT Orner_display_en
   PORT( sseg_sel0	:	IN	STD_LOGIC; 
          sseg_sel_n3	:	OUT	STD_LOGIC; 
          sseg_sel_n1	:	OUT	STD_LOGIC; 
          sseg_sel_n0	:	OUT	STD_LOGIC; 
          sseg_sel3	:	IN	STD_LOGIC; 
          sseg_sel1	:	IN	STD_LOGIC; 
          sseg_sel_n2	:	OUT	STD_LOGIC; 
          sseg_sel2	:	IN	STD_LOGIC);
   END COMPONENT;

   SIGNAL sseg_sel0	:	STD_LOGIC;
   SIGNAL sseg_sel_n3	:	STD_LOGIC;
   SIGNAL sseg_sel_n1	:	STD_LOGIC;
   SIGNAL sseg_sel_n0	:	STD_LOGIC;
   SIGNAL sseg_sel3	:	STD_LOGIC;
   SIGNAL sseg_sel1	:	STD_LOGIC;
   SIGNAL sseg_sel_n2	:	STD_LOGIC;
   SIGNAL sseg_sel2	:	STD_LOGIC;

BEGIN

   UUT: Orner_display_en PORT MAP(
		sseg_sel0 => sseg_sel0, 
		sseg_sel_n3 => sseg_sel_n3, 
		sseg_sel_n1 => sseg_sel_n1, 
		sseg_sel_n0 => sseg_sel_n0, 
		sseg_sel3 => sseg_sel3, 
		sseg_sel1 => sseg_sel1, 
		sseg_sel_n2 => sseg_sel_n2, 
		sseg_sel2 => sseg_sel2
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		sseg_sel3 <= '0'; sseg_sel2 <= '0'; sseg_sel1 <= '0'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '0'; sseg_sel2 <= '0'; sseg_sel1 <= '0'; sseg_sel0 <= '1';
		wait for 10 ns;

		sseg_sel3 <= '0'; sseg_sel2 <= '0'; sseg_sel1 <= '1'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '0'; sseg_sel2 <= '0'; sseg_sel1 <= '1'; sseg_sel0 <= '1';
		wait for 10 ns;
		
		sseg_sel3 <= '0'; sseg_sel2 <= '1'; sseg_sel1 <= '0'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '0'; sseg_sel2 <= '1'; sseg_sel1 <= '0'; sseg_sel0 <= '1';
		wait for 10 ns;

		sseg_sel3 <= '0'; sseg_sel2 <= '1'; sseg_sel1 <= '1'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '0'; sseg_sel2 <= '1'; sseg_sel1 <= '1'; sseg_sel0 <= '1';
		wait for 10 ns;
		
		sseg_sel3 <= '1'; sseg_sel2 <= '0'; sseg_sel1 <= '0'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '1'; sseg_sel2 <= '0'; sseg_sel1 <= '0'; sseg_sel0 <= '1';
		wait for 10 ns;

		sseg_sel3 <= '1'; sseg_sel2 <= '0'; sseg_sel1 <= '1'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '1'; sseg_sel2 <= '0'; sseg_sel1 <= '1'; sseg_sel0 <= '1';
		wait for 10 ns;
		
		sseg_sel3 <= '1'; sseg_sel2 <= '1'; sseg_sel1 <= '0'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '1'; sseg_sel2 <= '1'; sseg_sel1 <= '0'; sseg_sel0 <= '1';
		wait for 10 ns;

		sseg_sel3 <= '1'; sseg_sel2 <= '1'; sseg_sel1 <= '1'; sseg_sel0 <= '0';
		wait for 10 ns;
	
		sseg_sel3 <= '1'; sseg_sel2 <= '1'; sseg_sel1 <= '1'; sseg_sel0 <= '1';
		wait for 10 ns;
		
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
