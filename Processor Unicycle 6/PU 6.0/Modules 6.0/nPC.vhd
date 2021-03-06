-- Company:        UTP
-- Engineers:      Cristian Stiven Vargas Rojo
--						 Jhoan Sebastian Cobos Vega
--						 Gustavo Adolfo Cardona Correa

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity nPC is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
			  reset : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           out_Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end nPC;

architecture arq_NPC of nPC is

begin
process(clk,address,reset)
begin
	if(rising_edge(clk))then
		if(reset = '1')then
			out_Instruction <= (others=> '0');
		else
			out_Instruction <= address;
		end if;
	end if;
end process;	

end arq_NPC;

