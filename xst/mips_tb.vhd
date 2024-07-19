LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY mips_tb IS
END mips_tb;
 
ARCHITECTURE behavior OF mips_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mips211000240
    PORT(
         CLKM : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLKM : std_logic := '0';

   -- Clock period definitions
   constant CLKM_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mips211000240 PORT MAP (
          CLKM => CLKM
        );

   -- Clock process definitions
   CLKM_process :process
   begin
		CLKM <= '0';
		wait for CLKM_period/2;
		CLKM <= '1';
		wait for CLKM_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLKM_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
