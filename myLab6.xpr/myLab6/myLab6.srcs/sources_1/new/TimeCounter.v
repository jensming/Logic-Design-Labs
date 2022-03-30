`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2021 09:14:12 PM
// Design Name: 
// Module Name: TimeCounter
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


module TimeCounter(
    input clk,
    input CE,
    input R,
    output [3:0] timeC
    );
    
    countUD4L c1 (.clk(clk), .R(R), .Up(CE), .Dw(1'b0), .Q(timeC));
endmodule
