`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/24 08:16:32
// Design Name: 
// Module Name: Registers
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


module Registers(
    input clock,
    input reset,
    input [25:21] readReg1,
    input [20:16] readReg2,
    input [4:0] writeReg,
    input [31:0] writeData,
    input regWrite,
    output reg [31:0] readData1,
    output reg [31:0] readData2
    );
    reg [31:0] regFile[0:31];
    always @ (readReg1 or readReg2)
    begin
        regFile[0]=0;
        readData1=regFile[readReg1];
        readData2=regFile[readReg2];
    end
    always @ (negedge clock)
    begin
        if (reset)
		  begin
            regFile[0]=0;
            regFile[1]=0;
            regFile[2]=0;
            regFile[3]=0;
            regFile[4]=0;
            regFile[5]=0;
            regFile[6]=0;
            regFile[7]=0;
            regFile[8]=0;
            regFile[9]=0;
            regFile[10]=0;
            regFile[11]=0;
            regFile[12]=0;
            regFile[13]=0;
            regFile[14]=0;
            regFile[15]=0;
            regFile[16]=0;
            regFile[17]=0;
            regFile[18]=0;
            regFile[19]=0;
            regFile[20]=0;
            regFile[21]=0;
            regFile[22]=0;
            regFile[23]=0;
            regFile[24]=0;
            regFile[25]=0;
            regFile[26]=0;
            regFile[27]=0;
            regFile[28]=0;
            regFile[29]=0;
            regFile[30]=0;
            regFile[31]=0;
	     end
        if(regWrite==1) regFile[writeReg]=writeData;
    end
endmodule
