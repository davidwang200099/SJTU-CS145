`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/08 08:42:16
// Design Name: 
// Module Name: top_tb
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


module top_tb();
    reg clock,reset;
    always #50 clock=!clock;
    Top top(.clock(clock),.reset(reset));
    //wire [15:0] out;
    //assign out=top.registers.regFile[1][15:0];
    initial begin
        $readmemh("test-new-instr-data.txt",top.data_memory.memFile);
        
        $readmemb("test-new-instr.txt",top.instruction_memory.instrFile);
        //top.instruction_memory.instrFile[0]=32'h00000001;
        clock=0;
        reset=1;
        #75
        reset=0;
    end
endmodule
