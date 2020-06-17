------------------------------------------------------------
-- mips.vhd
-- David_Harris@hmc.edu and Sarah_Harris@hmc.edu 30 May 2006
-- Single Cycle MIPS processor
-- Modified by Ryan Silva
-- - to work in VHDL 93
--	Modified by Danial Neebel Jul 2014
-- - to add imem, and dmem modules 
-- Modified by Virginia Trimble Apr 2015
-- - to add the top module and remove alu 
------------------------------------------------------------
-- ------------------------------------------------------------------
--Name:			Jacob Orner

--Date:			12 May 2016

--Course:			ECE 281

--File:			mips_combo.vhd

--HW:				Lab 4

--Purp:			This program creates the mips microprocessor created for the lab.

--Documentation:	None

--Academic Integrity Statement: I certify that, while others may have 
--assisted me in brain storming, debugging and validating this program, 
--the program itself is my own work. I understand that submitting code 
--which is the work of other individuals is a violation of the honor   
--code.  I also understand that if I knowingly give my original work to 
--another individual is also a violation of the honor code. 

-- ------------------------------------------------------------------
------------------------------------------------------------
-- Entity Declarations
------------------------------------------------------------

library IEEE; use IEEE.STD_LOGIC_1164.all;
entity mips is -- single cycle MIPS processor
  port(clk, reset:        in  STD_LOGIC;
       pc:                inout STD_LOGIC_VECTOR(31 downto 0);
       instr:             in  STD_LOGIC_VECTOR(31 downto 0);
       memwrite:          out STD_LOGIC;
       aluout, writedata: inout STD_LOGIC_VECTOR(31 downto 0);
       readdata:          in  STD_LOGIC_VECTOR(31 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all;
entity controller is -- single cycle control decoder
  port(op, funct:          in  STD_LOGIC_VECTOR(5 downto 0);
       zero:               in  STD_LOGIC;
       memtoreg, memwrite: out STD_LOGIC;
       pcsrc: 					out STD_LOGIC;
		 alusrc:      			out STD_LOGIC_VECTOR(1 downto 0);
       regdst, regwrite:   out STD_LOGIC;
       jump:               out STD_LOGIC;
       alucontrol:         out STD_LOGIC_VECTOR(2 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all;
entity maindec is -- main control decoder
  port(op:                 in  STD_LOGIC_VECTOR(5 downto 0);
       memtoreg, memwrite: out STD_LOGIC;
       branch:     			out STD_LOGIC;
		 alusrc:      			out STD_LOGIC_VECTOR(1 downto 0);
       regdst, regwrite:   out STD_LOGIC;
       jump:               out STD_LOGIC;
       aluop:              out  STD_LOGIC_VECTOR(1 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all;
entity aludec is -- ALU control decoder
  port(funct:      in  STD_LOGIC_VECTOR(5 downto 0);
       aluop:      in  STD_LOGIC_VECTOR(1 downto 0);
       alucontrol: out STD_LOGIC_VECTOR(2 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all; use IEEE.STD_LOGIC_ARITH.all;
entity datapath is  -- MIPS datapath
  port(clk, reset:        in  STD_LOGIC;
       memtoreg, pcsrc:   in  STD_LOGIC;
		 alusrc:      			in STD_LOGIC_VECTOR(1 downto 0); 
       regdst:    			in  STD_LOGIC;
       regwrite, jump:    in  STD_LOGIC;
       alucontrol:        in  STD_LOGIC_VECTOR(2 downto 0);
       zero:              out STD_LOGIC;
       pc:                inout STD_LOGIC_VECTOR(31 downto 0);
       instr:             in  STD_LOGIC_VECTOR(31 downto 0);
       aluout, writedata: inout STD_LOGIC_VECTOR(31 downto 0);
       readdata:          in  STD_LOGIC_VECTOR(31 downto 0));
end;

--your ALU entity declaration goes here.  In this file, f is called alucontrol and y is
--			called result and is an inout.
LIBRARY ieee; use ieee.numeric_std.all;
use IEEE.STD_LOGIC_1164.ALL; use ieee.std_logic_signed.all;
entity alu is
	port(
		a, b : in std_logic_vector(31 downto 0);
		f    : in std_logic_vector(2 downto 0);
		y    : out std_logic_vector(31 downto 0);
		zero : out std_logic
	);
end alu;

library IEEE; use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;
entity regfile is -- three-port register file
  port(clk:           in  STD_LOGIC;
       we3:           in  STD_LOGIC;
       ra1, ra2, wa3: in  STD_LOGIC_VECTOR(4 downto 0);
       wd3:           in  STD_LOGIC_VECTOR(31 downto 0);
       rd1, rd2:      out STD_LOGIC_VECTOR(31 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;
entity adder is -- adder
  port(a, b: in  STD_LOGIC_VECTOR(31 downto 0);
       y:    out STD_LOGIC_VECTOR(31 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all;
entity sl2 is -- shift left by 2
  port(a: in  STD_LOGIC_VECTOR(31 downto 0);
       y: out STD_LOGIC_VECTOR(31 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all;
entity signext is -- sign extender
  port(a: in  STD_LOGIC_VECTOR(15 downto 0);
       y: out STD_LOGIC_VECTOR(31 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all;
entity zeroext is -- zero extender
  port(a: in  STD_LOGIC_VECTOR(15 downto 0);
       y: out STD_LOGIC_VECTOR(31 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all;  use IEEE.STD_LOGIC_ARITH.all;
entity flopr is -- flip-flop with synchronous reset
  generic(width: integer);
  port(clk, reset: in  STD_LOGIC;
       d:          in  STD_LOGIC_VECTOR(width-1 downto 0);
       q:          out STD_LOGIC_VECTOR(width-1 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all;
entity mux2 is -- two-input multiplexer
  generic(width: integer);
  port(d0, d1: in  STD_LOGIC_VECTOR(width-1 downto 0);
       s:      in  STD_LOGIC;
       y:      out STD_LOGIC_VECTOR(width-1 downto 0));
end;

library IEEE; use IEEE.STD_LOGIC_1164.all;
entity mux3 is -- three-input multiplexer
  port(d0, d1, d2: in  STD_LOGIC_VECTOR(31 downto 0);
       s:      in  STD_LOGIC_VECTOR(1 downto 0);
       y:      out STD_LOGIC_VECTOR(31 downto 0));
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
--use IEEE.NUMERIC_STD_UNSIGNED.all;
use IEEE.NUMERIC_STD.all;

entity top is -- top-level design for testing
  port(clk, reset:           in     STD_LOGIC;
       writedata, dataadr:   inout STD_LOGIC_VECTOR(31 downto 0);
       memwrite:             inout STD_LOGIC);
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all; use STD.TEXTIO.all;
--use IEEE.NUMERIC_STD_UNSIGNED.all; 
use IEEE.NUMERIC_STD.all; 

entity dmem is -- data memory
  port(clk, we:  in STD_LOGIC;
       a, wd:    in STD_LOGIC_VECTOR(31 downto 0);
       rd:       out STD_LOGIC_VECTOR(31 downto 0));
end;

library IEEE; 
use IEEE.STD_LOGIC_1164.all; 
use STD.TEXTIO.all;
--use IEEE.NUMERIC_STD_UNSIGNED.all;  
use IEEE.NUMERIC_STD.all; 
use IEEE.STD_LOGIC_UNSIGNED.all;  use IEEE.STD_LOGIC_ARITH.all;


entity imem is -- instruction memory
  port(a:  in  STD_LOGIC_VECTOR(5 downto 0);
       rd: out STD_LOGIC_VECTOR(31 downto 0));
end;

---------------------------------------------------------
-- Architecture Definitions
---------------------------------------------------------

architecture struct of mips is
  component controller
    port(op, funct:          in  STD_LOGIC_VECTOR(5 downto 0);
         zero:               in  STD_LOGIC;
         memtoreg, memwrite: out STD_LOGIC;
         pcsrc:			      out STD_LOGIC;
			alusrc:      			out STD_LOGIC_VECTOR(1 downto 0);
         regdst, regwrite:   out STD_LOGIC;
         jump:               out STD_LOGIC;
         alucontrol:         out STD_LOGIC_VECTOR(2 downto 0));
  end component;
  component datapath
    port(clk, reset:        in  STD_LOGIC;
         memtoreg, pcsrc:   in  STD_LOGIC;
			alusrc:      		 in STD_LOGIC_VECTOR(1 downto 0); 
         regdst:   			 in  STD_LOGIC;
         regwrite, jump:    in  STD_LOGIC;
         alucontrol:        in  STD_LOGIC_VECTOR(2 downto 0);
         zero:              out STD_LOGIC;
         pc:                inout STD_LOGIC_VECTOR(31 downto 0);
         instr:             in STD_LOGIC_VECTOR(31 downto 0);
         aluout, writedata: inout STD_LOGIC_VECTOR(31 downto 0);
         readdata:          in  STD_LOGIC_VECTOR(31 downto 0));
  end component;
  signal memtoreg, regdst, regwrite, jump, pcsrc: STD_LOGIC;
  signal alusrc: STD_LOGIC_VECTOR(1 downto 0);  
  signal zero: STD_LOGIC;
  signal alucontrol: STD_LOGIC_VECTOR(2 downto 0);
begin
  cont: controller port map(instr(31 downto 26), instr(5 downto 0),
                            zero, memtoreg, memwrite, pcsrc, alusrc,
									 regdst, regwrite, jump, alucontrol);
  dp: datapath port map(clk, reset, memtoreg, pcsrc, alusrc, regdst,
                        regwrite, jump, alucontrol, zero, pc, instr,
								aluout, writedata, readdata);
end;

architecture struct of controller is
  component maindec
    port(op:                 in  STD_LOGIC_VECTOR(5 downto 0);
         memtoreg, memwrite: out STD_LOGIC;
         branch:     			out STD_LOGIC;
			alusrc:      			out STD_LOGIC_VECTOR(1 downto 0); 
         regdst, regwrite:   out STD_LOGIC;
         jump:               out STD_LOGIC;
         aluop:              out  STD_LOGIC_VECTOR(1 downto 0));
  end component;
  component aludec
    port(funct:      in  STD_LOGIC_VECTOR(5 downto 0);
         aluop:      in  STD_LOGIC_VECTOR(1 downto 0);
         alucontrol: out STD_LOGIC_VECTOR(2 downto 0));
  end component;

  signal aluop: STD_LOGIC_VECTOR(1 downto 0);
  signal branch: STD_LOGIC;
begin
  md: maindec port map(op, memtoreg, memwrite, branch,
                       alusrc, regdst, regwrite, jump, aluop);
  ad: aludec port map(funct, aluop, alucontrol);

  pcsrc <= (branch and zero and not op(0)) or (branch and not zero and op(0));
 
end;

architecture behave of maindec is
  signal controls: STD_LOGIC_VECTOR(8 downto 0);
begin
  process(op) begin
    case op is							
      when "000000" => controls <= "110000010"; -- Rtype
      when "100011" => controls <= "101001000"; -- LW
      when "101011" => controls <= "001010000"; -- SW
      when "000100" => controls <= "000100001"; -- BEQ
      when "001000" => controls <= "101000000"; -- ADDI
      when "000010" => controls <= "000000100"; -- J
		when "001101" => controls <= "101000011"; -- ORI
		when "000101" => controls <= "000100001"; -- BNE
      when others   => controls <= "---------"; -- illegal op
    end case;
  end process;

  regwrite <= controls(8);
  regdst   <= controls(7);
  alusrc   <= controls(1 downto 0);  
  branch   <= controls(5);
  memwrite <= controls(4);
  memtoreg <= controls(3);
  jump     <= controls(2);
  aluop    <= controls(1 downto 0);
end;

architecture behave of aludec is
begin
  process(aluop, funct) begin
    case aluop is
      when "00" => alucontrol <= "010"; -- add (for lb/sb/addi)
      when "01" => alucontrol <= "110"; -- sub (for beq)
		when "11" => alucontrol <= "001"; -- or (for ori)
      when others => case funct is         -- R-type instructions
                         when "100000" => alucontrol <= "010"; -- add (for add)
                         when "100010" => alucontrol <= "110"; -- subtract (for sub)
                         when "100100" => alucontrol <= "000"; -- logical and (for and)
                         when "100101" => alucontrol <= "001"; -- logical or (for or)
                         when "101010" => alucontrol <= "111"; -- set on less (for slt)
                         when others   => alucontrol <= "---"; -- should never happen
                     end case;
    end case;
  end process;
end;

architecture struct of datapath is
  component alu
    port(a, b:       in  STD_LOGIC_VECTOR(31 downto 0);
         f: in  STD_LOGIC_VECTOR(2 downto 0);
         y:     inout STD_LOGIC_VECTOR(31 downto 0);
	      zero:       out STD_LOGIC);
  end component;
  component regfile
    port(clk:           in  STD_LOGIC;
         we3:           in  STD_LOGIC;
         ra1, ra2, wa3: in  STD_LOGIC_VECTOR(4 downto 0);
         wd3:           in  STD_LOGIC_VECTOR(31 downto 0);
         rd1, rd2:      out STD_LOGIC_VECTOR(31 downto 0));
  end component;
  component adder
    port(a, b: in  STD_LOGIC_VECTOR(31 downto 0);
         y:    out STD_LOGIC_VECTOR(31 downto 0));
  end component;
  component sl2
    port(a: in  STD_LOGIC_VECTOR(31 downto 0);
         y: out STD_LOGIC_VECTOR(31 downto 0));
  end component;
  component signext
    port(a: in  STD_LOGIC_VECTOR(15 downto 0);
         y: out STD_LOGIC_VECTOR(31 downto 0));
  end component;
  component zeroext
    port(a: in  STD_LOGIC_VECTOR(15 downto 0);
         y: out STD_LOGIC_VECTOR(31 downto 0));
  end component;
  component flopr generic(width: integer);
    port(clk, reset: in  STD_LOGIC;
         d:          in  STD_LOGIC_VECTOR(width-1 downto 0);
         q:          out STD_LOGIC_VECTOR(width-1 downto 0));
  end component;
  component mux2 generic(width: integer);
    port(d0, d1: in  STD_LOGIC_VECTOR(width-1 downto 0);
         s:      in  STD_LOGIC;
         y:      out STD_LOGIC_VECTOR(width-1 downto 0));
  end component;
  component mux3
    port(d0, d1, d2: in  STD_LOGIC_VECTOR(31 downto 0);
         s:      in  STD_LOGIC_VECTOR(1 downto 0);
         y:      out STD_LOGIC_VECTOR(31 downto 0));
  end component;
  
  signal writereg: STD_LOGIC_VECTOR(4 downto 0);
  signal pcjump, pcnext, pcnextbr, pcplus4, pcbranch: STD_LOGIC_VECTOR(31 downto 0);
  signal signimm, signimmsh: STD_LOGIC_VECTOR(31 downto 0); 
  signal zeroimm, zeroimmsh : STD_LOGIC_VECTOR(31 downto 0);
  signal srca, srcb, result: STD_LOGIC_VECTOR(31 downto 0);
begin
  -- next PC logic
  pcjump <= pcplus4(31 downto 28) & instr(25 downto 0) & "00";
  pcreg: flopr generic map(32) port map(clk, reset, pcnext, pc);
  pcadd1: adder port map(pc, X"00000004", pcplus4);
  immsh: sl2 port map(signimm, signimmsh);
  pcadd2: adder port map(pcplus4, signimmsh, pcbranch);
  pcbrmux: mux2 generic map(32) port map(pcplus4, pcbranch, pcsrc, pcnextbr);
  pcmux: mux2 generic map(32) port map(pcnextbr, pcjump, jump, pcnext);

  -- register file logic
  rf: regfile port map(clk, regwrite, instr(25 downto 21), instr(20 downto 16),
              writereg, result, srca, writedata);
  wrmux: mux2 generic map(5) port map(instr(20 downto 16), instr(15 downto 11),
                                      regdst, writereg);
  resmux: mux2 generic map(32) port map(aluout, readdata, memtoreg, result);
  se: signext port map(instr(15 downto 0), signimm);
  ze: zeroext port map(instr(15 downto 0), zeroimm);

  -- ALU logic
  srcbmux: mux3 port map(writedata, signimm, zeroimm, alusrc, srcb); 
  mainalu:  alu port map(srca, srcb, alucontrol, aluout, zero);
end;

--insert your ALU architecture here.
architecture Behavioral of alu is

signal q,r,s: std_logic_vector(31 downto 0) := (others => '0');

begin
q <= a;
r <= b;
y <= s;

process(q, r, s, f)
begin
	case f is
		when "000" =>
			s <= q and r;
		when "001" =>
			s <= q or r;
		when "010" =>
			s <= q + r;
		when "100" =>
			s <= q and not r;
		when "101" =>
			s <= q or not r;
		when "110" =>
			s <= q - r;
		when "111" =>
			if(q < r) then
				s <= x"00000001";
			else 
				s <= x"00000000";
			end if;
		when others => 
			s <= x"00000000";
	end case;
	
	if(s = x"00000000") then
		zero <= '1';
	else 
		zero <= '0';
	end if;
end process;

end Behavioral;

architecture behave of regfile is
  type ramtype is array (31 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
  signal mem: ramtype;
begin
  -- three-ported register file
  -- read two ports combinationally
  -- write third port on rising edge of clock
  process(clk) begin
    if clk'event and clk = '1' then
       if we3 = '1' then mem(CONV_INTEGER(wa3)) <= wd3;
       end if;
    end if;
  end process;
  process(ra1, ra2, mem) begin
    if (conv_integer(ra1) = 0) then rd1 <= X"00000000"; -- register 0 holds 0
    else rd1 <= mem(CONV_INTEGER(ra1));
    end if;
    if (conv_integer(ra2) = 0) then rd2 <= X"00000000"; 
    else rd2 <= mem(CONV_INTEGER(ra2));
    end if;
  end process;
end;

architecture behave of adder is
begin
  y <= a + b;
end;

architecture behave of sl2 is
begin
  y <= a(29 downto 0) & "00";
end;

architecture behave of signext is
begin
  y <= X"0000" & a when a(15) = '0' else X"ffff" & a; 
end;

architecture behave of zeroext is
begin
  y <= X"0000" & a; 
end;

architecture asynchronous of flopr is
begin
  process(clk, reset) begin
    if reset = '1' then  q <= CONV_STD_LOGIC_VECTOR(0, width); 
    elsif clk'event and clk = '1' then
      q <= d;
    end if;
  end process;
end;

architecture behave of mux2 is
begin
  y <= d0 when s = '0' else d1;
end;

architecture behave of mux3 is
begin
	y <= d1 when s = "00" else
	d0 when s = "01" else
	d0 when s = "10" else
	d2 when s = "11" else
	X"00000000";
end; 

architecture test of top is
  component mips 
    port(clk, reset:        in  STD_LOGIC;
         pc:                inout STD_LOGIC_VECTOR(31 downto 0);
         instr:             in  STD_LOGIC_VECTOR(31 downto 0); 
         memwrite:          out STD_LOGIC;
         aluout, writedata: inout STD_LOGIC_VECTOR(31 downto 0);
         readdata:          in  STD_LOGIC_VECTOR(31 downto 0));
  end component;
  component imem
    port(a:  in  STD_LOGIC_VECTOR(5 downto 0);
         rd: out STD_LOGIC_VECTOR(31 downto 0));
  end component;
  component dmem
    port(clk, we:  in STD_LOGIC;
         a, wd:    in STD_LOGIC_VECTOR(31 downto 0);
         rd:       out STD_LOGIC_VECTOR(31 downto 0));
  end component;
  signal pc, instrLocal, 
         readdata: STD_LOGIC_VECTOR(31 downto 0);
begin
  -- instantiate processor and memories
  mips1: mips port map(clk, reset, pc, instrLocal, memwrite, dataadr, writedata, readdata);
  imem1: imem port map(pc(7 downto 2), instrLocal);
  dmem1: dmem port map(clk, memwrite, dataadr, writedata, readdata);
end;

architecture behave of dmem is
begin
  process (clk, a)is
    type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
    variable mem: ramtype;
  begin
   
      if clk'event and clk = '1' then
				
          if (we = '1') then mem(to_integer(unsigned(a(7 downto 2)))) := wd;
          end if;
      end if;
      rd <= mem(to_integer(unsigned(a(7 downto 2)))); 


  end process;
end;

architecture behave of imem is
begin
    process is

-- You'll need to create a path to your own file here.
		 file mem_file: text open read_mode is "C:\Users\C18Jacob.Orner\Desktop\memfile2.dat";

		  
        variable L: line;
        variable ch: character;
        variable index, result: integer;
        type ramtype is array (63 downto 0) of STD_LOGIC_VECTOR(31 downto 0);
        variable mem: ramtype;
    begin
        -- initialize memory from file
	-- memory in little-endian format
	--  80020044 means mem[3] = 80 and mem[0] = 44
        for i in 0 to 63 loop -- set all contents low
            mem(conv_integer(i)) := X"00000000";
        end loop;
        index := 0; 
        while not endfile(mem_file) loop
            readline(mem_file, L);
           
                result := 0;
                    for k in 1 to 8 loop
                        read(L, ch);
                        if '0' <= ch and ch <= '9' then 
                            result := result*16 + character'pos(ch)-character'pos('0');
									
                        elsif 'a' <= ch and ch <= 'f' then
                            result := result*16 + character'pos(ch)-character'pos('a')+10;
									
                        else report "Format error on line " & integer'image(index)
                             severity error;
                        end if;
                    end loop;


        
            mem(index) := conv_std_logic_vector(result, 32);  
            index := index + 1;
        end loop;
        
        loop

            rd <= mem(conv_integer(a));
            wait on a;
        end loop;
    end process;
end;

