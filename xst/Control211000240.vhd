library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Cont_unit is
    Port ( op : in  STD_LOGIC_VECTOR (5 downto 0);
           RegDst : out  STD_LOGIC;
           ALUSrc : out  STD_LOGIC;
           MemtoReg : out  STD_LOGIC;
           RegWrite : out  STD_LOGIC;
           MemRead : out  STD_LOGIC;
           MemWrite : out  STD_LOGIC;
           Branch : out  STD_LOGIC;
           ALUOp : out  STD_LOGIC_VECTOR (1 downto 0));
			  
           
end Cont_unit;

architecture Behavioral of Cont_unit is

begin

process(op)
begin

if op="000000"then
			RegDst <='1';
         ALUSrc <='0';
         MemtoReg <='0';
         RegWrite <='1';
         MemRead <='0';
         MemWrite <='0';
         Branch <='0';
         ALUOp <="10";
elsif op ="100011" then 
			RegDst <='0';
         ALUSrc <='1';
         MemtoReg <='1';
         RegWrite <='1';
         MemRead <='1';
         MemWrite <='0';
         Branch <='0';
         ALUOp <="00";
elsif op ="101011" then
			RegDst <='0';
         ALUSrc <='1';
         MemtoReg <='0';
         RegWrite <='0';
         MemRead <='0';
         MemWrite <='1';
         Branch <='0';
         ALUOp <="00";
elsif op ="000100" then
			RegDst <='0';
         ALUSrc <='0';
         MemtoReg <='0';
         RegWrite <='0';
         MemRead <='0';
         MemWrite <='0';
         Branch <='1';
         ALUOp <="01";

end if;
end process;			
end Behavioral;

