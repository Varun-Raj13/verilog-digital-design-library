`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:19:49 04/17/2026
// Design Name:   moore1010
// Module Name:   E:/Xilinx14.7/Varun_projects/moore1010tb.v
// Project Name:  Varun_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: moore1010
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module moore1010tb;

	// Inputs
	reg x;
	reg clk;
	reg rst;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	moore1010 uut (
		.x(x), 
		.y(y), 
		.clk(clk), 
		.rst(rst)
	);
always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		x = 0;
		clk = 0;
		rst = 1;#10;
		rst=0;
		x = 0;#10;
		x = 1;#10;
		x = 0;#10;
		x = 0;#10;
		x = 1;#10;
		x = 1;#10;
		x = 0;#10;
		x = 1;#10;
		x = 0;#10;
		x = 1;#10;
		x = 0;#10;
		x=1;#10;
		x=0;#10;
				x=1;#10;
		x=0;#10;
        $stop;
		// Add stimulus here

	end
   endmodule

