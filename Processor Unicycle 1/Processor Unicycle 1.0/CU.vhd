----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:39:07 11/12/2012 
-- Design Name: 
-- Module Name:    unidadControl - arqUnidadControl 
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

entity UC is
    Port ( 
			  op : in  STD_LOGIC_VECTOR (1 downto 0);
			  Aluop_UC: out STD_LOGIC_VECTOR (5 downto 0);
           op3 : in  STD_LOGIC_VECTOR (5 downto 0));

end UC;
 
	architecture arq_UC of UC is

begin
	process(op,op3)
	begin
					if(op = "10")then				
						case op3 is
							when("000000") =>
								Aluop_UC <= "000001"; -- Add
							when("000100") =>
								Aluop_UC <= "000010"; -- Sub
							when("000001") =>
								Aluop_UC <= "000011"; -- And
							when("000101") =>
								Aluop_UC <= "000100"; -- Nand
							when("000010") =>
								Aluop_UC <= "000101"; -- Or	
							when("000110") =>
								Aluop_UC <= "000110"; -- Nor
							when("000011") =>
								Aluop_UC <= "000111"; -- Xor
							when("000111") =>
								Aluop_UC <= "001000"; -- Xnor
			
							when others => -- Cae el nop
								Aluop_UC <= (others=>'0');
							end case;
							
					end if;
	end process;
end arq_UC;
