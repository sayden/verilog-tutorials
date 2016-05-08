module prescaler(input wire clk_in, output wire clk_out);
  parameter BITS = 22;

  reg [BITS-1:0] count = 0;

  assign clk_out = count[BITS-1];

  always @ ( posedge(clk_in) ) begin
    count <= count + 1;
  end
endmodule


module mux2(input wire clk, output reg[3:0]out_data);
  wire [3:0] in1 = 4'b1001;
  wire [3:0] in2 = 4'b0110;

  wire clk_prescaled;

  prescaler #(.BITS(22))
    Pres1(.clk_in(clk), .clk_out(clk_prescaled));

  always @ ( in1 or in2 or clk_prescaled ) begin
    if (clk_prescaled == 0)
      out_data <= in1;
    else
      out_data <= in2;
  end

endmodule
