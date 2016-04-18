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
								
							when "010000" => --ADDcc
								Aluop_UC <= "000000";
								
							when "001000" => --ADDX
								Aluop_UC <= "000101";
								
							when "011000" => --ADDXcc
								Aluop_UC <= "000101";
								
							when "000100" => -- SUB
								Aluop_UC <= "000001";
								
							when "010100" => -- SUBcc
								Aluop_UC <= "000001";
								
							when "001100" => -- SUBX
								Aluop_UC <= "000110";
								
							when "011100" => -- SUBXcc
								Aluop_UC <= "000110";
								
							when "000001" => -- AND
								Aluop_UC <= "000010";
								
							when "010001" => -- ANDcc
								Aluop_UC <= "000010";
								
							when "000101" => --ANDN
								Aluop_UC <= "100010";
								
							when "010101" => --ANDNcc
								Aluop_UC <= "100010";
								
							when "000010" => -- OR
								Aluop_UC <= "000011";
								
							when "010010" => -- ORcc
								Aluop_UC <= "000011";
								
							when "000110" => --NOR
								Aluop_UC <= "100011";
								
							when "010110" => --NORcc
								Aluop_UC <= "100011";
								
							when "000011" => -- XOR
								Aluop_UC <= "000100";
								
							when "010011" => -- XORcc
								Aluop_UC <= "000100";
								
							when "000111" => -- XNOR
								Aluop_UC <= "100100";
								
							when "010111" => -- XNORcc
								Aluop_UC <= "100100";
								
							when "111100" => -- SAVE
								Aluop_UC <= "000000";
								
							when "111101" => -- RESTORE
								Aluop_UC <= "000000";	
			
							when others => -- Cae el nop
								Aluop_UC <= (others=>'0');
							end case;
							
					end if;
	end process;
end arq_UC;
