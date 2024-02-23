`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:55:08 AM
// Design Name: 
// Module Name: inst_decoder_tb
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


module inst_decoder_tb(
logic [6:0] immediate,
logic [5:0] nzimm,
logic [8:0] offset,
logic [3:0] opcode,
logic RegWrite,
logic RegDst,
logic [15:0] instr_i,
logic ALUSrc1,
logic ALUSrc2,
logic [3:0] ALUOp,
logic MemWrite,
logic [3:0] opcode,
logic MemToReg,
logic Regsrc
    );
    
    initial begin
    immediate = 7'b0; nzimm = 6'b0; offset = 9'b0; opcode = 4'b0;
    #100 immediate = 7'b100; nzimm = 6'b0; offset = 9'b0; opcode = 4'b0000;
    #100 immediate = 7'b100; nzimm = 6'b0; offset = 9'b0; opcode = 4'b0001;
    #100 immediate = 7'b0; nzimm = 6'b0; offset = 9'b0; opcode = 4'b0010;
    #100 immediate = 7'b0; nzimm = 6'b100; offset = 9'b0; opcode = 4'b0011;
    #100 immediate = 7'b0; nzimm = 6'b0; offset = 9'b0; opcode = 4'b0100;
    #100 immediate = 7'b1010101; nzimm = 6'b0; offset = 9'b0; opcode = 4'b0101;
    #100 immediate = 7'b0; nzimm = 6'b0; offset = 9'b0; opcode = 4'b0110;
    #100 immediate = 7'b0; nzimm = 6'b0; offset = 9'b0; opcode = 4'b0111;
    #100 immediate = 7'b0; nzimm = 6'b10; offset = 9'b0; opcode = 4'b1000;
    #100 immediate = 7'b0; nzimm = 6'b10; offset = 9'b0; opcode = 4'b1001;
    #100 immediate = 7'b0; nzimm = 6'b0; offset = 9'b101010101; opcode = 4'b1010;
    #100 immediate = 7'b0; nzimm = 6'b0; offset = 9'b101010101; opcode = 4'b1011;
    end
endmodule
