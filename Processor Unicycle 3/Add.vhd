library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.all;

entity Add is 
    Port ( oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           resul : out  STD_LOGIC_VECTOR (31 downto 0));
end Add;

architecture arq_Add of Add is

begin

	process(oper1,oper2)
	begin
		resul <= std_logic_vector(unsigned(oper1) + unsigned(oper2));
	end process;

end arq_Add;
