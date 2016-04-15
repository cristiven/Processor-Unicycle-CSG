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
							when "000000" => -- ADD
								Aluop_UC <= "000000";
							when "000100" => -- SUB
								Aluop_UC <= "000001";
							when "000001" => -- AND
								Aluop_UC <= "000010";
							when "000101" => --ANDN
								Aluop_UC <= "100010";
							when "000010" => -- OR
								Aluop_UC <= "000011";
							when "000110" => --ORN
								Aluop_UC <= "100011";
							when "000011" => -- XOR
								Aluop_UC <= "000100";
							when "000111" => -- XNOR
								Aluop_UC <= "100100";
			
							when others => -- Cae el nop
								Aluop_UC <= (others=>'0');
							end case;
							
					end if;
	end process;
end arq_UC;
