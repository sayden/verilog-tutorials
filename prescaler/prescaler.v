module prescaler(input wire clk, output wire clk_out);
  parameter BITS = 30;

  reg [BITS-1:0] count = 0;

  assign clk_out = count[BITS-1];

  always @ ( clk ) begin
    count <= count + 1;
  end
endmodule
