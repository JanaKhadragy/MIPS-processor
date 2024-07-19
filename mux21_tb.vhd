LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mux_2to1 IS
END mux_2to1;
 
ARCHITECTURE behavior OF mux_2to1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_32
    PORT(
         a : IN  std_logic_vector(31 downto 0);
         b : IN  std_logic_vector(31 downto 0);
         output : OUT  std_logic_vector(31 downto 0);
         sel : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(31 downto 0) := (others => '0');
   signal b : std_logic_vector(31 downto 0) := (others => '0');
   signal sel : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_32 PORT MAP (
          a => a,
          b => b,
          output => output,
          sel => sel
        );


 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      

      -- insert stimulus here 
		a <= X"FFFFFFFF";
		b <= X"00000000";
		sel <= '0';
		wait for 100 ns;	
		sel <= '1';
      wait;
   end process;

END;
