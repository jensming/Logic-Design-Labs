`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/10/2021 02:32:18 PM
// Design Name: 
// Module Name: OneSecCounter
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


module OneSecCounter(
    input clk,
    input CE,
    input R,
    output [3:0] oneSec
    );
    
    countUD4L c1 (.clk(clk), .R(R), .Up(CE), .Dw(1'b0), .Q(oneSec));
endmodule
