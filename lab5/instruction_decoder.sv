`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/23/2024 10:53:46 AM
// Design Name: 
// Module Name: instruction_decoder
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


module instruction_decoder(
    input [6:0] immediate,
    input [5:0] nzimm,
    input [8:0] offset,
    input [3:0] opcode,
    output RegWrite,
    output RegDst,
    output [15:0] instr_i,
    output ALUSrc1,
    output ALUSrc2,
    output [3:0] ALUOp,
    output MemWrite,
    output [3:0] opcode,
    output MemToReg,
    output Regsrc
    );
endmodule
