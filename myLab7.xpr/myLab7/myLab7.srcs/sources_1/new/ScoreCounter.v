`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2021 11:09:56 AM
// Design Name: 
// Module Name: ScoreCounter
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


module ScoreCounter(
    input clk,
    input CE,
    input R,
    output [15:0] score
    );
    
    wire [2:0] utc;
    
    countUD4L c1 (.clk(clk), .R(R), .Up(CE), .Q(score[3:0]), .UTC(utc[0]));
    countUD4L c2 (.clk(clk), .R(R), .Up(CE & utc[0]), .Q(score[7:4]), .UTC(utc[1]));
    countUD4L c3 (.clk(clk), .R(R), .Up(CE &(&utc[1:0])), .Q(score[11:8]), .UTC(utc[2]));
    countUD4L c4 (.clk(clk), .R(R), .Up(CE & (&utc[2:0])), .Q(score[15:12]));
    
endmodule
