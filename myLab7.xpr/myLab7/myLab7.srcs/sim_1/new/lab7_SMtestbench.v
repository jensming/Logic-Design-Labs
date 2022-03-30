`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/18/2021 11:14:51 PM
// Design Name: 
// Module Name: lab7_SMtestbench
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


module lab7_SMtestbench();
  reg clk, btnL, TwoSecs, frame16, collision;
  wire ResetTimer, bounceBall, idle;
  
  StateMachine UUT (
      .clk(clk), .btnL(btnL), .TwoSecs(TwoSecs), .frame16(frame16), .collision(collision), .ResetTimer(ResetTimer), .bounceBall(bounceBall), .idle(idle)
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
   
   assign btnL = 1'b0;
   assign TwoSecs = 1'b0;
   assign frame16 = 1'b0;
   assign collision = 1'b0;
   #100;
   
   assign btnL = 1'b1;
   #100;
   
   assign btnL = 1'b0;
   #100;
   
   assign btnL = 1'b0;
   assign TwoSecs = 1'b1;
   assign frame16 = 1'b0;
   assign collision = 1'b0;
   #100;
   
   assign btnL = 1'b0;
   assign TwoSecs = 1'b0;
   assign frame16 = 1'b0;
   assign collision = 1'b0;
   #100;
   
   assign btnL = 1'b1;
   assign TwoSecs = 1'b0;
   assign frame16 = 1'b0;
   assign collision = 1'b0;
   #100;
   
   assign btnL = 1'b0;
   assign TwoSecs = 1'b0;
   assign frame16 = 1'b1;
   assign collision = 1'b0;
   #100;
   
   assign btnL = 1'b0;
   assign TwoSecs = 1'b0;
   assign frame16 = 1'b0;
   assign collision = 1'b0;
   #100;
   
   assign btnL = 1'b0;
   assign TwoSecs = 1'b0;
   assign frame16 = 1'b0;
   assign collision = 1'b1;
   #100;
   
   end
endmodule
