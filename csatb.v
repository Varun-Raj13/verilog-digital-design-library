`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:01:54 04/17/2026
// Design Name:   csa
// Module Name:   E:/Xilinx14.7/Varun_projects/csatb.v
// Project Name:  Varun_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: csa
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module csatb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;
	reg cin;

	// Outputs
	wire [7:0] x;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	csa uut (
		.a(a), 
		.b(b), 
		.x(x), 
		.cin(cin), 
		.cout(cout)
	);

	initial begin
		a = 32;b = 0;cin = 0;#100;
		a = 12;b = 109;cin = 0;#100;
		a = 66;b = 49;cin = 0;#100;
		a = 178;b = 132;cin = 0;#100;
      $stop;  
		
		// Add stimulus here

	end
      
endmodule

