----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:26:57 05/09/2016 
-- Design Name: 
-- Module Name:    AddPC22 - arq_AddPC22 
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

entity AddPC22 is
	Port ( PC : in  STD_LOGIC_VECTOR (31 downto 0);
          disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
          suma : out  STD_LOGIC_VECTOR (31 downto 0));
end AddPC22;

architecture arq_AddPC22 of AddPC22 is

begin
process(PC,disp22) is
begin
	suma <= std_logic_vector(unsigned(PC) + unsigned(disp22));
end process;

end arq_AddPC22;

