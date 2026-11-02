`timescale 1ns / 1ps
module alu32bit#(parameter N=32)(input signed [N-1:0]a,b,input [3:0] opcode,output reg signed [N-1:0] y,
output reg [3:0] flags_nzcv);
localparam  add = 4'b0000,
				sub = 4'b0001,
				and_op = 4'b0010,
				or_op = 4'b0011,
				xor_op = 4'b0100,
				not_op = 4'b0101,
            shl = 4'b0110,
				shr = 4'b0111,
				cmp = 4'b1000;
reg signed [N:0] temp;
always@(*)begin
y = 0;
flags_nzcv = 0;
case(opcode)
add		: 		begin 
					temp = a+b; y = temp[N-1:0];
					flags_nzcv[0]= (a[N-1]~^b[N-1])&(a[N-1]^y[N-1]);
					flags_nzcv[1]= temp[N];
					end
sub		: 		begin
					y = a-b;
					flags_nzcv[0] = (a[N-1]^b[N-1])&(a[N-1]^y[N-1]);
					end
and_op	: 		y = a&b;
or_op		: 		y = a|b;
xor_op	: 		y = a^b;
not_op	: 		y = ~a;
shl		: 		y = a<<b[4:0];
shr		: 		y = a>>>b[4:0];
cmp		: 		y = (a>b);
default	:		y = 0;
endcase
flags_nzcv[3] = y[N-1];
flags_nzcv[2] = (y==0);
end
endmodule
