module prescaler(input wire clk_in, output wire clk_out);
  parameter BITS = 28;

  reg [BITS-1:0] count = 0;

  assign clk_out = count[BITS-1];

  always @ ( posedge(clk_in) ) begin
    count <= count + 1;
  end
endmodule
