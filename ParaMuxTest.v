`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:13:32 09/30/2018
// Design Name:   mux
// Module Name:   /home/keras/verilog/closedloop/ParaMuxTest.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mux
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ParaMuxTest;
	parameter D_SIZE=2,D_COUNT=3;
	// Outputs
	wire [D_SIZE-1:0] outdata;
	reg [D_SIZE*D_COUNT-1:0] indata ;
	reg addr;

	// Instantiate the Unit Under Test (UUT)
	mux #(D_SIZE,D_COUNT,1) uut (
		.outdata(outdata),
		.indata(indata),
		.addr(addr)
	);

	initial begin
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		indata = 6;
		addr = 0;
		#100;
		addr = 1;
		#100;
		addr = 2;

	end
      
endmodule

