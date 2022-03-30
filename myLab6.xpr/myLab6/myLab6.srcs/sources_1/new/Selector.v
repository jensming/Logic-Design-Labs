`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2021 09:14:12 PM
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
    input [15:0] Q,
    output [3:0] Qsel
    );
    
    assign Qsel[0] = (Q[0] & ~sel[3] & ~sel[2] & ~sel[1] & sel[0]) | (Q[4] & ~sel[3] & ~sel[2] & sel[1] & ~sel[0]) | (Q[8] & ~sel[3] & sel[2] & ~sel[1] & ~sel[0]) | (Q[12] & sel[3] & ~sel[2] & ~sel[1] & ~sel[0]);
    assign Qsel[1] = (Q[1] & ~sel[3] & ~sel[2] & ~sel[1] & sel[0]) | (Q[5] & ~sel[3] & ~sel[2] & sel[1] & ~sel[0]) | (Q[9] & ~sel[3] & sel[2] & ~sel[1] & ~sel[0]) | (Q[13] & sel[3] & ~sel[2] & ~sel[1] & ~sel[0]);
    assign Qsel[2] = (Q[2] & ~sel[3] & ~sel[2] & ~sel[1] & sel[0]) | (Q[6] & ~sel[3] & ~sel[2] & sel[1] & ~sel[0]) | (Q[10] & ~sel[3] & sel[2] & ~sel[1] & ~sel[0]) | (Q[14] & sel[3] & ~sel[2] & ~sel[1] & ~sel[0]);
    assign Qsel[3] = (Q[3] & ~sel[3] & ~sel[2] & ~sel[1] & sel[0]) | (Q[7] & ~sel[3] & ~sel[2] & sel[1] & ~sel[0]) | (Q[11] & ~sel[3] & sel[2] & ~sel[1] & ~sel[0]) | (Q[15] & sel[3] & ~sel[2] & ~sel[1] & ~sel[0]);
endmodule
