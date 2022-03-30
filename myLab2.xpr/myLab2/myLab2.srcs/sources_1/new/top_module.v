`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2021 02:10:28 PM
// Design Name: 
// Module Name: top_module
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


module top_module(
    input A0,
    input A1,
    input A2,
    input B0,
    input B1,
    input B2,
    input Cin,
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
    
    wire t0, t1, t2, t3; // t0 = S0, t1 = S1, t2 = S2, t3 = S3
    
    top_adder ta (.Cin(Cin), .A0(A0), .B0(B0), .A1(A1), .B1(B1), .A2(A2), .B2(B2), .S0(t0), .S1(t1), .S2(t2), .S3(t3));
    SSD_converter ssd (.n3(t3), .n2(t2), .n1(t1), .n0(t0), .cA(cA), .cB(cB), .cC(cC), .cD(cD), .cE(cE), .cF(cF), .cG(cG), .DP(DP), .AN0(AN0), .AN1(AN1), .AN2(AN2), .AN3(AN3));
endmodule
