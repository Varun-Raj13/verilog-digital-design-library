`timescale 1ns / 1ps
module multiplier8tb;
	reg [7:0] a, b;
	reg clk, rst;
	wire [15:0] c;
	reg [7:0] a_prev, b_prev;
multiplier8 uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.clk(clk), 
		.rst(rst)
	);
	always #5 clk = ~clk;
	initial begin
		clk = 0;rst = 1;
		a = 0;b = 0;
		a_prev = 0;
		b_prev = 0;
		#10 rst = 0;
		@(posedge clk);
		a_prev = a; b_prev = b;
		a = 24; b = 32;
		@(posedge clk);
		$display("a=%d, b=%d => c=%d", a_prev, b_prev, c);
		@(posedge clk);
		a_prev = a; b_prev = b;
		a = 232; b = 123;
		@(posedge clk);
		$display("a=%d, b=%d => c=%d", a_prev, b_prev, c);
		@(posedge clk);
		a_prev = a; b_prev = b;
		a = 122; b = 38;
		@(posedge clk);
		$display("a=%d, b=%d => c=%d", a_prev, b_prev, c);
		@(posedge clk);
		a_prev = a; b_prev = b;
		a = 98; b = 67;
		@(posedge clk);
		$display("a=%d, b=%d => c=%d", a_prev, b_prev, c);
		$stop;
	end
endmodule