----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:56:20 04/02/2016 
-- Design Name: 
-- Module Name:    IM - arq_IM 
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
use std.textio.all;

entity IM is
    Port ( --clk : in STD_LOGIC;
			  address : in  STD_LOGIC_VECTOR (31 downto 0);
           reset : in  STD_LOGIC;
           out_Instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end IM;
 
     architecture arq_IM of IM is

	type rom_type is array (0 to 63) of std_logic_vector (31 downto 0);
		
	impure function InitRomFromFile (RomFileName : in string) return rom_type is
		FILE RomFile : text open read_mode is RomFileName;
		variable RomFileLine : line;
		variable temp_bv : bit_vector(31 downto 0);
		variable temp_mem : rom_type;
		begin
			for I in rom_type'range loop
				readline (RomFile, RomFileLine);
				read(RomFileLine, temp_bv);
				temp_mem(i) := to_stdlogicvector(temp_bv);
			end loop;
		return temp_mem;
	end function;
	
	signal instructions : rom_type := InitRomFromFile("test.data");
	
	
begin

	process(reset,address, instructions)
	begin
		
		  if(reset = '1')then
			  out_Instruction <= (others=>'0');
		  else
		  		out_Instruction <= instructions(conv_integer(address(5 downto 0)));
		      --convierte a address en un entero para saber a que posicion de la memoria debo ir
		  end if;
	end process;
	
end arq_IM;