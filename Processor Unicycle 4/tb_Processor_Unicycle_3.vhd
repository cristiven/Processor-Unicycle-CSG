--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:28:36 04/18/2016
-- Design Name:   
-- Module Name:   C:/Users/Cristian/Google Drive/CS se/Practice/Computer Architecture/PU 3.0/Processor_Unicycle_3/tb_Processor_Unicycle_3.vhd
-- Project Name:  Processor_Unicycle_3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Processor_Unicycle_3
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
 
ENTITY tb_Processor_Unicycle_3 IS
END tb_Processor_Unicycle_3;
 
ARCHITECTURE behavior OF tb_Processor_Unicycle_3 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processor_Unicycle_3
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         AluResultPU : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal AluResultPU : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Processor_Unicycle_3 PORT MAP (
          clk => clk,
          reset => reset,
          AluResultPU => AluResultPU
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
      reset <= '1';
      wait for 250 ns;
		reset <= '0';
		wait for 500 ns;

      wait;
   end process;

END;
