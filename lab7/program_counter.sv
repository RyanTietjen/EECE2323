`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2024 09:46:15 AM
// Design Name: 
// Module Name: program_counter
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


module program_counter(
    input clk,
    input rst,
    output logic [8:0] pc,
    input logic alu_take_branch,
    input logic [8:0]offset
    );
    
    always @ (posedge clk, posedge rst) begin
        if (rst) begin
            pc <= 0;
        end
        else begin
            pc <= alu_take_branch ? (pc + offset) : (pc + 1);
        end
    end
    
        
       
    
endmodule
