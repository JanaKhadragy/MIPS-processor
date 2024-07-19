library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux_32 is
    Port ( a : in  STD_LOGIC_VECTOR (31 downto 0);
           b : in  STD_LOGIC_VECTOR (31 downto 0);
           sel : in   STD_LOGIC;
           output : out STD_LOGIC_VECTOR (31 downto 0));
end mux_32;

architecture Behavioral of mux_32 is

begin
	process(a,b,sel)
	begin
	if sel = '0'
		then output <= a;
	else 
		output <= b;
	end if ;
end process	;


end Behavioral;

