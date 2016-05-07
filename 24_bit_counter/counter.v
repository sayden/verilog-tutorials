module bit_counter(input wire clk, output [23:0] out);
  reg [23:0] out = 0;

  initial begin
    out = 0;
  end

  always @ ( posedge clk ) begin
    out <= out + 1;
  end
endmodule
