
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
    Port ( CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop_A : in  STD_LOGIC_VECTOR (5 downto 0);
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture arq_ALU of ALU is

begin
 
	process(CRs1,CRs2,Aluop_A)
	begin
	   case (Aluop_A) is 
			when "000001" => -- Add
				AluResult <= CRs1 + CRs2;
			when "000010" => -- Sub
				AluResult <= CRs1 - CRs2;
			when "000011" => -- And
				AluResult <= CRs1 and CRs2;
			when "000100" => -- Nand
				AluResult <= CRs1 nand CRs2;
			when "000101" => -- Or
				AluResult <= CRs1 or CRs2;
			when "000110" => -- Nor
				AluResult <= CRs1 nor CRs2;
			when "000111" => -- Xor
				AluResult <= CRs1 xor CRs2;
			when "001000" => -- Xnor
				AluResult <= CRs1 xnor CRs2;
			
			when others => -- Cae el nop, en otros casos desconocidos
				AluResult <= (others=>'0');
		end case;
	end process;
end arq_ALU;
