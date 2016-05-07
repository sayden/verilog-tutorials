module prescaler(input wire clk_in, output wire clk_out);
  parameter BITS = 30;

  reg [BITS-1:0] count = 0;

  assign clk_out = count[BITS-1];

  always @ ( posedge(clk_in) ) begin
    count <= count + 1;
  end
endmodule


module four_bit_counter(input wire clk_in, output reg [3:0] data = 0);
  parameter BITS = 22;

  wire clk_pres;

  prescaler #(.BITS(BITS))
    pres1(
      .clk_in(clk_in),
      .clk_out(clk_pres)
      );

  always @ ( posedge(clk_pres) ) begin
    data <= data + 1;
  end

endmodule
