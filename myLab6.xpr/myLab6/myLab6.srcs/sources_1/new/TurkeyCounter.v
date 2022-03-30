`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2021 09:14:12 PM
// Design Name: 
// Module Name: TurkeyCounter
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


module TurkeyCounter(
    input clk,
    input Up,
    input Dw,
    output [7:0] turkeyC
    );
    
    wire [1:0] utc, dtc;
    
    countUD4L c1 (.clk(clk), .Up(Up), .Dw(Dw), .Q(turkeyC[3:0]), .UTC(utc[0]), .DTC(dtc[0]));
    countUD4L c2 (.clk(clk), .Up(Up & utc[0]), .Dw(Dw & dtc[0]), .Q(turkeyC[7:4]));
endmodule
