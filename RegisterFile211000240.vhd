library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Reg_File is
    Port ( reg_one : in  STD_LOGIC_VECTOR (4 downto 0);
           reg_two : in  STD_LOGIC_VECTOR (4 downto 0);
           write_reg : in  STD_LOGIC_VECTOR (4 downto 0);
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
			  reg_write :in STD_LOGIC;
           data_one : out  STD_LOGIC_VECTOR (31 downto 0);
           data_two : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk: in std_logic
			  );
end Reg_File;

architecture Behavioral of Reg_File is

type regfile_type is array (0 to  31) of STD_LOGIC_VECTOR (31 downto 0);

signal Reg_Arr : regfile_type := ( 
			  X"00000000",X"00000000",X"00000000",X"00000000",
			  X"00000005",X"00000007",X"00000000",X"00000000",
			  X"00000000",X"00000000",X"00000000",X"00000000",
			  X"00000000",X"00000000",X"00000000",X"00000000",
			  X"00000000",X"00000000",X"00000000",X"00000000",
			  X"00000000",X"00000000",X"00000000",X"00000000",
			  X"00000000",X"00000000",X"00000000",X"00000000",
			  X"00000000",X"00000000",X"00000000",X"00000000");

begin


process(write_reg,reg_write,write_data,reg_one,reg_two,clk)

begin

data_one <= Reg_Arr(to_integer (unsigned(reg_one)));
data_two <= Reg_Arr(to_integer (unsigned(reg_two)));

if(rising_edge(clk) and reg_write = '1')then
		Reg_Arr (to_integer (unsigned(write_reg))) <= write_data;

end if;

end process;		
end Behavioral;

