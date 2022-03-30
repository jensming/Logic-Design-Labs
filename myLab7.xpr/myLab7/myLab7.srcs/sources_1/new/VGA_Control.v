`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2021 10:44:58 AM
// Design Name: 
// Module Name: VGA_Control
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


module VGA_Control(
    input clk,
    output [3:0] vgaRed,
    output [3:0] vgaGreen,
    output [3:0] vgaBlue,
    output [9:0] Hpixels,
    output [9:0] Vpixels,
    output Hsync,
    output Vsync
    );
    
    wire [9:0] Hbound1, Hbound2, Vbound1, Vbound2; //low boundaries
    wire [9:0] Hreset, Vreset; //frame reset boundaries
    wire [9:0] HoutPixels, VoutPixels; //pixel count outputs
    wire activeR; //high when in active region of frame
    wire [11:0] totalvga;
    
    assign Hreset = 10'd799;
    assign Vreset = 10'd524;
    
    counterUD16L cH (.clk(clk), .Up(1'b1), .Dw(1'b0), .LD(Hreset == HoutPixels), .Din(16'h0000), .Q(HoutPixels));
    counterUD16L cV (.clk(clk), .Up(Hreset == HoutPixels), .Dw(1'b0), .LD((Hreset == HoutPixels) & (Vreset == VoutPixels)), .Din(16'h0000), .Q(VoutPixels));
    
    assign Hpixels = HoutPixels;
    assign Vpixels = VoutPixels;
    
    assign activeR = (HoutPixels <= 10'd639) & (VoutPixels <= 10'd479);//checking for active region pixels
    
    assign totalvga = {12'hFFF & {12{activeR}}} | {12'h0FF & {12{activeR}}} | {12'hFF0 & {12{activeR}}};
    
//    assign totalvga = {12{12'h0FF & Hbound & Vbound}};
    assign vgaRed = totalvga[11:8];
    assign vgaGreen = totalvga[7:4];
    assign vgaBlue = totalvga[3:0];
    
    assign Hbound1 = 10'd655;
    assign Hbound2 = 10'd750;
    assign Vbound1 = 10'd489;
    assign Vbound2 = 10'd490;
    
    assign Hsync = ~((HoutPixels >= Hbound1) & (HoutPixels <= Hbound2));
    assign Vsync = ~((VoutPixels >= Vbound1) & (VoutPixels <= Vbound2));
endmodule
