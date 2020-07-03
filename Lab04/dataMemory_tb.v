`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 09:12:11
// Design Name: 
// Module Name: dataMemory_tb
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


module dataMemory_tb();
    reg clock;
    reg [31:0] address;
    reg [31:0] writeData;
    reg memWrite;
    reg memRead;
    wire [31:0] readData;
    
    dataMemory dm(
        .clock(clock),
        .address(address),
        .writeData(writeData),
        .memWrite(memWrite),
        .memRead(memRead),
        .readData(readData)
    );
    always #100 clock=~clock;
    initial begin
        clock=0;
        address=0;
        writeData=0;
        memWrite=0;
        memRead=0;
        #185;
        memWrite=1'b1;
        address=32'h00000007;
        writeData=32'he0000000;
        #100;
        memWrite=1'b1;
        writeData=32'hffffffff;
        address=32'h00000006;
        
        #185;
        memRead=1'b1;
        memWrite=1'b0;
        
        #80;
        memWrite=1;
        address=8;
        writeData=32'haaaaaaaa;
        
        #80;
        memWrite=0;
        memRead=1;
        
    end
endmodule
