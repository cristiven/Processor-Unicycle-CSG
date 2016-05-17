--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:30:48 05/10/2016
-- Design Name:   
-- Module Name:   C:/Users/Cristian/Google Drive/CS se/Practice/Computer Architecture/PU 5.0/Processor_Unicycle_5/tb_DM.vhd
-- Project Name:  Processor_Unicycle_5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: DM
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
 
ENTITY tb_DM IS
END tb_DM;
 
ARCHITECTURE behavior OF tb_DM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT DM
    PORT(
         reset : IN  std_logic;
         wrenmem : IN  std_logic;
         addressDM : IN  std_logic_vector(31 downto 0);
         CRd : IN  std_logic_vector(31 downto 0);
         data : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal wrenmem : std_logic := '0';
   signal addressDM : std_logic_vector(31 downto 0) := (others => '0');
   signal CRd : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal data : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: DM PORT MAP (
          reset => reset,
          wrenmem => wrenmem,
          addressDM => addressDM,
          CRd => CRd,
          data => data
        );

   
   
   

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      
		reset<='0';
		wrenmem<='1';
		addressDM <= "00000000000000000000000000000001";
		CRd <= "00000000000000000000000000000100";
		
		wait for 20 ns;	
		
		
      wait;
   end process;

END;
