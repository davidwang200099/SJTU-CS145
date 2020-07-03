`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/17 09:40:47
// Design Name: 
// Module Name: Ctr_tb
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


module Ctr_tb(

    );
    // Inputs
	reg [5:0] opCode;

	// Outputs
	wire regDest;
	wire aluSrc;
	wire memToReg;
	wire regWrite;
	wire memRead;
	wire memWrite;
	wire Branch;
	wire [1:0] ALUop;
	wire Jump;

	// Instantiate the Unit Under Test (UUT)
	Ctr uut (
		.opCode(opCode), 
		.regDest(regDest), 
		.aluSrc(aluSrc), 
		.memToReg(memToReg), 
		.regWrite(regWrite), 
		.memRead(memRead), 
		.memWrite(memWrite), 
		.Branch(Branch), 
		.ALUop(ALUop), 
		.Jump(Jump)
	);

	initial begin
		// Initialize Inputs
		opCode = 0;

		// Wait 100 ns for global reset to finish
		#200;
        
		#100 opCode = 6'b100011;
		#100 opCode = 6'b101011;
		#100 opCode = 6'b000100;
		#100 opCode = 6'b000010;
		#100 opCode = 6'b010101;
		// Add stimulus here

	end
endmodule
