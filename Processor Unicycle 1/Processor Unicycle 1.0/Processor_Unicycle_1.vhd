----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:11:44 04/07/2016 
-- Design Name: 
-- Module Name:    Processor_Unicycle_1 - arq_Processor_Unicycle_1 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
 
entity Processor_Unicycle_1 is
	Port ( clk : in  STD_LOGIC;
          reset : in  STD_LOGIC;
          AluResultPU : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end Processor_Unicycle_1;

architecture arq_Processor_Unicycle_1 of Processor_Unicycle_1 is

	
	COMPONENT nPC
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		out_Instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT; 
	
	COMPONENT PC
	PORT(
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		clk : IN std_logic;          
		out_Instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT; 

	COMPONENT Add
	PORT(
		oper1 : IN std_logic_vector(31 downto 0);
		oper2 : IN std_logic_vector(31 downto 0);          
		resul : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
		
	
	COMPONENT IM
	PORT(
		--clk :IN std_logic;
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		out_Instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT RF
	PORT(
		reset : IN std_logic;
		rs1 : IN std_logic_vector(4 downto 0);
		rs2 : IN std_logic_vector(4 downto 0);
		rd : IN std_logic_vector(4 downto 0);
		DWR : IN std_logic_vector(31 downto 0);          
		CRs1 : OUT std_logic_vector(31 downto 0);
		CRs2 : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT UC
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		Aluop_UC : OUT std_logic_vector(5 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU
	PORT(
		CRs1 : IN std_logic_vector(31 downto 0);
		CRs2 : IN std_logic_vector(31 downto 0);
		Aluop_A : IN std_logic_vector(5 downto 0);
		AluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	signal aux_outnPC,aux_outPC,aux_outCRs1,aux_outCRs2,aux_outAdd,aux_outIM,addressnPC,aux_outAluResult: std_logic_vector(31 downto 0);
	signal aux_outAluop: std_logic_vector(5 downto 0);
	

begin

   Inst_Add: Add PORT MAP(
		oper1 => x"00000001",
		oper2 => aux_outnPC,
		resul => aux_outAdd
	);

	Inst_nPC: nPC PORT MAP(
		address => aux_outAdd,
		reset => reset,
		clk => clk,
		out_Instruction => aux_outnPC
	);

	Inst_PC: PC PORT MAP(
		address => aux_outnPC,
		reset => reset,
		clk => clk,
		out_Instruction => aux_outPC 
	);
	
	Inst_IM: IM PORT MAP(
		--clk => clk,
		address => aux_outPC,
		reset => reset,
		out_Instruction => aux_outIM
	);

	Inst_RF: RF PORT MAP(
		reset => reset,
		rs1 => aux_outIM(18 downto 14),
		rs2 => aux_outIM(4 downto 0),
		rd => aux_outIM(29 downto 25),
		DWR => aux_outAluResult,
		CRs1 => aux_outCRs1,
		CRs2 => aux_outCRs2
		
	);
	
	Inst_UC: UC PORT MAP(
		op => aux_outIM(31 downto 30),
		--op2 => aux_outIM(24 downto 22),
		op3 => aux_outIM(24 downto 19),
		Aluop_UC => aux_outAluop
	);

	Inst_ALU: ALU PORT MAP(
		CRs1 => aux_outCRs1,
		CRs2 => aux_outCRs2,
		Aluop_A => aux_outAluop,
		AluResult => aux_outAluResult
	);

   AluResultPU <= aux_outAluResult; 
	
end arq_Processor_Unicycle_1;

