module four_bit_counter(input wire clk_in, output wire [3:0] counter);

  reg [3:0] count;

  always @ ( posedge clk_in ) begin
    count <= count + 1;
  end

  assign counter = count;

endmodule
