-- Company:        UTP
-- Engineers:      Cristian Stiven Vargas Rojo
--						 Jhoan Sebastian Cobos Vega
--						 Gustavo Adolfo Cardona Correa

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity PC is
    Port ( address : in  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
           out_Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end PC;
 
architecture arq_PC of PC is

begin
	process(clk)
	begin
		if(reset = '1')then
			out_Instruction <= (others=> '0');
		else
			if(rising_edge(clk))then
				out_Instruction <= address;
			end if;
		end if;
end process;	

end arq_PC;
