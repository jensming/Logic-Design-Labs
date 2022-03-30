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
    input btnL,
    input TwoSecs,
    input frame16,
    input collision,
    output bounceBall,
    output ballFalling,
    output ResetTimer,
    output idle,
    output TwoSecWait,
    output RunGame,
    output Loss
    );
    
    wire [4:0] D, Q;
    wire WaitNext, TwoSecWaitNext, BallFallingNext, BallRisingNext, LoseNext;
    
    assign WaitNext = (~btnL & Q[0]); //0
    assign TwoSecWaitNext = (btnL & Q[0]) | (~TwoSecs & Q[1]) | (btnL & Q[4]);  //1
    assign BallFallingNext = (TwoSecs & Q[1]) | (~btnL & ~collision & Q[2]) | (Q[3] & frame16 & ~collision); //2
    assign BallRisingNext = (btnL & Q[2] & ~collision) | (Q[3] & ~frame16 & ~collision); //3
    assign LoseNext = (Q[2] & collision) | (Q[3] & collision) | (~btnL & Q[4]); //4
    
    assign D[0] = WaitNext;
    assign D[1] = TwoSecWaitNext;
    assign D[2] = BallFallingNext;
    assign D[3] = BallRisingNext;
    assign D[4] = LoseNext;
    
    FDRE #(.INIT(1'b1)) Q0_FF (.C(clk), .CE(1'b1), .D(D[0]), .Q(Q[0])); // Wait 00001
    FDRE #(.INIT(1'b0)) Q1_FF (.C(clk), .CE(1'b1), .D(D[1]), .Q(Q[1])); // TwoSecWait 00010
    FDRE #(.INIT(1'b0)) Q2_FF (.C(clk), .CE(1'b1), .D(D[2]), .Q(Q[2])); // BallFalling 00100
    FDRE #(.INIT(1'b0)) Q3_FF (.C(clk), .CE(1'b1), .D(D[3]), .Q(Q[3])); // BallRising 01000
    FDRE #(.INIT(1'b0)) Q4_FF (.C(clk), .CE(1'b1), .D(D[4]), .Q(Q[4])); // Lose 10000
    
    assign idle = Q[0];
    assign TwoSecWait = Q[1];
    assign RunGame = Q[2] | Q[3];
    assign ballFalling = Q[2];
    assign bounceBall = Q[3];
    assign ResetTimer = Q[0] | Q[2] | (Q[4] & btnL);
    assign Loss = Q[4];
endmodule
