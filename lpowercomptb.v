`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:12:59 04/17/2026
// Design Name:   lpowercomp
// Module Name:   E:/Xilinx14.7/Varun_projects/lpowercomptb.v
// Project Name:  Varun_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lpowercomp
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lpowercomptb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg clk;
	reg rst;

	// Outputs
	wire g;
	wire l;
	wire e;

	// Instantiate the Unit Under Test (UUT)
	lpowercomp uut (
		.a(a), 
		.b(b), 
		.clk(clk), 
		.rst(rst), 
		.g(g), 
		.l(l), 
		.e(e)
	);

		// Initialize Inputs
		always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		clk = 0;
		rst = 1;#10;
		rst=0;
		a=32;b=49;#10;
		a=232;b=49;#10;
		a=49;b=49;#10;
		a=32;b=149;#10;
        $stop;
        
		// Add stimulus here

	end
      
endmodule

