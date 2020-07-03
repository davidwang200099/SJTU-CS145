`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/17 10:08:08
// Design Name: 
// Module Name: ALUCtr_tb
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


module ALUCtr_tb();
    reg [1:0] ALUop;
    reg [5:0] functField;
    wire [3:0] operation;
    ALUCtr uu(
        .ALUop(ALUop),
        .functField(functField),
        .operation(operation)
    );
    initial begin
        ALUop=2'b00;
        functField=6'b000000;
        #100;
        ALUop=2'b00;
        functField=6'b000001;
        #100
        ALUop=2'b00;
        functField=6'b001101;
        #100
        ALUop=2'b01;
        functField=6'b100100;
        #100
        ALUop=2'b10;
        functField=6'b100000;
        #100
        functField=6'b010010;
        #100
        functField=6'b010100;
        #100
        functField=6'b100101;
        #100
        functField=6'b011010;
    end
endmodule