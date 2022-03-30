`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2021 12:24:02 PM
// Design Name: 
// Module Name: FullAdder
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


module FullAdder(
    input A,
    input B, //sel0
    input Cin, //sel1
    output Cout,
    output S
    );
    
    m4_1 aS (.in({A, ~A, ~A, A}), .sel({Cin, B}), .o(S));
    m4_1 aC (.in({1'b1, A, A, 1'b0}), .sel({Cin, B}), .o(Cout));
endmodule
