----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:09:16 04/12/2016 
-- Design Name: 
-- Module Name:    MUX - arq_MUX 
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


entity MUX is
	Port ( CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
          imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
          Selector_bit : in  STD_LOGIC;
          Operando_Alu : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX;

architecture arq_MUX of MUX is

begin
process(CRs2,imm32,Selector_bit)
begin
	if(Selector_bit='1') then
		Operando_Alu <= imm32;
	else
		Operando_Alu <= CRs2;
	end if;
end process;




end arq_MUX;

