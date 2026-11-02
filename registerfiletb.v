`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   23:33:51 04/17/2026
// Design Name:   registerfile
// Module Name:   E:/Xilinx14.7/Varun_projects/registerfiletb.v
// Project Name:  Varun_projects
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: registerfile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module registerfiletb;

	// Inputs
	reg clk;
	reg rst;
	reg [4:0] raddr1;
	reg [4:0] raddr2;
	reg [4:0] waddr;
	reg [31:0] wdata;

	// Outputs
	wire [31:0] rdata1;
	wire [31:0] rdata2;

	// Instantiate the Unit Under Test (UUT)
	registerfile uut (
		.clk(clk), 
		.rst(rst), 
		.raddr1(raddr1), 
		.raddr2(raddr2), 
		.waddr(waddr), 
		.wdata(wdata), 
		.rdata1(rdata1), 
		.rdata2(rdata2)
	);
always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		raddr1 = 0;
		raddr2 = 0;
		waddr = 0;
		wdata = 0;

		// Wait 100 ns for global reset to finish
		#10;rst=0;
		waddr=8;wdata=798;#10;
		waddr=25;wdata=987;#10;
		waddr=5;wdata=9876;#10;
		raddr1=5;raddr2=8;#10;
		waddr=31;wdata=12;#10;
		waddr=1;wdata=5432;#10;
		raddr1=25;raddr2=1;#10;
		rst=1;#10;rst=0;#10;
		$finish;
        
		// Add stimulus here

	
	end
      
endmodule

