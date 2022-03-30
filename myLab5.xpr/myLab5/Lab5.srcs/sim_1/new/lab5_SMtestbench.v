`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/04/2021 12:42:10 PM
// Design Name: 
// Module Name: lab5_SMtestbench
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


module lab5_SMtestbench();

  reg clk, Go, Stop, FourSecs, TwoSecs;
  reg [5:0] targetNum, countNum;
  wire ResetTimer, RunGame, Scored, FlashBoth, FlashAlt;
  
  StateMachine UUT (
      .clk(clk), .Go(Go), .Stop(Stop), .FourSecs(FourSecs), .TwoSecs(TwoSecs), .targetNum(targetNum), .countNum(countNum),
      .ResetTimer(ResetTimer), .RunGame(RunGame), .Scored(Scored), .FlashBoth(FlashBoth), .FlashAlt(FlashAlt)
      );   
      
  parameter PERIOD = 10;
  parameter real DUTY_CYCLE = 0.5;
  parameter OFFSET = 2;

  initial    // Clock process for clkin
  begin
      #OFFSET
		  clk = 1'b1;
      forever
      begin
          #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = ~clk;
      end
   end
   
initial
   
   begin
   #100;
   
   Stop = 1'b0;
   FourSecs = 1'b0;
   TwoSecs = 1'b0;
   Go = 1'b0;
   countNum = 6'b000011;
   targetNum = 6'b000000;
   #1000;
   Go = 1'b1;
   targetNum = 6'b000111;
   #100;
   Go = 1'b0;
   TwoSecs = 1'b1;
   #100;
   
   TwoSecs = 1'b0;
   #100;
   
   countNum = 6'b000111;
//   countNum = 6'b001001;
   Stop = 1'b1;
   #100;
   
   Stop = 1'b0;
   FourSecs = 1'b1;
   #100;
   
   FourSecs = 1'b0;
   #100;
   
   
   
   end
endmodule