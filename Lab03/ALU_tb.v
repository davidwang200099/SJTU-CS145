`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/17 11:27:50
// Design Name: 
// Module Name: ALU_tb
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


module ALU_tb();
    reg [31:0] input1;
    reg [31:0] input2;
    reg [3:0] aluCtr;
    wire zero;
    wire [31:0] aluRes;
    
    ALU alu(
        .input1(input1),
        .input2(input2),
        .aluCtr(aluCtr),
        .zero(zero),
        .aluRes(aluRes)
    );
    initial begin
        input1=25;
        input2=13;
        aluCtr=0;
        #100
        aluCtr=4'b0000;
        #100
        aluCtr=4'b0001;
        #100
        aluCtr=4'b0010;
        #100
        aluCtr=4'b0110;
        #100
        aluCtr=4'b0111;
        #100
        aluCtr=4'b1100;    
    end   
endmodule
