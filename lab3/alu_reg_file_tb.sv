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
    //regfile variables
    logic rst;
    logic clk;
    logic wr_en;
    logic [2:0] rd0_addr;
    logic [2:0] rd1_addr;
    logic [2:0] wr_addr;
    logic [15:0] wr_data;
    logic [15:0] rd0_data;
    logic [15:0] rd1_data;
    //alu variables
    logic[15:0] a;
    logic[15:0] b;
    logic[3:0] s;
    logic[15:0] f;
    logic take_branch;
    logic ovf;
    //mux variables
    logic [15:0] mux_a;
    logic [15:0] mux_b;
    logic sel_mux;
    logic [15:0] out;
    
reg_file UTT(.rst(rst), .clk(clk), .wr_en(wr_en), .rd0_addr(rd0_addr), .rd1_addr(rd1_addr), 
.wr_addr(wr_addr), .wr_data(wr_data), .rd0_data(rd0_data), .rd1_data(rd1_data));

//alu UTT(.a(a), .b(b), .s(s), .f(f), .take_branch(take_branch), .ovf(ovf));
//mux1 UTT(.mux_a(rd0_data), );
initial begin
    rst =0; ALUSrc1 = 1; ALUSrc2 = 1; alu_input2_instr_src = 16'hC; ALUOp = 0; RegWrite = 0; 
    #100; 
end
always #10 clk = ~clk; 
endmodule
