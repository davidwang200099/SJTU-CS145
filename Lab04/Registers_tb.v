`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 08:27:11
// Design Name: 
// Module Name: Registers_tb
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


module Registers_tb();
    reg clock;
    reg [25:21] readReg1;
    reg [20:16] readReg2;
    reg [4:0] writeReg;
    reg [31:0] writeData;
    reg regWrite;
    wire [31:0] readData1;
    wire [31:0] readData2;
    reg reset;
    Registers re(
        .clock(clock),
        .readReg1(readReg1),
        .readReg2(readReg2),
        .writeReg(writeReg),
        .writeData(writeData),
        .regWrite(regWrite),
        .readData1(readData1),
        .readData2(readData2),
        .reset(reset)
    );
    
    always #100 clock=~clock;
    initial begin
        clock=0;
        readReg1=0;
        readReg2=0;
        writeReg=0;
        writeData=0;
        regWrite=0;
        reset=1;
        #100;
        reset=0;
        #300;
        regWrite=1'b1;
        writeReg=5'b10101;
        writeData=32'hffff0000;
        #200;
        writeReg=5'b01010;
        writeData=32'h0000ffff;
        
        #200;
        regWrite=1'b0;
        writeReg=5'b00000;
        writeData=32'h00000004;
        
        #200;
        readReg1=5'b10101;
        readReg2=5'b01010;
        
        
    end
endmodule
