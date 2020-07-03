`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/17 11:17:14
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [31:0] input1,
    input [31:0] input2,
    input [3:0] aluCtr,
    output reg zero,
    output reg overflow,
    output reg [31:0] aluRes
    );
    reg [31:0] complement;
    integer i;
    always @(input1 or input2 or aluCtr)
    begin
        case(aluCtr)
            4'b0000:
                begin
                    aluRes=input1 & input2;
                    if(aluRes==0) zero=1;
                    else zero=0;
                    overflow=0;
                end
            4'b0001:
                begin
                    aluRes=input1 | input2;
                    if(aluRes==0) zero=1;
                    else zero=0;
                    overflow=0;
                end
            4'b0010:
                begin
                    aluRes=input1+input2;
                    zero=aluRes?0:1;
                    overflow=((input1[31]&input2[31]&!aluRes[31])|
                             (!input1[31]&!input2[31]&aluRes[31]))?
                                1:0;
                end
            4'b0011:
                begin
                    aluRes=input2<<input1;
                    if(aluRes==0) zero=1;
                    else zero=0;
                    overflow=0;
                end
            4'b0100:
                begin
                    aluRes=input2>>input1;
                    if(aluRes==0) zero=1;
                    else zero=0;
                    overflow=0;
                end
            4'b0101:
                begin
                    aluRes=input1 ^ input2;
                    if(aluRes==0) zero=1;
                    else zero=0;
                    overflow=0;
                end
            4'b0110:
                begin
                    if(input2==32'h80000000)
                        begin
                            aluRes=input1-input2;
                            overflow=input1[0]?1:0;
                        end
                    else
                        begin
                            complement=(~input2)+1;
                            aluRes=input1+complement;
                            overflow=((input1[31]&complement[31]&!aluRes[31])||
                                      (!input1[31]&!complement[31]&aluRes[31]))?
                                      1:0;
                        end
                    zero=aluRes?0:1;
                end
            4'b0111:
                begin
                    overflow=0;
                    if(input1[31]==input2[31]) 
                    begin
                        aluRes=(input1<input2)?1:0;
                        zero=aluRes?0:1;
                    end 
                    else
                    begin
                        aluRes=input1[31]?1:0;
                        zero=aluRes?0:1;
                    end
                    
                end
            4'b1000:
                begin
                    aluRes=input1+input2;
                    zero=aluRes?0:1;
                    overflow=((input1[31]&complement[31]&!aluRes[31])|
                             (!input1[31]&!input2[31]&aluRes[31]))?
                                1:0;
                end
            4'b1001:
                begin
                    aluRes=input1-input2;
                    zero=aluRes?0:1;
                    overflow=0;
                end
            4'b1010:
                begin
                    aluRes=(input1<input2)?1:0;
                    zero=aluRes?0:1;
                    overflow=0;
                end 
            4'b1011:
                begin
                    aluRes=~(input1|input2);
                    if(aluRes==0) zero=1;
                    else zero=0;
                    overflow=0;
                end
            4'b1100:
                begin
                    complement=input2;
                    for(i=input1;i>0;i=i-1)
                    begin
                        complement=complement>>1;
                        //complement=input2[31]?({1'b1,complement[30:0]}):({1'b0,complement[30:0]});
                        complement=({input2[31],31'h0})|complement;
                    end 
                    aluRes=complement;
                    overflow=0;
                    zero=aluRes?0:1;
                end 
        endcase
    end
endmodule
