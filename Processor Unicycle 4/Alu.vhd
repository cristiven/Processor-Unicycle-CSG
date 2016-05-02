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
 
	process(CRs1,CRs2,Aluop_A)
	begin
	   case (Aluop_A) is 
			when "000000" => 
				AluResult <= CRs1 + CRs2;	--add
			when "000100" =>
				AluResult <= CRs1 - CRs2;--sub
			when "000010" =>
				AluResult <= CRs1 OR CRs2;--or
			when "010000" =>
				AluResult <= CRs1 + CRs2;--ADDcc
			when "001000" =>
				AluResult <= (CRs1 + CRs2)+Carry;--ADDx
			when "011000" =>
				AluResult <= (CRs1 + CRs2)+Carry;--ADDxcc
			when "010100" =>
				AluResult <= CRs1 - CRs2;--SUBcc
			when "001100" =>
				AluResult <= (CRs1 - CRs2)-Carry;--SUBx
			when "011100" =>
				AluResult <= (CRs1 - CRs2)-Carry;--SUBxcc
			when "000001" =>
				AluResult <= CRs1 AND CRs2;--AND
			when "010001" =>
				AluResult <= CRs1 AND CRs2;--ANDcc
			when "000101" =>
				AluResult <= CRs1 AND ( NOT CRs2);--ANDN
			when "010101" =>
				AluResult <= CRs1 AND ( NOT CRs2);--ANDNcc
			when "010010" =>
				AluResult <= CRs1 OR CRs2;--ORcc
			when "000110" =>
				AluResult <= CRs1 OR (NOT CRs2);--ORN
			when "010110" =>
				AluResult <= CRs1 OR (NOT CRs2);--ORNcc
			when "000011" =>
				AluResult <= CRs1 XOR CRs2;--XOR
			when "010011" =>
				AluResult <= CRs1 XOR CRs2;--XORcc
			when "000111" =>
				AluResult <= CRs1 XOR (NOT CRs2);--XORN
			when "010111" =>
				AluResult <= CRs1 XOR (NOT CRs2);--XORNcc
			when "111111" =>
				AluResult <= x"00000000";
			when others  => null;
			
			
		end case;
	end process;
end arq_ALU;

--when others => -- Cae el nop, en otros casos desconocidos
				--AluResult <= (others=>'0');