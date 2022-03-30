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


module lab3_testbench();

    wire [7:0] D7Seg3, D7Seg2, D7Seg1, D7Seg0;
    reg [7:0] sw; 
    reg clkin, btnL, btnC, btnR;
    wire CA, CB, CC, CD, CE, CF, CG, DP, AN0, AN1, AN2, AN3;
    
    top_module UUT (
    .sw(sw), .seg({CG, CF, CE, CD, CC, CB, CA}), .btnL(btnL), .btnC(btnC), .btnR(btnR), .dp(DP),
    .an({AN3, AN2, AN1, AN0})
    );
    
    show_7segDisplay  showit (
    .seg({CG, CF, CE, CD, CC, CB, CA}),
    .DP(DP), .AN0(AN0), .AN1(AN1), .AN2(AN2), .AN3(AN3),
    .D7Seg0(D7Seg0), .D7Seg1(D7Seg1), .D7Seg2(D7Seg2), .D7Seg3(D7Seg3)
    );      
          
    parameter PERIOD = 10;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 2;

    initial    // Clock process for clkin
    begin
        #OFFSET
            clkin = 1'b1;
        forever
        begin
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clkin = ~clkin;
        end
	end
	
   initial
   
   begin
   #1000;
   
   sw = 8'b00000000;
   btnC = 1'b0;
   btnR = 1'b0;
   btnL = 1'b0;
   #100;
   
   sw = 8'b00000001;
   #100;
   
   sw = 8'b00000010;
   #100;
   
   sw = 8'b00000011;
   #100;
   
   sw = 8'b00000100;
   #100;
   
   sw = 8'b00000101;
   #100;

   sw = 8'b00000110;
   #100;
   
   sw = 8'b00000111;
   #100;
   
   sw = 8'b00001000;
   #100;
   
   sw = 8'b00001001;
   #100;
   
   sw = 8'b00001010;
   #100;
   
   sw = 8'b00001011;
   #100;
   
   sw = 8'b00001100;
   #100;
   
   sw = 8'b00001101;
   #100;
   
   sw = 8'b00001110;
   #100;
   
   sw = 8'b00001111;
   #100; 
	
   end
endmodule


module show_7segDisplay (
  input [6:0] seg,
  input DP,AN0,AN1,AN2,AN3,
  output reg [7:0] D7Seg0, D7Seg1, D7Seg2,D7Seg3);
  
  reg [7:0] val;
  
  always @(AN0 or val)
  begin
    if (AN0 == 0) D7Seg0 <= val;
    else if (AN0 == 1) D7Seg1 <= " ";
    else D7Seg0 <= 8'bX;   //  non-blocking assignment 
  end
  
  always @(AN1 or val)
  begin
    if (AN1 == 0) D7Seg1 <= val;
    else if (AN1 == 1) D7Seg1 <= " ";
    else D7Seg1 <= 8'bX;   //  non-blocking assignment 
  end 
  
  always @(AN2 or val)
  begin
    if (AN2 == 0) D7Seg2 <= val;
    else if (AN2 == 1) D7Seg2 <= " ";
    else D7Seg2 <= 8'bX;   //  non-blocking assignment 
  end 
  
  always @(AN3 or val)
  begin
    if (AN3 == 0) D7Seg3 <= val;
    else if (AN3 == 1) D7Seg3 <= " ";
    else D7Seg3 <= 8'bX;   //  non-blocking assignment 
  end     
    
  always @(seg)
  case (seg)
  7'b0111111:
       val = "-";
  7'b1111111:
       val = " ";
  7'b1000000:
       val = "0";
  7'b1111001:
       val = "1";
  7'b0100100:
       val = "2";
  7'b0110000:
       val = "3";
  7'b0011001:
       val = "4";
  7'b0010010:
       val = "5";
  7'b0000010:
       val = "6";
  7'b1111000:
       val = "7";
  7'b0000000:
       val = "8";
  7'b0011000:
       val = "9";
  7'b0001000:
       val = "A";
  7'b0000011:
       val = "B";
  7'b1000110:
       val = "C";
  7'b0100001:
       val = "D";
  7'b0000110:
       val = "E";
  7'b0001110:
       val = "F"; 
  default:
       val = 8'bX;                                    
  endcase
endmodule