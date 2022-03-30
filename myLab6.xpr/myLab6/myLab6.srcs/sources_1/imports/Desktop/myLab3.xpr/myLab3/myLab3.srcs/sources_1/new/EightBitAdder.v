`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2021 12:37:40 PM
// Design Name: 
// Module Name: EightBitAdder
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


module EightBitAdder(
    input [7:0] A,
    input B,
    output Cout,
    output [7:0] S
    );
    
    wire t0, t1, t2, t3, t4, t5, t6;
    
    FullAdder a1 (.Cin({1'b0}), .A(A[0]), .B(B), .S(S[0]), .Cout(t0));
    FullAdder a2 (.Cin(t0), .A(A[1]), .B({1'b0}), .S(S[1]), .Cout(t1));
    FullAdder a3 (.Cin(t1), .A(A[2]), .B({1'b0}), .S(S[2]), .Cout(t2));
    FullAdder a4 (.Cin(t2), .A(A[3]), .B({1'b0}), .S(S[3]), .Cout(t3));
    FullAdder a5 (.Cin(t3), .A(A[4]), .B({1'b0}), .S(S[4]), .Cout(t4));
    FullAdder a6 (.Cin(t4), .A(A[5]), .B({1'b0}), .S(S[5]), .Cout(t5));
    FullAdder a7 (.Cin(t5), .A(A[6]), .B({1'b0}), .S(S[6]), .Cout(t6));
    FullAdder a8 (.Cin(t6), .A(A[7]), .B({1'b0}), .S(S[7]), .Cout(Cout));
endmodule
