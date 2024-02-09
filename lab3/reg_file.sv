`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/09/2024 09:18:58 AM
// Design Name: 
// Module Name: reg_file
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


module reg_file(
    input rst,
    input clk,
    input wr_en,
    input [2:0] rd0_addr,
    input [2:0] rd1_addr,
    input [2:0] wr_addr,
    input [15:0] wr_data,
    output [15:0] rd0_data,
    output [15:0] rd1_data
    );
    
    reg [15:0] reg_array [0:7];
    assign reg_array[0] = 15'b0;
    assign rd0_data = reg_array[rd0_addr];
    assign rd1_data = reg_array[rd1_addr];
    
    
    always_ff @(posedge clk) begin
        if (rst) begin
        integer i;
            for (i = 1; i < 8; i = i + i) begin
                reg_array[i] <= 0;
            end
        
        end else if (wr_en) begin
            reg_array[wr_addr] <= wr_data;
        end
    end
    


    

endmodule
