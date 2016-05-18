----------------------------------------------------------------------------------
-- Company:        UTP
-- Engineers:      Cristian Stiven Vargas Rojo
--						 Jhoan Sebastian Cobos Vega
--						 Gustavo Adolfo Cardona Correa
-- 
-- Create Date:    14:11:44 04/18/2016 
-- Module Name:    Processor_Unicycle_3 - arq_Processor_Unicycle_3
-- Project Name:   Processor Unicycle. 
-- Tool versions:  3.0
-- Description:    Processor Unicycle 3 supporting icc
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Processor_Unicycle_6 is
	Port ( clk : in  STD_LOGIC;
          reset : in  STD_LOGIC;
          AluResultPU : out  STD_LOGIC_VECTOR (31 DOWNTO 0));
end Processor_Unicycle_6;

architecture arq_Processor_Unicycle_6 of Processor_Unicycle_6 is

	
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
	   clk :IN std_logic;
		address : IN std_logic_vector(31 downto 0);
		reset : IN std_logic;
		out_Instruction : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	
	COMPONENT RF
	PORT(
		--reset : IN std_logic;
		clk : IN std_logic;
		write_enabler: in STD_LOGIC;
		rs1 : IN std_logic_vector(5 downto 0);
		rs2 : IN std_logic_vector(5 downto 0);
		rd : IN std_logic_vector(5 downto 0);
		DWR : IN std_logic_vector(31 downto 0);          
		CRs1 : OUT std_logic_vector(31 downto 0);
		CRs2 : OUT std_logic_vector(31 downto 0);
		CRd : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT UC
	PORT(
		op : IN std_logic_vector(1 downto 0);
		op2 : in STD_LOGIC_VECTOR (2 downto 0);
		op3 : IN std_logic_vector(5 downto 0);
		icc : in STD_LOGIC_VECTOR (3 downto 0);
		cond: in STD_LOGIC_VECTOR (3 downto 0);
		Aluop_UC : OUT std_logic_vector(5 downto 0);
		wrenDM: OUT STD_LOGIC;
      selectorMux: out STD_LOGIC_VECTOR(1 downto 0);
	   write_enable : OUT STD_LOGIC;
		RFdest: out STD_LOGIC;
		PCSource: out STD_LOGIC_VECTOR(1 downto 0)
		);
	END COMPONENT;
	
	COMPONENT ALU
	PORT(
		CRs1 : IN std_logic_vector(31 downto 0);
		CRs2 : IN std_logic_vector(31 downto 0);
		Aluop_A : IN std_logic_vector(5 downto 0);
		Carry : IN std_logic;
		AluResult : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT SEU
	PORT(
		simm_13in : in  STD_LOGIC_VECTOR (12 downto 0);
      simm_32out : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT MUX
	PORT(
		CRs2 : in  STD_LOGIC_VECTOR (31 downto 0);
      imm32 : in  STD_LOGIC_VECTOR (31 downto 0);
      Selector_bit : in  STD_LOGIC;
      Operando_Alu : out  STD_LOGIC_VECTOR (31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT PSRModifier
	PORT(
	     CRs1 : in  STD_LOGIC;
        OperandAlu2 : in  STD_LOGIC;
        OP3: in  STD_LOGIC_VECTOR (5 downto 0);
		  OP: in STD_LOGIC_VECTOR(1 downto 0);
        Aluresult : in  STD_LOGIC_VECTOR (31 downto 0);
        --reset : in STD_LOGIC;
		  NZVC : out  STD_LOGIC_VECTOR (3 downto 0)
		  
		  );
	END COMPONENT;
	
	
	COMPONENT PSR
	PORT(
	     clk : in  STD_LOGIC;
		  reset: in STD_LOGIC;
		  NZVC : in  STD_LOGIC_VECTOR (3 downto 0);
		  nCWP: in STD_LOGIC;
		  icc : out STD_LOGIC_VECTOR (3 downto 0);
		  CWP: out STD_LOGIC;
        Carry : out  STD_LOGIC
		  );
	END COMPONENT;
	
	COMPONENT WindowsManager
	PORT (  
	      Rs1 : in  STD_LOGIC_VECTOR (4 downto 0);--Register Source 1
         Rs2 : in  STD_LOGIC_VECTOR (4 downto 0);--Register Source 2
         Rd : in  STD_LOGIC_VECTOR (4 downto 0);--Register Destination
         OP : in  STD_LOGIC_VECTOR (1 downto 0);
         OP3 : in  STD_LOGIC_VECTOR (5 downto 0);
			CWP : in  STD_LOGIC;--Current Window Pointer
			RO7 : out STD_LOGIC_VECTOR (5 downto 0);
         nCWP : out  STD_LOGIC;--New Current Windows Pointer
         nRs1 : out  STD_LOGIC_VECTOR (5 downto 0);--New Register Source 1
         nRs2 : out  STD_LOGIC_VECTOR (5 downto 0);--New Register Source 2
         nRd : out  STD_LOGIC_VECTOR (5 downto 0)--New Register Destination
			);
	END COMPONENT;
	
	COMPONENT DM
   PORT ( 
         reset : in  STD_LOGIC;
			--clk : in  STD_LOGIC;
         wrenmem : in  STD_LOGIC;
         addressDM : in  STD_LOGIC_VECTOR (31 downto 0);--Direccion es lo mismo que ALU_RESULT?
         CRd : in  STD_LOGIC_VECTOR (31 downto 0);
         data : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	END COMPONENT;
	
	COMPONENT MuxDM
	PORT( 
	      selector: in STD_LOGIC_VECTOR (1 downto 0);
			data : in  STD_LOGIC_VECTOR (31 downto 0);
         alu_result : in  STD_LOGIC_VECTOR (31 downto 0);
			PC: in STD_LOGIC_VECTOR(31 downto 0);
         data_to_write : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	END COMPONENT;
	
	COMPONENT MuxRF
	PORT (  
			nRDWm : in  STD_LOGIC_VECTOR (5 downto 0);--Windows Manager new RD
         rO7 : in  STD_LOGIC_VECTOR (5 downto 0);--O7 register
         RFdest_sel : in  STD_LOGIC;--Selector rf destination
         nRd : out  STD_LOGIC_VECTOR (5 downto 0) -- new RD
			);
	END COMPONENT;	
	
	COMPONENT MuxPC
	PORT (
			PCDisp30 : in  STD_LOGIC_VECTOR (31 downto 0);
         PCDisp22 : in  STD_LOGIC_VECTOR (31 downto 0);
         PC1 : in  STD_LOGIC_VECTOR (31 downto 0);
         AluResult : in  STD_LOGIC_VECTOR (31 downto 0);
         PCSource : in  STD_LOGIC_VECTOR (1 downto 0);
         PCAddressOut : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	END COMPONENT;	
	
	COMPONENT SEU22
	PORT ( 
			SEU22 : in  STD_LOGIC_VECTOR (21 downto 0);
         SEU32 : out  STD_LOGIC_VECTOR (31 downto 0)
		   );
	END COMPONENT;
	
	COMPONENT SEU30
	PORT ( 
			SEU30 : in  STD_LOGIC_VECTOR (29 downto 0);
         SEU32 : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	END COMPONENT;
	
	COMPONENT AddPC22
	PORT ( 
	      PC : in  STD_LOGIC_VECTOR (31 downto 0);
         disp22 : in  STD_LOGIC_VECTOR (31 downto 0);
         suma : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	END COMPONENT;
	
	COMPONENT AddPC30
	PORT ( 
	      PC : in  STD_LOGIC_VECTOR (31 downto 0);
         disp30 : in  STD_LOGIC_VECTOR (31 downto 0);
         suma : out  STD_LOGIC_VECTOR (31 downto 0)
			);
	END COMPONENT;
	
	signal aux_outnPC,aux_outPC,aux_outCRs1,aux_outCRs2,aux_outAdd,aux_outIM,aux_outAluResult,aux_simm32out,aux_OperandoAluout,aux_outCRd,aux_outdata,aux_data_to_write: std_logic_vector(31 downto 0);--addressnPC
	signal aux_outPCAddressOut,aux_out22SEU32,aux_out30SEU32,aux_out22suma,aux_out30suma: std_logic_vector(31 downto 0);
	signal aux_outAluop,aux_outnRs1,aux_outnRs2,aux_outnRd,aux_RO7,aux_outnRdMuxRF: std_logic_vector(5 downto 0);
	signal aux_outNZVC,aux_icc: std_logic_vector(3 downto 0);
	signal aux_outCarry,aux_outnCWP,aux_outCWP,aux_outwrite_enabler,aux_outwrenDM,aux_outRFdest: std_logic;
	signal aux_PCSource,aux_outselectorMux : std_logic_vector(1 downto 0);
	signal add1: STD_LOGIC_VECTOR(31 downto 0):= "00000000000000000000000000000001";
	

begin

   Inst_Add: Add PORT MAP(
		oper1 => add1,
		oper2 => aux_outnPC,
		resul => aux_outAdd
	);

	Inst_nPC: nPC PORT MAP(
		address => aux_outPCAddressOut,
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
		clk => clk,
		address => aux_outPC,
		reset => reset,
		out_Instruction => aux_outIM
	);

	Inst_RF: RF PORT MAP(
		--reset => reset,
		clk => clk,
		write_enabler => aux_outwrite_enabler,
		rs1 => aux_outnRs1,
		rs2 => aux_outnRs2,
		rd => aux_outnRdMuxRF,
		DWR => aux_data_to_write,
		CRs1 => aux_outCRs1,
		CRs2 => aux_outCRs2,
		CRd => aux_outCRd
	);
	
	Inst_UC: UC PORT MAP(
		op => aux_outIM(31 downto 30),
		op2 => aux_outIM(24 downto 22),
		op3 => aux_outIM(24 downto 19),
		icc => aux_icc,
	   cond => aux_outIM(28 downto 25),	
		wrenDM => aux_outwrenDM,
		selectorMux => aux_outselectorMux,
	   write_enable => aux_outwrite_enabler,
		Aluop_UC => aux_outAluop,
		RFdest => aux_outRFdest,
		PCSource => aux_PCSource
	);

	Inst_ALU: ALU PORT MAP(
		CRs1 => aux_outCRs1,
		CRs2 => aux_OperandoAluout,
		Carry => aux_outCarry,
		Aluop_A => aux_outAluop,
		AluResult => aux_outAluResult
		
	);
	
	Inst_SEU: SEU PORT MAP(
		simm_13in => aux_outIM(12 downto 0),
		simm_32out => aux_simm32out
	);
	
	Inst_MUX: MUX PORT MAP(
		CRs2 => aux_outCRs2,
      imm32 => aux_simm32out,
      Selector_bit => aux_outIM(13),
      Operando_Alu => aux_OperandoAluout
	);
	
	Inst_PSRModifier: PSRModifier PORT MAP(
		CRs1 => aux_outCRs1(31),
      OperandAlu2 => aux_OperandoAluout(31),
      --reset => reset,
		OP3 => aux_outIM(24 downto 19),--op3     
		OP => aux_outIM(31 downto 30),--op											
      Aluresult => aux_outAluResult,
		NZVC => aux_outNZVC
		
	);
	
	Inst_PSR: PSR PORT MAP(
	   clk => clk,
	   reset => reset,
		nCWP => aux_outnCWP,
		CWP => aux_outCWP,
	   NZVC => aux_outNZVC,
		icc => aux_icc,
      Carry => aux_outCarry
	);
	
	Inst_WindowsManager: WindowsManager PORT MAP(
	   Rs1 => aux_outIM(18 downto 14),
      Rs2 => aux_outIM(4 downto 0),
      Rd => aux_outIM(29 downto 25),
      OP => aux_outIM(31 downto 30),
      OP3 => aux_outIM(24 downto 19),
		RO7 => aux_RO7,
      CWP => aux_outCWP,
      nCWP => aux_outnCWP,
      nRs1 => aux_outnRs1,
      nRs2 => aux_outnRs2,
      nRd => aux_outnRd 
	);
	
	Inst_DM: DM PORT MAP(
      reset => reset,
		--clk => clk,
      wrenmem => aux_outwrenDM,
      addressDM => aux_outAluResult,
      CRd => aux_outCRd,		
      data => aux_outdata
	);
		
	Inst_MuxDM: MuxDM PORT MAP( 
	   selector => aux_outselectorMux,
		data => aux_outdata, 
      alu_result => aux_outAluResult,
      PC => aux_outPC, 
		data_to_write =>  aux_data_to_write
	);
	
	Inst_MuxRF: MuxRF PORT MAP(
		nRDWm => aux_outnRd,
		rO7 => aux_RO7,
		RFdest_sel => aux_outRFdest,
		nRd => aux_outnRdMuxRF
	);
	
	Inst_MuxPC: MuxPC PORT MAP(
		PCDisp30 => aux_out30suma,
      PCDisp22 => aux_out22suma,
      PC1 => aux_outAdd, 
      AluResult => aux_outAluResult,
      PCSource => aux_PCSource,
      PCAddressOut => aux_outPCAddressOut
	);
	
	Inst_SEU22: SEU22 PORT MAP(
		SEU22 => aux_outIM(21 downto 0),
      SEU32 => aux_out22SEU32
	);
	
	Inst_SEU30: SEU30 PORT MAP(
		SEU30 => aux_outIM(29 downto 0),
      SEU32 => aux_out30SEU32
	);
	
	Inst_AddPC22: AddPC22 PORT MAP(
		 PC => aux_outPC,
       disp22 => aux_out22SEU32,
       suma => aux_out22suma
	);
	
	Inst_AddPC30: AddPC30 PORT MAP(
		 PC => aux_outPC, 
       disp30 => aux_out30SEU32,
       suma => aux_out30suma
	);
   
	
	
	
   AluResultPU <= aux_data_to_write; 
	
end arq_Processor_Unicycle_6;