module prescaler(input wire clk, output wire clk_out);
  parameter N = 30;

  reg [N-1:0] count = 0;

  assign clk_out = count[N-1];

  always @ ( clk ) begin
    count <= count + 1;
  end
endmodule
