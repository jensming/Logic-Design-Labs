`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2021 09:14:12 PM
// Design Name: 
// Module Name: StateMachine
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


module StateMachine(
    input clk,
    input Left,  //high when sensor blocked
    input Right, //high when sensor blocked
    output LeftCrossing,
    output RightCrossing,
    output CrossLeft,
    output CrossRight,
    output ResetTimer
    );
    
    wire [6:0] D, Q;
    wire WaitNext, LeftStartNext, RightStartNext, LeftCrossingNext, RightCrossingNext, LeftCrossNext, RightCrossNext;
    
    assign WaitNext = (Q[0] & ~Left & ~Right) | (Q[1] & ~Left & ~Right) | (Q[2] & ~Left & ~Right) | (Q[5] & ~Left & ~Right) | (Q[6] & ~Left & ~Right); //0
    assign LeftStartNext = (Q[0] & Left & ~Right) | (Q[1] & Left & ~Right) | (Q[4] & Left & ~Right);  //1
    assign RightStartNext = (Q[0] & ~Left & Right) | (Q[2] & ~Left & Right) | (Q[3] & ~Left & Right); //2
    assign LeftCrossingNext = (Q[2] & Left & Right) | (Q[3] & Left & Right) | (Q[5] & Right);  //3
    assign RightCrossingNext = (Q[1] & Left & Right) | (Q[4] & Left & Right) | (Q[6] & Left); //4
    assign LeftCrossNext = (Q[3] & ~Right) | (Q[5] & Left & ~Right); //5
    assign RightCrossNext = (Q[4] & ~Left) | (Q[6] & ~Left & Right); //6
    
    assign D[0] = WaitNext;
    assign D[1] = LeftStartNext;
    assign D[2] = RightStartNext;
    assign D[3] = LeftCrossingNext;
    assign D[4] = RightCrossingNext;
    assign D[5] = LeftCrossNext;
    assign D[6] = RightCrossNext;
    
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0])); // Wait 0000001
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(D[1]), .Q(Q[1])); // LeftStart 0000010
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(1'b1), .D(D[2]), .Q(Q[2])); // RightStart 0000100
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(1'b1), .D(D[3]), .Q(Q[3])); // LeftCrossing 0001000
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .CE(1'b1), .D(D[4]), .Q(Q[4])); // RightCrossing 0010000
    FDRE #(.INIT(1'b0)) Q5_FF (.C(clk), .CE(1'b1), .D(D[5]), .Q(Q[5])); // LeftCross 0100000
    FDRE #(.INIT(1'b0)) Q6_FF (.C(clk), .CE(1'b1), .D(D[6]), .Q(Q[6])); // RightCross 1000000
    
    assign LeftCrossing = Q[2] | Q[3] | Q[6];
    assign RightCrossing = Q[1] | Q[4] | Q[5];
    assign CrossLeft = Q[5] & ~Left;
    assign CrossRight = Q[6] & ~Right;
    assign ResetTimer = (Q[5] | Q[6]) & ~Left & ~Right;
endmodule
