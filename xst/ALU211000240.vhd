library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_cont is
    Port ( inst : in  STD_LOGIC_VECTOR (5 downto 0);
           aluop : in  STD_LOGIC_VECTOR (1 downto 0);
           aluout : out  STD_LOGIC_VECTOR (3 downto 0));
end alu_cont;

architecture Behavioral of alu_cont is

begin
process(aluop,inst)
begin


if (aluop ="00")then
	aluout <= "0010";
	end if;
if (aluop ="01")then	
	aluout <= "0110";
	end if;
	
if (aluop ="10") and inst(3 downto 0) ="0000"	
then	aluout <= "0010";

elsif (aluop ="10")and inst(3 downto 0) ="0010"
then	aluout <= "0110";

elsif (aluop ="11")and inst(3 downto 0) ="0010"
then	aluout <= "0110";

elsif (aluop ="10")and inst(3 downto 0) ="0100"
then	aluout <= "0000";

elsif (aluop ="10")and inst(3 downto 0) ="0101"
then	aluout <= "0010";

elsif (aluop ="10")and inst(3 downto 0) ="1010"
then	aluout <= "0111";

elsif (aluop ="11")and inst(3 downto 0) ="1010"
then	aluout <= "0111";		

end if;
end process;
end Behavioral;

