`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:23:05 04/17/2026 
// Design Name: 
// Module Name:    multiplier8 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module multiplier8(
    input [7:0] a,
    input [7:0] b,
    output reg [15:0] c,
    input clk,
    input rst
    );
	 reg [7:0] tema;
	 reg [15:0] temb;
	 integer i;
	 always@(posedge clk)begin
	 if(rst)
	 c<=0;
	 else begin
	 temb=0;
	 tema=a;
	 for(i=0;i<8;i=i+1) 
	 temb=temb+((tema<<i)*b[i]);
	 c<=temb;
	 end
	 end
endmodule

