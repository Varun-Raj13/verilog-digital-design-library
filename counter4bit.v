`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:26:16 07/15/2026 
// Design Name: 
// Module Name:    counter4bit 
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
module counter4bit(input clk,rst,output reg [3:0] q
    );
always@(posedge clk or posedge rst)begin
if(rst)
q<=4'b0000;
else begin
q[0]<=~q[0];
q[1]<=q[0]?~q[1]:q[1];
q[2]<=(q[1]&q[0])?~q[2]:q[2];
q[3]<=(q[2]&q[1]&q[0])?~q[3]:q[3];
end
end

endmodule
