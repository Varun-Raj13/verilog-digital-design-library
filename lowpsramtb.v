`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:07:34 04/17/2026
// Design Name:   lowpsram
// Module Name:   E:/Xilinx14.7/Varun_projects/lowpsramtb.v
// Project Name:  Varun_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: lowpsram
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module lowpsramtb;

	// Inputs
	reg clk;
	reg rst;
	reg we;
	reg [2:0] addr;
	reg [7:0] in;

	// Outputs
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	lowpsram uut (
		.clk(clk), 
		.rst(rst), 
		.we(we), 
		.addr(addr), 
		.in(in), 
		.out(out)
	);

		always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		we = 0;
		addr = 0;
		in = 0;#10;
		rst=0;we=1;addr=6;in=67;#10;
		we=1;addr=7;in=198;#10;
		we=0;addr=7;#10;
		$finish;
        
		// Add stimulus here

	end
      
endmodule

