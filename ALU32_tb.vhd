LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY alu_test IS
END alu_test;
 
ARCHITECTURE behavior OF alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu_32
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         s : IN  std_logic_vector(3 downto 0);
         res : OUT  std_logic_vector(31 downto 0);
         zero : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal s : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal res : std_logic_vector(31 downto 0);
   signal zero : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu_32 PORT MAP (
          a => a,
          b => b,
          s => s,
          res => res,
          zero => zero
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 
		a <= X"00000001";
		b <= X"00000000";
		s <= "0000";
		wait for 100 ns;	
		
		s <= "0001";
		wait for 100 ns;
		
		s <= "0010";
		wait for 100 ns;	
		
		s <= "0110";
		wait for 100 ns;	
		
		s <= "0111";
		wait for 100 ns;	
		
		s <= "1100";
		wait for 100 ns;	


      wait;
   end process;

END;
