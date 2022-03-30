`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/06/2021 09:20:26 PM
// Design Name: 
// Module Name: lab6_SMtestbench
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


module lab6_SMtestbench();
  reg clk, Left, Right;
  wire ResetTimer, CrossLeft, CrossRight;
  
  StateMachine UUT (
      .clk(clk), .Left(Left), .Right(Right), .ResetTimer(ResetTimer), .CrossLeft(CrossLeft), .CrossRight(CrossRight)
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
   
   assign Left = 1'b0;
   assign Right = 1'b0;
   #100;
   
   //cross start
//   assign Left = 1'b1;
   assign Right = 1'b1;
   #100;
   
   assign Left = 1'b1;
   assign Right = 1'b1;
   #100;
   
//   assign Left = 1'b0;
   assign Right = 1'b0;
   #100;
   
//   assign Left = 1'b0;
////   assign Right = 1'b0;
//   #100;
   
   
//   assign Left = 1'b1;
   assign Right = 1'b1;
   #100;
     
   assign Left = 1'b0;
//   assign Right = 1'b0;
   #100;
   
   assign Left = 1'b1;
   assign Right = 1'b1;
   #100;
   
//   assign Left = 1'b0;
   assign Right = 1'b0;
   #100;
   
   
   
   
   //cross finish
   assign Left = 1'b0;
   assign Right = 1'b0;
   #100;
   
   end
endmodule
