----------------------------------------------------------------------------------
-- Company:        UTP
-- Engineers:      Cristian Stiven Vargas Rojo
--						 Jhoan Sebastian Cobos Vega
--						 Gustavo Adolfo Cardona Correa
-- 
-- Create Date:    15:54:22 04/18/2016 
-- Design Name: 
-- Module Name:    PSRModifier - arq_PSRModifier 
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

entity PSRModifier is

	Port(CRs1 : in  STD_LOGIC;--Bit mas significativo del registro 1
        OperandAlu2 : in  STD_LOGIC;--Bit menos significativo del registro 2
        --reset : in STD_LOGIC;
		  OP3: in  STD_LOGIC_VECTOR (5 downto 0);
		  OP: in STD_LOGIC_VECTOR(1 downto 0);
        Aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
        NZVC : out  STD_LOGIC_VECTOR (3 downto 0));
end PSRModifier;

architecture arq_PSRModifier of PSRModifier is

begin
process(Aluresult,CRs1,OperandAlu2,OP3)
begin


	if(OP = "10") then
		if(OP3 = "010000" or OP3 = "011000")then--ADDCC ADDXCC
			NZVC(3) <= Aluresult(31);	
			if(Aluresult = X"00000000")then
				NZVC(2) <= '1';
			else
				NZVC(2) <= '0';
			end if;
			NZVC(1) <= (CRs1 and OperandAlu2 and (not Aluresult(31))) or ((not CRs1) and (not OperandAlu2) and Aluresult(31));
			NZVC(0) <= (CRs1 and OperandAlu2) or ((not Aluresult(31)) and (CRs1 or OperandAlu2));
			
		elsif(OP3  = "010100" or OP3 ="011100")then--SUBCC SUBXCC
				NZVC(3) <= Aluresult(31);
				if(Aluresult = X"00000000")then
					NZVC(2) <= '1';
				else
					NZVC(2) <= '0';
				end if;
				NZVC(1) <= ((CRs1 and (not OperandAlu2) and (not Aluresult(31))) or ((not CRs1) and OperandAlu2 and Aluresult(31)));
				NZVC(0) <= ((not CRs1) and OperandAlu2) or (Aluresult(31) and ((not CRs1) or OperandAlu2));
		
		elsif(OP3  = "010001" or OP3  = "010101" or OP3  = "010010" or OP3  = "010110" or OP3  = "010011" or OP3  = "010111")then --ANDcc,ANDNcc,ORcc,NORcc,XORcc,XNORcc
					NZVC(3) <= Aluresult(31);
					if(Aluresult = X"00000000")then
						NZVC(2) <= '1';
					else
						NZVC(2) <= '0';
					end if;
					NZVC(1) <= '0';
					NZVC(0) <= '0';
		
		end if;
	end if;

end process;
	


end arq_PSRModifier;

