LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Cont_Unit_test IS
END Cont_Unit_test;
 
ARCHITECTURE behavior OF Cont_Unit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Cont_unit
    PORT(
         op : IN  std_logic_vector(5 downto 0);
         RegDst : OUT  std_logic;
         ALUSrc : OUT  std_logic;
         MemtoReg : OUT  std_logic;
         RegWrite : OUT  std_logic;
         MemRead : OUT  std_logic;
         MemWrite : OUT  std_logic;
         Branch : OUT  std_logic;
         ALUOp : OUT  std_logic_vector(1 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal RegDst : std_logic;
   signal ALUSrc : std_logic;
   signal MemtoReg : std_logic;
   signal RegWrite : std_logic;
   signal MemRead : std_logic;
   signal MemWrite : std_logic;
   signal Branch : std_logic;
   signal ALUOp : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Cont_unit PORT MAP (
          op => op,
          RegDst => RegDst,
          ALUSrc => ALUSrc,
          MemtoReg => MemtoReg,
          RegWrite => RegWrite,
          MemRead => MemRead,
          MemWrite => MemWrite,
          Branch => Branch,
          ALUOp => ALUOp
        );



   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		op<="000000";
      wait for 100 ns;	
		op<="100011";
      wait for 100 ns;
		op<="101011";
      wait for 100 ns;	
		op<="000100";
      wait for 100 ns;	
		

      wait;
   end process;

END;
