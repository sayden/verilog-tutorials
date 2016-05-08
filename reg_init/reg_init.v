module prescaler(input wire clk_in, output wire clk_out);
  parameter BITS = 22;

  reg [BITS-1:0] count = 0;

  assign clk_out = count[BITS-1];

  always @ ( posedge(clk_in) ) begin
    count <= count + 1;
  end
endmodule


module reg_init(input wire clk, output wire[3:0]out_data, output reg green = 1);
  parameter INI = 4'b0011;
  parameter BITS = 25;
  reg sel = 0;

  wire clk_prescaled;

  wire [3:0] din;
  reg [3:0] dout;

  //Register
  always @(posedge clk_prescaled ) begin
    dout <= din;
  end

  //Connect register with data out
  assign out_data = dout;

  //Multiplexer
  assign din = (sel == 0) ? INI : ~dout;

  //Init
  always @( posedge clk_prescaled ) begin
    sel <= 1;
    green = 0;
  end

  prescaler #(.BITS(BITS))
    Pres1(.clk_in(clk), .clk_out(clk_prescaled));

endmodule
