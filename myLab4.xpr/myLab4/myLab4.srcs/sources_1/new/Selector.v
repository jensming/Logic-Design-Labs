`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2021 04:27:04 PM
// Design Name: 
// Module Name: Selector
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


module Selector(
    input [3:0] sel,
    input [15:0] N,
    output [3:0] H
    );
    // output should be undefined when more than one select bits are high
    assign H[0] = (N[0] & ~sel[3] & ~sel[2] & ~sel[1] & sel[0]) | (N[4] & ~sel[3] & ~sel[2] & sel[1] & ~sel[0]) | (N[8] & ~sel[3] & sel[2] & ~sel[1] & ~sel[0]) | (N[12] & sel[3] & ~sel[2] & ~sel[1] & ~sel[0]);
    assign H[1] = (N[1] & ~sel[3] & ~sel[2] & ~sel[1] & sel[0]) | (N[5] & ~sel[3] & ~sel[2] & sel[1] & ~sel[0]) | (N[9] & ~sel[3] & sel[2] & ~sel[1] & ~sel[0]) | (N[13] & sel[3] & ~sel[2] & ~sel[1] & ~sel[0]);
    assign H[2] = (N[2] & ~sel[3] & ~sel[2] & ~sel[1] & sel[0]) | (N[6] & ~sel[3] & ~sel[2] & sel[1] & ~sel[0]) | (N[10] & ~sel[3] & sel[2] & ~sel[1] & ~sel[0]) | (N[14] & sel[3] & ~sel[2] & ~sel[1] & ~sel[0]);
    assign H[3] = (N[3] & ~sel[3] & ~sel[2] & ~sel[1] & sel[0]) | (N[7] & ~sel[3] & ~sel[2] & sel[1] & ~sel[0]) | (N[11] & ~sel[3] & sel[2] & ~sel[1] & ~sel[0]) | (N[15] & sel[3] & ~sel[2] & ~sel[1] & ~sel[0]);
endmodule
