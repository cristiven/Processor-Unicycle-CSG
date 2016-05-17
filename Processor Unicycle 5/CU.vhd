----------------------------------------------------------------------------------
-- Company:        UTP
-- Engineers:      Cristian Stiven Vargas Rojo
--						 Jhoan Sebastian Cobos Vega
--						 Gustavo Adolfo Cardona Correa
--  
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
			  op3 : in  STD_LOGIC_VECTOR (5 downto 0);
			  Aluop_UC: out STD_LOGIC_VECTOR (5 downto 0);
			  wrenDM: out STD_LOGIC;
			  selectorMux: out STD_LOGIC;
			  write_enable : out STD_LOGIC);

end UC;
 
architecture arq_UC of UC is

begin
	process(op,op3)
	begin
		if(op = "10")then				
			case op3 is
				when "000000" => -- ADD
					Aluop_UC <= "000000";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "010000" => --ADDcc
					Aluop_UC <= "010000";
					write_enable <= '1';
					wrenDM <= '0';
				   selectorMux<= '0';
								
				when "001000" => --ADDX
					Aluop_UC <= "001000";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "011000" => --ADDXcc
					Aluop_UC <= "011000";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "000100" => -- SUB
					Aluop_UC <= "000100";
					write_enable <= '1';
					wrenDM <= '0';
				   selectorMux<= '0';
								
				when "010100" => -- SUBcc
					Aluop_UC <= "010100";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "001100" => -- SUBX
					Aluop_UC <= "001100";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
							
				when "011100" => -- SUBXcc
					Aluop_UC <= "011100";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
							
				when "000001" => -- AND
					Aluop_UC <= "000001";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
							
				when "010001" => -- ANDcc
					Aluop_UC <= "010001";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux <= '0';
						
				when "000101" => --ANDN
					Aluop_UC <= "000101";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "010101" => --ANDNcc
					Aluop_UC <= "010101";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
						
				when "000010" => -- OR
					Aluop_UC <= "000011";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "010010" => -- ORcc
					Aluop_UC <= "010010";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "000110" => --NOR
					Aluop_UC <= "000110";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
							
				when "010110" => --NORcc
					Aluop_UC <= "010110";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "000011" => -- XOR
					Aluop_UC <= "000011";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "010011" => -- XORcc
					Aluop_UC <= "010011";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "000111" => -- XNOR
					Aluop_UC <= "000111";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "010111" => -- XNORcc
					Aluop_UC <= "010111";
				   write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
								
				when "111100" => -- SAVE
					Aluop_UC <= "000000";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
							
				when "111101" => -- RESTORE
					Aluop_UC <= "000000";
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
							
				when others => -- Cae el nop
					Aluop_UC <= (others=>'0');
					write_enable <= '1';
					wrenDM <= '0';
					selectorMux<= '0';
			end case;	
				 elsif(op = "11") then
					case op3 is
					
				when "000100" => --SW
					Aluop_UC <= "000000";
					write_enable <= '0';
					wrenDM <= '1';--Habilitamos la escritura en el DM
					selectorMux<= '0';
					
				when "000000" => --LW
					Aluop_UC <= "000000";
					write_enable <= '1';--Habilitamos la escritura en el RF
					wrenDM <= '0';--Si no habilitamos la escritura, es porque vamos a leer
					selectorMux<= '1';
					
				when others =>
					Aluop_UC <= "000000";
					write_enable <= '0';
					wrenDM <= '0';
					selectorMux<= '0';
					end case;
				 end if;
	end process;
end arq_UC;
