`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:28:06 04/17/2026
// Design Name:   shiftreg8
// Module Name:   E:/Xilinx14.7/Varun_projects/shiftreg8tb.v
// Project Name:  Varun_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: shiftreg8
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shiftreg8tb;

	// Inputs
	reg in;
	reg clk;
	reg rst;
	reg mode;

	// Outputs
	wire [7:0] x;

	// Instantiate the Unit Under Test (UUT)
	shiftreg8 uut (
		.in(in), 
		.clk(clk), 
		.rst(rst), 
		.mode(mode), 
		.x(x)
	);
always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		in = 0;
		clk = 0;
		mode = 0;
		rst = 1;#10
		
		rst=0;#10;
		in=1;#10;
		in=0;#10;
		in=1;#10;
		in=1;#10;
		in=0;#10;
		in=1;#10;
		in=1;#10;
		in=0;#10;
		in=1;#10;
		mode=1;in=1;#10;
		in=0;#10;
		in=1;#10;
		in=0;#10;
		in=1;#10;
        $stop;
		// Add stimulus here

	end
   endmodule

