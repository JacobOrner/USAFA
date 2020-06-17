--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: alu_synthesis.vhd
-- /___/   /\     Timestamp: Mon Apr 11 15:10:43 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm alu -w -dir netgen/synthesis -ofmt vhdl -sim alu.ngc alu_synthesis.vhd 
-- Device	: xc3s500e-4-fg320
-- Input file	: alu.ngc
-- Output file	: C:\Users\C18Jacob.Orner\Documents\Schoolwork\Spring_2016\ECE_281\Labs_and_CEs\CE4_Orner\netgen\synthesis\alu_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: alu
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity alu is
  port (
    zero : out STD_LOGIC; 
    y : out STD_LOGIC_VECTOR ( 31 downto 0 ); 
    a : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    b : in STD_LOGIC_VECTOR ( 31 downto 0 ); 
    f : in STD_LOGIC_VECTOR ( 2 downto 0 ) 
  );
end alu;

architecture Structure of alu is
  signal Mmux_s10 : STD_LOGIC; 
  signal Mmux_s100 : STD_LOGIC; 
  signal Mmux_s1001_129 : STD_LOGIC; 
  signal Mmux_s101_130 : STD_LOGIC; 
  signal Mmux_s105 : STD_LOGIC; 
  signal Mmux_s1051_132 : STD_LOGIC; 
  signal Mmux_s110 : STD_LOGIC; 
  signal Mmux_s1101_134 : STD_LOGIC; 
  signal Mmux_s115 : STD_LOGIC; 
  signal Mmux_s1151_136 : STD_LOGIC; 
  signal Mmux_s120 : STD_LOGIC; 
  signal Mmux_s1201_138 : STD_LOGIC; 
  signal Mmux_s125 : STD_LOGIC; 
  signal Mmux_s1251_140 : STD_LOGIC; 
  signal Mmux_s130 : STD_LOGIC; 
  signal Mmux_s1301_142 : STD_LOGIC; 
  signal Mmux_s135 : STD_LOGIC; 
  signal Mmux_s1351_144 : STD_LOGIC; 
  signal Mmux_s140 : STD_LOGIC; 
  signal Mmux_s1401_146 : STD_LOGIC; 
  signal Mmux_s145 : STD_LOGIC; 
  signal Mmux_s1451_148 : STD_LOGIC; 
  signal Mmux_s15 : STD_LOGIC; 
  signal Mmux_s150 : STD_LOGIC; 
  signal Mmux_s1501_151 : STD_LOGIC; 
  signal Mmux_s151_152 : STD_LOGIC; 
  signal Mmux_s155 : STD_LOGIC; 
  signal Mmux_s1551_154 : STD_LOGIC; 
  signal Mmux_s20 : STD_LOGIC; 
  signal Mmux_s201_156 : STD_LOGIC; 
  signal Mmux_s25 : STD_LOGIC; 
  signal Mmux_s251_158 : STD_LOGIC; 
  signal Mmux_s30 : STD_LOGIC; 
  signal Mmux_s301_160 : STD_LOGIC; 
  signal Mmux_s35 : STD_LOGIC; 
  signal Mmux_s351_162 : STD_LOGIC; 
  signal Mmux_s40 : STD_LOGIC; 
  signal Mmux_s401_164 : STD_LOGIC; 
  signal Mmux_s45 : STD_LOGIC; 
  signal Mmux_s451_166 : STD_LOGIC; 
  signal Mmux_s5 : STD_LOGIC; 
  signal Mmux_s50 : STD_LOGIC; 
  signal Mmux_s501_169 : STD_LOGIC; 
  signal Mmux_s51_170 : STD_LOGIC; 
  signal Mmux_s55 : STD_LOGIC; 
  signal Mmux_s551_172 : STD_LOGIC; 
  signal Mmux_s60 : STD_LOGIC; 
  signal Mmux_s601_174 : STD_LOGIC; 
  signal Mmux_s65 : STD_LOGIC; 
  signal Mmux_s651_176 : STD_LOGIC; 
  signal Mmux_s70 : STD_LOGIC; 
  signal Mmux_s701_178 : STD_LOGIC; 
  signal Mmux_s75 : STD_LOGIC; 
  signal Mmux_s751_180 : STD_LOGIC; 
  signal Mmux_s80 : STD_LOGIC; 
  signal Mmux_s801_182 : STD_LOGIC; 
  signal Mmux_s85 : STD_LOGIC; 
  signal Mmux_s851_184 : STD_LOGIC; 
  signal Mmux_s90 : STD_LOGIC; 
  signal Mmux_s901_186 : STD_LOGIC; 
  signal Mmux_s95 : STD_LOGIC; 
  signal Mmux_s951_188 : STD_LOGIC; 
  signal Mmux_s_3_f5_189 : STD_LOGIC; 
  signal Mmux_s_4_190 : STD_LOGIC; 
  signal Mmux_s_4_f5_191 : STD_LOGIC; 
  signal Mmux_s_5_192 : STD_LOGIC; 
  signal Mmux_s_51_193 : STD_LOGIC; 
  signal Mmux_s_6_194 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal a_0_IBUF_229 : STD_LOGIC; 
  signal a_10_IBUF_230 : STD_LOGIC; 
  signal a_11_IBUF_231 : STD_LOGIC; 
  signal a_12_IBUF_232 : STD_LOGIC; 
  signal a_13_IBUF_233 : STD_LOGIC; 
  signal a_14_IBUF_234 : STD_LOGIC; 
  signal a_15_IBUF_235 : STD_LOGIC; 
  signal a_16_IBUF_236 : STD_LOGIC; 
  signal a_17_IBUF_237 : STD_LOGIC; 
  signal a_18_IBUF_238 : STD_LOGIC; 
  signal a_19_IBUF_239 : STD_LOGIC; 
  signal a_1_IBUF_240 : STD_LOGIC; 
  signal a_20_IBUF_241 : STD_LOGIC; 
  signal a_21_IBUF_242 : STD_LOGIC; 
  signal a_22_IBUF_243 : STD_LOGIC; 
  signal a_23_IBUF_244 : STD_LOGIC; 
  signal a_24_IBUF_245 : STD_LOGIC; 
  signal a_25_IBUF_246 : STD_LOGIC; 
  signal a_26_IBUF_247 : STD_LOGIC; 
  signal a_27_IBUF_248 : STD_LOGIC; 
  signal a_28_IBUF_249 : STD_LOGIC; 
  signal a_29_IBUF_250 : STD_LOGIC; 
  signal a_2_IBUF_251 : STD_LOGIC; 
  signal a_30_IBUF_252 : STD_LOGIC; 
  signal a_31_IBUF_253 : STD_LOGIC; 
  signal a_3_IBUF_254 : STD_LOGIC; 
  signal a_4_IBUF_255 : STD_LOGIC; 
  signal a_5_IBUF_256 : STD_LOGIC; 
  signal a_6_IBUF_257 : STD_LOGIC; 
  signal a_7_IBUF_258 : STD_LOGIC; 
  signal a_8_IBUF_259 : STD_LOGIC; 
  signal a_9_IBUF_260 : STD_LOGIC; 
  signal b_0_IBUF_293 : STD_LOGIC; 
  signal b_10_IBUF_294 : STD_LOGIC; 
  signal b_11_IBUF_295 : STD_LOGIC; 
  signal b_12_IBUF_296 : STD_LOGIC; 
  signal b_13_IBUF_297 : STD_LOGIC; 
  signal b_14_IBUF_298 : STD_LOGIC; 
  signal b_15_IBUF_299 : STD_LOGIC; 
  signal b_16_IBUF_300 : STD_LOGIC; 
  signal b_17_IBUF_301 : STD_LOGIC; 
  signal b_18_IBUF_302 : STD_LOGIC; 
  signal b_19_IBUF_303 : STD_LOGIC; 
  signal b_1_IBUF_304 : STD_LOGIC; 
  signal b_20_IBUF_305 : STD_LOGIC; 
  signal b_21_IBUF_306 : STD_LOGIC; 
  signal b_22_IBUF_307 : STD_LOGIC; 
  signal b_23_IBUF_308 : STD_LOGIC; 
  signal b_24_IBUF_309 : STD_LOGIC; 
  signal b_25_IBUF_310 : STD_LOGIC; 
  signal b_26_IBUF_311 : STD_LOGIC; 
  signal b_27_IBUF_312 : STD_LOGIC; 
  signal b_28_IBUF_313 : STD_LOGIC; 
  signal b_29_IBUF_314 : STD_LOGIC; 
  signal b_2_IBUF_315 : STD_LOGIC; 
  signal b_30_IBUF_316 : STD_LOGIC; 
  signal b_31_IBUF_317 : STD_LOGIC; 
  signal b_3_IBUF_318 : STD_LOGIC; 
  signal b_4_IBUF_319 : STD_LOGIC; 
  signal b_5_IBUF_320 : STD_LOGIC; 
  signal b_6_IBUF_321 : STD_LOGIC; 
  signal b_7_IBUF_322 : STD_LOGIC; 
  signal b_8_IBUF_323 : STD_LOGIC; 
  signal b_9_IBUF_324 : STD_LOGIC; 
  signal f_0_IBUF_328 : STD_LOGIC; 
  signal f_1_IBUF_329 : STD_LOGIC; 
  signal f_2_IBUF_330 : STD_LOGIC; 
  signal s_mux0000 : STD_LOGIC; 
  signal y_0_OBUF_396 : STD_LOGIC; 
  signal y_10_OBUF_397 : STD_LOGIC; 
  signal y_11_OBUF_398 : STD_LOGIC; 
  signal y_12_OBUF_399 : STD_LOGIC; 
  signal y_13_OBUF_400 : STD_LOGIC; 
  signal y_14_OBUF_401 : STD_LOGIC; 
  signal y_15_OBUF_402 : STD_LOGIC; 
  signal y_16_OBUF_403 : STD_LOGIC; 
  signal y_17_OBUF_404 : STD_LOGIC; 
  signal y_18_OBUF_405 : STD_LOGIC; 
  signal y_19_OBUF_406 : STD_LOGIC; 
  signal y_1_OBUF_407 : STD_LOGIC; 
  signal y_20_OBUF_408 : STD_LOGIC; 
  signal y_21_OBUF_409 : STD_LOGIC; 
  signal y_22_OBUF_410 : STD_LOGIC; 
  signal y_23_OBUF_411 : STD_LOGIC; 
  signal y_24_OBUF_412 : STD_LOGIC; 
  signal y_25_OBUF_413 : STD_LOGIC; 
  signal y_26_OBUF_414 : STD_LOGIC; 
  signal y_27_OBUF_415 : STD_LOGIC; 
  signal y_28_OBUF_416 : STD_LOGIC; 
  signal y_29_OBUF_417 : STD_LOGIC; 
  signal y_2_OBUF_418 : STD_LOGIC; 
  signal y_30_OBUF_419 : STD_LOGIC; 
  signal y_31_OBUF_420 : STD_LOGIC; 
  signal y_3_OBUF_421 : STD_LOGIC; 
  signal y_4_OBUF_422 : STD_LOGIC; 
  signal y_5_OBUF_423 : STD_LOGIC; 
  signal y_6_OBUF_424 : STD_LOGIC; 
  signal y_7_OBUF_425 : STD_LOGIC; 
  signal y_8_OBUF_426 : STD_LOGIC; 
  signal y_9_OBUF_427 : STD_LOGIC; 
  signal zero_OBUF_429 : STD_LOGIC; 
  signal Maddsub_s_addsub0000_cy : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal Maddsub_s_addsub0000_lut : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal Mcompar_s_cmp_lt0000_cy : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal Mcompar_s_cmp_lt0000_lut : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal s_addsub0000 : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal zero_cmp_eq0000_wg_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal zero_cmp_eq0000_wg_lut : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => N1
    );
  Mcompar_s_cmp_lt0000_lut_0_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_0_IBUF_229,
      I1 => b_0_IBUF_293,
      O => Mcompar_s_cmp_lt0000_lut(0)
    );
  Mcompar_s_cmp_lt0000_cy_0_Q : MUXCY
    port map (
      CI => N1,
      DI => a_0_IBUF_229,
      S => Mcompar_s_cmp_lt0000_lut(0),
      O => Mcompar_s_cmp_lt0000_cy(0)
    );
  Mcompar_s_cmp_lt0000_lut_1_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_1_IBUF_240,
      I1 => b_1_IBUF_304,
      O => Mcompar_s_cmp_lt0000_lut(1)
    );
  Mcompar_s_cmp_lt0000_cy_1_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(0),
      DI => a_1_IBUF_240,
      S => Mcompar_s_cmp_lt0000_lut(1),
      O => Mcompar_s_cmp_lt0000_cy(1)
    );
  Mcompar_s_cmp_lt0000_lut_2_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_2_IBUF_251,
      I1 => b_2_IBUF_315,
      O => Mcompar_s_cmp_lt0000_lut(2)
    );
  Mcompar_s_cmp_lt0000_cy_2_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(1),
      DI => a_2_IBUF_251,
      S => Mcompar_s_cmp_lt0000_lut(2),
      O => Mcompar_s_cmp_lt0000_cy(2)
    );
  Mcompar_s_cmp_lt0000_lut_3_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_3_IBUF_254,
      I1 => b_3_IBUF_318,
      O => Mcompar_s_cmp_lt0000_lut(3)
    );
  Mcompar_s_cmp_lt0000_cy_3_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(2),
      DI => a_3_IBUF_254,
      S => Mcompar_s_cmp_lt0000_lut(3),
      O => Mcompar_s_cmp_lt0000_cy(3)
    );
  Mcompar_s_cmp_lt0000_lut_4_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_4_IBUF_255,
      I1 => b_4_IBUF_319,
      O => Mcompar_s_cmp_lt0000_lut(4)
    );
  Mcompar_s_cmp_lt0000_cy_4_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(3),
      DI => a_4_IBUF_255,
      S => Mcompar_s_cmp_lt0000_lut(4),
      O => Mcompar_s_cmp_lt0000_cy(4)
    );
  Mcompar_s_cmp_lt0000_lut_5_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_5_IBUF_256,
      I1 => b_5_IBUF_320,
      O => Mcompar_s_cmp_lt0000_lut(5)
    );
  Mcompar_s_cmp_lt0000_cy_5_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(4),
      DI => a_5_IBUF_256,
      S => Mcompar_s_cmp_lt0000_lut(5),
      O => Mcompar_s_cmp_lt0000_cy(5)
    );
  Mcompar_s_cmp_lt0000_lut_6_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_6_IBUF_257,
      I1 => b_6_IBUF_321,
      O => Mcompar_s_cmp_lt0000_lut(6)
    );
  Mcompar_s_cmp_lt0000_cy_6_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(5),
      DI => a_6_IBUF_257,
      S => Mcompar_s_cmp_lt0000_lut(6),
      O => Mcompar_s_cmp_lt0000_cy(6)
    );
  Mcompar_s_cmp_lt0000_lut_7_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_7_IBUF_258,
      I1 => b_7_IBUF_322,
      O => Mcompar_s_cmp_lt0000_lut(7)
    );
  Mcompar_s_cmp_lt0000_cy_7_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(6),
      DI => a_7_IBUF_258,
      S => Mcompar_s_cmp_lt0000_lut(7),
      O => Mcompar_s_cmp_lt0000_cy(7)
    );
  Mcompar_s_cmp_lt0000_lut_8_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_8_IBUF_259,
      I1 => b_8_IBUF_323,
      O => Mcompar_s_cmp_lt0000_lut(8)
    );
  Mcompar_s_cmp_lt0000_cy_8_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(7),
      DI => a_8_IBUF_259,
      S => Mcompar_s_cmp_lt0000_lut(8),
      O => Mcompar_s_cmp_lt0000_cy(8)
    );
  Mcompar_s_cmp_lt0000_lut_9_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_9_IBUF_260,
      I1 => b_9_IBUF_324,
      O => Mcompar_s_cmp_lt0000_lut(9)
    );
  Mcompar_s_cmp_lt0000_cy_9_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(8),
      DI => a_9_IBUF_260,
      S => Mcompar_s_cmp_lt0000_lut(9),
      O => Mcompar_s_cmp_lt0000_cy(9)
    );
  Mcompar_s_cmp_lt0000_lut_10_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_10_IBUF_230,
      I1 => b_10_IBUF_294,
      O => Mcompar_s_cmp_lt0000_lut(10)
    );
  Mcompar_s_cmp_lt0000_cy_10_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(9),
      DI => a_10_IBUF_230,
      S => Mcompar_s_cmp_lt0000_lut(10),
      O => Mcompar_s_cmp_lt0000_cy(10)
    );
  Mcompar_s_cmp_lt0000_lut_11_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_11_IBUF_231,
      I1 => b_11_IBUF_295,
      O => Mcompar_s_cmp_lt0000_lut(11)
    );
  Mcompar_s_cmp_lt0000_cy_11_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(10),
      DI => a_11_IBUF_231,
      S => Mcompar_s_cmp_lt0000_lut(11),
      O => Mcompar_s_cmp_lt0000_cy(11)
    );
  Mcompar_s_cmp_lt0000_lut_12_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_12_IBUF_232,
      I1 => b_12_IBUF_296,
      O => Mcompar_s_cmp_lt0000_lut(12)
    );
  Mcompar_s_cmp_lt0000_cy_12_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(11),
      DI => a_12_IBUF_232,
      S => Mcompar_s_cmp_lt0000_lut(12),
      O => Mcompar_s_cmp_lt0000_cy(12)
    );
  Mcompar_s_cmp_lt0000_lut_13_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_13_IBUF_233,
      I1 => b_13_IBUF_297,
      O => Mcompar_s_cmp_lt0000_lut(13)
    );
  Mcompar_s_cmp_lt0000_cy_13_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(12),
      DI => a_13_IBUF_233,
      S => Mcompar_s_cmp_lt0000_lut(13),
      O => Mcompar_s_cmp_lt0000_cy(13)
    );
  Mcompar_s_cmp_lt0000_lut_14_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_14_IBUF_234,
      I1 => b_14_IBUF_298,
      O => Mcompar_s_cmp_lt0000_lut(14)
    );
  Mcompar_s_cmp_lt0000_cy_14_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(13),
      DI => a_14_IBUF_234,
      S => Mcompar_s_cmp_lt0000_lut(14),
      O => Mcompar_s_cmp_lt0000_cy(14)
    );
  Mcompar_s_cmp_lt0000_lut_15_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_15_IBUF_235,
      I1 => b_15_IBUF_299,
      O => Mcompar_s_cmp_lt0000_lut(15)
    );
  Mcompar_s_cmp_lt0000_cy_15_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(14),
      DI => a_15_IBUF_235,
      S => Mcompar_s_cmp_lt0000_lut(15),
      O => Mcompar_s_cmp_lt0000_cy(15)
    );
  Mcompar_s_cmp_lt0000_lut_16_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_16_IBUF_236,
      I1 => b_16_IBUF_300,
      O => Mcompar_s_cmp_lt0000_lut(16)
    );
  Mcompar_s_cmp_lt0000_cy_16_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(15),
      DI => a_16_IBUF_236,
      S => Mcompar_s_cmp_lt0000_lut(16),
      O => Mcompar_s_cmp_lt0000_cy(16)
    );
  Mcompar_s_cmp_lt0000_lut_17_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_17_IBUF_237,
      I1 => b_17_IBUF_301,
      O => Mcompar_s_cmp_lt0000_lut(17)
    );
  Mcompar_s_cmp_lt0000_cy_17_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(16),
      DI => a_17_IBUF_237,
      S => Mcompar_s_cmp_lt0000_lut(17),
      O => Mcompar_s_cmp_lt0000_cy(17)
    );
  Mcompar_s_cmp_lt0000_lut_18_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_18_IBUF_238,
      I1 => b_18_IBUF_302,
      O => Mcompar_s_cmp_lt0000_lut(18)
    );
  Mcompar_s_cmp_lt0000_cy_18_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(17),
      DI => a_18_IBUF_238,
      S => Mcompar_s_cmp_lt0000_lut(18),
      O => Mcompar_s_cmp_lt0000_cy(18)
    );
  Mcompar_s_cmp_lt0000_lut_19_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_19_IBUF_239,
      I1 => b_19_IBUF_303,
      O => Mcompar_s_cmp_lt0000_lut(19)
    );
  Mcompar_s_cmp_lt0000_cy_19_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(18),
      DI => a_19_IBUF_239,
      S => Mcompar_s_cmp_lt0000_lut(19),
      O => Mcompar_s_cmp_lt0000_cy(19)
    );
  Mcompar_s_cmp_lt0000_lut_20_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_20_IBUF_241,
      I1 => b_20_IBUF_305,
      O => Mcompar_s_cmp_lt0000_lut(20)
    );
  Mcompar_s_cmp_lt0000_cy_20_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(19),
      DI => a_20_IBUF_241,
      S => Mcompar_s_cmp_lt0000_lut(20),
      O => Mcompar_s_cmp_lt0000_cy(20)
    );
  Mcompar_s_cmp_lt0000_lut_21_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_21_IBUF_242,
      I1 => b_21_IBUF_306,
      O => Mcompar_s_cmp_lt0000_lut(21)
    );
  Mcompar_s_cmp_lt0000_cy_21_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(20),
      DI => a_21_IBUF_242,
      S => Mcompar_s_cmp_lt0000_lut(21),
      O => Mcompar_s_cmp_lt0000_cy(21)
    );
  Mcompar_s_cmp_lt0000_lut_22_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_22_IBUF_243,
      I1 => b_22_IBUF_307,
      O => Mcompar_s_cmp_lt0000_lut(22)
    );
  Mcompar_s_cmp_lt0000_cy_22_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(21),
      DI => a_22_IBUF_243,
      S => Mcompar_s_cmp_lt0000_lut(22),
      O => Mcompar_s_cmp_lt0000_cy(22)
    );
  Mcompar_s_cmp_lt0000_lut_23_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_23_IBUF_244,
      I1 => b_23_IBUF_308,
      O => Mcompar_s_cmp_lt0000_lut(23)
    );
  Mcompar_s_cmp_lt0000_cy_23_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(22),
      DI => a_23_IBUF_244,
      S => Mcompar_s_cmp_lt0000_lut(23),
      O => Mcompar_s_cmp_lt0000_cy(23)
    );
  Mcompar_s_cmp_lt0000_lut_24_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_24_IBUF_245,
      I1 => b_24_IBUF_309,
      O => Mcompar_s_cmp_lt0000_lut(24)
    );
  Mcompar_s_cmp_lt0000_cy_24_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(23),
      DI => a_24_IBUF_245,
      S => Mcompar_s_cmp_lt0000_lut(24),
      O => Mcompar_s_cmp_lt0000_cy(24)
    );
  Mcompar_s_cmp_lt0000_lut_25_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_25_IBUF_246,
      I1 => b_25_IBUF_310,
      O => Mcompar_s_cmp_lt0000_lut(25)
    );
  Mcompar_s_cmp_lt0000_cy_25_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(24),
      DI => a_25_IBUF_246,
      S => Mcompar_s_cmp_lt0000_lut(25),
      O => Mcompar_s_cmp_lt0000_cy(25)
    );
  Mcompar_s_cmp_lt0000_lut_26_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_26_IBUF_247,
      I1 => b_26_IBUF_311,
      O => Mcompar_s_cmp_lt0000_lut(26)
    );
  Mcompar_s_cmp_lt0000_cy_26_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(25),
      DI => a_26_IBUF_247,
      S => Mcompar_s_cmp_lt0000_lut(26),
      O => Mcompar_s_cmp_lt0000_cy(26)
    );
  Mcompar_s_cmp_lt0000_lut_27_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_27_IBUF_248,
      I1 => b_27_IBUF_312,
      O => Mcompar_s_cmp_lt0000_lut(27)
    );
  Mcompar_s_cmp_lt0000_cy_27_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(26),
      DI => a_27_IBUF_248,
      S => Mcompar_s_cmp_lt0000_lut(27),
      O => Mcompar_s_cmp_lt0000_cy(27)
    );
  Mcompar_s_cmp_lt0000_lut_28_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_28_IBUF_249,
      I1 => b_28_IBUF_313,
      O => Mcompar_s_cmp_lt0000_lut(28)
    );
  Mcompar_s_cmp_lt0000_cy_28_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(27),
      DI => a_28_IBUF_249,
      S => Mcompar_s_cmp_lt0000_lut(28),
      O => Mcompar_s_cmp_lt0000_cy(28)
    );
  Mcompar_s_cmp_lt0000_lut_29_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_29_IBUF_250,
      I1 => b_29_IBUF_314,
      O => Mcompar_s_cmp_lt0000_lut(29)
    );
  Mcompar_s_cmp_lt0000_cy_29_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(28),
      DI => a_29_IBUF_250,
      S => Mcompar_s_cmp_lt0000_lut(29),
      O => Mcompar_s_cmp_lt0000_cy(29)
    );
  Mcompar_s_cmp_lt0000_lut_30_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_30_IBUF_252,
      I1 => b_30_IBUF_316,
      O => Mcompar_s_cmp_lt0000_lut(30)
    );
  Mcompar_s_cmp_lt0000_cy_30_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(29),
      DI => a_30_IBUF_252,
      S => Mcompar_s_cmp_lt0000_lut(30),
      O => Mcompar_s_cmp_lt0000_cy(30)
    );
  Mcompar_s_cmp_lt0000_lut_31_Q : LUT2
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => a_31_IBUF_253,
      I1 => b_31_IBUF_317,
      O => Mcompar_s_cmp_lt0000_lut(31)
    );
  Mcompar_s_cmp_lt0000_cy_31_Q : MUXCY
    port map (
      CI => Mcompar_s_cmp_lt0000_cy(30),
      DI => b_31_IBUF_317,
      S => Mcompar_s_cmp_lt0000_lut(31),
      O => Mcompar_s_cmp_lt0000_cy(31)
    );
  Maddsub_s_addsub0000_lut_0_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_0_IBUF_229,
      I1 => b_0_IBUF_293,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(0)
    );
  Maddsub_s_addsub0000_cy_0_Q : MUXCY
    port map (
      CI => s_mux0000,
      DI => a_0_IBUF_229,
      S => Maddsub_s_addsub0000_lut(0),
      O => Maddsub_s_addsub0000_cy(0)
    );
  Maddsub_s_addsub0000_xor_0_Q : XORCY
    port map (
      CI => s_mux0000,
      LI => Maddsub_s_addsub0000_lut(0),
      O => s_addsub0000(0)
    );
  Maddsub_s_addsub0000_lut_1_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_1_IBUF_240,
      I1 => b_1_IBUF_304,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(1)
    );
  Maddsub_s_addsub0000_cy_1_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(0),
      DI => a_1_IBUF_240,
      S => Maddsub_s_addsub0000_lut(1),
      O => Maddsub_s_addsub0000_cy(1)
    );
  Maddsub_s_addsub0000_xor_1_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(0),
      LI => Maddsub_s_addsub0000_lut(1),
      O => s_addsub0000(1)
    );
  Maddsub_s_addsub0000_lut_2_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_2_IBUF_251,
      I1 => b_2_IBUF_315,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(2)
    );
  Maddsub_s_addsub0000_cy_2_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(1),
      DI => a_2_IBUF_251,
      S => Maddsub_s_addsub0000_lut(2),
      O => Maddsub_s_addsub0000_cy(2)
    );
  Maddsub_s_addsub0000_xor_2_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(1),
      LI => Maddsub_s_addsub0000_lut(2),
      O => s_addsub0000(2)
    );
  Maddsub_s_addsub0000_lut_3_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_3_IBUF_254,
      I1 => b_3_IBUF_318,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(3)
    );
  Maddsub_s_addsub0000_cy_3_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(2),
      DI => a_3_IBUF_254,
      S => Maddsub_s_addsub0000_lut(3),
      O => Maddsub_s_addsub0000_cy(3)
    );
  Maddsub_s_addsub0000_xor_3_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(2),
      LI => Maddsub_s_addsub0000_lut(3),
      O => s_addsub0000(3)
    );
  Maddsub_s_addsub0000_lut_4_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_4_IBUF_255,
      I1 => b_4_IBUF_319,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(4)
    );
  Maddsub_s_addsub0000_cy_4_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(3),
      DI => a_4_IBUF_255,
      S => Maddsub_s_addsub0000_lut(4),
      O => Maddsub_s_addsub0000_cy(4)
    );
  Maddsub_s_addsub0000_xor_4_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(3),
      LI => Maddsub_s_addsub0000_lut(4),
      O => s_addsub0000(4)
    );
  Maddsub_s_addsub0000_lut_5_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_5_IBUF_256,
      I1 => b_5_IBUF_320,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(5)
    );
  Maddsub_s_addsub0000_cy_5_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(4),
      DI => a_5_IBUF_256,
      S => Maddsub_s_addsub0000_lut(5),
      O => Maddsub_s_addsub0000_cy(5)
    );
  Maddsub_s_addsub0000_xor_5_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(4),
      LI => Maddsub_s_addsub0000_lut(5),
      O => s_addsub0000(5)
    );
  Maddsub_s_addsub0000_lut_6_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_6_IBUF_257,
      I1 => b_6_IBUF_321,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(6)
    );
  Maddsub_s_addsub0000_cy_6_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(5),
      DI => a_6_IBUF_257,
      S => Maddsub_s_addsub0000_lut(6),
      O => Maddsub_s_addsub0000_cy(6)
    );
  Maddsub_s_addsub0000_xor_6_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(5),
      LI => Maddsub_s_addsub0000_lut(6),
      O => s_addsub0000(6)
    );
  Maddsub_s_addsub0000_lut_7_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_7_IBUF_258,
      I1 => b_7_IBUF_322,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(7)
    );
  Maddsub_s_addsub0000_cy_7_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(6),
      DI => a_7_IBUF_258,
      S => Maddsub_s_addsub0000_lut(7),
      O => Maddsub_s_addsub0000_cy(7)
    );
  Maddsub_s_addsub0000_xor_7_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(6),
      LI => Maddsub_s_addsub0000_lut(7),
      O => s_addsub0000(7)
    );
  Maddsub_s_addsub0000_lut_8_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_8_IBUF_259,
      I1 => b_8_IBUF_323,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(8)
    );
  Maddsub_s_addsub0000_cy_8_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(7),
      DI => a_8_IBUF_259,
      S => Maddsub_s_addsub0000_lut(8),
      O => Maddsub_s_addsub0000_cy(8)
    );
  Maddsub_s_addsub0000_xor_8_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(7),
      LI => Maddsub_s_addsub0000_lut(8),
      O => s_addsub0000(8)
    );
  Maddsub_s_addsub0000_lut_9_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_9_IBUF_260,
      I1 => b_9_IBUF_324,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(9)
    );
  Maddsub_s_addsub0000_cy_9_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(8),
      DI => a_9_IBUF_260,
      S => Maddsub_s_addsub0000_lut(9),
      O => Maddsub_s_addsub0000_cy(9)
    );
  Maddsub_s_addsub0000_xor_9_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(8),
      LI => Maddsub_s_addsub0000_lut(9),
      O => s_addsub0000(9)
    );
  Maddsub_s_addsub0000_lut_10_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_10_IBUF_230,
      I1 => b_10_IBUF_294,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(10)
    );
  Maddsub_s_addsub0000_cy_10_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(9),
      DI => a_10_IBUF_230,
      S => Maddsub_s_addsub0000_lut(10),
      O => Maddsub_s_addsub0000_cy(10)
    );
  Maddsub_s_addsub0000_xor_10_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(9),
      LI => Maddsub_s_addsub0000_lut(10),
      O => s_addsub0000(10)
    );
  Maddsub_s_addsub0000_lut_11_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_11_IBUF_231,
      I1 => b_11_IBUF_295,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(11)
    );
  Maddsub_s_addsub0000_cy_11_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(10),
      DI => a_11_IBUF_231,
      S => Maddsub_s_addsub0000_lut(11),
      O => Maddsub_s_addsub0000_cy(11)
    );
  Maddsub_s_addsub0000_xor_11_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(10),
      LI => Maddsub_s_addsub0000_lut(11),
      O => s_addsub0000(11)
    );
  Maddsub_s_addsub0000_lut_12_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_12_IBUF_232,
      I1 => b_12_IBUF_296,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(12)
    );
  Maddsub_s_addsub0000_cy_12_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(11),
      DI => a_12_IBUF_232,
      S => Maddsub_s_addsub0000_lut(12),
      O => Maddsub_s_addsub0000_cy(12)
    );
  Maddsub_s_addsub0000_xor_12_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(11),
      LI => Maddsub_s_addsub0000_lut(12),
      O => s_addsub0000(12)
    );
  Maddsub_s_addsub0000_lut_13_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_13_IBUF_233,
      I1 => b_13_IBUF_297,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(13)
    );
  Maddsub_s_addsub0000_cy_13_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(12),
      DI => a_13_IBUF_233,
      S => Maddsub_s_addsub0000_lut(13),
      O => Maddsub_s_addsub0000_cy(13)
    );
  Maddsub_s_addsub0000_xor_13_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(12),
      LI => Maddsub_s_addsub0000_lut(13),
      O => s_addsub0000(13)
    );
  Maddsub_s_addsub0000_lut_14_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_14_IBUF_234,
      I1 => b_14_IBUF_298,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(14)
    );
  Maddsub_s_addsub0000_cy_14_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(13),
      DI => a_14_IBUF_234,
      S => Maddsub_s_addsub0000_lut(14),
      O => Maddsub_s_addsub0000_cy(14)
    );
  Maddsub_s_addsub0000_xor_14_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(13),
      LI => Maddsub_s_addsub0000_lut(14),
      O => s_addsub0000(14)
    );
  Maddsub_s_addsub0000_lut_15_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_15_IBUF_235,
      I1 => b_15_IBUF_299,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(15)
    );
  Maddsub_s_addsub0000_cy_15_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(14),
      DI => a_15_IBUF_235,
      S => Maddsub_s_addsub0000_lut(15),
      O => Maddsub_s_addsub0000_cy(15)
    );
  Maddsub_s_addsub0000_xor_15_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(14),
      LI => Maddsub_s_addsub0000_lut(15),
      O => s_addsub0000(15)
    );
  Maddsub_s_addsub0000_lut_16_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_16_IBUF_236,
      I1 => b_16_IBUF_300,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(16)
    );
  Maddsub_s_addsub0000_cy_16_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(15),
      DI => a_16_IBUF_236,
      S => Maddsub_s_addsub0000_lut(16),
      O => Maddsub_s_addsub0000_cy(16)
    );
  Maddsub_s_addsub0000_xor_16_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(15),
      LI => Maddsub_s_addsub0000_lut(16),
      O => s_addsub0000(16)
    );
  Maddsub_s_addsub0000_lut_17_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_17_IBUF_237,
      I1 => b_17_IBUF_301,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(17)
    );
  Maddsub_s_addsub0000_cy_17_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(16),
      DI => a_17_IBUF_237,
      S => Maddsub_s_addsub0000_lut(17),
      O => Maddsub_s_addsub0000_cy(17)
    );
  Maddsub_s_addsub0000_xor_17_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(16),
      LI => Maddsub_s_addsub0000_lut(17),
      O => s_addsub0000(17)
    );
  Maddsub_s_addsub0000_lut_18_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_18_IBUF_238,
      I1 => b_18_IBUF_302,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(18)
    );
  Maddsub_s_addsub0000_cy_18_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(17),
      DI => a_18_IBUF_238,
      S => Maddsub_s_addsub0000_lut(18),
      O => Maddsub_s_addsub0000_cy(18)
    );
  Maddsub_s_addsub0000_xor_18_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(17),
      LI => Maddsub_s_addsub0000_lut(18),
      O => s_addsub0000(18)
    );
  Maddsub_s_addsub0000_lut_19_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_19_IBUF_239,
      I1 => b_19_IBUF_303,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(19)
    );
  Maddsub_s_addsub0000_cy_19_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(18),
      DI => a_19_IBUF_239,
      S => Maddsub_s_addsub0000_lut(19),
      O => Maddsub_s_addsub0000_cy(19)
    );
  Maddsub_s_addsub0000_xor_19_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(18),
      LI => Maddsub_s_addsub0000_lut(19),
      O => s_addsub0000(19)
    );
  Maddsub_s_addsub0000_lut_20_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_20_IBUF_241,
      I1 => b_20_IBUF_305,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(20)
    );
  Maddsub_s_addsub0000_cy_20_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(19),
      DI => a_20_IBUF_241,
      S => Maddsub_s_addsub0000_lut(20),
      O => Maddsub_s_addsub0000_cy(20)
    );
  Maddsub_s_addsub0000_xor_20_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(19),
      LI => Maddsub_s_addsub0000_lut(20),
      O => s_addsub0000(20)
    );
  Maddsub_s_addsub0000_lut_21_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_21_IBUF_242,
      I1 => b_21_IBUF_306,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(21)
    );
  Maddsub_s_addsub0000_cy_21_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(20),
      DI => a_21_IBUF_242,
      S => Maddsub_s_addsub0000_lut(21),
      O => Maddsub_s_addsub0000_cy(21)
    );
  Maddsub_s_addsub0000_xor_21_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(20),
      LI => Maddsub_s_addsub0000_lut(21),
      O => s_addsub0000(21)
    );
  Maddsub_s_addsub0000_lut_22_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_22_IBUF_243,
      I1 => b_22_IBUF_307,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(22)
    );
  Maddsub_s_addsub0000_cy_22_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(21),
      DI => a_22_IBUF_243,
      S => Maddsub_s_addsub0000_lut(22),
      O => Maddsub_s_addsub0000_cy(22)
    );
  Maddsub_s_addsub0000_xor_22_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(21),
      LI => Maddsub_s_addsub0000_lut(22),
      O => s_addsub0000(22)
    );
  Maddsub_s_addsub0000_lut_23_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_23_IBUF_244,
      I1 => b_23_IBUF_308,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(23)
    );
  Maddsub_s_addsub0000_cy_23_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(22),
      DI => a_23_IBUF_244,
      S => Maddsub_s_addsub0000_lut(23),
      O => Maddsub_s_addsub0000_cy(23)
    );
  Maddsub_s_addsub0000_xor_23_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(22),
      LI => Maddsub_s_addsub0000_lut(23),
      O => s_addsub0000(23)
    );
  Maddsub_s_addsub0000_lut_24_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_24_IBUF_245,
      I1 => b_24_IBUF_309,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(24)
    );
  Maddsub_s_addsub0000_cy_24_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(23),
      DI => a_24_IBUF_245,
      S => Maddsub_s_addsub0000_lut(24),
      O => Maddsub_s_addsub0000_cy(24)
    );
  Maddsub_s_addsub0000_xor_24_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(23),
      LI => Maddsub_s_addsub0000_lut(24),
      O => s_addsub0000(24)
    );
  Maddsub_s_addsub0000_lut_25_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_25_IBUF_246,
      I1 => b_25_IBUF_310,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(25)
    );
  Maddsub_s_addsub0000_cy_25_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(24),
      DI => a_25_IBUF_246,
      S => Maddsub_s_addsub0000_lut(25),
      O => Maddsub_s_addsub0000_cy(25)
    );
  Maddsub_s_addsub0000_xor_25_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(24),
      LI => Maddsub_s_addsub0000_lut(25),
      O => s_addsub0000(25)
    );
  Maddsub_s_addsub0000_lut_26_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_26_IBUF_247,
      I1 => b_26_IBUF_311,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(26)
    );
  Maddsub_s_addsub0000_cy_26_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(25),
      DI => a_26_IBUF_247,
      S => Maddsub_s_addsub0000_lut(26),
      O => Maddsub_s_addsub0000_cy(26)
    );
  Maddsub_s_addsub0000_xor_26_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(25),
      LI => Maddsub_s_addsub0000_lut(26),
      O => s_addsub0000(26)
    );
  Maddsub_s_addsub0000_lut_27_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_27_IBUF_248,
      I1 => b_27_IBUF_312,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(27)
    );
  Maddsub_s_addsub0000_cy_27_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(26),
      DI => a_27_IBUF_248,
      S => Maddsub_s_addsub0000_lut(27),
      O => Maddsub_s_addsub0000_cy(27)
    );
  Maddsub_s_addsub0000_xor_27_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(26),
      LI => Maddsub_s_addsub0000_lut(27),
      O => s_addsub0000(27)
    );
  Maddsub_s_addsub0000_lut_28_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_28_IBUF_249,
      I1 => b_28_IBUF_313,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(28)
    );
  Maddsub_s_addsub0000_cy_28_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(27),
      DI => a_28_IBUF_249,
      S => Maddsub_s_addsub0000_lut(28),
      O => Maddsub_s_addsub0000_cy(28)
    );
  Maddsub_s_addsub0000_xor_28_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(27),
      LI => Maddsub_s_addsub0000_lut(28),
      O => s_addsub0000(28)
    );
  Maddsub_s_addsub0000_lut_29_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_29_IBUF_250,
      I1 => b_29_IBUF_314,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(29)
    );
  Maddsub_s_addsub0000_cy_29_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(28),
      DI => a_29_IBUF_250,
      S => Maddsub_s_addsub0000_lut(29),
      O => Maddsub_s_addsub0000_cy(29)
    );
  Maddsub_s_addsub0000_xor_29_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(28),
      LI => Maddsub_s_addsub0000_lut(29),
      O => s_addsub0000(29)
    );
  Maddsub_s_addsub0000_lut_30_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_30_IBUF_252,
      I1 => b_30_IBUF_316,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(30)
    );
  Maddsub_s_addsub0000_cy_30_Q : MUXCY
    port map (
      CI => Maddsub_s_addsub0000_cy(29),
      DI => a_30_IBUF_252,
      S => Maddsub_s_addsub0000_lut(30),
      O => Maddsub_s_addsub0000_cy(30)
    );
  Maddsub_s_addsub0000_xor_30_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(29),
      LI => Maddsub_s_addsub0000_lut(30),
      O => s_addsub0000(30)
    );
  Maddsub_s_addsub0000_lut_31_Q : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => a_31_IBUF_253,
      I1 => b_31_IBUF_317,
      I2 => s_mux0000,
      O => Maddsub_s_addsub0000_lut(31)
    );
  Maddsub_s_addsub0000_xor_31_Q : XORCY
    port map (
      CI => Maddsub_s_addsub0000_cy(30),
      LI => Maddsub_s_addsub0000_lut(31),
      O => s_addsub0000(31)
    );
  Mmux_s_2_f6 : MUXF6
    port map (
      I0 => Mmux_s_4_f5_191,
      I1 => Mmux_s_3_f5_189,
      S => f_2_IBUF_330,
      O => y_0_OBUF_396
    );
  Mmux_s_4_f5 : MUXF5
    port map (
      I0 => Mmux_s_6_194,
      I1 => Mmux_s_51_193,
      S => f_1_IBUF_329,
      O => Mmux_s_4_f5_191
    );
  Mmux_s_51 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(0),
      I1 => f_0_IBUF_328,
      O => Mmux_s_51_193
    );
  Mmux_s_3_f5 : MUXF5
    port map (
      I0 => Mmux_s_5_192,
      I1 => Mmux_s_4_190,
      S => f_1_IBUF_329,
      O => Mmux_s_3_f5_189
    );
  zero_cmp_eq0000_wg_lut_0_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => y_24_OBUF_412,
      I1 => y_23_OBUF_411,
      I2 => y_25_OBUF_413,
      I3 => y_22_OBUF_410,
      O => zero_cmp_eq0000_wg_lut(0)
    );
  zero_cmp_eq0000_wg_cy_0_Q : MUXCY
    port map (
      CI => N1,
      DI => N0,
      S => zero_cmp_eq0000_wg_lut(0),
      O => zero_cmp_eq0000_wg_cy(0)
    );
  zero_cmp_eq0000_wg_lut_1_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => y_21_OBUF_409,
      I1 => y_20_OBUF_408,
      I2 => y_26_OBUF_414,
      I3 => y_19_OBUF_406,
      O => zero_cmp_eq0000_wg_lut(1)
    );
  zero_cmp_eq0000_wg_cy_1_Q : MUXCY
    port map (
      CI => zero_cmp_eq0000_wg_cy(0),
      DI => N0,
      S => zero_cmp_eq0000_wg_lut(1),
      O => zero_cmp_eq0000_wg_cy(1)
    );
  zero_cmp_eq0000_wg_lut_2_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => y_18_OBUF_405,
      I1 => y_17_OBUF_404,
      I2 => y_27_OBUF_415,
      I3 => y_16_OBUF_403,
      O => zero_cmp_eq0000_wg_lut(2)
    );
  zero_cmp_eq0000_wg_cy_2_Q : MUXCY
    port map (
      CI => zero_cmp_eq0000_wg_cy(1),
      DI => N0,
      S => zero_cmp_eq0000_wg_lut(2),
      O => zero_cmp_eq0000_wg_cy(2)
    );
  zero_cmp_eq0000_wg_lut_3_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => y_15_OBUF_402,
      I1 => y_14_OBUF_401,
      I2 => y_28_OBUF_416,
      I3 => y_13_OBUF_400,
      O => zero_cmp_eq0000_wg_lut(3)
    );
  zero_cmp_eq0000_wg_cy_3_Q : MUXCY
    port map (
      CI => zero_cmp_eq0000_wg_cy(2),
      DI => N0,
      S => zero_cmp_eq0000_wg_lut(3),
      O => zero_cmp_eq0000_wg_cy(3)
    );
  zero_cmp_eq0000_wg_lut_4_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => y_12_OBUF_399,
      I1 => y_11_OBUF_398,
      I2 => y_29_OBUF_417,
      I3 => y_10_OBUF_397,
      O => zero_cmp_eq0000_wg_lut(4)
    );
  zero_cmp_eq0000_wg_cy_4_Q : MUXCY
    port map (
      CI => zero_cmp_eq0000_wg_cy(3),
      DI => N0,
      S => zero_cmp_eq0000_wg_lut(4),
      O => zero_cmp_eq0000_wg_cy(4)
    );
  zero_cmp_eq0000_wg_lut_5_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => y_9_OBUF_427,
      I1 => y_8_OBUF_426,
      I2 => y_30_OBUF_419,
      I3 => y_7_OBUF_425,
      O => zero_cmp_eq0000_wg_lut(5)
    );
  zero_cmp_eq0000_wg_cy_5_Q : MUXCY
    port map (
      CI => zero_cmp_eq0000_wg_cy(4),
      DI => N0,
      S => zero_cmp_eq0000_wg_lut(5),
      O => zero_cmp_eq0000_wg_cy(5)
    );
  zero_cmp_eq0000_wg_lut_6_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => y_6_OBUF_424,
      I1 => y_5_OBUF_423,
      I2 => y_31_OBUF_420,
      I3 => y_4_OBUF_422,
      O => zero_cmp_eq0000_wg_lut(6)
    );
  zero_cmp_eq0000_wg_cy_6_Q : MUXCY
    port map (
      CI => zero_cmp_eq0000_wg_cy(5),
      DI => N0,
      S => zero_cmp_eq0000_wg_lut(6),
      O => zero_cmp_eq0000_wg_cy(6)
    );
  zero_cmp_eq0000_wg_lut_7_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => y_3_OBUF_421,
      I1 => y_2_OBUF_418,
      I2 => y_0_OBUF_396,
      I3 => y_1_OBUF_407,
      O => zero_cmp_eq0000_wg_lut(7)
    );
  zero_cmp_eq0000_wg_cy_7_Q : MUXCY
    port map (
      CI => zero_cmp_eq0000_wg_cy(6),
      DI => N0,
      S => zero_cmp_eq0000_wg_lut(7),
      O => zero_OBUF_429
    );
  s_mux00002 : LUT3
    generic map(
      INIT => X"FB"
    )
    port map (
      I0 => f_0_IBUF_328,
      I1 => f_1_IBUF_329,
      I2 => f_2_IBUF_330,
      O => s_mux0000
    );
  a_31_IBUF : IBUF
    port map (
      I => a(31),
      O => a_31_IBUF_253
    );
  a_30_IBUF : IBUF
    port map (
      I => a(30),
      O => a_30_IBUF_252
    );
  a_29_IBUF : IBUF
    port map (
      I => a(29),
      O => a_29_IBUF_250
    );
  a_28_IBUF : IBUF
    port map (
      I => a(28),
      O => a_28_IBUF_249
    );
  a_27_IBUF : IBUF
    port map (
      I => a(27),
      O => a_27_IBUF_248
    );
  a_26_IBUF : IBUF
    port map (
      I => a(26),
      O => a_26_IBUF_247
    );
  a_25_IBUF : IBUF
    port map (
      I => a(25),
      O => a_25_IBUF_246
    );
  a_24_IBUF : IBUF
    port map (
      I => a(24),
      O => a_24_IBUF_245
    );
  a_23_IBUF : IBUF
    port map (
      I => a(23),
      O => a_23_IBUF_244
    );
  a_22_IBUF : IBUF
    port map (
      I => a(22),
      O => a_22_IBUF_243
    );
  a_21_IBUF : IBUF
    port map (
      I => a(21),
      O => a_21_IBUF_242
    );
  a_20_IBUF : IBUF
    port map (
      I => a(20),
      O => a_20_IBUF_241
    );
  a_19_IBUF : IBUF
    port map (
      I => a(19),
      O => a_19_IBUF_239
    );
  a_18_IBUF : IBUF
    port map (
      I => a(18),
      O => a_18_IBUF_238
    );
  a_17_IBUF : IBUF
    port map (
      I => a(17),
      O => a_17_IBUF_237
    );
  a_16_IBUF : IBUF
    port map (
      I => a(16),
      O => a_16_IBUF_236
    );
  a_15_IBUF : IBUF
    port map (
      I => a(15),
      O => a_15_IBUF_235
    );
  a_14_IBUF : IBUF
    port map (
      I => a(14),
      O => a_14_IBUF_234
    );
  a_13_IBUF : IBUF
    port map (
      I => a(13),
      O => a_13_IBUF_233
    );
  a_12_IBUF : IBUF
    port map (
      I => a(12),
      O => a_12_IBUF_232
    );
  a_11_IBUF : IBUF
    port map (
      I => a(11),
      O => a_11_IBUF_231
    );
  a_10_IBUF : IBUF
    port map (
      I => a(10),
      O => a_10_IBUF_230
    );
  a_9_IBUF : IBUF
    port map (
      I => a(9),
      O => a_9_IBUF_260
    );
  a_8_IBUF : IBUF
    port map (
      I => a(8),
      O => a_8_IBUF_259
    );
  a_7_IBUF : IBUF
    port map (
      I => a(7),
      O => a_7_IBUF_258
    );
  a_6_IBUF : IBUF
    port map (
      I => a(6),
      O => a_6_IBUF_257
    );
  a_5_IBUF : IBUF
    port map (
      I => a(5),
      O => a_5_IBUF_256
    );
  a_4_IBUF : IBUF
    port map (
      I => a(4),
      O => a_4_IBUF_255
    );
  a_3_IBUF : IBUF
    port map (
      I => a(3),
      O => a_3_IBUF_254
    );
  a_2_IBUF : IBUF
    port map (
      I => a(2),
      O => a_2_IBUF_251
    );
  a_1_IBUF : IBUF
    port map (
      I => a(1),
      O => a_1_IBUF_240
    );
  a_0_IBUF : IBUF
    port map (
      I => a(0),
      O => a_0_IBUF_229
    );
  b_31_IBUF : IBUF
    port map (
      I => b(31),
      O => b_31_IBUF_317
    );
  b_30_IBUF : IBUF
    port map (
      I => b(30),
      O => b_30_IBUF_316
    );
  b_29_IBUF : IBUF
    port map (
      I => b(29),
      O => b_29_IBUF_314
    );
  b_28_IBUF : IBUF
    port map (
      I => b(28),
      O => b_28_IBUF_313
    );
  b_27_IBUF : IBUF
    port map (
      I => b(27),
      O => b_27_IBUF_312
    );
  b_26_IBUF : IBUF
    port map (
      I => b(26),
      O => b_26_IBUF_311
    );
  b_25_IBUF : IBUF
    port map (
      I => b(25),
      O => b_25_IBUF_310
    );
  b_24_IBUF : IBUF
    port map (
      I => b(24),
      O => b_24_IBUF_309
    );
  b_23_IBUF : IBUF
    port map (
      I => b(23),
      O => b_23_IBUF_308
    );
  b_22_IBUF : IBUF
    port map (
      I => b(22),
      O => b_22_IBUF_307
    );
  b_21_IBUF : IBUF
    port map (
      I => b(21),
      O => b_21_IBUF_306
    );
  b_20_IBUF : IBUF
    port map (
      I => b(20),
      O => b_20_IBUF_305
    );
  b_19_IBUF : IBUF
    port map (
      I => b(19),
      O => b_19_IBUF_303
    );
  b_18_IBUF : IBUF
    port map (
      I => b(18),
      O => b_18_IBUF_302
    );
  b_17_IBUF : IBUF
    port map (
      I => b(17),
      O => b_17_IBUF_301
    );
  b_16_IBUF : IBUF
    port map (
      I => b(16),
      O => b_16_IBUF_300
    );
  b_15_IBUF : IBUF
    port map (
      I => b(15),
      O => b_15_IBUF_299
    );
  b_14_IBUF : IBUF
    port map (
      I => b(14),
      O => b_14_IBUF_298
    );
  b_13_IBUF : IBUF
    port map (
      I => b(13),
      O => b_13_IBUF_297
    );
  b_12_IBUF : IBUF
    port map (
      I => b(12),
      O => b_12_IBUF_296
    );
  b_11_IBUF : IBUF
    port map (
      I => b(11),
      O => b_11_IBUF_295
    );
  b_10_IBUF : IBUF
    port map (
      I => b(10),
      O => b_10_IBUF_294
    );
  b_9_IBUF : IBUF
    port map (
      I => b(9),
      O => b_9_IBUF_324
    );
  b_8_IBUF : IBUF
    port map (
      I => b(8),
      O => b_8_IBUF_323
    );
  b_7_IBUF : IBUF
    port map (
      I => b(7),
      O => b_7_IBUF_322
    );
  b_6_IBUF : IBUF
    port map (
      I => b(6),
      O => b_6_IBUF_321
    );
  b_5_IBUF : IBUF
    port map (
      I => b(5),
      O => b_5_IBUF_320
    );
  b_4_IBUF : IBUF
    port map (
      I => b(4),
      O => b_4_IBUF_319
    );
  b_3_IBUF : IBUF
    port map (
      I => b(3),
      O => b_3_IBUF_318
    );
  b_2_IBUF : IBUF
    port map (
      I => b(2),
      O => b_2_IBUF_315
    );
  b_1_IBUF : IBUF
    port map (
      I => b(1),
      O => b_1_IBUF_304
    );
  b_0_IBUF : IBUF
    port map (
      I => b(0),
      O => b_0_IBUF_293
    );
  f_2_IBUF : IBUF
    port map (
      I => f(2),
      O => f_2_IBUF_330
    );
  f_1_IBUF : IBUF
    port map (
      I => f(1),
      O => f_1_IBUF_329
    );
  f_0_IBUF : IBUF
    port map (
      I => f(0),
      O => f_0_IBUF_328
    );
  zero_OBUF : OBUF
    port map (
      I => zero_OBUF_429,
      O => zero
    );
  y_31_OBUF : OBUF
    port map (
      I => y_31_OBUF_420,
      O => y(31)
    );
  y_30_OBUF : OBUF
    port map (
      I => y_30_OBUF_419,
      O => y(30)
    );
  y_29_OBUF : OBUF
    port map (
      I => y_29_OBUF_417,
      O => y(29)
    );
  y_28_OBUF : OBUF
    port map (
      I => y_28_OBUF_416,
      O => y(28)
    );
  y_27_OBUF : OBUF
    port map (
      I => y_27_OBUF_415,
      O => y(27)
    );
  y_26_OBUF : OBUF
    port map (
      I => y_26_OBUF_414,
      O => y(26)
    );
  y_25_OBUF : OBUF
    port map (
      I => y_25_OBUF_413,
      O => y(25)
    );
  y_24_OBUF : OBUF
    port map (
      I => y_24_OBUF_412,
      O => y(24)
    );
  y_23_OBUF : OBUF
    port map (
      I => y_23_OBUF_411,
      O => y(23)
    );
  y_22_OBUF : OBUF
    port map (
      I => y_22_OBUF_410,
      O => y(22)
    );
  y_21_OBUF : OBUF
    port map (
      I => y_21_OBUF_409,
      O => y(21)
    );
  y_20_OBUF : OBUF
    port map (
      I => y_20_OBUF_408,
      O => y(20)
    );
  y_19_OBUF : OBUF
    port map (
      I => y_19_OBUF_406,
      O => y(19)
    );
  y_18_OBUF : OBUF
    port map (
      I => y_18_OBUF_405,
      O => y(18)
    );
  y_17_OBUF : OBUF
    port map (
      I => y_17_OBUF_404,
      O => y(17)
    );
  y_16_OBUF : OBUF
    port map (
      I => y_16_OBUF_403,
      O => y(16)
    );
  y_15_OBUF : OBUF
    port map (
      I => y_15_OBUF_402,
      O => y(15)
    );
  y_14_OBUF : OBUF
    port map (
      I => y_14_OBUF_401,
      O => y(14)
    );
  y_13_OBUF : OBUF
    port map (
      I => y_13_OBUF_400,
      O => y(13)
    );
  y_12_OBUF : OBUF
    port map (
      I => y_12_OBUF_399,
      O => y(12)
    );
  y_11_OBUF : OBUF
    port map (
      I => y_11_OBUF_398,
      O => y(11)
    );
  y_10_OBUF : OBUF
    port map (
      I => y_10_OBUF_397,
      O => y(10)
    );
  y_9_OBUF : OBUF
    port map (
      I => y_9_OBUF_427,
      O => y(9)
    );
  y_8_OBUF : OBUF
    port map (
      I => y_8_OBUF_426,
      O => y(8)
    );
  y_7_OBUF : OBUF
    port map (
      I => y_7_OBUF_425,
      O => y(7)
    );
  y_6_OBUF : OBUF
    port map (
      I => y_6_OBUF_424,
      O => y(6)
    );
  y_5_OBUF : OBUF
    port map (
      I => y_5_OBUF_423,
      O => y(5)
    );
  y_4_OBUF : OBUF
    port map (
      I => y_4_OBUF_422,
      O => y(4)
    );
  y_3_OBUF : OBUF
    port map (
      I => y_3_OBUF_421,
      O => y(3)
    );
  y_2_OBUF : OBUF
    port map (
      I => y_2_OBUF_418,
      O => y(2)
    );
  y_1_OBUF : OBUF
    port map (
      I => y_1_OBUF_407,
      O => y(1)
    );
  y_0_OBUF : OBUF
    port map (
      I => y_0_OBUF_396,
      O => y(0)
    );
  Mmux_s_6 : LUT3
    generic map(
      INIT => X"E8"
    )
    port map (
      I0 => a_0_IBUF_229,
      I1 => b_0_IBUF_293,
      I2 => f_0_IBUF_328,
      O => Mmux_s_6_194
    );
  Mmux_s_5 : LUT3
    generic map(
      INIT => X"8E"
    )
    port map (
      I0 => f_0_IBUF_328,
      I1 => a_0_IBUF_229,
      I2 => b_0_IBUF_293,
      O => Mmux_s_5_192
    );
  Mmux_s_4 : LUT3
    generic map(
      INIT => X"72"
    )
    port map (
      I0 => f_0_IBUF_328,
      I1 => Mcompar_s_cmp_lt0000_cy(31),
      I2 => s_addsub0000(0),
      O => Mmux_s_4_190
    );
  Mmux_s551 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(1),
      I1 => f_0_IBUF_328,
      O => Mmux_s55
    );
  Mmux_s552 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_1_IBUF_304,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_1_IBUF_240,
      O => Mmux_s551_172
    );
  Mmux_s55_f5 : MUXF5
    port map (
      I0 => Mmux_s551_172,
      I1 => Mmux_s55,
      S => f_1_IBUF_329,
      O => y_1_OBUF_407
    );
  Mmux_s1101 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(2),
      I1 => f_0_IBUF_328,
      O => Mmux_s110
    );
  Mmux_s1102 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_2_IBUF_315,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_2_IBUF_251,
      O => Mmux_s1101_134
    );
  Mmux_s110_f5 : MUXF5
    port map (
      I0 => Mmux_s1101_134,
      I1 => Mmux_s110,
      S => f_1_IBUF_329,
      O => y_2_OBUF_418
    );
  Mmux_s1301 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(4),
      I1 => f_0_IBUF_328,
      O => Mmux_s130
    );
  Mmux_s1302 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_4_IBUF_319,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_4_IBUF_255,
      O => Mmux_s1301_142
    );
  Mmux_s130_f5 : MUXF5
    port map (
      I0 => Mmux_s1301_142,
      I1 => Mmux_s130,
      S => f_1_IBUF_329,
      O => y_4_OBUF_422
    );
  Mmux_s1251 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(3),
      I1 => f_0_IBUF_328,
      O => Mmux_s125
    );
  Mmux_s1252 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_3_IBUF_318,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_3_IBUF_254,
      O => Mmux_s1251_140
    );
  Mmux_s125_f5 : MUXF5
    port map (
      I0 => Mmux_s1251_140,
      I1 => Mmux_s125,
      S => f_1_IBUF_329,
      O => y_3_OBUF_421
    );
  Mmux_s1351 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(5),
      I1 => f_0_IBUF_328,
      O => Mmux_s135
    );
  Mmux_s1352 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_5_IBUF_320,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_5_IBUF_256,
      O => Mmux_s1351_144
    );
  Mmux_s135_f5 : MUXF5
    port map (
      I0 => Mmux_s1351_144,
      I1 => Mmux_s135,
      S => f_1_IBUF_329,
      O => y_5_OBUF_423
    );
  Mmux_s1451 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(7),
      I1 => f_0_IBUF_328,
      O => Mmux_s145
    );
  Mmux_s1452 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_7_IBUF_322,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_7_IBUF_258,
      O => Mmux_s1451_148
    );
  Mmux_s145_f5 : MUXF5
    port map (
      I0 => Mmux_s1451_148,
      I1 => Mmux_s145,
      S => f_1_IBUF_329,
      O => y_7_OBUF_425
    );
  Mmux_s1401 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(6),
      I1 => f_0_IBUF_328,
      O => Mmux_s140
    );
  Mmux_s1402 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_6_IBUF_321,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_6_IBUF_257,
      O => Mmux_s1401_146
    );
  Mmux_s140_f5 : MUXF5
    port map (
      I0 => Mmux_s1401_146,
      I1 => Mmux_s140,
      S => f_1_IBUF_329,
      O => y_6_OBUF_424
    );
  Mmux_s1501 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(8),
      I1 => f_0_IBUF_328,
      O => Mmux_s150
    );
  Mmux_s1502 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_8_IBUF_323,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_8_IBUF_259,
      O => Mmux_s1501_151
    );
  Mmux_s150_f5 : MUXF5
    port map (
      I0 => Mmux_s1501_151,
      I1 => Mmux_s150,
      S => f_1_IBUF_329,
      O => y_8_OBUF_426
    );
  Mmux_s51 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(10),
      I1 => f_0_IBUF_328,
      O => Mmux_s5
    );
  Mmux_s52 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_10_IBUF_294,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_10_IBUF_230,
      O => Mmux_s51_170
    );
  Mmux_s5_f5 : MUXF5
    port map (
      I0 => Mmux_s51_170,
      I1 => Mmux_s5,
      S => f_1_IBUF_329,
      O => y_10_OBUF_397
    );
  Mmux_s1551 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(9),
      I1 => f_0_IBUF_328,
      O => Mmux_s155
    );
  Mmux_s1552 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_9_IBUF_324,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_9_IBUF_260,
      O => Mmux_s1551_154
    );
  Mmux_s155_f5 : MUXF5
    port map (
      I0 => Mmux_s1551_154,
      I1 => Mmux_s155,
      S => f_1_IBUF_329,
      O => y_9_OBUF_427
    );
  Mmux_s101 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(11),
      I1 => f_0_IBUF_328,
      O => Mmux_s10
    );
  Mmux_s102 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_11_IBUF_295,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_11_IBUF_231,
      O => Mmux_s101_130
    );
  Mmux_s10_f5 : MUXF5
    port map (
      I0 => Mmux_s101_130,
      I1 => Mmux_s10,
      S => f_1_IBUF_329,
      O => y_11_OBUF_398
    );
  Mmux_s201 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(13),
      I1 => f_0_IBUF_328,
      O => Mmux_s20
    );
  Mmux_s202 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_13_IBUF_297,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_13_IBUF_233,
      O => Mmux_s201_156
    );
  Mmux_s20_f5 : MUXF5
    port map (
      I0 => Mmux_s201_156,
      I1 => Mmux_s20,
      S => f_1_IBUF_329,
      O => y_13_OBUF_400
    );
  Mmux_s151 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(12),
      I1 => f_0_IBUF_328,
      O => Mmux_s15
    );
  Mmux_s152 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_12_IBUF_296,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_12_IBUF_232,
      O => Mmux_s151_152
    );
  Mmux_s15_f5 : MUXF5
    port map (
      I0 => Mmux_s151_152,
      I1 => Mmux_s15,
      S => f_1_IBUF_329,
      O => y_12_OBUF_399
    );
  Mmux_s251 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(14),
      I1 => f_0_IBUF_328,
      O => Mmux_s25
    );
  Mmux_s252 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_14_IBUF_298,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_14_IBUF_234,
      O => Mmux_s251_158
    );
  Mmux_s25_f5 : MUXF5
    port map (
      I0 => Mmux_s251_158,
      I1 => Mmux_s25,
      S => f_1_IBUF_329,
      O => y_14_OBUF_401
    );
  Mmux_s351 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(16),
      I1 => f_0_IBUF_328,
      O => Mmux_s35
    );
  Mmux_s352 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_16_IBUF_300,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_16_IBUF_236,
      O => Mmux_s351_162
    );
  Mmux_s35_f5 : MUXF5
    port map (
      I0 => Mmux_s351_162,
      I1 => Mmux_s35,
      S => f_1_IBUF_329,
      O => y_16_OBUF_403
    );
  Mmux_s301 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(15),
      I1 => f_0_IBUF_328,
      O => Mmux_s30
    );
  Mmux_s302 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_15_IBUF_299,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_15_IBUF_235,
      O => Mmux_s301_160
    );
  Mmux_s30_f5 : MUXF5
    port map (
      I0 => Mmux_s301_160,
      I1 => Mmux_s30,
      S => f_1_IBUF_329,
      O => y_15_OBUF_402
    );
  Mmux_s401 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(17),
      I1 => f_0_IBUF_328,
      O => Mmux_s40
    );
  Mmux_s402 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_17_IBUF_301,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_17_IBUF_237,
      O => Mmux_s401_164
    );
  Mmux_s40_f5 : MUXF5
    port map (
      I0 => Mmux_s401_164,
      I1 => Mmux_s40,
      S => f_1_IBUF_329,
      O => y_17_OBUF_404
    );
  Mmux_s501 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(19),
      I1 => f_0_IBUF_328,
      O => Mmux_s50
    );
  Mmux_s502 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_19_IBUF_303,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_19_IBUF_239,
      O => Mmux_s501_169
    );
  Mmux_s50_f5 : MUXF5
    port map (
      I0 => Mmux_s501_169,
      I1 => Mmux_s50,
      S => f_1_IBUF_329,
      O => y_19_OBUF_406
    );
  Mmux_s451 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(18),
      I1 => f_0_IBUF_328,
      O => Mmux_s45
    );
  Mmux_s452 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_18_IBUF_302,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_18_IBUF_238,
      O => Mmux_s451_166
    );
  Mmux_s45_f5 : MUXF5
    port map (
      I0 => Mmux_s451_166,
      I1 => Mmux_s45,
      S => f_1_IBUF_329,
      O => y_18_OBUF_405
    );
  Mmux_s601 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(20),
      I1 => f_0_IBUF_328,
      O => Mmux_s60
    );
  Mmux_s602 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_20_IBUF_305,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_20_IBUF_241,
      O => Mmux_s601_174
    );
  Mmux_s60_f5 : MUXF5
    port map (
      I0 => Mmux_s601_174,
      I1 => Mmux_s60,
      S => f_1_IBUF_329,
      O => y_20_OBUF_408
    );
  Mmux_s701 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(22),
      I1 => f_0_IBUF_328,
      O => Mmux_s70
    );
  Mmux_s702 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_22_IBUF_307,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_22_IBUF_243,
      O => Mmux_s701_178
    );
  Mmux_s70_f5 : MUXF5
    port map (
      I0 => Mmux_s701_178,
      I1 => Mmux_s70,
      S => f_1_IBUF_329,
      O => y_22_OBUF_410
    );
  Mmux_s651 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(21),
      I1 => f_0_IBUF_328,
      O => Mmux_s65
    );
  Mmux_s652 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_21_IBUF_306,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_21_IBUF_242,
      O => Mmux_s651_176
    );
  Mmux_s65_f5 : MUXF5
    port map (
      I0 => Mmux_s651_176,
      I1 => Mmux_s65,
      S => f_1_IBUF_329,
      O => y_21_OBUF_409
    );
  Mmux_s751 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(23),
      I1 => f_0_IBUF_328,
      O => Mmux_s75
    );
  Mmux_s752 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_23_IBUF_308,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_23_IBUF_244,
      O => Mmux_s751_180
    );
  Mmux_s75_f5 : MUXF5
    port map (
      I0 => Mmux_s751_180,
      I1 => Mmux_s75,
      S => f_1_IBUF_329,
      O => y_23_OBUF_411
    );
  Mmux_s951 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(27),
      I1 => f_0_IBUF_328,
      O => Mmux_s95
    );
  Mmux_s952 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_27_IBUF_312,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_27_IBUF_248,
      O => Mmux_s951_188
    );
  Mmux_s95_f5 : MUXF5
    port map (
      I0 => Mmux_s951_188,
      I1 => Mmux_s95,
      S => f_1_IBUF_329,
      O => y_27_OBUF_415
    );
  Mmux_s901 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(26),
      I1 => f_0_IBUF_328,
      O => Mmux_s90
    );
  Mmux_s902 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_26_IBUF_311,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_26_IBUF_247,
      O => Mmux_s901_186
    );
  Mmux_s90_f5 : MUXF5
    port map (
      I0 => Mmux_s901_186,
      I1 => Mmux_s90,
      S => f_1_IBUF_329,
      O => y_26_OBUF_414
    );
  Mmux_s851 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(25),
      I1 => f_0_IBUF_328,
      O => Mmux_s85
    );
  Mmux_s852 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_25_IBUF_310,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_25_IBUF_246,
      O => Mmux_s851_184
    );
  Mmux_s85_f5 : MUXF5
    port map (
      I0 => Mmux_s851_184,
      I1 => Mmux_s85,
      S => f_1_IBUF_329,
      O => y_25_OBUF_413
    );
  Mmux_s1201 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(31),
      I1 => f_0_IBUF_328,
      O => Mmux_s120
    );
  Mmux_s1202 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_31_IBUF_317,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_31_IBUF_253,
      O => Mmux_s1201_138
    );
  Mmux_s120_f5 : MUXF5
    port map (
      I0 => Mmux_s1201_138,
      I1 => Mmux_s120,
      S => f_1_IBUF_329,
      O => y_31_OBUF_420
    );
  Mmux_s1151 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(30),
      I1 => f_0_IBUF_328,
      O => Mmux_s115
    );
  Mmux_s1152 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_30_IBUF_316,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_30_IBUF_252,
      O => Mmux_s1151_136
    );
  Mmux_s115_f5 : MUXF5
    port map (
      I0 => Mmux_s1151_136,
      I1 => Mmux_s115,
      S => f_1_IBUF_329,
      O => y_30_OBUF_419
    );
  Mmux_s1051 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(29),
      I1 => f_0_IBUF_328,
      O => Mmux_s105
    );
  Mmux_s1052 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_29_IBUF_314,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_29_IBUF_250,
      O => Mmux_s1051_132
    );
  Mmux_s105_f5 : MUXF5
    port map (
      I0 => Mmux_s1051_132,
      I1 => Mmux_s105,
      S => f_1_IBUF_329,
      O => y_29_OBUF_417
    );
  Mmux_s1001 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(28),
      I1 => f_0_IBUF_328,
      O => Mmux_s100
    );
  Mmux_s1002 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_28_IBUF_313,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_28_IBUF_249,
      O => Mmux_s1001_129
    );
  Mmux_s100_f5 : MUXF5
    port map (
      I0 => Mmux_s1001_129,
      I1 => Mmux_s100,
      S => f_1_IBUF_329,
      O => y_28_OBUF_416
    );
  Mmux_s801 : LUT2
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => s_addsub0000(24),
      I1 => f_0_IBUF_328,
      O => Mmux_s80
    );
  Mmux_s802 : LUT4
    generic map(
      INIT => X"F660"
    )
    port map (
      I0 => b_24_IBUF_309,
      I1 => f_2_IBUF_330,
      I2 => f_0_IBUF_328,
      I3 => a_24_IBUF_245,
      O => Mmux_s801_182
    );
  Mmux_s80_f5 : MUXF5
    port map (
      I0 => Mmux_s801_182,
      I1 => Mmux_s80,
      S => f_1_IBUF_329,
      O => y_24_OBUF_412
    );

end Structure;

