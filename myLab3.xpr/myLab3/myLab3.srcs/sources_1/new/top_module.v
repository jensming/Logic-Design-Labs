`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/12/2021 10:06:56 PM
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
    input [7:0] sw,
    input btnL,
    input btnC,
    input btnR,
    input clkin,
    output [6:0] seg,
    output dp,
    output [3:0] an,
    output dig
    );
    
    wire t0, t1, t2, t3, t4, t5, t6, t7, dig_sel;
    wire [6:0] dig1, dig2;
    lab3_digsel digsel (.clkin(clkin), .greset(btnR), .digsel(dig_sel));
    
    Incrementer inc (.a(sw), .b({btnL, btnC}), .s({t7, t6, t5, t4, t3, t2, t1, t0}));
    hex7seg ssd1 (.n({t3, t2, t1, t0}), .seg(dig1));
    hex7seg ssd2 (.n({t7, t6, t5, t4}), .seg(dig2));
    m2_1x8 ssd_sel (.in0(dig1), .in1(dig2), .sel(dig_sel), .o({seg}));
    
    assign dp = 1'b1;
    assign an[1:0] = {~dig_sel, dig_sel};
    assign an[3:2] = {1'b1, 1'b1};
    assign dig = dig_sel;
endmodule
