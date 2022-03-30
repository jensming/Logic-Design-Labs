`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 07:59:28 PM
// Design Name: 
// Module Name: LFSR
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


module LFSR(
    input clk,
    input CE,
    output [7:0] rnd
    );
    
    wire [7:0] w;
    
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(CE), .D(w[0] ^ (^w[7:5])), .Q(w[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(CE), .D(w[0]), .Q(w[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(CE), .D(w[1]), .Q(w[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(CE), .D(w[2]), .Q(w[3]));
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .CE(CE), .D(w[3]), .Q(w[4]));
    FDRE #(.INIT(1'b0)) Q5_FF (.C(clk), .CE(CE), .D(w[4]), .Q(w[5]));
    FDRE #(.INIT(1'b0)) Q6_FF (.C(clk), .CE(CE), .D(w[5]), .Q(w[6]));
    FDRE #(.INIT(1'b0)) Q7_FF (.C(clk), .CE(CE), .D(w[6]), .Q(w[7]));
    
    assign rnd = w;
endmodule
