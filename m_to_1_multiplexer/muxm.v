module prescaler(input wire clk_in, output wire clk_out);
  parameter BITS = 22;

  reg [BITS-1:0] count = 0;

  assign clk_out = count[BITS-1];

  always @ ( posedge(clk_in) ) begin
    count <= count + 1;
  end
endmodule


module muxm(input wire clk, output reg[3:0]out_data);
  parameter BITS = 22;
  wire [3:0] in1 = 4'b0000;
  wire [3:0] in2 = 4'b1010;
  wire [3:0] in3 = 4'b1111;
  wire [3:0] in4 = 4'b0101;

  reg [1:0] sel = 0;

  wire clk_prescaled;

  prescaler #(.BITS(BITS))
    Pres1(.clk_in(clk), .clk_out(clk_prescaled));

  always @* begin
    case (sel)
      0: out_data <= in1;
      1: out_data <= in2;
      2: out_data <= in3;
      3: out_data <= in4;
      default: out_data <= 0;
    endcase
  end

  always @ ( posedge(clk_prescaled) ) begin
    sel <= sel + 1;
  end

endmodule
