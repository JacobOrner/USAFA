-- Vhdl test bench created from schematic C:\Users\C18Jacob.Orner\Documents\Schoolwork\Spring_2016\ECE_281\Labs_and_CEs\ECE281_Lab1_Orner\Orner_Lab1_sseg_decoder.sch - Thu Jan 28 11:21:51 2016
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

--File:			Orner_Lab1_sseg_decoder_tb.vhd

--HW:				Lab 1

--Purp:			This program tests the schematic drawn for the seven segment decoder for the lab.

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
ENTITY Orner_Lab1_sseg_decoder_Orner_Lab1_sseg_decoder_sch_tb IS
END Orner_Lab1_sseg_decoder_Orner_Lab1_sseg_decoder_sch_tb;
ARCHITECTURE behavioral OF 
      Orner_Lab1_sseg_decoder_Orner_Lab1_sseg_decoder_sch_tb IS 

   COMPONENT Orner_Lab1_sseg_decoder
   PORT( D3	:	IN	STD_LOGIC; 
          D2	:	IN	STD_LOGIC; 
          D1	:	IN	STD_LOGIC; 
          D0	:	IN	STD_LOGIC; 
          a	:	OUT	STD_LOGIC; 
          b	:	OUT	STD_LOGIC; 
          c	:	OUT	STD_LOGIC; 
          d	:	OUT	STD_LOGIC; 
          e	:	OUT	STD_LOGIC; 
          f	:	OUT	STD_LOGIC; 
          g	:	OUT	STD_LOGIC);
   END COMPONENT;

   SIGNAL D3	:	STD_LOGIC;
   SIGNAL D2	:	STD_LOGIC;
   SIGNAL D1	:	STD_LOGIC;
   SIGNAL D0	:	STD_LOGIC;
   SIGNAL a	:	STD_LOGIC;
   SIGNAL b	:	STD_LOGIC;
   SIGNAL c	:	STD_LOGIC;
   SIGNAL d	:	STD_LOGIC;
   SIGNAL e	:	STD_LOGIC;
   SIGNAL f	:	STD_LOGIC;
   SIGNAL g	:	STD_LOGIC;

BEGIN

   UUT: Orner_Lab1_sseg_decoder PORT MAP(
		D3 => D3, 
		D2 => D2, 
		D1 => D1, 
		D0 => D0, 
		a => a, 
		b => b, 
		c => c, 
		d => d, 
		e => e, 
		f => f, 
		g => g
   );

-- *** Test Bench - User Defined Section ***
   tb : PROCESS
   BEGIN
		D3 <= '0'; D2 <= '0'; D1<= '0'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '0'; D2 <= '0'; D1<= '0'; D0 <= '1';
		wait for 10 ns;

		D3 <= '0'; D2 <= '0'; D1<= '1'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '0'; D2 <= '0'; D1<= '1'; D0 <= '1';
		wait for 10 ns;
	
		D3 <= '0'; D2 <= '1'; D1<= '0'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '0'; D2 <= '1'; D1<= '0'; D0 <= '1';
		wait for 10 ns;

		D3 <= '0'; D2 <= '1'; D1<= '1'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '0'; D2 <= '1'; D1<= '1'; D0 <= '1';
		wait for 10 ns;
		
		D3 <= '1'; D2 <= '0'; D1<= '0'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '1'; D2 <= '0'; D1<= '0'; D0 <= '1';
		wait for 10 ns;

		D3 <= '1'; D2 <= '0'; D1<= '1'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '1'; D2 <= '0'; D1<= '1'; D0 <= '1';
		wait for 10 ns;
	
		D3 <= '1'; D2 <= '1'; D1<= '0'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '1'; D2 <= '1'; D1<= '0'; D0 <= '1';
		wait for 10 ns;

		D3 <= '1'; D2 <= '1'; D1<= '1'; D0 <= '0';
		wait for 10 ns;
	
		D3 <= '1'; D2 <= '1'; D1<= '1'; D0 <= '1';
		wait for 10 ns;
      WAIT; -- will wait forever
   END PROCESS;
-- *** End Test Bench - User Defined Section ***

END;
