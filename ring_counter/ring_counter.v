module ring_counter(input clock, input reset, output reg [3:0] out);

  always @ ( posedge(clock) ) begin
    if(reset)
      out = 4'b0001;
    else
      begin
      out <= out<<1;
      out[0] <= out[3];
      end
  end
endmodule
