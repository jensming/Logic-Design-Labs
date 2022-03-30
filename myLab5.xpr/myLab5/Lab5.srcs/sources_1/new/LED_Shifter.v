`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 08:32:37 PM
// Design Name: 
// Module Name: LED_Shifter
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


module LED_Shifter(
    input clk,
    input In,
    input CE,
    input R,
    output [15:0] led
    );
    
    wire [15:0] w;
    
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .R(R), .CE(CE), .D(In), .Q(w[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .R(R), .CE(CE), .D(w[0]), .Q(w[1]));
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .R(R), .CE(CE), .D(w[1]), .Q(w[2]));
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .R(R), .CE(CE), .D(w[2]), .Q(w[3]));
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .R(R), .CE(CE), .D(w[3]), .Q(w[4]));
    FDRE #(.INIT(1'b0)) Q5_FF (.C(clk), .R(R), .CE(CE), .D(w[4]), .Q(w[5]));
    FDRE #(.INIT(1'b0)) Q6_FF (.C(clk), .R(R), .CE(CE), .D(w[5]), .Q(w[6]));
    FDRE #(.INIT(1'b0)) Q7_FF (.C(clk), .R(R), .CE(CE), .D(w[6]), .Q(w[7]));
    FDRE #(.INIT(1'b0)) Q8_FF (.C(clk), .R(R), .CE(CE), .D(w[7]), .Q(w[8]));
    FDRE #(.INIT(1'b0)) Q9_FF (.C(clk), .R(R), .CE(CE), .D(w[8]), .Q(w[9]));
    FDRE #(.INIT(1'b0)) Q10_FF (.C(clk), .R(R), .CE(CE), .D(w[9]), .Q(w[10]));
    FDRE #(.INIT(1'b0)) Q11_FF (.C(clk), .R(R), .CE(CE), .D(w[10]), .Q(w[11]));
    FDRE #(.INIT(1'b0)) Q12_FF (.C(clk), .R(R), .CE(CE), .D(w[11]), .Q(w[12]));
    FDRE #(.INIT(1'b0)) Q13_FF (.C(clk), .R(R), .CE(CE), .D(w[12]), .Q(w[13]));
    FDRE #(.INIT(1'b0)) Q14_FF (.C(clk), .R(R), .CE(CE), .D(w[13]), .Q(w[14]));
    FDRE #(.INIT(1'b0)) Q15_FF (.C(clk), .R(R), .CE(CE), .D(w[14]), .Q(w[15]));
    
    assign led = w;
endmodule
