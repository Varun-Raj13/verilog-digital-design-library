`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:18:51 04/17/2026 
// Design Name: 
// Module Name:    moore1010 
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
module moore1010(
    input x,
    output reg y,
    input clk,
    input rst
    );
	 parameter s0=3'd0,s1=3'd1,s2=3'd2,s3=3'd3,s4=3'd4;
	 reg [2:0] state,nxs;
	 always@(posedge clk)begin
	 if(rst)begin
	 state<=s0;
	 end
	 else
	 state<=nxs;
	 end
	 always@(*)begin
	 case(state)
	 s0: nxs=x?s1:s0;
	 s1: nxs=x?s1:s2;
	 s2: nxs=x?s3:s0;
	 s3: nxs=x?s1:s4;
	 s4: nxs=x?s3:s0;
	 default: nxs=s0;
	 endcase
	 end
	 always@(*)begin
	 case(state)
	 s4:y=1;
	 default:y=0;
	 endcase
	 end
	 
	 


endmodule
