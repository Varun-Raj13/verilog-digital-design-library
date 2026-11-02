`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:27:12 04/17/2026 
// Design Name: 
// Module Name:    shiftreg8 
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
module shiftreg8(
    input in,
    input clk,
    input rst,
    input mode,
    output reg[7:0] x
    );
	 always@(posedge clk)begin
	 if(rst)
	 x<=0;
	 else if(mode)
	 x<={x[6:0],in};
	 else
	 x<={in,x[7:1]};
	 end 


endmodule
