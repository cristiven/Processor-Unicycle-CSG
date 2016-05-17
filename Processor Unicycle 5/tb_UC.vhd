--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:35:52 04/02/2016
-- Design Name:   
-- Module Name:   C:/Users/Cristian/Google Drive/C S se/Practice/Computer Architecture/Processor Unicycle 1.0/Processor_Unicycle_1.0/tb_UC.vhd
-- Project Name:  Processor_Unicycle_1.0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: UC
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_UC IS
END tb_UC;
 
ARCHITECTURE behavior OF tb_UC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT UC
    PORT(
         op : IN  std_logic_vector(1 downto 0);
         Aluop_UC : OUT  std_logic_vector(5 downto 0);
         op3 : IN  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal op : std_logic_vector(1 downto 0) := (others => '0');
   signal op3 : std_logic_vector(5 downto 0) := (others => '0');

 	--Outputs
   signal Aluop_UC : std_logic_vector(5 downto 0);
  
BEGIN
  
	-- Instantiate the Unit Under Test (UUT)
   uut: UC PORT MAP (
          op => op,
          Aluop_UC => Aluop_UC,
          op3 => op3
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
			op <= "10";
			op3 <= "000000" ;
			
      wait for 100 ns;
			op <= "10";
			op3 <= "010000" ;
			
      wait for 100 ns;
			op <= "00";
			op3 <= "000000" ;
		
		

      wait;
   end process;

END;
