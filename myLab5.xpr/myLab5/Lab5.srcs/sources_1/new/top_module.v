`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/02/2021 03:43:18 PM
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
    input btnR,
    input btnU,
    input btnC,
    output [15:0] led,
    output [3:0] an,
    output [6:0] seg,
    output dp
    );
    
    wire [15:0] Q;
    wire [3:0] H, sel;
    wire [7:0] targetNum, gameNum, secs;
    wire [5:0] tn, gc; 
    wire [1:0] w;
    wire clk, qsec, go, stop, FourSecs, TwoSecs, ShowNum, ResetTimer, ResetCount, RunGame, 
         Scored, FlashBoth, FlashAlt, digsel, scoreClked, idle, scoreEdge;
    
    FDRE #(.INIT(1'b0)) QU_FF (.C(clk), .CE(1'b1), .D(btnU), .Q(w[0]));
    FDRE #(.INIT(1'b0)) QC_FF (.C(clk), .CE(1'b1), .D(btnC), .Q(w[1]));
    assign stop = ~w[0] & btnU;
    assign go = ~w[1] & btnC;
//    assign stop = btnU;
//    assign go = btnC;
    
    assign tn = targetNum[5:0];
    assign gc = gameNum[5:0];
    StateMachine sm (.clk(clk), .Go(go), .Stop(stop), .FourSecs(FourSecs), .TwoSecs(TwoSecs), 
                     .targetNum(tn), .countNum(gc), .ShowNum(ShowNum), .ResetTimer(ResetTimer), .ResetCount(ResetCount),
                     .RunGame(RunGame), .Scored(Scored), .FlashBoth(FlashBoth), .FlashAlt(FlashAlt));
    
    LFSR rndNum (.clk(clk), .CE(idle), .rnd(targetNum));
    Game_Counter gameC (.clk(clk), .R(ResetCount), .CE(qsec & RunGame), .gc(gameNum));
    assign Q = {{2{1'b0}}, targetNum[5:0], {2{1'b0}}, gameNum[5:0]};
    
    Time_Counter timeC (.clk(clk), .R(ResetTimer), .CE(qsec), .tc(secs));
    assign FourSecs = secs[4];
    assign TwoSecs = secs[3];
    
    LED_Shifter score (.clk(clk), .R(1'b0), .In(1'b1), .CE(scoreEdge), .led(led));
    FDRE #(.INIT(1'b0)) Qscore_FF (.C(clk), .CE(1'b1), .D(Scored), .Q(scoreClked));
    assign scoreEdge = ~scoreClked & Scored;
    
    RingCounter ringC (.clk(clk), .adv(digsel), .rc(sel));
    Selector s (.sel(sel), .N(Q), .H(H));
    hex7seg ssd (.n(H), .seg(seg));
    lab5_clks slowit (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel), .qsec(qsec));
    
    assign idle = ~ShowNum;
    assign an[3] = (idle | ~(~idle & sel[3])) | (sel[3] & FlashBoth & secs[0]) | (sel[3] & FlashAlt & ~secs[0]); // ~( sel[3] & ShowNum & (flash logic) )
    assign an[2] = (idle | ~(~idle & sel[2])) | (sel[2] & FlashBoth & secs[0]) | (sel[2] & FlashAlt & ~secs[0]); // ~( sel[3] & ShowNum & (flash logic) )
    assign an[1] = ~sel[1] | ((sel[1] & FlashBoth & secs[0]) | (sel[1] & FlashAlt & secs[0]));
    assign an[0] = ~sel[0] | ((sel[0] & FlashBoth & secs[0]) | (sel[0] & FlashAlt & secs[0]));
    assign dp = 1'b1;
endmodule
