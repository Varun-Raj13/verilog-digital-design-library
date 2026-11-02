`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:16:19 04/17/2026
// Design Name:   mealy1010
// Module Name:   E:/Xilinx14.7/Varun_projects/mealy1010tb.v
// Project Name:  Varun_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mealy1010
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mealy1010tb;

	// Inputs
	reg clk;
	reg reset;
	reg x;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	mealy1010 uut (
		.clk(clk), 
		.reset(reset), 
		.x(x), 
		.y(y)
	);

	always #5 clk=~clk;

	initial begin

		// Initialize Inputs
		clk = 0;
		reset = 1;x=0;#10
		reset=0;
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
		$stop;

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end   
endmodule

