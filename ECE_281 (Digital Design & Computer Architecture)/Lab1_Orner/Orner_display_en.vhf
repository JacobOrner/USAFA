--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Orner_display_en.vhf
-- /___/   /\     Timestamp : 02/02/2016 13:47:36
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/ECE_281/Labs_and_CEs/ECE281_Lab1_Orner/Orner_display_en.vhf -w C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/ECE_281/Labs_and_CEs/ECE281_Lab1_Orner/Orner_display_en.sch
--Design Name: Orner_display_en
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

entity INV4_MXILINX_Orner_display_en is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          O0 : out   std_logic; 
          O1 : out   std_logic; 
          O2 : out   std_logic; 
          O3 : out   std_logic);
end INV4_MXILINX_Orner_display_en;

architecture BEHAVIORAL of INV4_MXILINX_Orner_display_en is
   attribute BOX_TYPE   : string ;
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
begin
   I_36_37 : INV
      port map (I=>I3,
                O=>O3);
   
   I_36_38 : INV
      port map (I=>I2,
                O=>O2);
   
   I_36_39 : INV
      port map (I=>I1,
                O=>O1);
   
   I_36_40 : INV
      port map (I=>I0,
                O=>O0);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity Orner_display_en is
   port ( sseg_sel0   : in    std_logic; 
          sseg_sel1   : in    std_logic; 
          sseg_sel2   : in    std_logic; 
          sseg_sel3   : in    std_logic; 
          sseg_sel_n0 : out   std_logic; 
          sseg_sel_n1 : out   std_logic; 
          sseg_sel_n2 : out   std_logic; 
          sseg_sel_n3 : out   std_logic);
end Orner_display_en;

architecture BEHAVIORAL of Orner_display_en is
   attribute HU_SET     : string ;
   component INV4_MXILINX_Orner_display_en
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O0 : out   std_logic; 
             O1 : out   std_logic; 
             O2 : out   std_logic; 
             O3 : out   std_logic);
   end component;
   
   attribute HU_SET of XLXI_11 : label is "XLXI_11_0";
begin
   XLXI_11 : INV4_MXILINX_Orner_display_en
      port map (I0=>sseg_sel0,
                I1=>sseg_sel1,
                I2=>sseg_sel2,
                I3=>sseg_sel3,
                O0=>sseg_sel_n0,
                O1=>sseg_sel_n1,
                O2=>sseg_sel_n2,
                O3=>sseg_sel_n3);
   
end BEHAVIORAL;


