--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : Orner_Lab1_sseg_decoder.vhf
-- /___/   /\     Timestamp : 02/02/2016 13:49:35
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/ECE_281/Labs_and_CEs/ECE281_Lab1_Orner/Orner_Lab1_sseg_decoder.vhf -w C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/ECE_281/Labs_and_CEs/ECE281_Lab1_Orner/Orner_Lab1_sseg_decoder.sch
--Design Name: Orner_Lab1_sseg_decoder
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

entity Orner_Lab1_sseg_decoder is
   port ( D0 : in    std_logic; 
          D1 : in    std_logic; 
          D2 : in    std_logic; 
          D3 : in    std_logic; 
          a  : out   std_logic; 
          b  : out   std_logic; 
          c  : out   std_logic; 
          d  : out   std_logic; 
          e  : out   std_logic; 
          f  : out   std_logic; 
          g  : out   std_logic);
end Orner_Lab1_sseg_decoder;

architecture BEHAVIORAL of Orner_Lab1_sseg_decoder is
   attribute INIT       : string ;
   attribute BOX_TYPE   : string ;
   signal XLXN_32 : std_logic;
   signal XLXN_45 : std_logic;
   signal XLXN_46 : std_logic;
   signal XLXN_56 : std_logic;
   signal XLXN_67 : std_logic;
   component LUT4
      -- synopsys translate_off
      generic( INIT : bit_vector :=  x"0000");
      -- synopsys translate_on
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute INIT of LUT4 : component is "0000";
   attribute BOX_TYPE of LUT4 : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND3 : component is "BLACK_BOX";
   
   component AND4
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND4 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   attribute INIT of XLXI_1 : label is "3812";
   attribute INIT of XLXI_3 : label is "D860";
   attribute INIT of XLXI_4 : label is "D004";
   attribute INIT of XLXI_5 : label is "8692";
   attribute INIT of XLXI_6 : label is "02BA";
   attribute INIT of XLXI_7 : label is "308E";
begin
   XLXI_1 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"3812")
   -- synopsys translate_on
      port map (I0=>D0,
                I1=>D1,
                I2=>D2,
                I3=>D3,
                O=>a);
   
   XLXI_3 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"D860")
   -- synopsys translate_on
      port map (I0=>D0,
                I1=>D1,
                I2=>D2,
                I3=>D3,
                O=>b);
   
   XLXI_4 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"D004")
   -- synopsys translate_on
      port map (I0=>D0,
                I1=>D1,
                I2=>D2,
                I3=>D3,
                O=>c);
   
   XLXI_5 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"8692")
   -- synopsys translate_on
      port map (I0=>D0,
                I1=>D1,
                I2=>D2,
                I3=>D3,
                O=>d);
   
   XLXI_6 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"02BA")
   -- synopsys translate_on
      port map (I0=>D0,
                I1=>D1,
                I2=>D2,
                I3=>D3,
                O=>e);
   
   XLXI_7 : LUT4
   -- synopsys translate_off
   generic map( INIT => x"308E")
   -- synopsys translate_on
      port map (I0=>D0,
                I1=>D1,
                I2=>D2,
                I3=>D3,
                O=>f);
   
   XLXI_8 : OR2
      port map (I0=>XLXN_46,
                I1=>XLXN_45,
                O=>g);
   
   XLXI_9 : AND3
      port map (I0=>XLXN_67,
                I1=>XLXN_56,
                I2=>XLXN_32,
                O=>XLXN_45);
   
   XLXI_10 : AND4
      port map (I0=>D0,
                I1=>D1,
                I2=>D2,
                I3=>XLXN_32,
                O=>XLXN_46);
   
   XLXI_11 : INV
      port map (I=>D3,
                O=>XLXN_32);
   
   XLXI_13 : INV
      port map (I=>D1,
                O=>XLXN_67);
   
   XLXI_14 : INV
      port map (I=>D2,
                O=>XLXN_56);
   
end BEHAVIORAL;


