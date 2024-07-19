LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Data_Mem_test IS
END Data_Mem_test;
 
ARCHITECTURE behavior OF Data_Mem_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Data_memory
    PORT(
         Address : IN  std_logic_vector(31 downto 0);
         WriteData : IN  std_logic_vector(31 downto 0);
         ReadData : OUT  std_logic_vector(31 downto 0);
         m_read : IN  std_logic;
         m_write : IN  std_logic;
         CLK : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Address : std_logic_vector(31 downto 0) := (others => '0');
   signal WriteData : std_logic_vector(31 downto 0) := (others => '0');
   signal m_read : std_logic := '0';
   signal m_write : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal ReadData : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Data_memory PORT MAP (
          Address => Address,
          WriteData => WriteData,
          ReadData => ReadData,
          m_read => m_read,
          m_write => m_write,
          CLK => CLK
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;
		
		Address<=X"00000000";
		m_read<='0';
		m_write<='1';
		WriteData<=X"11111111";
		wait for 100 ns;
		Address<=X"00000004";
		m_read<='1';
		m_write<='0';
		
		
		
		
      wait for 100 ns;
		wait for CLK_period*10;

      wait;
   end process;

END;
