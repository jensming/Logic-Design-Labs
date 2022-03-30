`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2021 06:35:03 PM
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
    input btnU,
    input btnD,
    input btnC,
    input btnL,
    input [15:0] sw,
    output [6:0] seg,
    output dp,
    output [3:0] an,
    output [15:0] led,
    output UTC,
    output DTC
    );
    
    wire [15:0] Q;
    wire [3:0] H, sel;
//    wire up1, upC, Dw, UTC, DTC, clk, digsel;
    wire up1, upC, Up, Dw, clk, digsel;
    
    counterUD16L c (.clk(clk), .Up(up1 | upC), .Dw(Dw), .LD(btnL), .Din(sw), .Q(Q), .UTC(UTC), .DTC(DTC));
    RingCounter ringC (.clk(clk), .adv(digsel), .rc(sel));
    Selector s (.sel(sel), .N(Q), .H(H));
    hex7seg ssd (.n(H), .seg(seg));
    EdgeDetector edgeU (.clk(clk), .b(btnU), .ed(up1));
    EdgeDetector edgeD (.clk(clk), .b(btnD), .ed(Dw));
    assign upC = btnC & ~(&Q[15:2]);
    lab4_clks slowit (.clkin(clkin), .greset(btnR), .clk(clk), .digsel(digsel));
//    lab4_clks slowit (.clkin(clkin), .greset(btnR), .fastclk(clk), .digsel(digsel));
    
    assign led = sw;
    assign an[3:0] = ~sel;
    assign dp = (~UTC & ~sel[1]) | (~DTC & ~sel[2]);
endmodule
