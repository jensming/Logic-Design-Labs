`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/28/2021 08:42:10 PM
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
    input Go,
    input Stop,
    input FourSecs,
    input TwoSecs,
    input [5:0] targetNum,
    input [5:0] countNum,
    output ShowNum,
    output ResetTimer,
    output ResetCount,
    output RunGame,
    output Scored,
    output FlashBoth,
    output FlashAlt
    );
    
    wire [4:0] D, Q;
    wire WaitNext, twoSecWaitNext, WinNext, LoseNext, MatchNext;
    
//    assign Wait = Go & (~Win | ~Lose);  Q[0]
//    assign twoSecWait = Go & ~TwoSecs;  Q[1]
//    assign Win = Match & ~FourSecs;     Q[2]
//    assign Lose = ~Match & ~FourSecs;   Q[3]
    wire Match = &(~(targetNum[5:0] ^ countNum[5:0])); 
    
    assign WaitNext = (Q[0] & ~Go) | (Q[3] & FourSecs) | (Q[4] & FourSecs); //Q0
    assign twoSecWaitNext = (Q[0] & Go) | (Q[1] & ~TwoSecs); //Q1
    assign MatchNext = (Q[1] & TwoSecs) | (Q[2] & ~Stop); //Q2
    assign WinNext = (Q[2] & Stop & Match) | (Q[3] & ~FourSecs); // Q3
    assign LoseNext =  (Q[2] & Stop & ~Match)| (Q[4] & ~FourSecs); //Q4
    
    assign D[4] = LoseNext;
    assign D[3] = WinNext;
    assign D[2] = MatchNext;
    assign D[1] = twoSecWaitNext;
    assign D[0] = WaitNext;
    
//    FDRE #(.INIT(1'b0)) Q01234_FF (.C({5{clk}}), .CE({5{1'b1}}), .D(D[4:0]), .Q(Q[4:0]));
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0])); // IDLE 00001
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(D[1]), .Q(Q[1])); // 2  SEC WAIT 00010
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(1'b1), .D(D[2]), .Q(Q[2])); // GAMEPLAY 00100
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(1'b1), .D(D[3]), .Q(Q[3])); // WIN 01000
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .CE(1'b1), .D(D[4]), .Q(Q[4])); // LOSE 10000
    
    assign ShowNum = ~Q[0];
    assign ResetTimer = (Q[0] & Go) | (Q[2] & Stop);
    assign ResetCount = Q[0] & Go; 
    assign RunGame = Q[2];
    assign Scored = Q[3];
    assign FlashBoth = Q[3];
    assign FlashAlt = Q[4];
endmodule
