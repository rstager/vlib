`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:35:30 09/30/2018 
// Design Name: 
// Module Name:    ParametricMux 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////

module mux #(parameter DATA_SIZE = 32, DATA_COUNT = 2, ADDR_SIZE = 1) (
output [DATA_SIZE - 1:0] outdata ,
input [DATA_SIZE*DATA_COUNT - 1:0] indata, [ADDR_SIZE - 1:0]   addr);

wire [DATA_SIZE-1:0] array[0:DATA_COUNT-1];

generate
	genvar i;
	for(i=0; i<DATA_COUNT; i=i+1) begin : gen1
		assign array[i] = indata[(i+1)*DATA_SIZE-1:i*DATA_SIZE];
	end
endgenerate

assign outdata = array[addr];

endmodule
