`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2021 09:16:38 PM
// Design Name: 
// Module Name: lab7_VGAtestbench
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


module lab7_VGAtestbench();
  reg clk;
  wire [3:0] red, green, blue;
  wire [9:0] Hpixels, Vpixels;
  wire Hsync, Vsync;
  
  VGA_Control UUT (
      .clk(clk), .vgaRed(red), .vgaGreen(green), .vgaBlue(blue), .Hpixels(Hpixels),
      .Vpixels(Vpixels), .Hsync(Hsync), .Vsync(Vsync)
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
   
   #500;
   end
endmodule
