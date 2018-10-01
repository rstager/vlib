`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:06:25 09/30/2018
// Design Name:   mojo_top
// Module Name:   /home/keras/verilog/closedloop/MuxTest.v
// Project Name:  Mojo-Base
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mojo_top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MuxTest;

	// Inputs
	reg clk;
	reg rst_n;
	reg cclk;
	reg spi_ss;
	reg spi_mosi;
	reg spi_sck;
	reg avr_tx;
	reg avr_rx_busy;
	reg my_spi_ss;
	reg my_spi_mosi;
	reg my_spi_sck;

	// Outputs
	wire [7:0] led;
	wire spi_miso;
	wire [3:0] spi_channel;
	wire avr_rx;
	wire my_spi_miso;

	// Instantiate the Unit Under Test (UUT)
	mojo_top uut (
		.clk(clk), 
		.rst_n(rst_n), 
		.cclk(cclk), 
		.led(led), 
		.spi_miso(spi_miso), 
		.spi_ss(spi_ss), 
		.spi_mosi(spi_mosi), 
		.spi_sck(spi_sck), 
		.spi_channel(spi_channel), 
		.avr_tx(avr_tx), 
		.avr_rx(avr_rx), 
		.avr_rx_busy(avr_rx_busy), 
		.my_spi_miso(my_spi_miso), 
		.my_spi_ss(my_spi_ss), 
		.my_spi_mosi(my_spi_mosi), 
		.my_spi_sck(my_spi_sck)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst_n = 0;
		cclk = 0;
		spi_ss = 0;
		spi_mosi = 0;
		spi_sck = 0;
		avr_tx = 0;
		avr_rx_busy = 0;
		my_spi_ss = 0;
		my_spi_mosi = 0;
		my_spi_sck = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		
		

	end
      
endmodule

