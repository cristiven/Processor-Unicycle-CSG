--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:34:57 04/07/2016
-- Design Name:   
-- Module Name:   C:/Users/Cristian/Google Drive/CS se/Practice/Computer Architecture/Processor Unicycle 1.0/Processor_Unicycle_1.0/tb_PC.vhd
-- Project Name:  Processor_Unicycle_1.0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PC
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
 

 
ENTITY tb_PC IS
END tb_PC;
 
ARCHITECTURE behavior OF tb_PC IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PC
    PORT(
         address : IN  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         out_Instruction : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal address : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal out_Instruction : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PC PORT MAP (
          address => address,
          clk => clk,
          reset => reset,
          out_Instruction => out_Instruction
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
      -- hold reset state for 100 ns.
      wait for 100 ns;
					address <= x"00000000";
		reset <= '0';
					wait for 20 ns;
					address <= x"00000001";
					wait for 20 ns;
					address <= x"00000002";
					wait for 20 ns;
					address <= x"00000003";

      wait;
   end process;

END;
