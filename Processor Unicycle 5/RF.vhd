----------------------------------------------------------------------------------
-- Company:        UTP
-- Engineers:      Cristian Stiven Vargas Rojo
--						 Jhoan Sebastian Cobos Vega
--						 Gustavo Adolfo Cardona Correa
-- 
-- Create Date:    00:04:51 04/03/2016 
-- Design Name: 
-- Module Name:    RF - arq_RF 
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
USE ieee.numeric_std.ALL;
use std.textio.all;

entity RF is
    Port ( 
		    reset : in STD_LOGIC;
		    rs1 : in  STD_LOGIC_VECTOR (5 downto 0);
          rs2 : in  STD_LOGIC_VECTOR (5 downto 0);
          rd : in  STD_LOGIC_VECTOR (5 downto 0);
		    write_enabler: in STD_LOGIC;--Enabler to write
          DWR : in  STD_LOGIC_VECTOR (31 downto 0);
          CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
          CRs2 : out  STD_LOGIC_VECTOR (31 downto 0);
		    CRd : out STD_LOGIC_VECTOR (31 downto 0)); -- Content Register Destination
			  
end RF;
 
architecture arq_RF of RF is

type RF_type is array (0 to 39) of std_logic_vector (31 downto 0);
signal registers : RF_type :=(others => x"00000000");

begin

	process(reset,rs1,rs2,rd,DWR)--reset
	begin
	   registers(0) <= x"00000000";
		if(reset = '1')then
			CRs1 <= (others=>'0');
			CRs2 <= (others=>'0');
			CRd <= (others=> '0');
			registers <= (others => x"00000000");
			
		else
			CRs1 <= registers(conv_integer(rs1));
			CRs2 <= registers(conv_integer(rs2));
			CRd <= registers(conv_integer(rd));
			if(write_enabler = '1' and rd /= "000000")then --Si esta habilitado para escribir
				registers(conv_integer(rd)) <= DWR; --Escribe en el registro de destino
			end if;
		end if;
	end process;
end arq_RF;



