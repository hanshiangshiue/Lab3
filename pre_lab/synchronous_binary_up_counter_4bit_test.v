`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:14:57 08/18/2015
// Design Name:   synchronous_binary_up_counter_4bit
// Module Name:   D:/synchronous_binary_up_counter_4bit/synchronous_binary_up_counter_4bit_test.v
// Project Name:  synchronous_binary_up_counter_4bit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: synchronous_binary_up_counter_4bit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module synchronous_binary_up_counter_4bit_test;

	// Inputs
	reg clk;
	reg rst_n;

	// Outputs
	wire [3:0] counter;

	// Instantiate the Unit Under Test (UUT)
	synchronous_binary_up_counter_4bit uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.counter(counter)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
	end
		
	always
	begin
		#(50/2) clk=~clk;
	end
	initial
	begin
		// Wait 100 ns for global reset to finish
		#50;
        rst_n=1;
		
		  
		// Add stimulus here

	end
      
endmodule

