`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 09:39:25
// Design Name: 
// Module Name: signext_tb
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


module signext_tb();
    reg [15:0] inst;
    wire [31:0] data;
    signext ext(
        .inst(inst),
        .data(data)
    );
    initial begin
        inst=16'h0000;
        #200
        inst=16'b0000000000000001;
        #200
        inst=16'b1111111111111111;
        #200
        inst=16'b0000000000000010;
        #200
        inst=16'b1111111111111110;
    end
endmodule
