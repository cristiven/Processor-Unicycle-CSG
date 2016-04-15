--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   22:04:53 04/02/2016
-- Design Name:   
-- Module Name:   C:/Users/Cristian/Google Drive/C S se/Practice/Computer Architecture/Processor Unicycle 1.0/Processor_Unicycle_1.0/tb_Add.vhd
-- Project Name:  Processor_Unicycle_1.0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Add
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
 
ENTITY tb_Add IS
END tb_Add;
 
ARCHITECTURE behavior OF tb_Add IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Add
    PORT(
         oper1 : IN  std_logic_vector(31 downto 0);
         oper2 : IN  std_logic_vector(31 downto 0);
         resul : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs 
   signal oper1 : std_logic_vector(31 downto 0) := (others => '0');
   signal oper2 : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal resul : std_logic_vector(31 downto 0);
  
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Add PORT MAP (
          oper1 => oper1,
          oper2 => oper2,
          resul => resul
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
         oper1 <= "00000000000000000000000000000000";
			oper2 <= "00000000000000000000000000000100" ;
			
      wait for 100 ns;
			oper1 <= "00000000000000000000000000001000" ;
			oper2 <= "00000000000000000000000000000100" ;

      wait;
   end process;

END;
