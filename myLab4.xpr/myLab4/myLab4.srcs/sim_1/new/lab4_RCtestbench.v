`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2021 12:28:11 PM
// Design Name: 
// Module Name: lab4_RCtestbench
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


module lab4_RCtestbench();
    reg clk, adv;
    wire [3:0] rc;
    
    RingCounter UUT (
    .clk(clk), .adv(adv), .rc(rc)
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
   
   adv = 1'b0;
   #100;
   
   adv = 1'b1;
   #100;
   
   adv = 1'b0;
   #100;
   
   
   #100;
   end
endmodule
