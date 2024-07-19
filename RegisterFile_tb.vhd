LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY Reg_test IS
END Reg_test;
 
ARCHITECTURE behavior OF Reg_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reg_File
    PORT(
         reg_one : IN  std_logic_vector(4 downto 0);
         reg_two : IN  std_logic_vector(4 downto 0);
         write_reg : IN  std_logic_vector(4 downto 0);
         write_data : IN  std_logic_vector(31 downto 0);
         reg_write : IN  std_logic;
         data_one : OUT  std_logic_vector(31 downto 0);
         data_two : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reg_one : std_logic_vector(4 downto 0) := (others => '0');
   signal reg_two : std_logic_vector(4 downto 0) := (others => '0');
   signal write_reg : std_logic_vector(4 downto 0) := (others => '0');
   signal write_data : std_logic_vector(31 downto 0) := (others => '0');
   signal reg_write : std_logic := '0';

 	--Outputs
   signal data_one : std_logic_vector(31 downto 0);
   signal data_two : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg_File PORT MAP (
          reg_one => reg_one,
          reg_two => reg_two,
          write_reg => write_reg,
          write_data => write_data,
          reg_write => reg_write,
          data_one => data_one,
          data_two => data_two
        );

  

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


      -- insert stimulus here 

reg_one <= "00000";
reg_two <= "00001";
 wait for 100 ns;
 reg_write <= '1';
write_reg <= "00001";
write_data <= X"01010101";
      wait;
   end process;

END;
