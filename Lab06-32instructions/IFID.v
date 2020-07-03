`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/14 18:34:20
// Design Name: 
// Module Name: IFID
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


module IFID(
    input clock,
    input reset,
    input [31:0] instruction_in,
    input [31:0] PC_Plus_4,
    output reg [31:0] IFID_PCplus4,
    output reg [31:0] IFID_instruction
    );
    always @ (posedge clock)
    if(!reset)
    begin
        IFID_PCplus4<=PC_Plus_4;
        IFID_instruction<=instruction_in;
    end
    else
    begin
        IFID_PCplus4=0;
        IFID_instruction=0;
    end
endmodule
