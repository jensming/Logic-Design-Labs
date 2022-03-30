`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/08/2021 11:48:34 AM
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
    input clkin,
    input btnL,
    input btnR,
    input btnU,
    output [15:0] led,
    output [3:0] an,
    output [6:0] seg,
    output dp
    );
    
    wire [15:0] Q;
    wire [7:0] tc, negTurkeyC, turkeyNum;
    wire [6:0] segTemp, segSign;
    wire [3:0] timeNum, secs, Qsel, sel, oneSecCheck; 
    wire [1:0] w;
    wire clk, digsel, qsec, ResetTimer, Left, Right, CrossLeft, CrossRight, LeftCrossing, RightCrossing, oneSec;
    
//    FDRE #(.INIT(1'b0)) QL_FF (.C(clk), .CE(1'b1), .D(btnL), .Q(w[0]));
//    FDRE #(.INIT(1'b0)) QR_FF (.C(clk), .CE(1'b1), .D(btnR), .Q(w[1]));
//    assign Left = ~w[0] & btnL;
//    assign Right = ~w[1] & btnR;

    assign Left = btnL;
    assign Right = btnR;
    
    StateMachine sm (.clk(clk), .Left(Left), .Right(Right), .CrossLeft(CrossLeft), .CrossRight(CrossRight), 
                     .ResetTimer(ResetTimer), .LeftCrossing(LeftCrossing), .RightCrossing(RightCrossing));
    
    TurkeyCounter turkeyC (.clk(clk), .Up(CrossLeft & ~(&secs[3:0])), .Dw(CrossRight & ~(&secs[3:0])), .turkeyC(tc));
    
    // Two's Complement Converter
    Incrementer invert (.a(~tc), .b(1'b1), .s(negTurkeyC));
    m2_1x8 mux1 (.in0(tc), .in1(negTurkeyC), .sel(tc[7]), .o(turkeyNum)); // turkeyNum is counter's magnitude
    
    assign Q = {timeNum[3:0], {4{1'b0}}, turkeyNum[7:0]};
    
    OneSecCounter s1 (.clk(clk), .R(ResetTimer), .CE(qsec), .oneSec(oneSecCheck));
    FDRE #(.INIT(1'b0)) Q0_FF (.C(clk), .R(btnU), .CE(1'b1), .D(oneSecCheck[2]), .Q(w[0]));
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .R(btnU), .CE(1'b1), .D(w[0]), .Q(w[1]));
    assign oneSec = ~w[1] & w[0];
    
    TimeCounter timeC (.clk(clk), .R(ResetTimer), .CE(oneSec & (LeftCrossing | RightCrossing) & ~(&secs[3:0])), .timeC(secs));
    assign timeNum = secs;
    
    RingCounter ringC (.clk(clk), .adv(digsel), .rc(sel));
    Selector s (.sel(sel), .Q(Q), .Qsel(Qsel));
    hex7seg ssd (.n(Qsel), .seg(segTemp));
    m2_1x8 mux2 (.in0({1'b0, segTemp}), .in1(8'b00111111), .sel(sel[2] & tc[7]), .o(seg)); //pos or neg bits SSD
    
    lab6_clks slowit (.clkin(clkin), .greset(btnU), .clk(clk), .digsel(digsel), .qsec(qsec));
    
    assign an[3] = ~((LeftCrossing | RightCrossing) & sel[3]);
    assign an[2] = ~(tc[7] & sel[2]);
    assign an[1] = ~sel[1];
    assign an[0] = ~sel[0];
    
    assign dp = 1'b1;
    
    assign led[15] = ~Left;
    assign led[14:10] = {5{1'b0}};
    assign led[9] = ~Right;
    assign led[8:0] = {9{1'b0}};
endmodule
