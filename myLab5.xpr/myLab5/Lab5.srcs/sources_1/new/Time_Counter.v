`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 08:14:31 PM
// Design Name: 
// Module Name: Time_Counter
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


module Time_Counter(
    input clk,
    input CE,
    input R,
    output [7:0] tc
    );
    
    wire [1:0] utc;
    
    countU4L c1 (.clk(clk), .R(R), .Up(CE), .Q(tc[3:0]), .UTC(utc[0]));
    countU4L c2 (.clk(clk), .R(R), .Up(CE & utc[0]), .Q(tc[7:4]), .UTC(utc[1]));
endmodule
