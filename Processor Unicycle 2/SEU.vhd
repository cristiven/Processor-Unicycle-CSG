----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:56:47 04/12/2016 
-- Design Name: 
-- Module Name:    SEU - arq_SEU 
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


entity SEU is --Sign Extension Unit
    Port ( simm_13in : in  STD_LOGIC_VECTOR (12 downto 0);
           simm_32out : out  STD_LOGIC_VECTOR (31 downto 0));
end SEU;

architecture arq_SEU of SEU is

begin
	process(simm_13in)
	begin
		simm_32out(12 downto 0) <= simm_13in;
		if(simm_13in(12)= '1') then
			simm_32out(31 downto 13) <= (others=>'1');
		else
			simm_32out(31 downto 13) <= (others=>'0');
		end if;
	end process;


end arq_SEU;

