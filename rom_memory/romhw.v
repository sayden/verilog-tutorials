`default_nettype none

module romhw(input wire clk,
			 output wire [3:0] leds);

	localparam ADDR = 4'h5;

	rom32x4 ROM(.clk(clk), .addr(ADDR), .data(leds));

endmodule