library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity instructionMemory is
    Port ( readAddress : in  STD_LOGIC_VECTOR (31 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0)
			  --clk:in  STD_LOGIC
			  );
end instructionMemory;

architecture Behavioral of instructionMemory is
TYPE RAM IS ARRAY(0 TO 63) OF std_logic_vector(7 DOWNTO 0);
	SIGNAL IM : RAM := (
			x"00", x"85", x"10", x"20",--add,$v0,$a0,$a1
			x"AC", x"02", x"00", x"08",--sw,$v0,8($zero)
			x"8C", x"06", x"00", x"08",--lw,$a2,8($zero)
			x"10", x"46", x"00", x"01",--beq,$v0,$a2,Good_Pross
			x"00", x"46", x"88", x"2A",--slt,$s1,$v0,$a2
			x"00", x"A4", x"88", x"22",--Good_Pross: sub,$s1,$a1,$a0
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00",
			x"00", x"00", x"00", x"00"
			 );
						
begin

instruction(31 downto 24)<= IM(to_integer((unsigned(readAddress))));
instruction(23 downto 16)<= IM(to_integer((unsigned(readAddress)+1)));
instruction(15 downto 8)<= IM(to_integer((unsigned(readAddress)+2)));
instruction(7 downto 0)<= IM(to_integer((unsigned(readAddress)+3)));

end Behavioral;

