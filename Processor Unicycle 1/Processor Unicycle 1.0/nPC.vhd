
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
process(clk, address, reset)
	begin
		if(reset = '1')then
			out_Instruction <= (others=> '0');
		else
			if(rising_edge(clk))then
				out_Instruction <= address;
			end if;
		end if;
end process;

end arq_NPC;

