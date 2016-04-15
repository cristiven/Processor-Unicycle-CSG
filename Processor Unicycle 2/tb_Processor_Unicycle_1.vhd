--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:56:28 04/10/2016
-- Design Name:   
-- Module Name:   C:/Users/Cristian/Google Drive/CS se/Practice/Computer Architecture/Processor Unicycle 1.0/Processor_Unicycle_1.0/tb_Processor_Unicycle_1.vhd
-- Project Name:  Processor_Unicycle_1.0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Processor_Unicycle_1
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_Processor_Unicycle_1 IS
END tb_Processor_Unicycle_1;
 
ARCHITECTURE behavior OF tb_Processor_Unicycle_1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Processor_Unicycle_1
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
   uut: Processor_Unicycle_1 PORT MAP (
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
      wait for 100 ns;
		reset <= '0';
		wait for 200 ns;
		reset <= '1';
		
      wait;
   end process;

END;
