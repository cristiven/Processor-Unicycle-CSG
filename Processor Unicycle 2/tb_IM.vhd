--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:12:26 04/04/2016
-- Design Name:   
-- Module Name:   C:/Users/Cristian/Google Drive/C S se/Practice/Computer Architecture/Processor Unicycle 1.0/Processor_Unicycle_1.0/tb_IM.vhd
-- Project Name:  Processor_Unicycle_1.0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: IM
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
 
ENTITY tb_IM IS
END tb_IM;
 
ARCHITECTURE behavior OF tb_IM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT IM
    PORT(
         clk : IN  std_logic;
         address : IN  std_logic_vector(31 downto 0);
         reset : IN  std_logic;
         outInstruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal reset : std_logic := '0';

 	--Outputs
   signal outInstruction : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: IM PORT MAP (
          clk => clk,
          address => address,
          reset => reset,
          outInstruction => outInstruction
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      address <= "00000000000000000000000000000010";
      wait for 100 ns;	
			reset <= '1';
			wait for 100 ns;
			reset <= '0';
			address <= "00000000000000000000000000100000";
		
		wait;
   end process;

END;
