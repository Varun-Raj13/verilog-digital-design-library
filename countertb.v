`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:03:12 07/15/2026
// Design Name:   counter4bit
// Module Name:   E:/Xilinx14.7/Varun_projects/countertb.v
// Project Name:  Varun_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: counter4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module countertb;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [4:0] q;

	// Instantiate the Unit Under Test (UUT)
	counter4bit uut (
		.clk(clk), 
		.rst(rst), 
		.q(q)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

