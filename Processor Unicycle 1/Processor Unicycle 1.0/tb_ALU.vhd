--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:43:49 04/07/2016
-- Design Name:   
-- Module Name:   C:/Users/Cristian/Google Drive/CS se/Practice/Computer Architecture/Processor Unicycle 1.0/Processor_Unicycle_1.0/tb_ALU.vhd
-- Project Name:  Processor_Unicycle_1.0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY tb_ALU IS
END tb_ALU;
 
ARCHITECTURE behavior OF tb_ALU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         CRs1 : IN  std_logic_vector(31 downto 0);
         CRs2 : IN  std_logic_vector(31 downto 0);
         Aluop : IN  std_logic_vector(5 downto 0);
         Carry : IN  std_logic;
         AluResult : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CRs1 : std_logic_vector(31 downto 0) := (others => '0');
   signal CRs2 : std_logic_vector(31 downto 0) := (others => '0');
   signal Aluop : std_logic_vector(5 downto 0) := (others => '0');
   signal Carry : std_logic := '0';

 	--Outputs
   signal AluResult : std_logic_vector(31 downto 0);
   
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          CRs1 => CRs1,
          CRs2 => CRs2,
          Aluop => Aluop,
          Carry => Carry,
          AluResult => AluResult
        );

   -- Stimulus process
   stim_proc: process
   begin		
      CRs1 <= "00000000000000000000000000000110";
		CRs2 <= "00000000000000000000000000000100";
		Aluop <= "000000";
      wait for 100 ns;
		CRs1 <= "00000000000000000000000000000100";
		CRs2 <= "00000000000000000000000000000110";		
		Aluop <= "000001";
		wait for 100 ns;
		CRs1 <= "00000000000000000000000000000110";
		CRs2 <= "00000000000000000000000000000100";
		Aluop <= "000010";
      wait for 100 ns;
		CRs1 <= "00000000000000000000000000000110";
		CRs2 <= "00000000000000000000000000000100";
		Aluop <= "000101";
		wait;

   end process;

END;
