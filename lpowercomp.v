`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:11:38 04/17/2026 
// Design Name: 
// Module Name:    lpowercomp 
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
module lpowercomp(
    input [7:0] a,
    input [7:0] b,
	 input clk,
	 input rst,
    output reg g,
    output reg l,
    output reg e
    );
	 integer i;
	 reg c;
	 always@(posedge clk)begin
	 if(rst)begin
	 g<=0;l<=0;e<=0;
	 end
	 else begin
	 	 g<=0;l<=0;e<=1;c=0;
	 for(i=7;i>=0;i=i-1)begin
	 if(c==0)begin
	 if(a[i]&~b[i])begin
	 g<=1;l<=0;e<=0;c=1;
	 end
	 else if(~a[i]&b[i])begin
	 g<=0;l<=1;e<=0;c=1;
	 end
	 end
	 end
	 end
end
	 
	 
endmodule

