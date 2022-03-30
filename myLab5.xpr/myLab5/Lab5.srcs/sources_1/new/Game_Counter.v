`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 08:13:20 PM
// Design Name: 
// Module Name: Game_Counter
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


module Game_Counter(
    input clk,
    input CE,
    input R,
    output [7:0] gc
    );
    
    wire [1:0] utc;
    
    countU4L c1 (.clk(clk), .R(R), .Up(CE), .Q(gc[3:0]), .UTC(utc[0]));
    countU4L c2 (.clk(clk), .R(R), .Up(CE & utc[0]), .Q(gc[7:4]), .UTC(utc[1]));
endmodule
