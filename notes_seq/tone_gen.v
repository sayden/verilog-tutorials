module tone_gen(input wire clk_in, output wire ch_out);
  parameter freq = 1000;

  divM #(.BITS(freq)) divider(.clk_in(clk), .clk_out(ch_out));

endmodule
