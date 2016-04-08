
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ALU is
    Port ( CRs1 : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Aluop_A : in  STD_LOGIC_VECTOR (5 downto 0);
           Carry : in  STD_LOGIC;
           AluResult : out  STD_LOGIC_VECTOR (31 downto 0));
end ALU;

architecture arq_ALU of ALU is

begin
 
	process(CRs1,CRs2,Aluop_A,Carry)
	begin
	   case (Aluop_A) is 
			when "000000" => -- add
				AluResult <= CRs1 + CRs2;
			when "000001" => -- addcc
				AluResult <= CRs1 + CRs2;
			when "000010" => -- addx
				AluResult <= CRs1 + CRs2 + Carry;
			when "000100" => -- and
				AluResult <= CRs1 and CRs2;
			when "001000" => -- or
				AluResult <= CRs1 or CRs2;
			when "010000" => -- sub
				AluResult <= CRs1 - CRs2;
			when "000101" => -- subcc
				AluResult <= CRs1 - CRs2;
			
			when others => -- Cae el nop
				AluResult <= (others=>'0');
		end case;
	end process;
end arq_ALU;
