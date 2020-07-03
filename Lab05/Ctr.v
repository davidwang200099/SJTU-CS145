`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/17 09:18:07
// Design Name: 
// Module Name: Ctr
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


module Ctr(
    input [5:0] opCode,
    output reg regDest,
    output reg [1:0] aluSrc,
    output reg memToReg,
    output reg regWrite,
    output reg memRead,
    output reg memWrite,
    output reg Branch,
    output reg [2:0] ALUop,
    output reg Jump,
    output reg jumpTarget,
    output reg Call
    );
    always @(opCode)
    begin
        case(opCode)
            6'b000000://add,sub,and,or,slt,jr
            begin
                regDest=1;
                aluSrc=0;
                memToReg=0;
                regWrite=1;
                memRead=0;
                memWrite=0;
                Branch=0;
                Jump=0;
                jumpTarget=0;
                Call=0;
                ALUop=3'b010;
            end
            6'b000010://jump
            begin
                regDest=0;
                aluSrc=0;
                memToReg=0;
                regWrite=0;
                memRead=0;
                memWrite=0;
                Branch=0;
                Jump=1;
                jumpTarget=1;
                Call=0;
                ALUop=3'b000;
            end
            6'b000011://jal
            begin
                regDest=0;
                aluSrc=0;
                memToReg=0;
                regWrite=1;
                memRead=0;
                memWrite=0;
                Branch=0;
                Jump=1;
                jumpTarget=1;
                Call=1;
                ALUop=3'b000;
            end
            6'b001000://addi
            begin
                regDest=0;
                aluSrc=1;
                memToReg=0;
                regWrite=1;
                memRead=0;
                memWrite=0;
                Branch=0;
                Jump=0;
                jumpTarget=0;
                Call=0;
                ALUop=3'b000;
            end
            6'b001100://andi
            begin
                regDest=0;
                aluSrc=1;
                memToReg=0;
                regWrite=1;
                memRead=0;
                memWrite=0;
                Branch=0;
                Jump=0;
                jumpTarget=0;
                Call=0;
                ALUop=3'b000;
            end
            6'b001101://ori
            begin
                regDest=0;
                aluSrc=1;
                memToReg=0;
                regWrite=1;
                memRead=0;
                memWrite=0;
                Branch=0;
                Jump=0;
                jumpTarget=0;
                Call=0;
                ALUop=3'b000;
            end
            6'b100011://lw
            begin
                regDest=0;
                aluSrc=1;
                memToReg=1;
                regWrite=1;
                memRead=1;
                memWrite=0;
                Branch=0;
                Jump=0;
                jumpTarget=0;
                Call=0;
                ALUop=3'b000;
            end
            6'b101011://sw
            begin
                aluSrc=1;
                regWrite=0;
                memRead=0;
                memWrite=1;
                Branch=0;
                Jump=0;
                jumpTarget=0;
                Call=0;
                ALUop=3'b000;
            end
            6'b000100://beq
            begin
                aluSrc=0;
                regWrite=0;
                memRead=0;
                memWrite=0;
                Branch=1;
                Jump=0;
                jumpTarget=0;
                Call=0;
                ALUop[0]=3'b001;
            end
            
            
        endcase
    end
endmodule
