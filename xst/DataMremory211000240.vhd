library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Data_memory is
    Port ( Address : in  STD_LOGIC_VECTOR (31 downto 0);
           WriteData : in  STD_LOGIC_VECTOR (31 downto 0);
           ReadData : out  STD_LOGIC_VECTOR (31 downto 0);
           m_read : in  STD_LOGIC;
           m_write : in  STD_LOGIC;
			  CLK : in STD_LOGIC);
			  
end Data_memory;

architecture Behavioral of Data_memory is
type RAM is array (0 to 95) of STD_LOGIC_VECTOR (7 downto 0);

signal mm :
RAM :=(
		X"AB",X"CD",X"EF",X"00",
		X"75",X"74",X"65",X"72",
		X"20",X"41",X"72",X"36",
		X"68",X"69",X"74",X"65",
		X"12",X"34",X"56",X"78",
		X"7F",X"7F",X"6D",X"6D",
		X"00",X"00",X"00",X"00",
		X"78",X"78",X"6A",X"6A",
		X"00",X"00",X"00",X"01",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00",
		X"00",X"00",X"00",X"00"
		);
begin
process(m_read,m_write,CLK,Address,WriteData)
begin

if m_read='1' and m_write='0' then
		--m_read
		ReadData (31 downto 24) <= mm(to_integer (unsigned(Address)));
		ReadData (23 downto 16)<= mm(to_integer (unsigned(Address))+1);
		ReadData (15 downto 8)<= mm(to_integer (unsigned(Address))+2);
		ReadData (7 downto 0) <= mm(to_integer (unsigned(Address))+3);
		--read from mem and output from read data
		
		--write to memory
	elsif m_read='0' and m_write='1' and rising_edge(CLK) then	
	   mm(to_integer (unsigned(Address))) <= WriteData(31 downto 24);
		mm(to_integer (unsigned(Address))+1) <= WriteData(23 downto 16);
		mm(to_integer (unsigned(Address))+2) <= WriteData(15 downto 8);
		mm(to_integer (unsigned(Address))+3) <= WriteData(7 downto 0);
		
	
end if;
end process;

end Behavioral;

