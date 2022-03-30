`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/21/2021 11:32:27 AM
// Design Name: 
// Module Name: RingCounter
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


module RingCounter(
    input adv, //control bit, Advance
    input clk,
    output [3:0] rc
    );
    
    wire [3:0] w;
    
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(adv), .D(w[3]), .Q(w[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(adv), .D(w[0]), .Q(w[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(adv), .D(w[1]), .Q(w[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(adv), .D(w[2]), .Q(w[3]));
    
    assign rc = w;
endmodule
