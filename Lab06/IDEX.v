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


module IDEX(
    input clock,
    input reset,
    input [31:0] IFID_PCPlus4,
    input [31:0] readData1,
    input [31:0] readData2,
    input [31:0] signextended,
    input [4:0] IFID_rt,
    input [4:0] IFID_rd,
    input [1:0] wb,//RegWrite
    input [2:0] m,// Branch,memRead,memWrite
    input [4:0] ex,// D4:ALUSrc D3-D1:ALUOp D0:RegDst
    output reg [31:0] IDEX_PCPlus4,
    output reg [31:0] IDEX_readData1,
    output reg [31:0] IDEX_readData2,
    output reg [31:0] IDEX_signextended,
    output reg [4:0] IDEX_rt,
    output reg [4:0] IDEX_rd,
    output reg [1:0] IDEX_wb,
    output reg [2:0] IDEX_m,
    output reg [4:0] IDEX_ex
    );
    always @ (posedge clock)
    if(!reset)
        begin
        IDEX_PCPlus4=IFID_PCPlus4;
        IDEX_readData1=readData1;
        IDEX_readData2=readData2;
        IDEX_signextended=signextended;
        IDEX_rt=IFID_rt;
        IDEX_rd=IFID_rd;
        IDEX_m=m;
        IDEX_wb=wb;
        IDEX_ex=ex;
        end
    else
        begin
        IDEX_PCPlus4=0;
        IDEX_readData1=0;
        IDEX_readData2=0;
        IDEX_signextended=0;
        IDEX_rt=0;
        IDEX_rd=0;
        IDEX_m=0;
        IDEX_wb=0;
        IDEX_ex=0;
        end
endmodule
