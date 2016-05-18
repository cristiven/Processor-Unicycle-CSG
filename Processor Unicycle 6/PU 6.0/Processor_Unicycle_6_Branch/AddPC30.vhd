----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:58:49 05/09/2016 
-- Design Name: 
-- Module Name:    AddPC30 - arq_AddPC30 
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
use IEEE.NUMERIC_STD.all;


entity AddPC30 is
	Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
			 disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
          suma : out  STD_LOGIC_VECTOR (31 downto 0));
			 
end AddPC30;

architecture arq_AddPC30 of AddPC30 is

begin
process(disp30,PC) is
begin
	suma <= std_logic_vector(unsigned(disp30) + unsigned(PC));
end process;
end arq_AddPC30;

