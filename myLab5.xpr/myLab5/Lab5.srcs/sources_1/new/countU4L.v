`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 08:23:00 PM
// Design Name: 
// Module Name: countU4L
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


module countU4L(
    input clk,
    input Up,
    input R,
    output [3:0] Q,
    output UTC
    );
    
    wire [3:0] U;
    
    assign U[3] = Q[3] ^ &Q[2:0];
    assign U[2] = Q[2] ^ &Q[1:0];
    assign U[1] = ^Q[1:0];
    assign U[0] = ~Q[0];
    
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .R(R), .CE(Up), .D(Up & U[0]), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .R(R), .CE(Up), .D(Up & U[1]), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .R(R), .CE(Up), .D(Up & U[2]), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .R(R), .CE(Up), .D(Up & U[3]), .Q(Q[3]));
    
    assign UTC = &Q[3:0];
endmodule
