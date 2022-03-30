`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2021 12:50:56 AM
// Design Name: 
// Module Name: lab3_testbench
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


module lab4_countUD4Ltestbench();
    reg [3:0] sw; 
    reg clk, Up, Dw, LD;
    wire [3:0] Q;
    wire UTC, DTC;
    
    countUD4L UUT (
    .clk(clk), .Up(Up), .Dw(Dw), .LD(LD), .Din(sw), .Q(Q),
    .UTC(UTC), .DTC(DTC)
    );
    
    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;

    initial    // Clock process for clk
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
   
   sw = 4'b0011;
   Up = 1'b0;
   Dw = 1'b0;
   LD = 1'b0;
   #100;
   
   LD = 1'b1;
   #100;
   
   Up = 1'b1;
//   Dw = 1'b1;
   LD = 1'b0;
   #100;
   
   Up = 1'b0;
//   Dw = 1'b0;
   #100;
   
//    Up = 1'b1;
   Dw = 1'b1;
   #100;
   
   Dw = 1'b0;
   #100;
   end
endmodule