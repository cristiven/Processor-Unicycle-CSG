-- Company:        UTP
-- Engineers:      Cristian Stiven Vargas Rojo
--						 Jhoan Sebastian Cobos Vega
--						 Gustavo Adolfo Cardona Correa
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
    Port ( CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop_A : in  STD_LOGIC_VECTOR (5 downto 0);
           Carry: in STD_LOGIC;
			  AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end ALU;

architecture arq_ALU of ALU is

begin
 
	process(CRs1,CRs2,Aluop_A,Carry)
	begin
	   case (Aluop_A) is 
			when "000000" => -- add,addcc
				AluResult <= CRs1 + CRs2;
			when "000001" => -- sub,subcc
				AluResult <= CRs1 - CRs2;
			when "000010" => --and
				AluResult <= CRs1 and CRs2;
			when "100010" => --andn
				AluResult <= CRs1 nand CRs2;
			when "000011" => -- or
				AluResult <= CRs1 or CRs2;
			when "100011" => -- nor
				AluResult <= CRs1 nor CRs2;
			when "000100" => -- xor
				AluResult <= CRs1 xor CRs2;
			when "100100" => -- xnor
				AluResult <= CRs1 xnor CRs2;
			when "000101" => -- addX,addXcc
				AluResult <= CRs1 + CRs2 + Carry;
			when "000110" => --subX,subXcc
				AluResult <= CRs1 - CRs2 - Carry;
			when others =>
				AluResult <= (others=>'0');
		end case;
	end process;
end arq_ALU;

--when others => -- Cae el nop, en otros casos desconocidos
				--AluResult <= (others=>'0');