LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY alu_cont_test IS
END alu_cont_test;
 
ARCHITECTURE behavior OF alu_cont_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_cont
    PORT(
         inst : IN  std_logic_vector(5 downto 0);
         aluop : IN  std_logic_vector(1 downto 0);
         aluout : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inst : std_logic_vector(5 downto 0) := (others => '0');
   signal aluop : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal aluout : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu_cont PORT MAP (
          inst => inst,
          aluop => aluop,
          aluout => aluout
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      aluop <="00";
		--inst <="XXXXXX";
      wait for 100 ns;	
		 
		aluop <="01";
		--inst <="XXXXXX";
      wait for 100 ns;	
		
		aluop <= "10";
		inst (3 downto 0)<="0000";
      wait for 100 ns;
		
		aluop <="10";
		inst (3 downto 0)<="0010";
      wait for 100 ns;

		aluop <="11";
		inst (3 downto 0)<="0010";
      wait for 100 ns;		
		
		aluop <="10";
		inst (3 downto 0)<="0100";
      wait for 100 ns;	
		
		aluop <="10";
		inst(3 downto 0) <="0101";
      wait for 100 ns;	
		
		aluop <="10";
		inst (3 downto 0)<="1010";
      wait for 100 ns;
		
		aluop <="11";
		inst(3 downto 0) <="1010";
      wait for 100 ns;		

      -- insert stimulus here 

      wait;
   end process;

END;
