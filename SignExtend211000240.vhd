library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity signExtender is
    Port ( sign_in : in  STD_LOGIC_VECTOR (15 downto 0);
           sign_out : out  STD_LOGIC_VECTOR (31 downto 0));
end signExtender;

architecture Behavioral of signExtender is

begin

sign_out (15 downto 0) <= sign_in;

process(sign_in)

begin

if (sign_in(15) <= '0') then
	sign_out(31 downto 16) <= X"0000";

elsif (sign_in(15) <= '1') then
		sign_out(31 downto 16) <= X"1111";

end if;		
end process;
end Behavioral;

