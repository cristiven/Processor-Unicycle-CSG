----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
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
			  rs1 : in  STD_LOGIC_VECTOR (4 downto 0);
           rs2 : in  STD_LOGIC_VECTOR (4 downto 0);
           rd : in  STD_LOGIC_VECTOR (4 downto 0);
           DWR : in  STD_LOGIC_VECTOR (31 downto 0);
           CRs1 : out  STD_LOGIC_VECTOR (31 downto 0);
           CRs2 : out  STD_LOGIC_VECTOR (31 downto 0));
			  
end RF;
 
architecture arq_RF of RF is

type RF_type is array (0 to 39) of std_logic_vector (31 downto 0);
signal registers : RF_type :=(others => x"00000000");

begin

	process(reset,rs1,rs2,rd,DWR)--reset
	begin
		if(reset = '1')then
			CRs1 <= (others=>'0');
			CRs2 <= (others=>'0');
			registers <= (others => x"00000000");
			
		else
			CRs1 <= registers(conv_integer(rs1));
			CRs2 <= registers(conv_integer(rs2));
			if(rd /= "000000")then
				registers(conv_integer(rd)) <= DWR; --Escribe en el registro de destino
			end if;
		end if;
	end process;
end arq_RF;

--CRs1 <= registers(conv_integer(rs1));
--CRs2 <= registers(conv_integer(rs2));
