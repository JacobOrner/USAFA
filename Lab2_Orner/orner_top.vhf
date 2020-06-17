--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 14.7
--  \   \         Application : sch2hdl
--  /   /         Filename : orner_top.vhf
-- /___/   /\     Timestamp : 03/03/2016 08:02:15
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: sch2hdl -intstyle ise -family spartan3e -flat -suppress -vhdl C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/ECE_281/Labs_and_CEs/Lab2_Orner/orner_top.vhf -w C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/ECE_281/Labs_and_CEs/Lab2_Orner/orner_top.sch
--Design Name: orner_top
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

entity AND6_MXILINX_orner_top is
   port ( I0 : in    std_logic; 
          I1 : in    std_logic; 
          I2 : in    std_logic; 
          I3 : in    std_logic; 
          I4 : in    std_logic; 
          I5 : in    std_logic; 
          O  : out   std_logic);
end AND6_MXILINX_orner_top;

architecture BEHAVIORAL of AND6_MXILINX_orner_top is
   attribute BOX_TYPE   : string ;
   attribute RLOC       : string ;
   signal dummy   : std_logic;
   signal I35     : std_logic;
   signal O_DUMMY : std_logic;
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
   
   component FMAP
      port ( I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : in    std_logic);
   end component;
   attribute BOX_TYPE of FMAP : component is "BLACK_BOX";
   
   attribute RLOC of I_36_93 : label is "X0Y0";
   attribute RLOC of I_36_94 : label is "X0Y0";
begin
   O <= O_DUMMY;
   I_36_69 : AND3
      port map (I0=>I3,
                I1=>I4,
                I2=>I5,
                O=>I35);
   
   I_36_85 : AND4
      port map (I0=>I0,
                I1=>I1,
                I2=>I2,
                I3=>I35,
                O=>O_DUMMY);
   
   I_36_93 : FMAP
      port map (I1=>I3,
                I2=>I4,
                I3=>I5,
                I4=>dummy,
                O=>I35);
   
   I_36_94 : FMAP
      port map (I1=>I0,
                I2=>I1,
                I3=>I2,
                I4=>I35,
                O=>O_DUMMY);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity thunderbird_fsm_MUSER_orner_top is
   port ( clk      : in    std_logic; 
          left     : in    std_logic; 
          Reset    : in    std_logic; 
          right    : in    std_logic; 
          lights_L : out   std_logic_vector (2 downto 0); 
          lights_R : out   std_logic_vector (2 downto 0));
end thunderbird_fsm_MUSER_orner_top;

architecture BEHAVIORAL of thunderbird_fsm_MUSER_orner_top is
   attribute BOX_TYPE   : string ;
   attribute HU_SET     : string ;
   signal XLXN_1   : std_logic;
   signal XLXN_2   : std_logic;
   signal XLXN_4   : std_logic;
   signal XLXN_8   : std_logic;
   signal XLXN_12  : std_logic;
   signal XLXN_15  : std_logic;
   signal XLXN_17  : std_logic;
   signal XLXN_18  : std_logic;
   signal XLXN_19  : std_logic;
   signal XLXN_20  : std_logic;
   signal XLXN_26  : std_logic;
   signal XLXN_27  : std_logic;
   signal XLXN_30  : std_logic;
   signal XLXN_31  : std_logic;
   signal XLXN_32  : std_logic;
   signal XLXN_35  : std_logic;
   signal XLXN_38  : std_logic;
   signal XLXN_40  : std_logic;
   signal XLXN_42  : std_logic;
   signal XLXN_45  : std_logic;
   signal XLXN_47  : std_logic;
   signal XLXN_48  : std_logic;
   signal XLXN_50  : std_logic;
   signal XLXN_52  : std_logic;
   signal XLXN_58  : std_logic;
   signal XLXN_59  : std_logic;
   signal XLXN_65  : std_logic;
   signal XLXN_84  : std_logic;
   signal XLXN_92  : std_logic;
   component FD
      generic( INIT : bit :=  '0');
      port ( C : in    std_logic; 
             D : in    std_logic; 
             Q : out   std_logic);
   end component;
   attribute BOX_TYPE of FD : component is "BLACK_BOX";
   
   component OR2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR2 : component is "BLACK_BOX";
   
   component AND5
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND5 : component is "BLACK_BOX";
   
   component INV
      port ( I : in    std_logic; 
             O : out   std_logic);
   end component;
   attribute BOX_TYPE of INV : component is "BLACK_BOX";
   
   component OR3
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of OR3 : component is "BLACK_BOX";
   
   component AND6_MXILINX_orner_top
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             I2 : in    std_logic; 
             I3 : in    std_logic; 
             I4 : in    std_logic; 
             I5 : in    std_logic; 
             O  : out   std_logic);
   end component;
   
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
   
   component AND2
      port ( I0 : in    std_logic; 
             I1 : in    std_logic; 
             O  : out   std_logic);
   end component;
   attribute BOX_TYPE of AND2 : component is "BLACK_BOX";
   
   attribute HU_SET of XLXI_14 : label is "XLXI_14_1";
begin
   XLXI_1 : FD
      port map (C=>clk,
                D=>XLXN_1,
                Q=>XLXN_84);
   
   XLXI_2 : FD
      port map (C=>clk,
                D=>XLXN_19,
                Q=>XLXN_18);
   
   XLXI_3 : FD
      port map (C=>clk,
                D=>XLXN_30,
                Q=>XLXN_40);
   
   XLXI_4 : OR2
      port map (I0=>XLXN_4,
                I1=>XLXN_2,
                O=>XLXN_1);
   
   XLXI_5 : AND5
      port map (I0=>XLXN_17,
                I1=>XLXN_15,
                I2=>XLXN_12,
                I3=>left,
                I4=>XLXN_8,
                O=>XLXN_2);
   
   XLXI_7 : INV
      port map (I=>Reset,
                O=>XLXN_8);
   
   XLXI_9 : INV
      port map (I=>XLXN_84,
                O=>XLXN_12);
   
   XLXI_10 : INV
      port map (I=>XLXN_18,
                O=>XLXN_15);
   
   XLXI_11 : INV
      port map (I=>XLXN_40,
                O=>XLXN_17);
   
   XLXI_12 : OR3
      port map (I0=>XLXN_27,
                I1=>XLXN_26,
                I2=>XLXN_20,
                O=>XLXN_19);
   
   XLXI_14 : AND6_MXILINX_orner_top
      port map (I0=>right,
                I1=>left,
                I2=>XLXN_17,
                I3=>XLXN_15,
                I4=>XLXN_12,
                I5=>XLXN_8,
                O=>XLXN_20);
   
   XLXI_15 : AND3
      port map (I0=>XLXN_40,
                I1=>XLXN_15,
                I2=>XLXN_8,
                O=>XLXN_26);
   
   XLXI_16 : AND4
      port map (I0=>XLXN_17,
                I1=>XLXN_18,
                I2=>XLXN_12,
                I3=>XLXN_8,
                O=>XLXN_27);
   
   XLXI_20 : AND5
      port map (I0=>right,
                I1=>XLXN_17,
                I2=>XLXN_15,
                I3=>XLXN_12,
                I4=>XLXN_8,
                O=>XLXN_31);
   
   XLXI_21 : AND4
      port map (I0=>XLXN_17,
                I1=>XLXN_18,
                I2=>XLXN_12,
                I3=>XLXN_8,
                O=>XLXN_32);
   
   XLXI_23 : OR2
      port map (I0=>XLXN_38,
                I1=>XLXN_35,
                O=>lights_L(1));
   
   XLXI_24 : AND2
      port map (I0=>XLXN_40,
                I1=>XLXN_84,
                O=>XLXN_35);
   
   XLXI_25 : AND3
      port map (I0=>XLXN_42,
                I1=>XLXN_18,
                I2=>XLXN_84,
                O=>XLXN_38);
   
   XLXI_26 : INV
      port map (I=>XLXN_40,
                O=>XLXN_42);
   
   XLXI_27 : AND2
      port map (I0=>XLXN_18,
                I1=>XLXN_84,
                O=>lights_L(2));
   
   XLXI_28 : OR3
      port map (I0=>XLXN_52,
                I1=>XLXN_47,
                I2=>XLXN_45,
                O=>lights_R(0));
   
   XLXI_29 : AND3
      port map (I0=>XLXN_40,
                I1=>XLXN_18,
                I2=>XLXN_84,
                O=>XLXN_45);
   
   XLXI_30 : AND2
      port map (I0=>XLXN_18,
                I1=>XLXN_48,
                O=>XLXN_47);
   
   XLXI_31 : INV
      port map (I=>XLXN_84,
                O=>XLXN_48);
   
   XLXI_32 : INV
      port map (I=>XLXN_84,
                O=>XLXN_50);
   
   XLXI_33 : AND2
      port map (I0=>XLXN_40,
                I1=>XLXN_50,
                O=>XLXN_52);
   
   XLXI_34 : OR2
      port map (I0=>XLXN_59,
                I1=>XLXN_58,
                O=>lights_R(1));
   
   XLXI_35 : AND2
      port map (I0=>XLXN_18,
                I1=>XLXN_65,
                O=>XLXN_58);
   
   XLXI_36 : AND3
      port map (I0=>XLXN_40,
                I1=>XLXN_18,
                I2=>XLXN_84,
                O=>XLXN_59);
   
   XLXI_37 : INV
      port map (I=>XLXN_84,
                O=>XLXN_65);
   
   XLXI_38 : AND2
      port map (I0=>XLXN_40,
                I1=>XLXN_18,
                O=>lights_R(2));
   
   XLXI_39 : AND2
      port map (I0=>XLXN_84,
                I1=>XLXN_84,
                O=>lights_L(0));
   
   XLXI_40 : AND3
      port map (I0=>XLXN_15,
                I1=>XLXN_84,
                I2=>XLXN_8,
                O=>XLXN_4);
   
   XLXI_46 : AND4
      port map (I0=>XLXN_17,
                I1=>XLXN_15,
                I2=>XLXN_84,
                I3=>XLXN_8,
                O=>XLXN_92);
   
   XLXI_47 : OR3
      port map (I0=>XLXN_92,
                I1=>XLXN_32,
                I2=>XLXN_31,
                O=>XLXN_30);
   
end BEHAVIORAL;



library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.ALL;
library UNISIM;
use UNISIM.Vcomponents.ALL;

entity orner_top is
   port ( clk : in    std_logic; 
          sw2 : in    std_logic; 
          sw3 : in    std_logic; 
          sw6 : in    std_logic; 
          sw7 : in    std_logic; 
          Led : out   std_logic_vector (5 downto 0));
end orner_top;

architecture BEHAVIORAL of orner_top is
   signal XLXN_11 : std_logic;
   component thunderbird_fsm_MUSER_orner_top
      port ( clk      : in    std_logic; 
             Reset    : in    std_logic; 
             left     : in    std_logic; 
             right    : in    std_logic; 
             lights_L : out   std_logic_vector (2 downto 0); 
             lights_R : out   std_logic_vector (2 downto 0));
   end component;
   
   component clock_divider
      port ( clk_fast : in    std_logic; 
             reset    : in    std_logic; 
             clk_slow : out   std_logic);
   end component;
   
begin
   XLXI_1 : thunderbird_fsm_MUSER_orner_top
      port map (clk=>XLXN_11,
                left=>sw3,
                Reset=>sw6,
                right=>sw2,
                lights_L(2 downto 0)=>Led(5 downto 3),
                lights_R(2)=>Led(0),
                lights_R(1)=>Led(1),
                lights_R(0)=>Led(2));
   
   XLXI_6 : clock_divider
      port map (clk_fast=>clk,
                reset=>sw7,
                clk_slow=>XLXN_11);
   
end BEHAVIORAL;


