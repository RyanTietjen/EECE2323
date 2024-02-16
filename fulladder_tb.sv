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
    logic[2:0] ALUOp;
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
mux mux1(ReadData1, 15'b0, ALUSrc1, input1);
mux mux2(ReadData2, alu_input2_instr_src, ALUSrc2, input2);
alu sixteenbit_alu(input1, input2, ALUOp, result, take_branch, ovf);

//sixteenbit_alu UTT(.a(input1), .b(input2), .s(ALUOp), .f(result), .take_branch(take_branch), .ovf(ovf));
//mux1 UTT(.a(ReadData1),.b(15'b0), .sel_mux(ALUSrc1), .out(input1));
//mux2 UTT(.a(ReadData2),.b(alu_input2_instr_src), .sel_mux(ALUSrc2), .out(input2));
//register1 UTT(.rst(reset), .clk(clk), .wr_en(RegWrite), .rd0_addr(rd0_addr), .rd1_addr(rd1_addr), .wr_addr(wr_addr), .wr_data(wr_data), .rd0_data(ReadData1), .rd1_data(ReadData2));
initial begin
    reset=1;
    #10 reset = 0;
    end
    
initial begin
    clk=1;
    forever #5 clk=~clk;
end
initial begin
    //ALUsrc1 = 1: zero register, 0: ReadData1
    //ALUsrc2 = 1: alu_input2_instr_src, 0: ReadData2
   
    ALUSrc1 = 1; ALUSrc2 = 1; alu_input2_instr_src = 16'hC; ALUOp = 0; RegWrite = 0; 
    #100;
end

endmodule
