`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/16/2021 12:05:56 PM
// Design Name: 
// Module Name: WhiteBall
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


module WhiteBall(
    input clk,
    input QuarterSecs,
    input bounceBall,
    input ballFalling,
    input idle,
    input TwoSecWait,
    input Loss,
    input btnL,
    input [9:0] Hpixels,
    input [9:0] Vpixels,
    output [11:0] ballRGB,
    output [9:0] topBottomBall,
    output [9:0] leftRightBall,
    output [9:0] tBall,
    output [9:0] bBall,
    output [9:0] lBall,
    output [9:0] rBall
    );
    
    wire [9:0] topVbound, bottomVbound;
    wire frame2, frame4;
    
    wire f2 = ((Hpixels == 10'd000) & ((Vpixels == 10'd410) | (Vpixels == 10'd412)));
    wire f4 = ((Hpixels == 10'd000) & ((Vpixels == 10'd410) | (Vpixels == 10'd412) | (Vpixels == 10'd414) | (Vpixels == 10'd416) | (Vpixels == 10'd418) | (Vpixels == 10'd420) | (Vpixels == 10'd422) | (Vpixels == 10'd424)));
    
    wire [1:0] w;
    FDRE #(.INIT(1'b0)) Qframe4_1_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(f4), .Q(w[0]));
    FDRE #(.INIT(1'b0)) Qframe4_2_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(w[0]), .Q(w[1]));
    assign frame4 = ~w[1] & w[0]; //4 pixels per frame
    
    wire [1:0] e;
    FDRE #(.INIT(1'b0)) Qframe2_1_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(f2), .Q(e[0]));
    FDRE #(.INIT(1'b0)) Qframe2_2_FF (.C(clk), .R(1'b0), .CE(1'b1), .D(e[0]), .Q(e[1]));
    assign frame2 = ~e[1] & e[0]; //2 pixels per frame
    
    counterUD16L topBall (.clk(clk), .Up(frame2 & ballFalling & (bottomVbound <= 10'd479)), .Dw(frame4 & bounceBall), .LD(idle | (Loss & btnL)), .Din(10'd240), .Q(topVbound)); //ball bounces 4 pixels per frame for 16 frames
    counterUD16L bottomBall (.clk(clk), .Up(frame2 & ballFalling & (bottomVbound <= 10'd479)), .Dw(frame4 & bounceBall), .LD(idle | (Loss & btnL)), .Din(10'd255), .Q(bottomVbound)); //ball bounces 4 pixels per frame for 16 frames
    
    assign topBottomBall = (Vpixels >= (topVbound + ({9{TwoSecWait & QuarterSecs}} | {9{Loss & QuarterSecs}}))) & (Vpixels <= (bottomVbound + ({9{TwoSecWait & QuarterSecs}} | {9{Loss & QuarterSecs}}))); //top and bottom edges of ball
    assign leftRightBall = (Hpixels >= (10'd160 + ({9{TwoSecWait & QuarterSecs}} | {9{Loss & QuarterSecs}}))) & (Hpixels <= (10'd175 + ({9{TwoSecWait & QuarterSecs}} | {9{Loss & QuarterSecs}}))); //left and right edges of ball
    
//    assign topBottomBall = (Vpixels >= 10'd240) & (Vpixels <= 10'd255); //top and bottom edges of ball
//    assign leftRightBall = (Hpixels >= 10'd160) & (Hpixels <= 10'd175); //left and right edges of ball
    
    assign tBall = topVbound;
    assign bBall = bottomVbound;
    assign lBall = 10'd160;
    assign rBall = 10'd175;
    
    assign ballRGB = 12'hFFF;
    
endmodule
