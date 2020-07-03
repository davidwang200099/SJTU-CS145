`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 10:16:12
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Top(input clock,input reset);
    //input wire clock;
    //input reset;
    reg [31:0] PC;
    wire REG_DST,JUMP,JUMP1,BRANCH,MEM_READ,MEM_TO_REG,MEM_WRITE,JUMPTARGET,CALL;
    wire [2:0] ALU_OP;
    wire ALU_SRC,REG_WRITE;//Signals generated by control unit
    
    wire [3:0] ALUCTR;
    
	wire [31:0] INST;//PC and instruction memory
	
	wire [4:0] WRITEREG;
	wire [4:0] READREG1;
	wire [4:0] READREG2;
	wire [31:0] REGREADDATA1;
	wire [31:0] REGREADDATA2;
	wire [31:0] REGWRITEDATA;//register file
	
	wire [31:0] INSTSHIFTED;
    wire [31:0] SIGNEXTENDED;
	wire [31:0] EXTENDSHIFTED;
	
	wire [31:0] ALUSRC1;
	wire [31:0] ALUSRC2;

    wire ZERO;
	wire [31:0] ALURSLT;//main ALU
	
	wire [31:0] MEM_DATA;
	wire [31:0] PC_PLUS_4;

	wire [31:0] IFID_PCPLUS4,IFID_INST;
	wire [31:0] IDEX_PCPLUS4,IDEX_READDATA1,IDEX_READDATA2,IDEX_SIGNEXTENDED;
	wire [4:0] IDEX_RT,IDEX_RD,IDEX_EX;
	wire [2:0] IDEX_M;
	wire [1:0] IDEX_WB;
	wire [1:0] EXMEM_WB;
	wire [2:0] EXMEM_M;
	wire [31:0] EXMEM_BRANCHTARGET,EXMEM_ALURESULT,EXMEM_MEMWRITEDATA;
	wire [4:0] EXMEM_WRITEREG;
	wire EXMEM_ZERO;
	wire MEMWB_REGWRITE,MEMWB_MEMTOREG;
	wire [31:0] MEMWB_MEMREADDATA,MEMWB_ALURESULT;
	wire [4:0] MEMWB_WRITEREG;
	instrMemory instruction_memory(//
	    .readAddress(PC),

	    .instruction(INST)
	);
	assign PC_PLUS_4=PC+4;
	always @ (posedge clock)
	begin
	    if(reset) PC<=0;
	    else PC<=(EXMEM_ZERO&&EXMEM_M[0])?EXMEM_BRANCHTARGET:PC_PLUS_4;
	end
    IFID ifid(//
        .clock(clock),
        .reset(reset),
		.instruction_in(INST),
		.PC_Plus_4(PC_PLUS_4),

		.IFID_PCplus4(IFID_PCPLUS4),
		.IFID_instruction(IFID_INST)
	);

	Ctr ctr(//
	    .opCode(IFID_INST[31:26]),

	    .regDest(REG_DST),
	    .aluSrc(ALU_SRC),
	    .memToReg(MEM_TO_REG),
	    .regWrite(REG_WRITE),
	    .memRead(MEM_READ),
	    .memWrite(MEM_WRITE),
	    .Branch(BRANCH),
	    .ALUop(ALU_OP),
	    .Jump(JUMP),
	    .Call(CALL),
	    .jumpTarget(JUMPTARGET)
	);
	
	Registers registers(//
	    .clock(clock),
	    .reset(reset),
	    .readReg1(IFID_INST[25:21]),
	    .readReg2(IFID_INST[20:16]),
	    .writeReg(MEMWB_WRITEREG),
	    .writeData((MEMWB_MEMTOREG?MEMWB_MEMREADDATA:MEMWB_ALURESULT)),// to be improved
	    .regWrite(MEMWB_REGWRITE),

	    .readData1(REGREADDATA1),
	    .readData2(REGREADDATA2)
	);
	signext signext(//
	    .inst(IFID_INST[15:0]),
	    .data(SIGNEXTENDED)
	);
	IDEX idex(//
	    .clock(clock),
	    .reset(reset),
		.IFID_PCPlus4(IFID_PCPLUS4),
		.readData1(REGREADDATA1),
		.readData2(REGREADDATA2),
		.signextended(SIGNEXTENDED),
		.IFID_rt(IFID_INST[20:16]),
		.IFID_rd(IFID_INST[15:11]),
		.ex({ALU_SRC,ALU_OP,REG_DST}),
		.m({BRANCH,MEM_READ,MEM_WRITE}),
		.wb({REG_WRITE,MEM_TO_REG}),
		
		.IDEX_PCPlus4(IDEX_PCPLUS4),
		.IDEX_readData1(IDEX_READDATA1),
		.IDEX_readData2(IDEX_READDATA2),
		.IDEX_signextended(IDEX_SIGNEXTENDED),
		.IDEX_rt(IDEX_RT),
		.IDEX_rd(IDEX_RD),
		.IDEX_m(IDEX_M),
		.IDEX_wb(IDEX_WB),
		.IDEX_ex(IDEX_EX)
	);
	ALUCtr aluctr(//
	    .ALUop(IDEX_EX[3:1]),
	    .functField(IDEX_SIGNEXTENDED[5:0]),
	    .operation(ALUCTR),
	    .Jump(JUMP1)//to be improved
	);
	ALU alu(//
	    .input1((ALUCTR==4'b0011||ALUCTR==4'b0100)?{27'h0,IDEX_SIGNEXTENDED[10:6]}:IDEX_READDATA1),
	    .input2(IDEX_EX[4]?IDEX_SIGNEXTENDED:IDEX_READDATA2),// to be improved
	    .aluCtr(ALUCTR),
	    .zero(ZERO),
	    .aluRes(ALURSLT)
	);

	EXMEM exmem(//
	    .clock(clock),
	    .reset(reset),
		.IDEX_wb(IDEX_WB),
		.IDEX_m(IDEX_M),
		.EX_branchTarget(IDEX_PCPLUS4+(SIGNEXTENDED<<2)),
		.EX_aluResult(ALURSLT),
		.EX_zero(ZERO),
		.EX_memWriteData(IDEX_READDATA2),
        .EX_writeReg(IDEX_EX[0]?IDEX_RD:IDEX_RT),
		.EXMEM_wb(EXMEM_WB),
		.EXMEM_m(EXMEM_M),
		.EXMEM_branchTarget(EXMEM_BRANCHTARGET),
		.EXMEM_zero(EXMEM_ZERO),
		.EXMEM_aluResult(EXMEM_ALURESULT),
		.EXMEM_memWriteData(EXMEM_MEMWRITEDATA),
		.EXMEM_writeReg(EXMEM_WRITEREG)
	);
	
	dataMemory data_memory(
	    .clock(clock),
	    .memWrite(EXMEM_M[2]),
	    .memRead(EXMEM_M[1]),
	    .address(EXMEM_ALURESULT),
	    .writeData(EXMEM_MEMWRITEDATA),
	    .readData(MEM_DATA)
	);
	MEMWB memwb(
	    .clock(clock),
	    .reset(reset),
		.EXMEM_wb(EXMEM_WB),
		.memReadData(MEM_DATA),
		.EXMEM_aluResult(EXMEM_ALURESULT),
		.EXMEM_writeReg(EXMEM_WRITEREG),
		.MEMWB_wb({MEMWB_REGWRITE,MEMWB_MEMTOREG}),
		.MEMWB_writeReg(MEMWB_WRITEREG),
		.MEMWB_aluResult(MEMWB_ALURESULT),
		.MEMWB_memReadData(MEMWB_MEMREADDATA)
	);
	
	
endmodule
