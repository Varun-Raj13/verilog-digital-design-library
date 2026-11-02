`timescale 1ns / 1ps
module alu32bit_tb;

	reg [31:0] a;
	reg [31:0] b;
	reg [3:0] opcode;

	wire [31:0] y;
	wire [3:0] flags_nzcv;

	alu32bit uut (
		.a(a), 
		.b(b), 
		.opcode(opcode), 
		.y(y), 
		.flags_nzcv(flags_nzcv)
	);

	initial begin
		a = 32'h72;b = 32'h49;
		opcode = 0; #20;
		a = 32'h7FFFFFFF;b = 32'd1;
		opcode = 0; #20;
		a = 32'h72;b = 32'h49;
		opcode = 1; #20;
		a = 32'h12;b = 32'h49;
		opcode = 1; #20;
		a = 32'h72;b = 32'h72;
		opcode = 1; #20;
		a = 32'h80000000;b = 32'd1;
		opcode = 1; #20;
		a = 32'h72;b = 32'h49;
		opcode = 2; #20;
		opcode = 3; #20;
		opcode = 4; #20;
		opcode = 5; #20;
		a = 72;b = 2;
		opcode = 6; #20;
		a = 72;b = 2;
		opcode = 7; #20;
		a = -16;b = 2;
		opcode = 7; #20;
		a = 32'h72;b = 32'h49;
		opcode = 8; #20;
		a = 32'h72;b = 32'h149;
		opcode = 8; #20;
		a = -72;b = 49;
		opcode = 8; #20;
		$finish;

	end
endmodule
