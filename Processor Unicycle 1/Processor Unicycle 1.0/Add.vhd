----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:34:17 04/02/2016 
-- Design Name: 
-- Module Name:    Add - arq_Add 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Add is 
    Port ( oper1 : in  STD_LOGIC_VECTOR (31 downto 0);
           oper2 : in  STD_LOGIC_VECTOR (31 downto 0);
           resul : out  STD_LOGIC_VECTOR (31 downto 0));
end Add;

architecture arq_Add of Add is

begin

	process(oper1,oper2)
	begin
		resul <= oper1 + oper2;
	end process;

end arq_Add;

-- oper = 4 o 32
-- generar las señales del modulo completo
