----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:17:52 04/18/2016 
-- Design Name: 
-- Module Name:    PSR - arq_PSR 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity PSR is
	
	  Port(clk : in  STD_LOGIC;
			 reset: in STD_LOGIC;
			 NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
          Carry : out  STD_LOGIC);
end PSR;

architecture arq_PSR of PSR is

signal PSRegister: STD_LOGIC_VECTOR (31 DOWNTO 0):= (others=>'0');

begin
	process(clk,reset)
	begin
		if(reset = '1') then
				Carry <= '0';
		else
			if(rising_edge(clk))then
				PSRegister(23 downto 20) <= NZVC;
				Carry <= PSRegister(20);
				
			end if;
		end if;
	end process;


end arq_PSR;

