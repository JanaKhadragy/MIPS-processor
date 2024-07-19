library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity alu_32 is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           s : in  STD_LOGIC_VECTOR (3 downto 0);
           res : out  STD_LOGIC_VECTOR (31 downto 0);
           zero : out  STD_LOGIC);
end alu_32;
---------------------------------------------------------------------
architecture Behavioral of alu_32 is

begin
process(a,b,s)
begin

if(s="0000")then
res <= a AND b;

elsif (s="0001") then
res <= a or b;

elsif (s="0010") then
res <= a + b;

elsif (s="0110") then
res <= a - b;

elsif (s="0111") then
	if a < b
		then res <= X"00000001";
	else 
		res <= X"00000000";
	end if;
	
elsif (s="1100") then
res <= a nor b;

end if;
if a = b then
zero <='1';
else
zero <='0';
end if;

end process;
end Behavioral;

