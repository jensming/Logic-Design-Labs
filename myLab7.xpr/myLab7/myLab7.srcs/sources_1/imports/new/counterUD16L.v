`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2021 10:08:48 PM
// Design Name: 
// Module Name: counterUD16L
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


module counterUD16L(
    input clk,
    input R,
    input Up,
    input Dw,
    input LD,
    input [15:0] Din,
    output [15:0] Q
    );
    
    wire [2:0] utc, dtc;
    
    countUD4L c1 (.clk(clk), .R(R), .Up(Up), .Dw(Dw), .LD(LD), .Din(Din[3:0]), .Q(Q[3:0]), .UTC(utc[0]), .DTC(dtc[0]));
    countUD4L c2 (.clk(clk), .R(R), .Up(Up & utc[0]), .Dw(Dw & dtc[0]), .LD(LD), .Din(Din[7:4]), .Q(Q[7:4]), .UTC(utc[1]), .DTC(dtc[1]));
    countUD4L c3 (.clk(clk), .R(R), .Up(Up &(&utc[1:0])), .Dw(Dw & (&dtc[1:0])), .LD(LD), .Din(Din[11:8]), .Q(Q[11:8]), .UTC(utc[2]), .DTC(dtc[2]));
    countUD4L c4 (.clk(clk), .R(R), .Up(Up & (&utc[2:0])), .Dw(Dw & (&dtc[2:0])), .LD(LD), .Din(Din[15:12]), .Q(Q[15:12]));
    
endmodule
