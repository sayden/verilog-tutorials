module rom_const_val(
  input wire clk,
  output wire [3:0] leds
  );

  localparam  ADDR = 5'h6;

  rom_32x4 ROM(.clk(clk), .address(ADDR), .data(leds));

endmodule
