library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_5bit is
    Port ( a : in  STD_LOGIC_VECTOR (4 downto 0);
           b : in  STD_LOGIC_VECTOR (4 downto 0);
           sel : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (4 downto 0));
end mux_5bit;

architecture Behavioral of mux_5bit is

begin

process(a,b,sel)

begin

if(sel = '0') then
output <= a;
elsif sel = '1' then
output <= b;
end if;
end process;

end Behavioral;

