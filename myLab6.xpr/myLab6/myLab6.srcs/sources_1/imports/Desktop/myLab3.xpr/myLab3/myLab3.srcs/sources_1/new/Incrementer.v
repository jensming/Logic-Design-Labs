`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2021 10:01:42 AM
// Design Name: 
// Module Name: Incrementer
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


module Incrementer(
    input [7:0] a,
    input b,
    output [7:0] s
    );
    
    EightBitAdder add (.A(a), .B(b), .S(s));
endmodule
