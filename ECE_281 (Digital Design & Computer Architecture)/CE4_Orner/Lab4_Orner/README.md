## Lab 4 ##

### Purpose ###
The purpose of this lab was to synthesize and implement VHDL code on a FPGA. It involved testing and debugging an elevator controller shell created in an earlier exercise and configuring both a Mealy and a Moore state machine on an FPGA. Following this, the code was modified as to allow the state machines to perform more complex and diverse actions.
The purpose of this lab was to build a simplified MIPS single-cycle processor using VHDL, load a test program and confirm that the system works, implement two new instructions, and write a new test program that confirms the new instructions work as well. 

### Prelab ###
The prelab for this lab included creating a text file named memfile.dat which contained the machine code instructions for the single-cycle MIPS processor. Below are the lines from the file created.

	20020005
	2003000c
	2067fff7
	00e22025
	00642824
	00a42820
	10a7000a
	0064202a
	10800001
	20050000
	00e2202a
	00853820	
	00e23822
	ac670044
	8c020050
	08000011
	20020001
	ac020054

These lines contained the initial program used to test the single-cycle MIPS processor. Other work done in the prelab included changing the file location of the data file in the mips_combo.vhd file which was used to find the file containing the instructions above. Also contained in the prelab was a table which was completed predicting the outputs given by the processor pertaining to each instruction. Followed with the question 'What address will the final instruction write to and what value will it write?'. The answer to this question is that it will write to the address 0x00000054 with the value of 7. Below is the table which was filled in for the prelab. 

| Cycle	| reset | pc | instr | branch | src_a | src_b | alu_result | zero | pc_src | write_data | mem_write | read_data |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 1 | 1 | 00 | addi $2,$0,5 20020005 | 0 | 0 | 5 | 5 | 0 | 0 | 0 | 0 | X | 
| 2 | 0 | 04 | addi $3,$0,12 2003000c | 0 | 0 | c | c | 0 | 0 | 0 | 0 | X |
| 3	| 0	| 08 | addi $7,$3,-9 2067fff7 | 0 | c | -9 | 3 | 0 | 0 | 0 | 0 | X |
| 4	| 0	| 0C | or $4,$7,$2 00e22025 | 0	| 3	| 5	| 7	| 0	| 0	| 0	| 0	| X |
| 5	| 0	| 10 | and $5,$3,$4 00642824 | 0 | c | 7 | 4 | 0 | 0 | 0 | 0 | X |
| 6	| 0	| 14 | add $5,$5,$4 00a42820 | 0 | 4 | 7 | b | 0 | 0 | 0 | 0 | X |
| 7	| 0 | 18 | beq $5,$7,end 10a7000a | 1 | b | 3 | 8 | 0 | 0 | 0 | 0 | X | 
| 8	| 0 | 1C | slt $4,$3,$4 0064202a | 0 | c | 7 | 0 | 1 | 0 | 0 | 0 | X | 
| 9	| 0 | 20 | beq$4,$0,around 10800001 | 1 | 0 | 0 | 0 | 1 | 1 | 0 | 0 | X | 
| 10 | 0 | 24 | slt $4,$7,$2 00e2202a | 0 | 3 | 5 | 1 | 0 | 0 | 0 | 0 | X | 
| 11 | 0 | 28 | add $7,$4,$5 00853820 | 0 | 1 | b | c | 0 | 0 | 0 | 0 | X | 
| 12 | 0 | 2C | sub $7,$7,$2 00e23822 | 0 | c | 5 | 7 | 0 | 0 | 0 | 0 | X | 
| 13 | 0 | 30 | sw $7, 68($3) ac670044 | 0 | c | [44] | [50] | 0 | 0 | 7 | 1 | X| 
| 14 | 0 | 34 | lw $2,80($0) 8c020050 | 0 | 0 | [50] | [50] | 0 | 0 | 0 | 0 | 1 | 
| 15 | 0 | 38 | j end 08000011 | x | x | x | x | x | 0 | 0 | 0 | X | 
| 16 | 0 | 3C | sw $2,84($0) ac020054 | 0 | 0 | [54] | [54] | 0 | 0 | 7 | 1 | X |

### Schematics ###
For this lab a schematic was given, but part of the assignment was to modify the given schematic to allow the microprocessor to perform the ori and bne commands. Below is the original schematic followed by the modified schematic.

![Original Schematic](https://bytebucket.org/Orner_Jacob/ece281/raw/11515e46cb70161a53a5cd08664428e0315a5575/Lab4_Orner/OriginalSchematic.png?token=58c561040645dbb0dd3c69b647fd996df23bee90)

![Updated Schematic](https://bytebucket.org/Orner_Jacob/ece281/raw/213fb49749bb013c464ff617bd118b804fadca04/Lab4_Orner/UpdatedSchematic.png?token=a349b311c1590b2c5934581c6eb42af1d035ecbf)

As you can see, in the updated schematic, a the mux for source B was changed from a two input mux to a three input mux allowing for the ori function to work, as well as another and gate was added for pcsrc, allowing the bne function to work.

### Code written ###
For the first step of the lab, the only code written was the component declaration and architecture for the alu, which are included below.

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

This code was added into the original mips_combo.vhd file given and allowed the initial set of machine code to run properly as planned.

Following the first part of the lab, the changes to the schematic as referenced above needed to be made, which necessitated code to be written in order to make these changes. This first change was the creation of a 3 input mux. Below is the code written for the declaration, instantiation, and architecture, respectively.

This code created the mux, with d0, d1, and d2 as the inputs, s as the selector, and y as the output.

  	component mux3
    port(d0, d1, d2: in  STD_LOGIC_VECTOR(31 downto 0);
         s:      in  STD_LOGIC_VECTOR(1 downto 0);
         y:      out STD_LOGIC_VECTOR(31 downto 0));
  	end component;

This code instantiated scrbmux as a mux3 with the inputs from writedata, signimm, and zeroimm, a selector of alusrc, and the output srcb.

	srcbmux: mux3 port map(writedata, signimm, zeroimm, alusrc, srcb); 

This code gave the mux instructions on how to act depending on the selector input. For each input, the mux outputted a specific input that it was given.
 
	architecture behave of mux3 is
		begin
		y <= d1 when s = "00" else
		d0 when s = "01" else
		d0 when s = "10" else
		d2 when s = "11" else
		X"00000000";
	end;

To allow for the ori and bne functions to be processed, code was written to take in their op functions in order to set the correct outputs for these functions. Below is the code written to do this.

		when "001101" => controls <= "101000011"; -- ORI
		when "000101" => controls <= "000100001"; -- BNE

Also changed was the assignment of alusrc in the maindec architecture. This output was changed to be two bits instead of one in order to differentiate for the three input mux. The alusrc was changed to match the output to the aluop and the mux3 was programmed to read this data and make the correct decision of what to pass on to the alu.

	regwrite <= controls(8);
	regdst   <= controls(7);
	alusrc   <= controls(1 downto 0);  
	branch   <= controls(5);
	memwrite <= controls(4);
	memtoreg <= controls(3);
	jump     <= controls(2);
	aluop    <= controls(1 downto 0); 

In order to correctly run the bne function, the pcsrc assignment also needed to be changed. An and gate was added with the inputs of zero, branch, and the opcode bit which differentiated the bne function from the beq function. Below is the code written to do this.

	pcsrc <= (branch and zero and not op(0)) or (branch and not zero and op(0));

In order to perform the ori function, a zero extender was created. Below is the declaration, instantiation, and architecture, respectively. 

  	component zeroext
    port(a: in  STD_LOGIC_VECTOR(15 downto 0);
         y: out STD_LOGIC_VECTOR(31 downto 0));
  	end component;

	ze: zeroext port map(instr(15 downto 0), zeroimm);

	architecture behave of zeroext is
	begin
	  y <= X"0000" & a; 
	end;

Also written for the lab was a testbench which allowed the microprocessor to be tested. Below is the code written for the testbench.

	stim_proc: process
	begin		
		reset <= '1';
			wait for 10 ns;

      -- insert stimulus here 		
		reset <= '0';
      wait;
	end process;

This code caused a reset in the microprocessor, and following the reset being turned from 1 to 0, the machine code ran. Below is the machine code used for the second part of the lab, which tested the ori and bne functions.

	34088000
	20098000
	350a8001
	11090005
	0128582a
	15600001
	08100009
	01485022
	350800ff
	016a5820
	01484022
	ad0b0052


### Debugging ###
Throughout the creation and testing of the microprocessor there were several bugs which had to be fixed. Although none were found on the first part of the lab, the second section of the lab had several. The first was during the change of alusrc from a one bit to a two bit signal. I had to move through the mips_combo file and change each declaration of the alusrc signal from std_logic to std_logic_vector(1 downto 0). This took some time but was reconciled immediately. The next issue was with the mux3 controller. Originally, I had written a process to take place within the mux which caused the logic to be used each time the input signal changed, however, if two of the same signals were used, the mux would use the first input for both of those signals. This was reconciled after some time, and is represented in the code above. Other than these minor bugs, there were no other issues in the creation of the microprocessor. 

### Testing ###
The testing for each part of the lab was conducted using the ISim Simulator Program below is the screenshots from the first part of the lab.

![Program 1 Test 1](https://bytebucket.org/Orner_Jacob/ece281/raw/11515e46cb70161a53a5cd08664428e0315a5575/Lab4_Orner/memfile11.png?token=bdc097aa4ddc494551ef6e7af0feceaf2397a8ce)

![Program 2 Test 2](https://bytebucket.org/Orner_Jacob/ece281/raw/11515e46cb70161a53a5cd08664428e0315a5575/Lab4_Orner/memfile12.png?token=a85df58564d2060260fc2f9f74542bf8a7f49c49)

These pictures show the testing of the first program, and each have captions explaining that each of the tests is correct in the outputs it is showing. 

For the first program, each of the functions given in the machine code were correctly handled and the outputs matched what was expected from the table that was filled out in the prelab.

For the second set of testing, the conditions were the same as the first. Below are the screenshots from the tests conducted on the second part of the lab.

![Program 2 Test 1](https://bytebucket.org/Orner_Jacob/ece281/raw/62a119781022ee1ec76638f0074a2e1f7f625afb/Lab4_Orner/memfile21.png?token=1075d67ef9ef29072fef9572b2599b2593178f70)

![Program 2 Test 2](https://bytebucket.org/Orner_Jacob/ece281/raw/62a119781022ee1ec76638f0074a2e1f7f625afb/Lab4_Orner/memfile22.png?token=7a95b59079dbad044fb2798dff515f7186b6ff12)

![Program 2 Test 3](https://bytebucket.org/Orner_Jacob/ece281/raw/62a119781022ee1ec76638f0074a2e1f7f625afb/Lab4_Orner/memfile23.png?token=a5f36b4f98d77635bbe91694664ae444b81bf831)

The captions in each of these pictures of the testing show that the program works as expected and the outputs are correct. In the lab document there was a question asking what address and data value are written by the sw instruction. The answer to this question is that the value 2 is written to the address at 0xFFFF7F54.

### Observations and Conclusions ###
The work for this lab was very intensive as well as tedious. Changing even the slightest piece of hardware in the vhd files necessitated many changes throughout the whole file. Overall, this lab allowed me to learn about microprocessors and the structures used to create them. This lab allowed me to learn about coding in VHDL and creating complex structures using VHDL coding. In conclusion, the lab was a success and the microprocessor was created as laid out in the lab document and also ran as expected. The lab was a success and the process of creating a microprocessor was a good learning experience.


### Documentation ###
None.