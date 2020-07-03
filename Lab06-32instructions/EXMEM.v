`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/14 18:41:34
// Design Name: 
// Module Name: IDEX
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

module EXMEM(
    input clock,
    input reset,
    input [1:0] IDEX_wb,
    input [4:0] IDEX_m,
    input IDEX_call,
    input [31:0] IDEX_PCPlus4,
    input IDEX_branchEqual,
    input [31:0] EX_branchTarget,
    input [31:0] EX_jumpTargetAddress,
    input [31:0] EX_aluResult,
    input EX_zero,
    input [31:0] EX_memWriteData,
    input [4:0] EX_writeReg,
    input EX_overflow,
    
    output reg [1:0] EXMEM_wb,//RegWrite
    output reg [4:0] EXMEM_m,
    output reg [31:0] EXMEM_branchTarget,
    output reg [31:0] EXMEM_jumpTargetAddress,
    output reg EXMEM_zero,
    output reg [31:0] EXMEM_aluResult,
    output reg [31:0] EXMEM_memWriteData,
    output reg [4:0] EXMEM_writeReg,
    output reg [31:0] EXMEM_PCPlus4,
    output reg EXMEM_call,
    output reg EXMEM_overflow,
    output reg EXMEM_branchEqual
);
    always @ (posedge clock)
    if(!reset)
    begin
        EXMEM_wb<=IDEX_wb;
        EXMEM_m<=IDEX_m;
        EXMEM_aluResult<=EX_aluResult;
        EXMEM_branchTarget<=EX_branchTarget;
        EXMEM_jumpTargetAddress<=EX_jumpTargetAddress;
        EXMEM_zero<=EX_zero;
        EXMEM_memWriteData<=EX_memWriteData;
        EXMEM_writeReg<=EX_writeReg;
        EXMEM_PCPlus4<=IDEX_PCPlus4;
        EXMEM_call<=IDEX_call;
        EXMEM_overflow<=EX_overflow;
        EXMEM_branchEqual<=IDEX_branchEqual;
        
    end
    else
    begin
        EXMEM_wb<=0;
        EXMEM_m<=0;
        EXMEM_aluResult<=0;
        EXMEM_branchTarget<=0;
        EXMEM_jumpTargetAddress<=0;
        EXMEM_zero<=0;
        EXMEM_memWriteData<=0;
        EXMEM_writeReg<=0;
        EXMEM_PCPlus4<=0;
        EXMEM_call<=0;
        EXMEM_overflow<=0;
        EXMEM_branchEqual<=0;
    end
endmodule