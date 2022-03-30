`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/17/2021 01:15:04 PM
// Design Name: 
// Module Name: Walls
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


module Walls(
    input clk,
    input btnL,
    input frame2,
    input idle,
    input TwoSecWait,
    input RunGame,
    input Loss,
    input [7:0] rnd1,
    input [7:0] rnd2,
    input [7:0] rnd3,
    input [7:0] rnd4,
    input [9:0] Hpixels,
    input [9:0] Vpixels,
    output [11:0] wallRGB,
    output [11:0] blockRGB,
    output [11:0] gapRGB,
    output [9:0] topBottomWall1,
    output [9:0] topBottomWall2,
    output [9:0] topBottomWall3,
    output [9:0] topBottomWall4,
    output [9:0] leftRightWall1,
    output [9:0] leftRightWall2,
    output [9:0] leftRightWall3,
    output [9:0] leftRightWall4,
    output [9:0] rBoundW1,
    output [9:0] rBoundW2,
    output [9:0] rBoundW3,
    output [9:0] rBoundW4,
    output [9:0] lBoundW1,
    output [9:0] lBoundW2,
    output [9:0] lBoundW3,
    output [9:0] lBoundW4,
    output [9:0] topBottomBlock11,
    output [9:0] topBottomBlock12,
    output [9:0] topBottomBlock21,
    output [9:0] topBottomBlock22,
    output [9:0] topBottomBlock31,
    output [9:0] topBottomBlock32,
    output [9:0] topBottomBlock41,
    output [9:0] topBottomBlock42,
    output [9:0] leftRightBlock1,
    output [9:0] leftRightBlock2,
    output [9:0] leftRightBlock3,
    output [9:0] leftRightBlock4,
    output [9:0] topBottomG1,
    output [9:0] topBottomG2,
    output [9:0] topBottomG3,
    output [9:0] topBottomG4,
    output [9:0] leftRightG1,
    output [9:0] leftRightG2,
    output [9:0] leftRightG3,
    output [9:0] leftRightG4
    );
    
    //random number
    wire [9:0] rndNum1 = {{3{1'b0}}, rnd1[6:4], {4{1'b0}}};
    wire [9:0] rndNum2 = {{3{1'b0}}, rnd2[6:4], {4{1'b0}}};
    wire [9:0] rndNum3 = {{3{1'b0}}, rnd3[6:4], {4{1'b0}}};
    wire [9:0] rndNum4 = {{3{1'b0}}, rnd4[6:4], {4{1'b0}}};
    
    //turquoise walls
    wire [9:0] leftHboundW1, rightHboundW1, leftHboundW2, rightHboundW2, leftHboundW3, rightHboundW3, leftHboundW4, rightHboundW4; //horizontal bounds of walls
    wire [9:0] leftBoundW1, rightBoundW1, leftBoundW2, rightBoundW2, leftBoundW3, rightBoundW3, leftBoundW4, rightBoundW4, topBoundW11, bottomBoundW11, topBoundW12, bottomBoundW12, topBoundW21, bottomBoundW21, topBoundW22, bottomBoundW22, topBoundW31, bottomBoundW31, topBoundW32, bottomBoundW32, topBoundW41, bottomBoundW41, topBoundW42, bottomBoundW42; //in-game wall bounds
    
    assign leftBoundW1 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd320 : 10'd592;
    assign rightBoundW1 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd367 : 10'd639;
    
    assign leftBoundW2 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd480 : 10'd592; 
    assign rightBoundW2 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd527 : 10'd639;
    
    assign leftBoundW3 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd640 : 10'd592; 
    assign rightBoundW3 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd687 : 10'd639;
    
    assign leftBoundW4 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd800 : 10'd592; 
    assign rightBoundW4 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd847 : 10'd639;
    
    counterUD16L leftBoundWall1 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW1 == 10'd000) | (Loss & btnL)), .Din(leftBoundW1), .Q(leftHboundW1));
    counterUD16L rightBoundWall1 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW1 == 10'd000) | (Loss & btnL)), .Din(rightBoundW1), .Q(rightHboundW1));
   
    counterUD16L leftBoundWall2 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW2 == 10'd000) | (Loss & btnL)), .Din(leftBoundW2), .Q(leftHboundW2));
    counterUD16L rightBoundWall2 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW2 == 10'd000) | (Loss & btnL)), .Din(rightBoundW2), .Q(rightHboundW2));
   
    counterUD16L leftBoundWall3 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW3 == 10'd000) | (Loss & btnL)), .Din(leftBoundW3), .Q(leftHboundW3));
    counterUD16L rightBoundWall3 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW3 == 10'd000) | (Loss & btnL)), .Din(rightBoundW3), .Q(rightHboundW3));
   
    counterUD16L leftBoundWall4 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW4 == 10'd000) | (Loss & btnL)), .Din(leftBoundW4), .Q(leftHboundW4));
    counterUD16L rightBoundWall4 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW4 == 10'd000) | (Loss & btnL)), .Din(rightBoundW4), .Q(rightHboundW4));
    
    
    assign bottomBoundW11 = (((rightHboundW1 == 10'd000) & (rnd1[7] == 1'b0)) ? (10'd133 + rndNum1) : 10'd133) | (((rightHboundW1 == 10'd000) & (rnd1[7] == 1'b1)) ? (10'd133 - rndNum1) : 10'd133);
    
    assign topBoundW12 = (((rightHboundW1 == 10'd000) & (rnd1[7] == 1'b0)) ? (10'd347 + rndNum1) : 10'd347) | (((rightHboundW1 == 10'd000) & (rnd1[7] == 1'b1)) ? (10'd347 - rndNum1) : 10'd347); 
    
    assign bottomBoundW21 = (((rightHboundW2 == 10'd000) & (rnd2[7] == 1'b0)) ? (10'd173 + rndNum2) : 10'd173) | (((rightHboundW2 == 10'd000) & (rnd2[7] == 1'b1)) ? (10'd173 - rndNum2) : 10'd173);
    
    assign topBoundW22 = (((rightHboundW2 == 10'd000) & (rnd2[7] == 1'b0)) ? (10'd387 + rndNum2) : 10'd387) | (((rightHboundW2 == 10'd000) & (rnd2[7] == 1'b1)) ? (10'd387 - rndNum2) : 10'd387); 
    
    assign bottomBoundW31 = (((rightHboundW3 == 10'd000) & (rnd3[7] == 1'b0)) ? (10'd103 + rndNum3) : 10'd103) | (((rightHboundW3 == 10'd000) & (rnd3[7] == 1'b1)) ? (10'd103 - rndNum3) : 10'd103);
    
    assign topBoundW32 = (((rightHboundW3 == 10'd000) & (rnd3[7] == 1'b0)) ? (10'd317 + rndNum3) : 10'd317) | (((rightHboundW3 == 10'd000) & (rnd3[7] == 1'b1)) ? (10'd317 - rndNum3) : 10'd317); 
    
    assign bottomBoundW41 = (((rightHboundW4 == 10'd000) & (rnd4[7] == 1'b0)) ? (10'd193 + rndNum4) : 10'd193) | (((rightHboundW4 == 10'd000) & (rnd4[7] == 1'b1)) ? (10'd193 - rndNum4) : 10'd193);
    
    assign topBoundW42 = (((rightHboundW4 == 10'd000) & (rnd4[7] == 1'b0)) ? (10'd407 + rndNum4) : 10'd407) | (((rightHboundW4 == 10'd000) & (rnd4[7] == 1'b1)) ? (10'd407 - rndNum4) : 10'd407);
    
    //left bound condition
//    assign bottomBoundW11 = (((leftHboundW1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd133 : (10'd133 + rndNum1)) | (((leftHboundW1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd133 : (10'd133 - rndNum1));
    
//    assign topBoundW12 = (((leftHboundW1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd347 : (10'd347 + rndNum1)) | (((leftHboundW1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd347 : (10'd347 - rndNum1)); 
    
//    assign bottomBoundW21 = (((leftHboundW2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd173 : (10'd173 + rndNum2)) | (((leftHboundW2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd173 : (10'd173 - rndNum2));
    
//    assign topBoundW22 = (((leftHboundW2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd387 : (10'd387 + rndNum2)) | (((leftHboundW2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd387 : (10'd387 - rndNum2)); 
    
//    assign bottomBoundW31 = (((leftHboundW3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd103 : (10'd103 + rndNum3)) | (((leftHboundW3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd103 : (10'd103 - rndNum3));
    
//    assign topBoundW32 = (((leftHboundW3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd317 : (10'd317 + rndNum3)) | (((leftHboundW3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd317 : (10'd317 - rndNum3)); 
    
//    assign bottomBoundW41 = (((leftHboundW4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd193 : (10'd193 + rndNum4)) | (((leftHboundW4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd193 : (10'd193 - rndNum4));
    
//    assign topBoundW42 = (((leftHboundW4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd407 : (10'd407 + rndNum4)) | (((leftHboundW4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd407 : (10'd407 - rndNum4));
    
    //right bound condition
//    assign bottomBoundW11 = (((rightHboundW1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd133 : (10'd133 + rndNum1)) | (((rightHboundW1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd133 : (10'd133 - rndNum1));
    
//    assign topBoundW12 = (((rightHboundW1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd347 : (10'd347 + rndNum1)) | (((rightHboundW1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd347 : (10'd347 - rndNum1)); 
    
//    assign bottomBoundW21 = (((rightHboundW2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd173 : (10'd173 + rndNum2)) | (((rightHboundW2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd173 : (10'd173 - rndNum2));
    
//    assign topBoundW22 = (((rightHboundW2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd387 : (10'd387 + rndNum2)) | (((rightHboundW2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd387 : (10'd387 - rndNum2)); 
    
//    assign bottomBoundW31 = (((rightHboundW3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd103 : (10'd103 + rndNum3)) | (((rightHboundW3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd103 : (10'd103 - rndNum3));
    
//    assign topBoundW32 = (((rightHboundW3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd317 : (10'd317 + rndNum3)) | (((rightHboundW3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd317 : (10'd317 - rndNum3)); 
    
//    assign bottomBoundW41 = (((rightHboundW4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd193 : (10'd193 + rndNum4)) | (((rightHboundW4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd193 : (10'd193 - rndNum4));
    
//    assign topBoundW42 = (((rightHboundW4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd407 : (10'd407 + rndNum4)) | (((rightHboundW4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd407 : (10'd407 - rndNum4)); 
    
    assign topBottomWall1 = ((Vpixels >= 10'd000) & (Vpixels <= bottomBoundW11)) || ((Vpixels >= topBoundW12) & (Vpixels <= 10'd479));
    assign topBottomWall2 = ((Vpixels >= 10'd000) & (Vpixels <= bottomBoundW21)) || ((Vpixels >= topBoundW22) & (Vpixels <= 10'd479));
    assign topBottomWall3 = ((Vpixels >= 10'd000) & (Vpixels <= bottomBoundW31)) || ((Vpixels >= topBoundW32) & (Vpixels <= 10'd479));
    assign topBottomWall4 = ((Vpixels >= 10'd000) & (Vpixels <= bottomBoundW41)) || ((Vpixels >= topBoundW42) & (Vpixels <= 10'd479));
    
//    assign topBottomWall1 = ((Vpixels >= 10'd000) & (Vpixels <= 10'd133)) || ((Vpixels >= 10'd347) & (Vpixels <= 10'd479));
//    assign topBottomWall2 = ((Vpixels >= 10'd000) & (Vpixels <= 10'd173)) || ((Vpixels >= 10'd387) & (Vpixels <= 10'd479));
//    assign topBottomWall3 = ((Vpixels >= 10'd000) & (Vpixels <= 10'd103)) || ((Vpixels >= 10'd317) & (Vpixels <= 10'd479));
//    assign topBottomWall4 = ((Vpixels >= 10'd000) & (Vpixels <= 10'd193)) || ((Vpixels >= 10'd407) & (Vpixels <= 10'd479)); //top and bottom edges of walls (gap considered in between)
    
    assign leftRightWall1 = (Hpixels >= leftHboundW1) & (Hpixels <= rightHboundW1); //left and right edges of wall1
    assign leftRightWall2 = (Hpixels >= leftHboundW2) & (Hpixels <= rightHboundW2); //left and right edges of wall2
    assign leftRightWall3 = (Hpixels >= leftHboundW3) & (Hpixels <= rightHboundW3); //left and right edges of wall3
    assign leftRightWall4 = (Hpixels >= leftHboundW4) & (Hpixels <= rightHboundW4); //left and right edges of wall4
    
    assign rBoundW1 = rightHboundW1;
    assign rBoundW2 = rightHboundW2;
    assign rBoundW3 = rightHboundW3;
    assign rBoundW4 = rightHboundW4;
    
    assign lBoundW1 = leftHboundW1;
    assign lBoundW2 = leftHboundW2;
    assign lBoundW3 = leftHboundW3;
    assign lBoundW4 = leftHboundW4;
    
    assign wallRGB = 12'h0FF;
    
//    assign leftRightWall1 = (Hpixels >= 10'd320) & (Hpixels <= 10'd367); //left and right edges of wall1
//    assign leftRightWall2 = (Hpixels >= 10'd480) & (Hpixels <= 10'd527); //left and right edges of wall2
//    assign leftRightWall3 = (Hpixels >= 10'd640) & (Hpixels <= 10'd687); //left and right edges of wall3
//    assign leftRightWall4 = (Hpixels >= 10'd800) & (Hpixels <= 10'd847); //left and right edges of wall4





    //yellow blocks of walls
    wire [9:0] leftHboundB1, rightHboundB1, leftHboundB2, rightHboundB2, leftHboundB3, rightHboundB3, leftHboundB4, rightHboundB4; //horizontal bounds of blocks
    wire [9:0] leftBoundB1, rightBoundB1, leftBoundB2, rightBoundB2, leftBoundB3, rightBoundB3, leftBoundB4, rightBoundB4, topBoundB11, bottomBoundB11, topBoundB12, bottomBoundB12, topBoundB21, bottomBoundB21, topBoundB22, bottomBoundB22, topBoundB31, bottomBoundB31, topBoundB32, bottomBoundB32, topBoundB41, bottomBoundB41, topBoundB42, bottomBoundB42; //in-game block bounds
    
    assign leftBoundB1 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd320 : 10'd592; 
    assign rightBoundB1 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd367 : 10'd639;
    
    assign leftBoundB2 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd480 : 10'd592; 
    assign rightBoundB2 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd527 : 10'd639;
    
    assign leftBoundB3 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd640 : 10'd592; 
    assign rightBoundB3 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd687 : 10'd639;
    
    assign leftBoundB4 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd800 : 10'd592; 
    assign rightBoundB4 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd847 : 10'd639;
    
    counterUD16L leftBoundBlock1 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW1 == 10'd000) | (Loss & btnL)), .Din(leftBoundB1), .Q(leftHboundB1));
    counterUD16L rightBoundBlock1 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW1 == 10'd000) | (Loss & btnL)), .Din(rightBoundB1), .Q(rightHboundB1));
   
    counterUD16L leftBoundBlock2 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW2 == 10'd000) | (Loss & btnL)), .Din(leftBoundB2), .Q(leftHboundB2));
    counterUD16L rightBoundBlock2 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW2 == 10'd000) | (Loss & btnL)), .Din(rightBoundB2), .Q(rightHboundB2));
   
    counterUD16L leftBoundBlock3 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW3 == 10'd000) | (Loss & btnL)), .Din(leftBoundB3), .Q(leftHboundB3));
    counterUD16L rightBoundBlock3 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW3 == 10'd000) | (Loss & btnL)), .Din(rightBoundB3), .Q(rightHboundB3));
   
    counterUD16L leftBoundBlock4 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW4 == 10'd000) | (Loss & btnL)), .Din(leftBoundB4), .Q(leftHboundB4));
    counterUD16L rightBoundBlock4 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW4 == 10'd000) | (Loss & btnL)), .Din(rightBoundB4), .Q(rightHboundB4));
    
    
    assign topBoundB11 = (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? (10'd133 + rndNum1) : 10'd133) | (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? (10'd133 - rndNum1) : 10'd133);
    assign bottomBoundB11 = (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? (10'd180 + rndNum1) : 10'd180) | (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? (10'd180 - rndNum1) : 10'd180);
    
    assign topBoundB12 = (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? (10'd300 + rndNum1) : 10'd300) | (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? (10'd300 - rndNum1) : 10'd300); 
    assign bottomBoundB12 = (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? (10'd347 + rndNum1) : 10'd347) | (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? (10'd347 - rndNum1) : 10'd347);
    
    assign topBoundB21 = (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? (10'd173 + rndNum2) : 10'd173) | (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? (10'd173 - rndNum2) : 10'd173); 
    assign bottomBoundB21 = (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? (10'd220 + rndNum2) : 10'd220) | (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? (10'd220 - rndNum2) : 10'd220);
    
    assign topBoundB22 = (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? (10'd340 + rndNum2) : 10'd340) | (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? (10'd340 - rndNum2) : 10'd340); 
    assign bottomBoundB22 = (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? (10'd387 + rndNum2) : 10'd387) | (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? (10'd387 - rndNum2) : 10'd387);
    
    assign topBoundB31 = (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? (10'd103 + rndNum3) : 10'd103) | (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? (10'd103 - rndNum3) : 10'd103);
    assign bottomBoundB31 = (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? (10'd150 + rndNum3) : 10'd150) | (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? (10'd150 - rndNum3) : 10'd150);
    
    assign topBoundB32 = (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? (10'd270 + rndNum3) : 10'd270) | (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? (10'd270 - rndNum3) : 10'd270); 
    assign bottomBoundB32 = (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? (10'd317 + rndNum3) : 10'd317) | (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? (10'd317 - rndNum3) : 10'd317);
    
    assign topBoundB41 = (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? (10'd193 + rndNum4) : 10'd193) | (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? (10'd193 - rndNum4) : 10'd193); 
    assign bottomBoundB41 = (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? (10'd240 + rndNum4) : 10'd240) | (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? (10'd240 - rndNum4) : 10'd240);
    
    assign topBoundB42 = (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? (10'd360 + rndNum4) : 10'd360) | (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? (10'd360 - rndNum4) : 10'd360); 
    assign bottomBoundB42 = (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? (10'd407 + rndNum4) : 10'd407) | (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? (10'd407 - rndNum4) : 10'd407);
    
    //left bound condition
//    assign topBoundB11 = (((leftHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd133 : (10'd133 + rndNum1)) | (((leftHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd133 : (10'd133 - rndNum1));
//    assign bottomBoundB11 = (((leftHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd180 : (10'd180 + rndNum1)) | (((leftHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd180 : (10'd180 - rndNum1));
    
//    assign topBoundB12 = (((leftHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd300 : (10'd300 + rndNum1)) | (((leftHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd300 : (10'd300 - rndNum1)); 
//    assign bottomBoundB12 = (((leftHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd347 : (10'd347 + rndNum1)) | (((leftHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd347 : (10'd347 - rndNum1));
    
//    assign topBoundB21 = (((leftHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd173 : (10'd173 + rndNum2)) | (((leftHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd173 : (10'd173 - rndNum2)); 
//    assign bottomBoundB21 = (((leftHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd220 : (10'd220 + rndNum2)) | (((leftHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd220 : (10'd220 - rndNum2));
    
//    assign topBoundB22 = (((leftHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd340 : (10'd340 + rndNum2)) | (((leftHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd340 : (10'd340 - rndNum2)); 
//    assign bottomBoundB22 = (((leftHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd387 : (10'd387 + rndNum2)) | (((leftHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd387 : (10'd387 - rndNum2));
    
//    assign topBoundB31 = (((leftHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd103 : (10'd103 + rndNum3)) | (((leftHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd103 : (10'd103 - rndNum3));
//    assign bottomBoundB31 = (((leftHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd150 : (10'd150 + rndNum3)) | (((leftHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd150 : (10'd150 - rndNum3));
    
//    assign topBoundB32 = (((leftHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd270 : (10'd270 + rndNum3)) | (((leftHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd270 : (10'd270 - rndNum3)); 
//    assign bottomBoundB32 = (((leftHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd317 : (10'd317 + rndNum3)) | (((leftHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd317 : (10'd317 - rndNum3));
    
//    assign topBoundB41 = (((leftHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd193 : (10'd193 + rndNum4)) | (((leftHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd193 : (10'd193 - rndNum4)); 
//    assign bottomBoundB41 = (((leftHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd240 : (10'd240 + rndNum4)) | (((leftHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd240 : (10'd240 - rndNum4));
    
//    assign topBoundB42 = (((leftHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd360 : (10'd360 + rndNum4)) | (((leftHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd360 : (10'd360 - rndNum4)); 
//    assign bottomBoundB42 = (((leftHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd407 : (10'd407 + rndNum4)) | (((leftHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd407 : (10'd407 - rndNum4));
    
    //right bound condition
//    assign topBoundB11 = (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd133 : (10'd133 + rndNum1)) | (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd133 : (10'd133 - rndNum1));
//    assign bottomBoundB11 = (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd180 : (10'd180 + rndNum1)) | (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd180 : (10'd180 - rndNum1));
    
//    assign topBoundB12 = (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd300 : (10'd300 + rndNum1)) | (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd300 : (10'd300 - rndNum1)); 
//    assign bottomBoundB12 = (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd347 : (10'd347 + rndNum1)) | (((rightHboundB1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd347 : (10'd347 - rndNum1));
    
//    assign topBoundB21 = (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd173 : (10'd173 + rndNum2)) | (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd173 : (10'd173 - rndNum2)); 
//    assign bottomBoundB21 = (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd220 : (10'd220 + rndNum2)) | (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd220 : (10'd220 - rndNum2));
    
//    assign topBoundB22 = (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd340 : (10'd340 + rndNum2)) | (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd340 : (10'd340 - rndNum2)); 
//    assign bottomBoundB22 = (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd387 : (10'd387 + rndNum2)) | (((rightHboundB2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd387 : (10'd387 - rndNum2));
    
//    assign topBoundB31 = (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd103 : (10'd103 + rndNum3)) | (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd103 : (10'd103 - rndNum3));
//    assign bottomBoundB31 = (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd150 : (10'd150 + rndNum3)) | (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd150 : (10'd150 - rndNum3));
    
//    assign topBoundB32 = (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd270 : (10'd270 + rndNum3)) | (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd270 : (10'd270 - rndNum3)); 
//    assign bottomBoundB32 = (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd317 : (10'd317 + rndNum3)) | (((rightHboundB3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd317 : (10'd317 - rndNum3));
    
//    assign topBoundB41 = (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd193 : (10'd193 + rndNum4)) | (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd193 : (10'd193 - rndNum4)); 
//    assign bottomBoundB41 = (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd240 : (10'd240 + rndNum4)) | (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd240 : (10'd240 - rndNum4));
    
//    assign topBoundB42 = (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd360 : (10'd360 + rndNum4)) | (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd360 : (10'd360 - rndNum4)); 
//    assign bottomBoundB42 = (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd407 : (10'd407 + rndNum4)) | (((rightHboundB4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd407 : (10'd407 - rndNum4));
    
    assign topBottomBlock11 = (Vpixels >= topBoundB11) & (Vpixels <= bottomBoundB11);
    assign topBottomBlock12 = (Vpixels >= topBoundB12) & (Vpixels <= bottomBoundB12);
                                                                     
    assign topBottomBlock21 = (Vpixels >= topBoundB21) & (Vpixels <= bottomBoundB21);
    assign topBottomBlock22 = (Vpixels >= topBoundB22) & (Vpixels <= bottomBoundB22);
                                                                     
    assign topBottomBlock31 = (Vpixels >= topBoundB31) & (Vpixels <= bottomBoundB31);
    assign topBottomBlock32 = (Vpixels >= topBoundB32) & (Vpixels <= bottomBoundB32);
                                                                     
    assign topBottomBlock41 = (Vpixels >= topBoundB41) & (Vpixels <= bottomBoundB41);
    assign topBottomBlock42 = (Vpixels >= topBoundB42) & (Vpixels <= bottomBoundB42);
    
//    assign topBottomBlock11 = (Vpixels >= 10'd133) & (Vpixels <= 10'd180);
//    assign topBottomBlock12 = (Vpixels >= 10'd300) & (Vpixels <= 10'd347);
    
//    assign topBottomBlock21 = (Vpixels >= 10'd173) & (Vpixels <= 10'd220);
//    assign topBottomBlock22 = (Vpixels >= 10'd340) & (Vpixels <= 10'd387);
    
//    assign topBottomBlock31 = (Vpixels >= 10'd103) & (Vpixels <= 10'd150);
//    assign topBottomBlock32 = (Vpixels >= 10'd270) & (Vpixels <= 10'd317);
    
//    assign topBottomBlock41 = (Vpixels >= 10'd193) & (Vpixels <= 10'd240);
//    assign topBottomBlock42 = (Vpixels >= 10'd360) & (Vpixels <= 10'd407);
    
    assign leftRightBlock1 = (Hpixels >= leftHboundB1) & (Hpixels <= rightHboundB1);
    assign leftRightBlock2 = (Hpixels >= leftHboundB2) & (Hpixels <= rightHboundB2);
    assign leftRightBlock3 = (Hpixels >= leftHboundB3) & (Hpixels <= rightHboundB3);
    assign leftRightBlock4 = (Hpixels >= leftHboundB4) & (Hpixels <= rightHboundB4);
//    assign leftRightBlock1 = (Hpixels >= 10'd320) & (Hpixels <= 10'd367);
    
    assign blockRGB = 12'hFF0;
    
    
    
    
    
    //vertical gaps between yellow blocks
    wire [9:0] leftHboundG1, rightHboundG1, leftHboundG2, rightHboundG2, leftHboundG3, rightHboundG3, leftHboundG4, rightHboundG4; //horizontal bounds of gaps
    wire [9:0] leftBoundG1, rightBoundG1, leftBoundG2, rightBoundG2, leftBoundG3, rightBoundG3, leftBoundG4, rightBoundG4, topBoundG1, bottomBoundG1, topBoundG2, bottomBoundG2, topBoundG3, bottomBoundG3, topBoundG4, bottomBoundG4; //in-game gap bounds
    
    assign leftBoundG1 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd320 : 10'd592; 
    assign rightBoundG1 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd367 : 10'd639;
    
    assign leftBoundG2 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd480 : 10'd592; 
    assign rightBoundG2 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd527 : 10'd639;
    
    assign leftBoundG3 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd640 : 10'd592; 
    assign rightBoundG3 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd687 : 10'd639;
    
    assign leftBoundG4 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd800 : 10'd592; 
    assign rightBoundG4 = (idle | TwoSecWait | (Loss & btnL)) ? 10'd847 : 10'd639;
    
    counterUD16L leftBoundGap1 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW1 == 10'd000) | (Loss & btnL)), .Din(leftBoundG1), .Q(leftHboundG1));
    counterUD16L rightBoundGap1 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW1 == 10'd000) | (Loss & btnL)), .Din(rightBoundG1), .Q(rightHboundG1));
   
    counterUD16L leftBoundGap2 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW2 == 10'd000) | (Loss & btnL)), .Din(leftBoundG2), .Q(leftHboundG2));
    counterUD16L rightBoundGap2 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW2 == 10'd000) | (Loss & btnL)), .Din(rightBoundG2), .Q(rightHboundG2));
   
    counterUD16L leftBoundGap3 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW3 == 10'd000) | (Loss & btnL)), .Din(leftBoundG3), .Q(leftHboundG3));
    counterUD16L rightBoundGap3 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW3 == 10'd000) | (Loss & btnL)), .Din(rightBoundG3), .Q(rightHboundG3));
   
    counterUD16L leftBoundGap4 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW4 == 10'd000) | (Loss & btnL)), .Din(leftBoundG4), .Q(leftHboundG4));
    counterUD16L rightBoundGap4 (.clk(clk), .Up(1'b0), .Dw(frame2 & RunGame), .LD((rightHboundW4 == 10'd000) | (Loss & btnL)), .Din(rightBoundG4), .Q(rightHboundG4));
    
    
    assign topBoundG1 = (((rightHboundG1 == 10'd000) & (rnd1[7] == 1'b0)) ? (10'd180 + rndNum1) : 10'd180) | (((rightHboundG1 == 10'd000) & (rnd1[7] == 1'b1)) ? (10'd180 - rndNum1) : 10'd180);
    assign bottomBoundG1 = (((rightHboundG1 == 10'd000) & (rnd1[7] == 1'b0)) ? (10'd300 + rndNum1) : 10'd300) | (((rightHboundG1 == 10'd000) & (rnd1[7] == 1'b1)) ? (10'd300 - rndNum1) : 10'd300);
    
    assign topBoundG2 = (((rightHboundG2 == 10'd000) & (rnd2[7] == 1'b0)) ? (10'd220 + rndNum2) : 10'd220) | (((rightHboundG2 == 10'd000) & (rnd2[7] == 1'b1)) ? (10'd220 - rndNum2) : 10'd220); 
    assign bottomBoundG2 = (((rightHboundG2 == 10'd000) & (rnd2[7] == 1'b0)) ? (10'd340 + rndNum2) : 10'd340) | (((rightHboundG2 == 10'd000) & (rnd2[7] == 1'b1)) ? (10'd340 - rndNum2) : 10'd340);
    
    assign topBoundG3 = (((rightHboundG3 == 10'd000) & (rnd3[7] == 1'b0)) ? (10'd150 + rndNum3) : 10'd150) | (((rightHboundG3 == 10'd000) & (rnd3[7] == 1'b1)) ? (10'd150 - rndNum3) : 10'd150); 
    assign bottomBoundG3 = (((rightHboundG3 == 10'd000) & (rnd3[7] == 1'b0)) ? (10'd270 + rndNum3) : 10'd270) | (((rightHboundG3 == 10'd000) & (rnd3[7] == 1'b1)) ? (10'd270 - rndNum3) : 10'd270);
    
    assign topBoundG4 = (((rightHboundG4 == 10'd000) & (rnd4[7] == 1'b0)) ? (10'd240 + rndNum4) : 10'd240) | (((rightHboundG4 == 10'd000) & (rnd4[7] == 1'b1)) ? (10'd240 - rndNum4) : 10'd240); 
    assign bottomBoundG4 = (((rightHboundG4 == 10'd000) & (rnd4[7] == 1'b0)) ? (10'd360 + rndNum4) : 10'd360) | (((rightHboundG4 == 10'd000) & (rnd4[7] == 1'b1)) ? (10'd360 - rndNum4) : 10'd360);
    
    //left bound condition
//    assign topBoundG1 = (((leftHboundG1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd180 : (10'd180 + rndNum1)) | (((leftHboundG1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd180 : (10'd180 - rndNum1));
//    assign bottomBoundG1 = (((leftHboundG1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd300 : (10'd300 + rndNum1)) | (((leftHboundG1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd300 : (10'd300 - rndNum1));
    
//    assign topBoundG2 = (((leftHboundG2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd220 : (10'd220 + rndNum2)) | (((leftHboundG2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd220 : (10'd220 - rndNum2)); 
//    assign bottomBoundG2 = (((leftHboundG2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd340 : (10'd340 + rndNum2)) | (((leftHboundG2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd340 : (10'd340 - rndNum2));
    
//    assign topBoundG3 = (((leftHboundG3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd150 : (10'd150 + rndNum3)) | (((leftHboundG3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd150 : (10'd150 - rndNum3)); 
//    assign bottomBoundG3 = (((leftHboundG3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd270 : (10'd270 + rndNum3)) | (((leftHboundG3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd270 : (10'd270 - rndNum3));
    
//    assign topBoundG4 = (((leftHboundG4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd240 : (10'd240 + rndNum4)) | (((leftHboundG4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd240 : (10'd240 - rndNum4)); 
//    assign bottomBoundG4 = (((leftHboundG4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd360 : (10'd360 + rndNum4)) | (((leftHboundG4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd360 : (10'd360 - rndNum4));
    
    //right bound condition
//    assign topBoundG1 = (((rightHboundG1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd180 : (10'd180 + rndNum1)) | (((rightHboundG1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd180 : (10'd180 - rndNum1));
//    assign bottomBoundG1 = (((rightHboundG1 == 10'd000) & (rnd1[7] == 1'b0)) ? 10'd300 : (10'd300 + rndNum1)) | (((rightHboundG1 == 10'd000) & (rnd1[7] == 1'b1)) ? 10'd300 : (10'd300 - rndNum1));
    
//    assign topBoundG2 = (((rightHboundG2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd220 : (10'd220 + rndNum2)) | (((rightHboundG2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd220 : (10'd220 - rndNum2)); 
//    assign bottomBoundG2 = (((rightHboundG2 == 10'd000) & (rnd2[7] == 1'b0)) ? 10'd340 : (10'd340 + rndNum2)) | (((rightHboundG2 == 10'd000) & (rnd2[7] == 1'b1)) ? 10'd340 : (10'd340 - rndNum2));
    
//    assign topBoundG3 = (((rightHboundG3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd150 : (10'd150 + rndNum3)) | (((rightHboundG3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd150 : (10'd150 - rndNum3)); 
//    assign bottomBoundG3 = (((rightHboundG3 == 10'd000) & (rnd3[7] == 1'b0)) ? 10'd270 : (10'd270 + rndNum3)) | (((rightHboundG3 == 10'd000) & (rnd3[7] == 1'b1)) ? 10'd270 : (10'd270 - rndNum3));
    
//    assign topBoundG4 = (((rightHboundG4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd240 : (10'd240 + rndNum4)) | (((rightHboundG4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd240 : (10'd240 - rndNum4)); 
//    assign bottomBoundG4 = (((rightHboundG4 == 10'd000) & (rnd4[7] == 1'b0)) ? 10'd360 : (10'd360 + rndNum4)) | (((rightHboundG4 == 10'd000) & (rnd4[7] == 1'b1)) ? 10'd360 : (10'd360 - rndNum4));
    
    assign topBottomG1 = (Vpixels >= topBoundG1) & (Vpixels <= bottomBoundG1);
    assign topBottomG2 = (Vpixels >= topBoundG2) & (Vpixels <= bottomBoundG2);
    assign topBottomG3 = (Vpixels >= topBoundG3) & (Vpixels <= bottomBoundG3);
    assign topBottomG4 = (Vpixels >= topBoundG4) & (Vpixels <= bottomBoundG4);
    
//    assign topBottomG1 = (Vpixels >= 10'd180) & (Vpixels <= 10'd300);
//    assign topBottomG2 = (Vpixels >= 10'd220) & (Vpixels <= 10'd340);
//    assign topBottomG3 = (Vpixels >= 10'd150) & (Vpixels <= 10'd270);
//    assign topBottomG4 = (Vpixels >= 10'd240) & (Vpixels <= 10'd360);
    
    assign leftRightG1 = (Hpixels >= leftHboundG1) & (Hpixels <= rightHboundG1);
    assign leftRightG2 = (Hpixels >= leftHboundG2) & (Hpixels <= rightHboundG2);
    assign leftRightG3 = (Hpixels >= leftHboundG3) & (Hpixels <= rightHboundG3);
    assign leftRightG4 = (Hpixels >= leftHboundG4) & (Hpixels <= rightHboundG4);
//    assign leftRightG1 = (Hpixels >= 10'd020) & (Hpixels <= 10'd057);
    
    assign gapRGB = 12'h000;
    
endmodule
