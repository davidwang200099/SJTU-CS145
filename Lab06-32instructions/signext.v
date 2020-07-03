`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 09:36:43
// Design Name: 
// Module Name: signext
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


module signext(
    input [15:0] inst,
    output [31:0] data,
    output [31:0] zeroextended,
    output [31:0] leftshifted
    );
    assign data= inst[15]?{16'hffff,inst}:{16'h0000,inst};
    assign zeroextended={16'h0000,inst};
    assign leftshifted={inst,16'h0000};
endmodule
