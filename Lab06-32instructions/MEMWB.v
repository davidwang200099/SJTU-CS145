`timescale 1ns / 1ps

module MEMWB(
    input clock,
    input reset,
    input [1:0] EXMEM_wb,
    input [31:0] memReadData,
    input [31:0] EXMEM_aluResult,
    input [4:0] EXMEM_writeReg,
    input [31:0] EXMEM_PCPlus4,
    input EXMEM_call,

    output reg [1:0] MEMWB_wb,
    output reg [31:0] MEMWB_aluResult,
    output reg [31:0] MEMWB_memReadData,
    output reg [4:0] MEMWB_writeReg,
    output reg [31:0] MEMWB_PCPlus4,
    output reg MEMWB_call
);
    always @ (posedge clock)
    if(!reset)
    begin
        MEMWB_wb<=EXMEM_wb;
        MEMWB_aluResult<=EXMEM_aluResult;
        MEMWB_memReadData<=memReadData;
        MEMWB_writeReg<=EXMEM_writeReg;
        MEMWB_call<=EXMEM_call;
        MEMWB_PCPlus4<=EXMEM_PCPlus4;
    end
    else
    begin
        MEMWB_wb<=0;
        MEMWB_aluResult<=0;
        MEMWB_memReadData<=0;
        MEMWB_writeReg<=0;
        MEMWB_call<=0;
        MEMWB_PCPlus4<=0;
    end

endmodule
