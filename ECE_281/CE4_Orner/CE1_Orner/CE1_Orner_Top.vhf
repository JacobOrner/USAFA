--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CE1_Orner_Top.vhf
-- /___/   /\     Timestamp : 01/13/2016 21:36:48
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl "C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring 2016/ECE 281/Labs_and_CEs/CE1_Orner/CE1_Orner_Top.vhf" -w "C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring 2016/ECE 281/Labs_and_CEs/CE1_Orner/CE1_Orner_Top.sch"
--Design Name: CE1_Orner_Top
--Device: spartan3e
--Purpose:
--    This vhdl netlist is translated from an ECS schematic. It can be 
--    synthesized and simulated, but it should not be modified. 
--

library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CE1_Orner_Top is
   port ( sw5  : in    std_logic; 
          sw6  : in    std_logic; 
          sw7  : in    std_logic; 
          led0 : out   std_logic);
end CE1_Orner_Top;

architecture BEHAVIORAL of CE1_Orner_Top is
   attribute BOX_TYPE   : string ;
   signal XLXN_3  : std_logic;
   signal XLXN_4  : std_logic;
   signal XLXN_30 : std_logic;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>XLXN_30,
                I1=>sw7,
                O=>XLXN_3);
   
   XLXI_2 : AND2
      port map (I0=>sw5,
                I1=>sw6,
                O=>XLXN_4);
   
   XLXI_3 : OR2
      port map (I0=>XLXN_4,
                I1=>XLXN_3,
                O=>led0);
   
   XLXI_6 : INV
      port map (I=>sw6,
                O=>XLXN_30);
   
end BEHAVIORAL;


