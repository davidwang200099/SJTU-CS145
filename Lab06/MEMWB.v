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
module MEMWB(
    input clock,
    input reset,
    input [1:0] EXMEM_wb,
    input [31:0] memReadData,
    input [31:0] EXMEM_aluResult,
    input [4:0] EXMEM_writeReg,
    output reg [1:0] MEMWB_wb,
    output reg [31:0] MEMWB_aluResult,
    output reg [31:0] MEMWB_memReadData,
    output reg [4:0] MEMWB_writeReg
);
    always @ (posedge clock)
    if(!reset)
    begin
        MEMWB_wb=EXMEM_wb;
        MEMWB_aluResult=EXMEM_aluResult;
        MEMWB_memReadData=memReadData;
        MEMWB_writeReg=EXMEM_writeReg;
    end
    else
    begin
        MEMWB_wb=0;
        MEMWB_aluResult=0;
        MEMWB_memReadData=0;
        MEMWB_writeReg=0;
    end
    
endmodule