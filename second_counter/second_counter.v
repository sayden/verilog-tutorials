module seccount(input wire clk_in, output wire [3:0] data);

  wire clk_1HZ;
  wire [3:0] out_data;

  divM divisor(.clk_in(clk_in), .clk_out(clk_1HZ));

  four_bit_counter count(.clk_in(clk_1HZ), .counter(out_data));

  assign data = out_data;

endmodule
