----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:11:28 05/05/2016 
-- Design Name: 
-- Module Name:    MuxDM - arq_MuxDM 
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


entity MuxDM is
	 Port ( selector: in STD_LOGIC;
			  data : in  STD_LOGIC_VECTOR (31 downto 0);
           alu_result : in  STD_LOGIC_VECTOR (31 downto 0);
           data_to_write : out  STD_LOGIC_VECTOR (31 downto 0));
end MuxDM;

architecture arq_MuxDM of MuxDM is

begin

process(data,alu_result,selector)
begin
	if(selector='1')then
		data_to_write <= data;
	else
		data_to_write <= alu_result;
	end if;
end process;

end arq_MuxDM;

