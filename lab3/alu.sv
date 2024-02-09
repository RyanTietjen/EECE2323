`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/02/2024 09:23:47 AM
// Design Name: 
// Module Name: alu
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


module alu(
    input logic[15:0] a,
    input logic[15:0] b,
    input logic[3:0] s,
    output logic[15:0] f,
    output logic take_branch,
    output logic ovf
    );
    
    always @(a, b,s) begin
    case (s)
    4'b0000:
    begin 
    f=a+b; 
    ovf = (a[15] & b[15] & !f[15]) | (!a[15] & !b[15] & f[15]);
    take_branch = 0;
    end
    
    4'b0001:
    begin 
    f = ~b;
    ovf = 0;
    take_branch = 0;
    end
    
    4'b0010:
    begin 
    f = a & b;
    ovf = 0;
    take_branch = 0;
    end
    
    4'b0011:
    begin 
    f = a | b;
    ovf = 0;
    take_branch = 0;
    end
    
    4'b0100:
    begin 
    f = a >>> b;
    ovf = 0;
    take_branch = 0;
    end
    
    4'b0101:
    begin 
    f = a << b;
    ovf = 0;
    take_branch = 0;
    end
         
    4'b0110:
    begin 
    f = 0;
    ovf = 0;
    take_branch = a == 0;
    end
          
    4'b0111:
    begin 
    f = 0;
    ovf = 0;
    take_branch = a != 0;
    end
    
    4'b1000:
    begin 
    f = a ^ b;
    ovf = 0;
    take_branch = 0;
    end
   
    default: begin
    f=16'h0000;
    take_branch = 0;
    ovf = 0; end
    endcase
    
    end
endmodule
