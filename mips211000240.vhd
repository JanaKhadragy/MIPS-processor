library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mips211000240 is
	PORT (
		CLKM : IN STD_LOGIC
		);
end mips211000240;

architecture Behavioral of mips211000240 is

COMPONENT Adder is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           c : out  STD_LOGIC_VECTOR (31 downto 0));
end COMPONENT;

COMPONENT Cont_unit is
   Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR (1 downto 0));
			  
end COMPONENT;

COMPONENT Data_memory is
  Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData : out  STD_LOGIC_VECTOR (31 downto 0);
           m_read : in  STD_LOGIC;
           m_write : in  STD_LOGIC;
			  CLK : in STD_LOGIC);
			  
end COMPONENT;

COMPONENT Reg_File is
   Port ( reg_one : in  STD_LOGIC_VECTOR (4 downto 0);
           reg_two : in  STD_LOGIC_VECTOR (4 downto 0);
           write_reg : in  STD_LOGIC_VECTOR (4 downto 0);
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
			  reg_write :in STD_LOGIC;
           data_one : out  STD_LOGIC_VECTOR (31 downto 0);
           data_two : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in std_logic
			  );
			  
end COMPONENT;

COMPONENT alu_32 is
  Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           s : in  STD_LOGIC_VECTOR (3 downto 0);
           res : out  STD_LOGIC_VECTOR (31 downto 0);
           zero : out  STD_LOGIC);
			  
end COMPONENT;

COMPONENT alu_cont is
	Port ( inst : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : in  STD_LOGIC_VECTOR (1 downto 0);
           aluout : out  STD_LOGIC_VECTOR (3 downto 0));
			  
end COMPONENT;

COMPONENT instructionMemory is
	Port ( readAddress : in  STD_LOGIC_VECTOR (31 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0)
			  );
			  
end COMPONENT;

COMPONENT mux_32 is
	Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in   STD_LOGIC;
           output : out STD_LOGIC_VECTOR (31 downto 0));
			  
end COMPONENT;

COMPONENT mux_5bit is
 Port ( a : in  STD_LOGIC_VECTOR (4 downto 0);
           b : in  STD_LOGIC_VECTOR (4 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (4 downto 0));
			  
end COMPONENT;

COMPONENT pCount is
	 Port ( clk : in  STD_LOGIC;
           pin : in  STD_LOGIC_VECTOR (31 downto 0);
           pout : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end COMPONENT;

COMPONENT sheftLeft is
	Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end COMPONENT;

COMPONENT signExtender is
	 Port ( sign_in : in  STD_LOGIC_VECTOR (15 downto 0);
           sign_out : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end COMPONENT;

   signal ALUinput1: std_logic_vector(31 downto 0);
	signal ALUinput2: std_logic_vector(31 downto 0);
	signal ALUoutput: std_logic_vector(31 downto 0);
	signal ALUzeroFlag: std_logic;
	signal ALUselect: std_logic_vector(3 downto 0);
	
	signal PCoutput: std_logic_vector(31 downto 0);
	signal PCinput: std_logic_vector (31 downto 0);
	signal AdderOut: std_logic_vector (31 downto 0);
	
	signal inputInstruction: std_logic_vector (31 downto 0);
	signal readData2: std_logic_vector (31 downto 0);
	signal dataMemoryOut: std_logic_vector (31 downto 0);
	signal writeDataIn: std_logic_vector (31 downto 0);
	signal MUXregDstOut:std_logic_vector (4 downto 0);
	
	signal regDstControlSig: std_logic;
	signal branchControlSig: std_logic;
	signal memReadControlSig: std_logic;
	signal memToRegControlSig: std_logic;
	signal ALUopControl: std_logic_vector (1 downto 0);
	signal memWriteControlSig: std_logic;
	signal ALUSrcControlSig: std_logic;
	signal RegWriteControlSig: std_logic;
	
	signal signExtend: std_logic_vector (31 downto 0);
	signal shiftLeft2: std_logic_vector (31 downto 0);
	
	signal ALUoutputToPCMUX: std_logic_vector (31 downto 0);
	signal PCMUXcontrol: std_logic;

begin

PC : pCount PORT MAP(
		clk => CLKM,
      pin =>PCinput,
      pout => PCoutput	  
		);


IM : instructionMemory PORT MAP(
			readAddress => PCoutput,
         instruction => inputInstruction
			);

muxRd : mux_5bit PORT MAP(
			a => inputInstruction (20 downto 16),
         b => inputInstruction (15 downto 11),
         sel => regDstControlSig,
         output => MUXregDstOut 
			  );

RF : Reg_File PORT MAP( 
			reg_one => inputInstruction (25 downto 21),
           reg_two => inputInstruction (20 downto 16),
           write_reg => MUXregDstOut,
           write_data => writeDataIn,
			  reg_write => RegWriteControlSig,
           data_one => ALUinput1,
           data_two => readData2,
			  clk => CLKM
			  );

DM : Data_memory PORT MAP (
			Address  => ALUoutput,
           WriteData => readData2,
           ReadData  => dataMemoryOut,
           m_read => memReadControlSig,
           m_write => memWriteControlSig,
			  CLK  => CLKM
			  );
			  
CU : Cont_unit PORT MAP ( 
			op => inputInstruction (31 downto 26),
         RegDst => regDstControlSig,
         ALUSrc => ALUSrcControlSig,
         MemtoReg => memToRegControlSig,
         RegWrite => RegWriteControlSig,
         MemRead => memReadControlSig,
         MemWrite => memWriteControlSig,
         Branch => branchControlSig,
         ALUOp => ALUopControl
			);

AL : alu_32 PORT MAP( 
			a => ALUinput1,
           b => ALUinput2,
           s => ALUselect,
           res => ALUoutput,
           zero => ALUzeroFlag
			  );			

ALUCONT : alu_cont PORT MAP(
			  inst => inputInstruction (5 downto 0),
           aluop => ALUopControl,
           aluout => ALUselect
			  );

muxALU : mux_32 PORT MAP(
			a => readData2,
           b => signExtend,
           sel => ALUSrcControlSig,
           output => ALUinput2 
			  );

PCMUXcontrol <= (branchControlSig AND ALUzeroFlag);

muxPC : mux_32 PORT MAP( 
			a => AdderOut,
           b => ALUoutputToPCMUX,
           sel => PCMUXcontrol,
           output=> PCinput
			  );

Add1 : Adder PORT MAP(
		a => PCoutput,
      b => x"00000004",
      c => AdderOut
		);

SE : signExtender PORT MAP(
			sign_in => inputInstruction (15 downto 0),
           sign_out => signExtend
			  );

SHL : sheftLeft PORT MAP (
			a  => signExtend,
           b => shiftLeft2
			  );		

Add2 : Adder PORT MAP(
		a => AdderOut,
      b => shiftLeft2,
      c => ALUoutputToPCMUX
		);
muxmem : mux_32 PORT MAP(
a => ALUoutput,
b => dataMemoryOut,
sel => memToRegControlSig,
output => writeDataIn 
);
		


end Behavioral;

