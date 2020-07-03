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
    input [4:0] IFID_rs,
    input [31:0] readData1,
    input [31:0] readData2,
    input [31:0] signextended,
    input [31:0] zeroextended,
    input [31:0] leftshifted,
    input [4:0] IFID_rt,
    input [4:0] IFID_rd,
    input [1:0] wb,//RegWrite
    input [4:0] m,// Jumptarget,Jump,Branch,memRead,memWrite
    input [6:0] ex,// D6-D5:Signed D4:ALUSrc D3-D1:ALUOp D0:RegDst
    input call,
    input branchEqual,
    output reg [31:0] IDEX_PCPlus4,
    output reg [31:0] IDEX_readData1,
    output reg [31:0] IDEX_readData2,
    output reg [31:0] IDEX_signextended,
    output reg [31:0] IDEX_zeroextended,
    output reg [31:0] IDEX_leftshifted,
    output reg [4:0] IDEX_rs,
    output reg [4:0] IDEX_rt,
    output reg [4:0] IDEX_rd,
    output reg [1:0] IDEX_wb,
    output reg [4:0] IDEX_m,
    output reg [6:0] IDEX_ex,
    output reg IDEX_call,
    output reg IDEX_branchEqual
    );
    always @ (posedge clock)
    if(!reset)
        begin
        IDEX_PCPlus4<=IFID_PCPlus4;
        IDEX_readData1<=readData1;
        IDEX_readData2<=readData2;
        IDEX_signextended<=signextended;
        IDEX_zeroextended<=zeroextended;
        IDEX_leftshifted<=leftshifted;
        IDEX_rs<=IFID_rs;
        IDEX_rt<=IFID_rt;
        IDEX_rd<=IFID_rd;
        IDEX_m<=m;
        IDEX_wb<=wb;
        IDEX_ex<=ex;
        IDEX_call<=call;
        IDEX_branchEqual<=branchEqual;
        end
    else
        begin
        IDEX_PCPlus4<=0;
        IDEX_readData1<=0;
        IDEX_readData2<=0;
        IDEX_signextended<=0;
        IDEX_zeroextended<=0;
        IDEX_leftshifted<=0;
        IDEX_rt<=0;
        IDEX_rd<=0;
        IDEX_m<=0;
        IDEX_wb<=0;
        IDEX_ex<=0;
        IDEX_call=0;
        IDEX_branchEqual<=0;
        end
endmodule
