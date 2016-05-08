module d_ff(
  input wire clk,
  input wire d,
  input reset,
  output reg out
  );

  always @ ( negedge(reset) or posedge(clk) ) begin
    begin
      if(!reset)
        out = 0;
      else
        out = d;
      end
  end
endmodule
