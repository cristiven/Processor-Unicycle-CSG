----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:53:51 05/09/2016 
-- Design Name: 
-- Module Name:    MuxRF - arq_MuxRF 
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


entity MuxRF is
	Port (  nRdWm : in  STD_LOGIC_VECTOR (5 downto 0);--Windows Manager new RD
           rO7 : in  STD_LOGIC_VECTOR (5 downto 0);--O7 register
           RFdest_sel : in  STD_LOGIC;--Selector rf destination
           nRd : out  STD_LOGIC_VECTOR (5 downto 0));-- new RD
end MuxRF;

architecture arq_MuxRF of MuxRF is

begin
	process(nRdWm,rO7,RFdest_sel)
	begin
		if(RFdest_sel = '0')then
			nRd <= nRdWm;
		else
			if(RFdest_sel = '1')then
				nRd <= rO7;
			end if;
		end if;
	end process;

end arq_MuxRF;

