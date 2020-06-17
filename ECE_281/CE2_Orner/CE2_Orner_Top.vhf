--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : CE2_Orner_Top.vhf
-- /___/   /\     Timestamp : 01/21/2016 21:37:57
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/ECE_281/Labs_and_CEs/CE2_Orner/CE2_Orner_Top.vhf -w C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/ECE_281/Labs_and_CEs/CE2_Orner/CE2_Orner_Top.sch
--Design Name: CE2_Orner_Top
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

entity CE2_Orner_HA_MUSER_CE2_Orner_Top is
   port ( A     : in    std_logic; 
          B     : in    std_logic; 
          C_out : out   std_logic; 
          S     : out   std_logic);
end CE2_Orner_HA_MUSER_CE2_Orner_Top;

architecture BEHAVIORAL of CE2_Orner_HA_MUSER_CE2_Orner_Top is
   attribute BOX_TYPE   : string ;
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   component XOR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of XOR2 : component is "BLACK_BOX";
   
begin
   XLXI_1 : AND2
      port map (I0=>B,
                I1=>A,
                O=>C_out);
   
   XLXI_2 : XOR2
      port map (I0=>B,
                I1=>A,
                O=>S);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity CE2_Orner_Top is
   port ( sw0  : in    std_logic; 
          sw1  : in    std_logic; 
          led0 : out   std_logic; 
          led1 : out   std_logic);
end CE2_Orner_Top;

architecture BEHAVIORAL of CE2_Orner_Top is
   component CE2_Orner_HA_MUSER_CE2_Orner_Top
      port ( B     : in    std_logic; 
             A     : in    std_logic; 
             C_out : out   std_logic; 
             S     : out   std_logic);
   end component;
   
begin
   XLXI_1 : CE2_Orner_HA_MUSER_CE2_Orner_Top
      port map (A=>sw1,
                B=>sw0,
                C_out=>led1,
                S=>led0);
   
end BEHAVIORAL;


