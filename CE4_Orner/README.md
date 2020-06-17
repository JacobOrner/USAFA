## Arithmetic Logic Unit ##

### Purpose ###
The purpose of this exercise is to design, write, and test a 32-bit Arithmetic Logic Unit (ALU). As well as write a testbench of the ALU, doing both of these using VHDL code.

### ALU Overview ###
The ALU is a unit which will take two 32-bit inputs, as well as a 3-bit input as a selector. Depending on the selector input, the ALU will perform either a mathematical or logical function on the two 32-bit inputs, and return the result in the form of a 32-bit output. The ALU will also have another output which will be '1' if the result is equal to zero, and '0' if it is not. Below is a table with the different selector inputs and what functions each one corresponds to.

| F(2:0) | Function |
|:-:|:-:|
| 000 | A & B |
| 001 | A OR B |
| 010 | A + B |
| 011 | not used |
| 100 | A & ~B |
| 101 | A OR ~B |
| 110 | A - B |
| 111 | SLT |

### Code Written ###
The VHDL program for the ALU was created using the table shown above. The code uses a case statement to perform a function depending on the selector input (f) given. Below is the code.

	LIBRARY ieee;
	use ieee.numeric_std.all;
	use IEEE.STD_LOGIC_1164.ALL;
	use ieee.std_logic_signed.all;

	entity alu is
		port(
			a, b : in std_logic_vector(31 downto 0);
			f    : in std_logic_vector(2 downto 0);
			y    : out std_logic_vector(31 downto 0);
			zero : out std_logic
		);
	end alu;

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
	

The test bench was written to test each function using several different possible inputs. Below is a table which was contained in the lab document and filled out. This table only contains some of the tests used in the testbench, but paint a good picture of the different cases used to fully test the ALU.

| # |Test | F[2:0] | A | B | Y | Zero |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 | 	ADD 0+0					| 2	| 00000000	| 00000000 | 00000000 |	1 |
| 2 |	ADD 0+(-1)				| 2	| 00000000	| FFFFFFFF | FFFFFFFF |	0 |
| 3 |	ADD 1+(-1)				| 2	| 00000001	| FFFFFFFF | 00000000 |	1 |
| 4 |	ADD FF+1				| 2	| 000000FF	| 00000001 | 00000100 |	0 |
| 5 |	SUB 0-0					| 6	| 00000000	| 00000000 | 00000000 |	1 |
| 6 |	SUB 0-(-1)				| 6	| 00000000	| FFFFFFFF | 00000001 |	0 |
| 7	|	SUB 1-1					| 6	| 00000001	| 00000001 | 00000000 |	1 |
| 8 |	SUB 100-1				| 6	| 00000100	| 00000001 | 000000FF |	0 |
| 9 |	SLT 0,0					| 7	| 00000000	| 00000000 | 00000000 |	1 |
| 10 |	SLT 0,1					| 7	| 00000000	| 00000001 | 00000001 |	0 |
| 11 |	SLT 0,-1				| 7	| 00000000	| FFFFFFFF | 00000000 |	1 |
| 12 |	SLT 1,0					| 7	| 00000001	| 00000000 | 00000000 |	1 |
| 13 |  SLT -1,0				| 7	| FFFFFFFF	| 00000000 | 00000001 |	0 |
| 14 |  AND FFFFFFFF, FFFFFFFF	| 0	| FFFFFFFF	| FFFFFFFF | FFFFFFFF |	0 |
| 15 |  AND FFFFFFFF, 12345678	| 0 | FFFFFFFF	| 12345678 | 12345678 |	0 |
| 16 |  AND 12345678, 87654321	| 0	| 12345678	| 87654321 | 02244220 |	0 |
| 17 |  AND 00000000, FFFFFFFF	| 0	| 00000000	| FFFFFFFF | 00000000 |	1 |
| 18 |  OR  FFFFFFFF, FFFFFFFF	| 1	| FFFFFFFF	| FFFFFFFF | FFFFFFFF |	0 |
| 19 |  OR  12345678, 87654321	| 1	| 12345678	| 87654321 | 97755779 |	0 |
| 20 |  OR  00000000, FFFFFFFF	| 1	| 00000000	| FFFFFFFF | FFFFFFFF |	0 |
| 21 |  OR  00000000, 00000000	| 1	| 00000000	| 00000000 | 00000000 |	1 |

Each of the different sets of inputs tested both positive and negative numbers for each function, and tested inputs which would result in both zero, and non-zero numbers for each function. Below is the code for the testbench.
	
	LIBRARY ieee;
	use ieee.numeric_std.all;
	use IEEE.STD_LOGIC_1164.ALL;
	use ieee.std_logic_signed.all;

	ENTITY alu_tb IS
	END alu_tb;
 
	ARCHITECTURE behavior OF alu_tb IS 
	
		component alu
		port(
			a, b : in signed(31 downto 0);
			f    : in std_logic_vector(2 downto 0);
			y    : out signed(31 downto 0);
			zero : out std_logic
		);
		end component;
		
		signal a : signed(31 downto 0) := (others => '0');
		signal b : signed(31 downto 0) := (others => '0');
		signal f : std_logic_vector(2 downto 0) := (others => '0');
	
		signal y : signed(31 downto 0) := (others => '0');
		signal zero : std_logic := '0';
	
	BEGIN 
	
		uut : alu port map(
				a => a,
				b => b,
				f => f,
				y => y,
				zero => zero
			);
		
		stim_proc: process
		begin
			wait for 10 ns;
			a <= x"FFFFFFFF";	b <= x"FFFFFFFF";	f <= "000";
				wait for 20 ns;
			a <= x"FFFFFFFF";	b <= x"12345678";	f <= "000";
				wait for 20 ns;
			a <= x"12345678";	b <= x"87654321";	f <= "000";
				wait for 20 ns;
			a <= x"00000000";	b <= x"FFFFFFFF";	f <= "000";
				wait for 20 ns;
				
			a <= x"FFFFFFFF";	b <= x"FFFFFFFF";	f <= "001";
				wait for 20 ns;
			a <= x"12345678";	b <= x"87654321";	f <= "001";
				wait for 20 ns;
			a <= x"00000000";	b <= x"FFFFFFFF";	f <= "001";
				wait for 20 ns;
			a <= x"00000000";	b <= x"00000000";	f <= "001";
				wait for 20 ns;
				
			a <= x"00000000"; b <= x"00000000"; f <= "010";
				wait for 20 ns;
			a <= x"00000000"; b <= x"FFFFFFFF";	f <= "010";
				wait for 20 ns;
			a <= x"00000001";	b <= x"FFFFFFFF";	f <= "010";
				wait for 20 ns;
			a <= x"000000FF"; b <= x"00000001"; f <= "010";
				wait for 20 ns;
				
			a <= x"FFFFFFFF";	b <= x"FFFFFFFF";	f <= "100";
				wait for 20 ns;
			a <= x"FFFFFFFF";	b <= x"12345678";	f <= "100";
				wait for 20 ns;
			a <= x"12345678";	b <= x"87654321";	f <= "100";
				wait for 20 ns;
			a <= x"00000000";	b <= x"FFFFFFFF";	f <= "100";
				wait for 20 ns;
			
			a <= x"FFFFFFFF";	b <= x"FFFFFFFF";	f <= "101";
				wait for 20 ns;
			a <= x"12345678";	b <= x"87654321";	f <= "101";
				wait for 20 ns;
			a <= x"00000000";	b <= x"FFFFFFFF";	f <= "101";
				wait for 20 ns;
			a <= x"00000000";	b <= x"00000000";	f <= "101";
				wait for 20 ns;
			
			a <= x"00000000";	b <= x"00000000";	f <= "110";
				wait for 20 ns;
			a <= x"00000000";	b <= x"FFFFFFFF";	f <= "110";
				wait for 20 ns;
			a <= x"00000001";	b <= x"00000001";	f <= "110";
				wait for 20 ns;
			a <= x"00000100";	b <= x"00000001";	f <= "110";
				wait for 20 ns;
				
			a <= x"00000000";	b <= x"00000000";	f <= "111";
				wait for 20 ns;
			a <= x"00000000";	b <= x"00000001";	f <= "111";
				wait for 20 ns;
			a <= x"00000000";	b <= x"FFFFFFFF";	f <= "111";
				wait for 20 ns;
			a <= x"00000001";	b <= x"00000000";	f <= "111";
				wait for 20 ns;
			a <= x"FFFFFFFF";	b <= x"00000000";	f <= "111";
				wait for 20 ns;
			
			a <= x"00000000"; b <= x"00000000"; f <= "000";
				
			wait;
		end process;	
	END;

### Testing ###
The testing was conducted using the ISim program with the ALU VHDL program file. 
Below are pictures of the testing from the ISim system. The boxes above each test show the function and values used in the next 20 ns of testing. Each of the tests outputted the correct results pertaining to the table as well as the functions and inputs not shown in the table.

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/420cfa43f2cf2f38ee254ff9432b7488ee982a00/CE4_Orner/ISim1.png?token=239cacb3b72f4c182188035bc5a7c3a40ad90dd8)

![mouseover text](https://bytebucket.org/Orner_Jacob/ece281/raw/420cfa43f2cf2f38ee254ff9432b7488ee982a00/CE4_Orner/ISim2.png?token=229c6880bc5bccc55ff99636937dc4fdcb714a79)

### Conclusions ###
Given the task of designing, writing, and testing an ALU in accordance with the instructions given in the lab document went well. The ALU performed as expected when tested using the testbench written in the ISim program. All functions performed correctly and the outputs matched those expected in the table which was filled in from the lab document.

In conclusion, the lab was executed as laid out in the lab documents and the designed ALU worked in accordance with the specifications given in the lab document. In working on this lab it was learned how to design, write, and test and ALU through VHDL coding.

### Documentation ###
None.