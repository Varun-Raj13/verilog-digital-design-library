`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:59:30 04/17/2026 
// Design Name: 
// Module Name:    csa 
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
module csa(
    input [7:0] a,
    input [7:0] b,
    output [7:0] x,
    input cin,
    output cout
    );
	 wire [3:0] ahigh,bhigh,alow,blow;
	 wire k,j,y;
	 wire [3:0] xhigh1,xhigh0,xlow;
	 assign {ahigh,alow,bhigh,blow}={a[7:4],a[3:0],b[7:4],b[3:0]};
	 ra rlow(alow,blow,cin,xlow,j);
	 ra rhigh0(ahigh,bhigh,0,xhigh0,k);
	 ra rhigh1(ahigh,bhigh,1,xhigh1,y);
	 assign x[3:0]=xlow;
	 assign x[7:4]=j?xhigh1:xhigh0;
	 assign cout=j?k:y;
	 
	 


endmodule

module ra(l,m,n,o,p);
input [3:0] l,m;
input n;
output [3:0] o;
output p;
wire [3:0] q;
fa f0(l[0],m[0],n,o[0],q[0]);
genvar i;
generate
for(i=1;i<4;i=i+1)begin: f
fa fa1(l[i],m[i],q[i-1],o[i],q[i]);
end
endgenerate
assign p=q[3];
endmodule

module fa(a,b,c,d,e);
input a,b,c;
output d,e;
assign d=a^b^c;
assign e=(a&b)|(b&c)|(c&a);
endmodule
