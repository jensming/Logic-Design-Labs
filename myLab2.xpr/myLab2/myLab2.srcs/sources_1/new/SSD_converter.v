`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2021 10:28:56 PM
// Design Name: 
// Module Name: SSD_converter
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


module SSD_converter(
    input n0,
    input n1,
    input n2,
    input n3,
    output cA,
    output cB,
    output cC,
    output cD,
    output cE,
    output cF,
    output cG,
    output DP,
    output AN0,
    output AN1,
    output AN2,
    output AN3
    );
    
    assign cA = ~((n3 | n2 | n1 | ~n0) & (~n3 | n2 | ~n1 | ~n0) & (n3 |~n2 | n1 | n0) & (~n3 | ~n2 | n1 | ~n0));
    assign cB = ~((n3 | ~n2 | n1 | ~n0) & (n3 | ~n2 | ~n1 | n0) & (~n3 | n2 | ~n1 | ~n0) & (~n3 | ~n2 | n1 | n0) & (~n3 | ~n2 | ~n1 | n0) & (~n3 | ~n2 | ~n1 | ~n0));
    assign cC = ~((n3 | n2 | ~n1 | n0) & (~n3 | ~n2 | n1 | n0) & (~n3 | ~n2 | ~n1 | n0) & (~n3 | ~n2 | ~n1 | ~n0));
    assign cD = ~((n3 | n2 | n1 | ~n0) & (n3 | ~n2 | n1 | n0) & (n3 | ~n2 | ~n1 | ~n0) & (~n3 | n2 | n1 | ~n0) & (~n3 | n2 | ~n1 | n0) & (~n3 | ~n2 | ~n1 | ~n0));
    assign cE = ~((n3 | n2 | n1 | ~n0) & (n3 | n2 | ~n1 | ~n0) & (n3 | ~n2 | n1 | n0) & (n3 | ~n2 | n1 | ~n0) & (n3 | ~n2 | ~n1 | ~n0) & (~n3 | n2 | n1 | ~n0));
    assign cF = ~((n3 | n2 | n1 | ~n0) & (n3 | n2 | ~n1 | n0) & (n3 | n2 | ~n1 | ~n0) & (n3 | ~n2 | ~n1 | ~n0) & (~n3 | ~n2 | n1 | ~n0));
    assign cG = ~((n3 | n2 | n1 | n0) & (n3 | n2 | n1 | ~n0) & (n3 | ~n2 | ~n1 | ~n0) & (~n3 | ~n2 | n1 | n0));
    
    assign DP = 1'b1;
    assign AN0 = 1'b0;
    assign AN1 = 1'b1;
    assign AN2 = 1'b1;
    assign AN3 = 1'b1;
endmodule
