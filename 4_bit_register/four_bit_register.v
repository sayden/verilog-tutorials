module prescaler(input wire clk_in, output wire clk_out);
  parameter BITS = 30;

  reg [BITS-1:0] count = 0;

  assign clk_out = count[BITS-1];

  always @ ( posedge(clk_in) ) begin
    count <= count + 1;
  end
endmodule

module blink4(input wire clk_in, output reg [3:0] dout = 0, output wire GREEN);
  parameter BITS = 22;

  wire clk_base;

  wire [3:0] din;

  prescaler #(.BITS(BITS))
    PRES(
      .clk_in(clk_in),
      .clk_out(clk_base)
      );

  always @ ( posedge(clk_base) ) begin
    dout <= din;
  end

  assign din = ~dout;

  assign GREEN = ~dout[0];

  assign data = dout;

endmodule
