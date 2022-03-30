`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2021 10:51:14 AM
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
    input btnL,
    input [15:0] sw,
    output [3:0] an,
    output dp,
    output [6:0] seg,
    output [15:0] led,
    output Hsync,
    output Vsync,
    output [3:0] vgaBlue,
    output [3:0] vgaGreen,
    output [3:0] vgaRed
//    output oops,
//    output rgb_oops
    );
    
    wire [15:0] Q;
    wire [11:0] totalvga, ballRGB, wallRGB, blockRGB, gapRGB; 
//                topBottomBall, leftRightBall, topBottomWall1, topBottomWall2, topBottomWall3, topBottomWall4, leftRightWall1, leftRightWall2, leftRightWall3, leftRightWall4,
//                topBottomBlock11, topBottomBlock12, topBottomBlock21, topBottomBlock22, topBottomBlock31, topBottomBlock32, topBottomBlock41, topBottomBlock42, leftRightBlock1, leftRightBlock2, leftRightBlock3, leftRightBlock4, 
//                topBottomG1, topBottomG2, topBottomG3, topBottomG4, leftRightG1, leftRightG2, leftRightG3, leftRightG4;

    wire [9:0] Hpixels, Vpixels, rBoundW1, rBoundW2, rBoundW3, rBoundW4, tBall, bBall, lBall, rBall, lBoundW1, lBoundW2, lBoundW3, lBoundW4,
               topBottomBall, leftRightBall, topBottomWall1, topBottomWall2, topBottomWall3, topBottomWall4, leftRightWall1, leftRightWall2, leftRightWall3, leftRightWall4,
               topBottomBlock11, topBottomBlock12, topBottomBlock21, topBottomBlock22, topBottomBlock31, topBottomBlock32, topBottomBlock41, topBottomBlock42, leftRightBlock1, leftRightBlock2, leftRightBlock3, leftRightBlock4,
               topBottomG1, topBottomG2, topBottomG3, topBottomG4, leftRightG1, leftRightG2, leftRightG3, leftRightG4;
    wire [15:0] secs;
    wire [3:0] sel, Qsel, blue, green, red,  ballRed, ballGreen, ballBlue, wallRed, wallGreen, wallBlue, blockRed, blockGreen, blockBlue, gapRed, gapGreen, gapBlue;
    wire clk, digsel, eVsync, eScoreCE, TwoSecs, QuarterSecs, frame16, bounceBall, ballFalling, collision, idle, ResetTimer, Flash, TwoSecWait, RunGame, Loss;
    
   
    wire eBtnL;
    wire [1:0] e; 
    FDRE #(.INIT(1'b0)) QbtnL1_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(btnL), .Q(e[0]));
    FDRE #(.INIT(1'b0)) QbtnL2_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(e[0]), .Q(e[1]));
    assign eBtnL = ~e[1] & e[0];
    
    VGA_Control visuals (.clk(clk), .Hpixels(Hpixels), .Vpixels(Vpixels), .vgaBlue(blue),
                         .vgaGreen(green), .vgaRed(red), .Hsync(Hsync), .Vsync(Vsync));
    
    assign totalvga = {red, green, blue};
    
    assign ballRed = totalvga[11:8] && ballRGB[11:8] && topBottomBall && leftRightBall;
    assign ballGreen = totalvga[7:4] && ballRGB[7:4] && topBottomBall && leftRightBall;
    assign ballBlue = totalvga[3:0] && ballRGB[3:0] && topBottomBall && leftRightBall;
    
    assign wallRed = totalvga[11:8] && wallRGB[11:8] && ((topBottomWall1 && leftRightWall1) || (topBottomWall2 && leftRightWall2) || (topBottomWall3 && leftRightWall3) || (topBottomWall4 && leftRightWall4));
    assign wallGreen = totalvga[7:4] && wallRGB[7:4] && ((topBottomWall1 && leftRightWall1) || (topBottomWall2 && leftRightWall2) || (topBottomWall3 && leftRightWall3) || (topBottomWall4 && leftRightWall4));
    assign wallBlue = totalvga[3:0] && wallRGB[3:0] && ((topBottomWall1 && leftRightWall1) || (topBottomWall2 && leftRightWall2) || (topBottomWall3 && leftRightWall3) || (topBottomWall4 && leftRightWall4));
    
    assign blockRed = totalvga[11:8] && blockRGB[11:8] && ((topBottomBlock11 && leftRightBlock1) || (topBottomBlock12 && leftRightBlock1) || (topBottomBlock21 && leftRightBlock2) || (topBottomBlock22 && leftRightBlock2) || (topBottomBlock31 && leftRightBlock3) || (topBottomBlock32 && leftRightBlock3) || (topBottomBlock41 && leftRightBlock4) || (topBottomBlock42 && leftRightBlock4));
    assign blockGreen = totalvga[7:4] && blockRGB[7:4] && ((topBottomBlock11 && leftRightBlock1) || (topBottomBlock12 && leftRightBlock1) || (topBottomBlock21 && leftRightBlock2) || (topBottomBlock22 && leftRightBlock2) || (topBottomBlock31 && leftRightBlock3) || (topBottomBlock32 && leftRightBlock3) || (topBottomBlock41 && leftRightBlock4) || (topBottomBlock42 && leftRightBlock4));
    assign blockBlue = totalvga[3:0] && blockRGB[3:0] && ((topBottomBlock11 && leftRightBlock1) || (topBottomBlock12 && leftRightBlock1) || (topBottomBlock21 && leftRightBlock2) || (topBottomBlock22 && leftRightBlock2) || (topBottomBlock31 && leftRightBlock3) || (topBottomBlock32 && leftRightBlock3) || (topBottomBlock41 && leftRightBlock4) || (topBottomBlock42 && leftRightBlock4));
    
    assign gapRed = totalvga[11:8] && gapRGB[11:8] && ((topBottomG1 && leftRightG1) || (topBottomG2 && leftRightG2) || (topBottomG3 && leftRightG3) || (topBottomG4 && leftRightG4));
    assign gapGreen = totalvga[7:4] && gapRGB[7:4] && ((topBottomG1 && leftRightG1) || (topBottomG2 && leftRightG2) || (topBottomG3 && leftRightG3) || (topBottomG4 && leftRightG4));
    assign gapBlue = totalvga[3:0] && gapRGB[3:0] && ((topBottomG1 && leftRightG1) || (topBottomG2 && leftRightG2) || (topBottomG3 && leftRightG3) || (topBottomG4 && leftRightG4));
    
    assign vgaRed = (ballRed ? totalvga[11:8] : 4'h0) | (wallRed ? totalvga[11:8] : 4'h0) | (blockRed ? totalvga[11:8] : 4'h0) | (gapRed ? totalvga[11:8] : 4'h0);
    assign vgaGreen = (ballGreen ? totalvga[7:4] : 4'h0) | (wallGreen ? totalvga[7:4] : 4'h0) | (blockGreen ? totalvga[7:4] : 4'h0) | (gapGreen ? totalvga[7:4] : 4'h0);
    assign vgaBlue = (ballBlue ? totalvga[3:0] : 4'h0) | (wallBlue ? totalvga[3:0] : 4'h0) | (blockBlue ? totalvga[3:0] : 4'h0) | (gapBlue ? totalvga[3:0] : 4'h0);
    
    
    wire [1:0] w;
    FDRE #(.INIT(1'b0)) Qvsync1_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(~Vsync), .Q(w[0]));
    FDRE #(.INIT(1'b0)) Qvsync2_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(w[0]), .Q(w[1]));
    assign eVsync = ~w[1] & w[0];
    counterUD16L FPS (.clk(clk), .R(ResetTimer), .Up(eVsync), .Dw(1'b0), .LD(1'b0), .Din(16'h0000), .Q(secs));
    assign TwoSecs = secs[7];
    assign QuarterSecs = secs[5] & secs[4];
    assign frame16 = secs[3];
    
    wire frame2, frame4;
    assign frame2 = ((Hpixels == 10'd645) && (Vpixels == 10'd485)) | ((Hpixels == 10'd647) && (Vpixels == 10'd487)); //controls speed of wall movement
//    assign frame4 = ((Hpixels == 10'd645) && (Vpixels == 10'd485)) | ((Hpixels == 10'd647) && (Vpixels == 10'd487) | 
//                     (Hpixels == 10'd649) && (Vpixels == 10'd489)) | ((Hpixels == 10'd651) && (Vpixels == 10'd491)); //controls bounce of ball
    
    wire [1:0] t;
    wire wallHit = (ballGreen & (wallGreen | blockGreen));
    FDRE #(.INIT(1'b0)) Qblock1_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(wallHit), .Q(t[0]));
    FDRE #(.INIT(1'b0)) Qblock2_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(t[0]), .Q(t[1]));
    assign collision = ~t[1] & t[0];
    
    StateMachine gameStates (.clk(clk), .btnL(eBtnL), .TwoSecs(TwoSecs), .frame16(frame16), .bounceBall(bounceBall), .ballFalling(ballFalling), .RunGame(RunGame), .Loss(Loss), .collision(collision), .ResetTimer(ResetTimer), .idle(idle), .TwoSecWait(TwoSecWait));
    assign led[0] = idle;
    assign led[1] = TwoSecWait;
    assign led[2] = RunGame;
    assign led[3] = Loss;
    
    wire [7:0] rnd1;
    wire rndCE1 = (rBoundW1 == 10'd000);
//    wire rndCE1 = (lBoundW1 == 10'd000);
    LFSR rndNum1 (.clk(clk), .CE(rndCE1), .rnd(rnd1)); //rndNum for wall1
    
    wire [7:0] rnd2;
    wire rndCE2 = (rBoundW2 == 10'd000);
//    wire rndCE2 = (lBoundW2 == 10'd000);
    LFSR rndNum2 (.clk(clk), .CE(rndCE2), .rnd(rnd2)); //rndNum for wall2
    
    wire [7:0] rnd3;
    wire rndCE3 = (rBoundW3 == 10'd000);
//    wire rndCE3 = (lBoundW3 == 10'd000);
    LFSR rndNum3 (.clk(clk), .CE(rndCE3), .rnd(rnd3)); //rndNum for wall3
    
    wire [7:0] rnd4;
    wire rndCE4 = (rBoundW4 == 10'd000);
//    wire rndCE4 = (lBoundW4 == 10'd000);
    LFSR rndNum4 (.clk(clk), .CE(rndCE4), .rnd(rnd4)); //rndNum for wall4
    
    WhiteBall ball (.clk(clk), .QuarterSecs(QuarterSecs), .bounceBall(bounceBall), .ballFalling(ballFalling), .idle(idle), .TwoSecWait(TwoSecWait), .Loss(Loss), .btnL(eBtnL), .Hpixels(Hpixels), .Vpixels(Vpixels), .ballRGB(ballRGB), .topBottomBall(topBottomBall), .leftRightBall(leftRightBall),
                    .tBall(tBall), .bBall(bBall), .lBall(lBall), .rBall(rBall));
    
    Walls walls (.clk(clk), .btnL(eBtnL), .Loss(Loss), .frame2(frame2), .Hpixels(Hpixels), .Vpixels(Vpixels), .idle(idle), .TwoSecWait(TwoSecWait), .RunGame(RunGame), .rnd1(rnd1), .rnd2(rnd2), .rnd3(rnd3), .rnd4(rnd4),
                 .wallRGB(wallRGB), .topBottomWall1(topBottomWall1), .topBottomWall2(topBottomWall2), .topBottomWall3(topBottomWall3), .topBottomWall4(topBottomWall4), .leftRightWall1(leftRightWall1), .leftRightWall2(leftRightWall2), .leftRightWall3(leftRightWall3), .leftRightWall4(leftRightWall4), .rBoundW1(rBoundW1), .rBoundW2(rBoundW2), .rBoundW3(rBoundW3), .rBoundW4(rBoundW4), .lBoundW1(lBoundW1), .lBoundW2(lBoundW2), .lBoundW3(lBoundW3), .lBoundW4(lBoundW4),
                 .topBottomBlock11(topBottomBlock11), .topBottomBlock12(topBottomBlock12), .topBottomBlock21(topBottomBlock21), .topBottomBlock22(topBottomBlock22), .topBottomBlock31(topBottomBlock31), .topBottomBlock32(topBottomBlock32), .topBottomBlock41(topBottomBlock41), .topBottomBlock42(topBottomBlock42), .leftRightBlock1(leftRightBlock1), .leftRightBlock2(leftRightBlock2), .leftRightBlock3(leftRightBlock3), .leftRightBlock4(leftRightBlock4), .blockRGB(blockRGB),
                 .topBottomG1(topBottomG1), .topBottomG2(topBottomG2), .topBottomG3(topBottomG3), .topBottomG4(topBottomG4), .leftRightG1(leftRightG1), .leftRightG2(leftRightG2), .leftRightG3(leftRightG3), .leftRightG4(leftRightG4), .gapRGB(gapRGB));
    
    wire scoreCE = (lBall == rBoundW1) | (lBall == rBoundW2) | (lBall == rBoundW3) | (lBall == rBoundW4);
    wire [1:0] scoreClked;
    FDRE #(.INIT(1'b0)) Qscore1_FF (.C(clk), .CE(1'b1), .D(scoreCE), .Q(scoreClked[0]));
    FDRE #(.INIT(1'b0)) Qscore2_FF (.C(clk), .CE(1'b1), .D(scoreClked[0]), .Q(scoreClked[1]));
    assign eScoreCE = ~scoreClked[1] & scoreClked[0];
    ScoreCounter score (.clk(clk), .R(Loss & eBtnL), .CE(eScoreCE), .score(Q)); //score goes up each time after passing a wall
    
    RingCounter ringC (.clk(clk), .adv(digsel), .rc(sel));
    Selector s (.sel(sel), .Q(Q), .Qsel(Qsel));
    hex7seg ssd (.n(Qsel), .seg(seg));
    
    lab7_clks not_so_slow (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel));
    
    assign Flash = collision & QuarterSecs;
    
    assign an[3] = ~(sel[3] & (Loss & ~QuarterSecs | ~Loss));
    assign an[2] = ~(sel[2] & (Loss & ~QuarterSecs | ~Loss));
    assign an[1] = ~(sel[1] & (Loss & ~QuarterSecs | ~Loss));
    assign an[0] = ~(sel[0] & (Loss & ~QuarterSecs | ~Loss));
    assign dp = 1'b1;
endmodule
