`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/05/2021 01:33:44 AM
// Design Name: 
// Module Name: top_adder
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


module top_adder(
    input A0,
    input A1,
    input A2,
    input B0,
    input B1,
    input B2,
    input Cin,
    output S0,
    output S1,
    output S2,
    output S3
    );
    
    wire t0, t1;    // t0 = C1, t1 = C2
    
    FullAdder a1 (.Cin(Cin), .A(A0), .B(B0), .S(S0), .Cout(t0));
    FullAdder a2 (.Cin(t0), .A(A1), .B(B1), .S(S1), .Cout(t1));
    FullAdder a3 (.Cin(t1), .A(A2), .B(B2), .S(S2), .Cout(S3));
endmodule
