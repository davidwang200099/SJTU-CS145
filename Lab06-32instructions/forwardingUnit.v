`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/15 22:35:12
// Design Name: 
// Module Name: forwardingUnit
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


module forwardingUnit(
    input clock,
    input [4:0] IDEX_rs,
    input [4:0] IDEX_rt,
    input [4:0] EXMEM_regDest,
    input [4:0] MEMWB_regDest,
    input EXMEM_regWrite,
    input MEMWB_regWrite,
    
    output reg [1:0] ForwardA,
    output reg [1:0] ForwardB
    
    );
    always @ (IDEX_rs or IDEX_rt or EXMEM_regDest or MEMWB_regDest or EXMEM_regWrite or MEMWB_regWrite)
    begin
        ForwardA=2'b00;
        ForwardB=2'b00;
        if(EXMEM_regWrite && EXMEM_regDest!=0 && (EXMEM_regDest==IDEX_rs)) ForwardA=2'b10;
        else
        begin
        if(MEMWB_regWrite && MEMWB_regDest!=0 && !(EXMEM_regWrite && EXMEM_regDest && (EXMEM_regDest==IDEX_rs)) && MEMWB_regDest==IDEX_rs) ForwardA=2'b01;
        end
        if(EXMEM_regWrite && EXMEM_regDest!=0 && (EXMEM_regDest==IDEX_rt)) ForwardB=2'b10;
        else
        begin
        if(MEMWB_regWrite && MEMWB_regDest!=0 && !(EXMEM_regWrite && EXMEM_regDest!=0 && (EXMEM_regDest==IDEX_rt))&& MEMWB_regDest==IDEX_rt) ForwardB=2'b01;
        end
   end
endmodule
