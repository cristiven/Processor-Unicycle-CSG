----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:39:19 05/09/2016 
-- Design Name: 
-- Module Name:    MuxPC - arq_MuxPC 
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

entity MuxPC is
	Port (PCDisp30 : in  STD_LOGIC_VECTOR (31 downto 0);
         PCDisp22 : in  STD_LOGIC_VECTOR (31 downto 0);
         PC1 : in  STD_LOGIC_VECTOR (31 downto 0);
         AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
         PCSource : in  STD_LOGIC_VECTOR (1 downto 0);
         PCAddressOut : out  STD_LOGIC_VECTOR (31 downto 0));
end MuxPC;

architecture arq_MuxPC of MuxPC is


begin
	process(PCDisp30,PCDisp22,PC1,AluResult,PCSource)
	begin
			case PCSource is
				when "00" =>
					PCAddressOut <= AluResult;
				when "01" =>
					PCAddressOut <= PCDisp30;
				when "10" =>
					PCAddressOut <= PCDisp22;
				when "11" =>
					PCAddressOut <= PC1;
				when others =>
					PCAddressOut <= PC1;
			end case;
	end process;


end arq_MuxPC;

