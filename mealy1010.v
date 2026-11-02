`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:15:16 04/17/2026 
// Design Name: 
// Module Name:    mealy1010 
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
module mealy1010(
    input clk,
    input reset,
    input x,
    output reg y
    );
	 reg [1:0] prs,nxs;
	 parameter s0=2'b00,
	 s1=2'b01,
	 s2=2'b10,
	 s3=2'b11;
	 always@(posedge clk)begin
	 if(reset)
	 prs<=s0;
	 else
	 prs<=nxs;
	 end
	 always@(*)begin
	 case(prs)
	 s0:begin
	 if(x)
	 nxs=s1;
	 else
	 nxs=s0;
	 y=0;
	 end
	 s1:begin
	 if(x)
	 nxs=s1;
	 else
	 nxs=s2;
	 y=0;
	 end
	 s2:begin
	 if(x)
	 nxs=s3;
	 else
	 nxs=s0;
	 y=0;
	 end
	 s3:begin
	 if(x)begin
	 nxs=s1;
	 y=0;
	 end
	 else begin
	 nxs=s2;
	 y=1;
	 end
	 end
	 default:begin
	 nxs=s0;
	 y=0;
	 end
	 endcase
	 end


endmodule

