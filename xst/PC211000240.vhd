library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity pCount is
    Port ( clk : in  STD_LOGIC;
           pin : in  STD_LOGIC_VECTOR (31 downto 0);
           pout : out  STD_LOGIC_VECTOR (31 downto 0));
end pCount;

architecture Behavioral of pCount is
signal temp : STD_logic_vector (31 downto 0) := x"00000000";
begin

process(clk,pin)
begin
if (rising_edge (clk)) then
pout <= temp ;
end if;
if (falling_edge (clk)) then
temp <= pin;
end if;
end process;

end Behavioral;

