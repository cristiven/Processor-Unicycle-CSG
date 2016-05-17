--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   15:48:08 04/04/2016
-- Design Name:   
-- Module Name:   C:/Users/Cristian/Google Drive/C S se/Practice/Computer Architecture/Processor Unicycle 1.0/Processor_Unicycle_1.0/tb_RF.vhd
-- Project Name:  Processor_Unicycle_1.0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RF
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
 
ENTITY tb_RF IS
END tb_RF;
 
ARCHITECTURE behavior OF tb_RF IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT RF
    PORT(
         reset : IN  std_logic; 
         rs1 : IN  std_logic_vector(4 downto 0);
         rs2 : IN  std_logic_vector(4 downto 0);
         rd : IN  std_logic_vector(4 downto 0);
         we : IN  std_logic;
         DWR : IN  std_logic_vector(31 downto 0);
         CRs1 : OUT  std_logic_vector(31 downto 0);
         CRs2 : OUT  std_logic_vector(31 downto 0);
         CRd : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal rs1 : std_logic_vector(4 downto 0) := (others => '0');
   signal rs2 : std_logic_vector(4 downto 0) := (others => '0');
   signal rd : std_logic_vector(4 downto 0) := (others => '0');
   signal we : std_logic := '0';
   signal DWR : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal CRs1 : std_logic_vector(31 downto 0);
   signal CRs2 : std_logic_vector(31 downto 0);
   signal CRd : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   --constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: RF PORT MAP (
          reset => reset,
          rs1 => rs1,
          rs2 => rs2,
          rd => rd,
          we => we,
          DWR => DWR,
          CRs1 => CRs1,
          CRs2 => CRs2,
          CRd => CRd
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 20 ns;
		reset<='0';
		rs1<="00000";
		rs2<="00000";
		rd<="00001";
		dwr<=x"00000000";
		we<='0';
		
      wait for 20 ns;	
		rs1<="000001";
		rs2<="000001";
		rd <="000001";
		dwr<=x"00000000";
		we<='0';
		
      wait for 20 ns;
		rs1<="00010";
		rs2<="00010";
		rd<="00001";
		dwr<=x"00000000";
		we<='0';
		
      wait for 20 ns;
		rs1<="00011";
		rs2<="00011";
		rd<="00011";
		dwr<=x"00000000";
		we<='0';
		
      wait for 20 ns;
		rs1<="00001";
		rs2<="00001";
		rd<="00001";
		dwr<=x"0000000A";
		we<='1';
		
      wait for 20 ns;
		rs1<="00001";
		rs2<="00001";
		rd<="00001";
		dwr<=x"0000000A";
		we<='0';
   end process;

END;
