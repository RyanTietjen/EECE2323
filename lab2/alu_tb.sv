//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2024 09:41:14 AM
// Design Name: 
// Module Name: alu_tb
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

`timescale 1ns / 1ps
module alu_tb();
logic [15:0]a;
logic [15:0]b;
logic [3:0]s;
logic [15:0]f;
logic take_branch;
logic ovf;
    
    alu UTT(.a(a), .b(b), .s(s), .f(f), .take_branch(take_branch), .ovf(ovf));
    initial begin
    a=16'h3DB; b=16'h2A6; s = 4'b1000;
    #100 a=f; s=4'b0001;
    #100 b=f; s=4'b0011;
    #100 b=f; a=16'h7; s=4'b0010;
    #100 b=f; s = 4'b0101;
    
    #100 a=16'hFFE9; b =16'h2; s = 4'b0100;
    #100 a=f; b=16'h3E; s = 4'b0000;
    #100 s=4'b0111;
    
    #100 a=16'hA415; b = 16'hA555; s = 4'b0000; //tests overflow
    #100 s = 16'b1111; //tests default
    end
    
endmodule
