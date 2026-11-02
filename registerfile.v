`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:32:07 04/17/2026 
// Design Name: 
// Module Name:    registerfile 
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
/////////
module registerfile(
    input clk,
    input rst,
    input [4:0] raddr1,
    input [4:0] raddr2,
    input [4:0] waddr,
    input [31:0] wdata,
    output reg [31:0] rdata1,
    output reg [31:0] rdata2
    );
	 reg [31:0] regfile [0:31];
	 integer i;
	 always@(posedge clk)begin
	 if(rst)begin
	 for(i=0;i<32;i=i+1)
	 regfile[i]<=0;
	 rdata1<=0;
	 rdata2<=0;
	 end
	 else begin
	 regfile[waddr]<=wdata;
	 end
	 end
	 always@(*)begin
	  rdata1=regfile[raddr1];
	  rdata2=regfile[raddr2];
	 end
	 


endmodule
