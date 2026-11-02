`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:05:41 04/17/2026 
// Design Name: 
// Module Name:    lowpsram 
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

module lowpsram(
    input clk,
    input rst,
    input we,
    input [2:0] addr,
    input [7:0] in,
    output reg [7:0] out
    );
	 reg [7:0] mem_array [0:7];
	 integer i;
	 always@(posedge clk)begin
	 if(rst)begin
	 for(i=0;i<8;i=i+1)
	 mem_array[i]<=0;
	 out<=0;
	 end
	 else begin
	 if(we)
	 mem_array[addr]<=in;
	 else
	 out<=mem_array[addr];
	 end
	 end


endmodule
