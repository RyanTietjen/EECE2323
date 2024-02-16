`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 10:00:02 AM
// Design Name: 
// Module Name: alu_reg_file_tb
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


module alu_reg_file_tb();
    //inputs
    logic reset;
    logic clk;
    logic [2:0] rd0_addr;
    logic [2:0] rd1_addr;
    logic [2:0] wr_addr;
    logic [15:0] wr_data;
    logic RegWrite;
    logic [15:0] alu_input2_instr_src;
    logic ALUSrc2;
    logic ALUSrc1;
    logic[3:0] ALUOp;
    //outputs
    logic[15:0] result;
    logic [15:0] input1;
    logic [15:0] input2;
    logic take_branch;
    logic ovf;
    //between wires
    logic[15:0] ReadData1;
    logic[15:0] ReadData2;
    
reg_file register1(reset, clk, RegWrite, rd0_addr, rd1_addr, wr_addr, wr_data, ReadData1, ReadData2);
mux mux1(ReadData1, 16'b0, ALUSrc1, input1);
mux mux2(ReadData2, alu_input2_instr_src, ALUSrc2, input2);
alu sixteenbit_alu(input1, input2, ALUOp, result, take_branch, ovf);

initial begin
    reset=1;
    #10 reset = 0;
    end
    
initial begin
    clk=1;
    forever #10 clk=~clk;
end
initial begin
    //ALUsrc1 = 0: zero register, 1: ReadData1
    //ALUsrc2 = 0: alu_input2_instr_src, 1: ReadData2
    ALUSrc1 = 0; ALUSrc2 = 0; rd0_addr = 0; rd1_addr = 0; wr_addr = 0; wr_data = 0; RegWrite = 0; alu_input2_instr_src = 0; ALUOp = 0;
    #100
    ALUSrc1 = 0; ALUSrc2 = 0; alu_input2_instr_src = 16'hC; ALUOp = 4'b0000; RegWrite = 0; 
    #100;
    wr_addr = 2; wr_data = result; RegWrite = 1;
    #100;
    ALUSrc1 = 0; ALUSrc2 = 0; alu_input2_instr_src = 17;
    #100;
    wr_addr = 3; wr_data = result; RegWrite = 1;
    #100;
    rd0_addr = 2; rd1_addr = 3;  ALUSrc1 = 1; ALUSrc2 = 1; 
    #100;
end

endmodule
