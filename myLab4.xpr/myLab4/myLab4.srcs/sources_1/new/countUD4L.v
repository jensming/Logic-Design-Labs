`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2021 05:32:14 PM
// Design Name: 
// Module Name: countUD4L
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


module countUD4L(
    input clk,
    input Up,
    input Dw,
    input LD,
    input [3:0] Din,
    output [3:0] Q,
    output UTC,
    output DTC
    );
    
    wire [3:0] U, D;
    
    assign U[3] = Q[3] ^ &Q[2:0];
    assign U[2] = Q[2] ^ &Q[1:0];
    assign U[1] = ^Q[1:0];
    assign U[0] = ~Q[0];
    assign D[3] = Q[3] ^ &(~Q[2:0]);
    assign D[2] = Q[2] ^ &(~Q[1:0]);
    assign D[1] = ^~Q[1:0];
    assign D[0] = ~Q[0];
    
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .CE(LD | (Up ^ Dw)), .D((LD & Din[0]) | (~LD & Up & U[0]) | (~LD & Dw & D[0])), .Q(Q[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(LD | (Up ^ Dw)), .D((LD & Din[1]) | (~LD & Up & U[1]) | (~LD & Dw & D[1])), .Q(Q[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(LD | (Up ^ Dw)), .D((LD & Din[2]) | (~LD & Up & U[2]) | (~LD & Dw & D[2])), .Q(Q[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(LD | (Up ^ Dw)), .D((LD & Din[3]) | (~LD & Up & U[3]) | (~LD & Dw & D[3])), .Q(Q[3]));
    
    assign UTC = &Q[3:0];
    assign DTC = ~(|Q[3:0]);
endmodule
