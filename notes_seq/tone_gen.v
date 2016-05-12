module tone_gen(input wire clk_in, output wire tone);
  parameter freq = 1000;
  wire clk_out;

  divM #(.number(freq)) divider(.clk_in(clk_in), .clk_out(clk_out));

  assign tone = clk_out;

endmodule
