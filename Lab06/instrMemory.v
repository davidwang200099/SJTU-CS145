`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 10:12:39
// Design Name: 
// Module Name: instrMemory
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


module instrMemory(
    input [31:0] readAddress,
    output reg [31:0] instruction
    );
    reg [31:0] instrFile[31:0];
    always @ (readAddress)
    begin
        instruction=instrFile[readAddress>>2];
    end
endmodule
