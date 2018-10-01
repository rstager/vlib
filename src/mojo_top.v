module mojo_top(
    // 50MHz clock input
    input clk,
    // Input from reset button (active low)
    input rst_n,
    // cclk input from AVR, high when AVR is ready
    input cclk,
    // Outputs to the 8 onboard LEDs
    output[7:0]led,
    // AVR SPI connections
    output spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    // AVR ADC channel select
    output [3:0] spi_channel,
    // Serial connections
    input avr_tx, // AVR Tx => FPGA Rx
    output avr_rx, // AVR Rx => FPGA Tx
    input avr_rx_busy, // AVR Rx buffer full
    
    //My spi
    output my_spi_miso,
    input my_spi_ss,
    input my_spi_mosi,
    input my_spi_sck
    );

wire rst = ~rst_n; // make reset active high

// these signals should be high-z when not used
assign spi_miso = 1'bz;
assign avr_rx = 1'bz;
assign spi_channel = 4'bzzzz;

/*assign led[6] = 1'b0;*/

/*Coppied/modified from https://www.badprog.com/electronics-verilog-blinking-a-led*/
/* reg */
reg data1 = 1'b1;
reg [32:0] counter;
reg [32:0] decoder;
reg state;

/* assign */
assign led[0] = state;
assign led[1] = data1;

assign led[7] = rst;
assign led[6] = my_spi_ss;


/* always */
always @ (posedge clk) begin
    if (rst)
      counter <= 0;
     else
      counter <= counter + 1;
    state <= counter[26]; // <------ data to change

    qout[0] <= counter[20] ^ counter[21];
    qout[1] <= counter[21];
    qin <= qout;
    
end


reg [1:0] pqin;


wire done;
reg [7:0] din;
wire [7:0] dout;

spi_slave com1(clk, rst, my_spi_ss, my_spi_mosi, my_spi_miso, my_spi_sck, done, din, dout);
always @ (posedge clk) begin
    if(spi_ss)
      din <= decoder[15:7];
end 

always @ (posedge clk) begin
  if (rst)
      decoder <= 0;
  if(pqin[1] ^ qin[0])
    decoder <= decoder + 1;
  if(pqin[0] ^ qin[1])
    decoder <= decoder - 1;  

  pqin <= qin;
  
end




reg [1:0] qout;
reg [1:0] qin;



assign led[3:2] = qout;
assign led[5:4] = decoder[6:5];



endmodule