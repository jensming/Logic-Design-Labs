`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2021 02:31:26 PM
// Design Name: 
// Module Name: myLab_1
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


module myLab_1(
    input A,
    input B,
    input C,
    input D,
    output E,
    output F,
    output G,
    output H
    );
    
    assign E = ~A;
    assign F = B & C;
    assign G = B | C;
    assign H = B ^ C ^ D;
endmodule