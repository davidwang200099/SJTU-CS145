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
    input [2:0] ALUop,
    input [5:0] functField,
    output reg [3:0] operation,
    output reg Jump
    );
    always @ (ALUop or functField)
    begin 
        Jump=0;
        casex({ALUop,functField})
            9'b000xxxxxx:operation=4'b0010;//lw,sw,addi,jump,jal +
            9'b001xxxxxx:operation=4'b1001;//beq,bne -u
            9'b011xxxxxx:operation=4'b0000;//andi &
            9'b100xxxxxx:operation=4'b0001;//ori |
            9'b101xxxxxx:operation=4'b0011;// lui <<
            9'b110xxxxxx:operation=4'b1010;//sltiu
            9'b111xxxxxx:operation=4'b0111;//slti

            9'b010100100:operation=4'b0000;//and &
            9'b010100101:operation=4'b0001;//or |
            9'b010100000:operation=4'b0010;//add +
            9'b010000000:operation=4'b0011;//sll <<
            9'b010000010:operation=4'b0100;//srl >>
            9'b010100110:operation=4'b0101;//xor 
            9'b010100010:operation=4'b0110;//sub -
            9'b010101010:operation=4'b0111;//slt a<b?1:0
            9'b010100001:operation=4'b1000;//addu +u
            9'b010100011:operation=4'b1001;//subu -u
            9'b010101011:operation=4'b1010;//sltu
            9'b010100111:operation=4'b1011;//nor
            9'b010000011:operation=4'b1100;//sra
            9'b010000100:operation=4'b0011;//sllv
            9'b010000110:operation=4'b0100;//srlv
            9'b010000111:operation=4'b1100;//srav
            9'b010001000:
            begin
            operation=4'b0010;//jr
            Jump=1;
            end
        endcase
    end
endmodule
