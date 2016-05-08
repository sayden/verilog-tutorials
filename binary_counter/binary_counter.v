module binary_counter
  #(parameter BITS=4)
  (
    input wire clk, reset,
    output reg [BITS-1:0] binary
  );

  always @ ( posedge(clk), negedge(reset) )
  begin
    if(~reset)
      binary <= 0;
    else
      binary <= binary + 1;
  end

endmodule
