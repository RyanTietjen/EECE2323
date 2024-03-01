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
    input logic [6:0]immediate,
    input logic [5:0]nzimm,
    input logic [8:0]offset,
    input logic [3:0]opcode,
    output logic RegWrite,
    output logic RegDst,
    output logic [15:0]instr_i,
    output logic ALUSrc1,
    output logic ALUSrc2,
    output logic [3:0]ALUOp,
    output logic MemWrite,
    output logic [3:0]opcode_out,
    output logic MemToReg,
    output logic Regsrc
    );
    
    always @ (immediate, nzimm, offset, opcode) begin
    
    opcode_out = opcode;
    case(opcode)
    
    4'b0000:
    begin
    RegWrite = 1;
    RegDst = 1;
    instr_i = immediate;
    ALUSrc1 = 0;
    ALUSrc2 = 0;
    ALUOp = 4'b0;
    MemWrite = 0;
    MemToReg = 1;
    Regsrc = 0;
    end
    
    4'b0001:
    begin
    RegWrite = 0;
    RegDst = 0;
    instr_i = immediate;
    ALUSrc1 = 0;
    ALUSrc2 = 0;
    ALUOp = 4'b0;
    MemWrite = 1;
    MemToReg = 0;
    Regsrc = 0;
    end
    
    4'b0010:
    begin
    RegWrite = 1;
    RegDst = 1;
    instr_i = immediate;
    ALUSrc1 = 0;
    ALUSrc2 = 0;
    ALUOp = 4'b0;
    MemWrite = 0;
    MemToReg = 0;
    Regsrc = 0;
    end
    
    4'b0011:
    begin
    RegWrite = 1;
    RegDst = 1;
    instr_i = nzimm;
    ALUSrc1 = 0;
    ALUSrc2 = 1;
    ALUOp = 4'b0;
    MemWrite = 0;
    MemToReg = 0;
    Regsrc = 1;
    end
    
    4'b0100:
    begin
    RegWrite = 1;
    RegDst = 1;
    instr_i = immediate;
    ALUSrc1 = 0;
    ALUSrc2 = 0;
    ALUOp = 4'b10;
    MemWrite = 0;
    MemToReg = 0;
    Regsrc = 1;
    end
    
    4'b0101:
    begin
    RegWrite = 1;
    RegDst = 1;
    instr_i = immediate;
    ALUSrc1 = 0;
    ALUSrc2 = 1;
    ALUOp = 4'b10;
    MemWrite = 0;
    MemToReg = 0;
    Regsrc = 1;
    end
    
    4'b0110:
    begin
    RegWrite = 1;
    RegDst = 1;
    instr_i = immediate;
    ALUSrc1 = 0;
    ALUSrc2 = 0;
    ALUOp = 4'b11;
    MemWrite = 0;
    MemToReg = 0;
    Regsrc = 1;
    end
    
    4'b0111:
    begin
    RegWrite = 1;
    RegDst = 1;
    instr_i = immediate;
    ALUSrc1 = 0;
    ALUSrc2 = 0;
    ALUOp = 4'b1000;
    MemWrite = 0;
    MemToReg = 0;
    Regsrc = 1;
    end
    
    4'b1000:
    begin
    RegWrite = 1;
    RegDst = 1;
    instr_i = nzimm;
    ALUSrc1 = 0;
    ALUSrc2 = 1;
    ALUOp = 4'b100;
    MemWrite = 0;
    MemToReg = 0;
    Regsrc = 1;
    end
    
    4'b1001:
    begin
    RegWrite = 1;
    RegDst = 1;
    instr_i = nzimm;
    ALUSrc1 = 0;
    ALUSrc2 = 1;
    ALUOp = 4'b101;
    MemWrite = 0;
    MemToReg = 0;
    Regsrc = 1;
    end
    
    4'b1010:
    begin
    RegWrite = 0;
    RegDst = 0;
    instr_i = offset;
    ALUSrc1 = 0;
    ALUSrc2 = 1;
    ALUOp = 4'b110;
    MemWrite = 0;
    MemToReg = 0;
    Regsrc = 0;
    end
    
    4'b1011:
    begin
    RegWrite = 0;
    RegDst = 0;
    instr_i = offset;
    ALUSrc1 = 0;
    ALUSrc2 = 1;
    ALUOp = 4'b111;
    MemWrite = 0;
    MemToReg = 0;
    Regsrc = 0;
    end



    
    endcase
    end
endmodule
