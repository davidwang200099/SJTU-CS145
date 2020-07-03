`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/17 09:58:32
// Design Name: 
// Module Name: ALUCtr
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


module ALUCtr(
    input [1:0] ALUop,
    input [5:0] functField,
    output reg [3:0] operation
    );
    always @ (ALUop or functField)
    begin 
        casex({ALUop,functField})
            8'b00xxxxxx:operation=4'b0010;
            8'bx1xxxxxx:operation=4'b0110;
            8'b1xxx0000:operation=4'b0010;
            8'b1xxx0010:operation=4'b0110;
            8'b1xxx0100:operation=4'b0000;
            8'b1xxx0101:operation=4'b0001;
            8'b1xxx1010:operation=4'b0111;
        endcase
    end
endmodule
