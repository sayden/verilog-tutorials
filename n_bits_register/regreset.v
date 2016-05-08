//-- regreset.v
module regreset(input wire clk, output wire [3:0] out_data);
  parameter BITS = 24;
  parameter INI0 = 4'b1001;
  parameter INI1 = 4'b0110;

  wire clk_prescaled;

  wire [3:0] dout0;
  wire [3:0] dout1;

  reg reset = 0;

  //-- Inicializador
  always @(posedge(clk_prescaled))
    reset <= 1;

  //0 Register
  register #(.INI(INI0), .BITS(4))
    REG0(
      .clk(clk_prescaled),
      .reset(reset),
      .din(dout1),
      .out_data(dout0)
    );
  //1 Register
  register #(.INI(INI1), .BITS(4))
    REG1(
      .clk(clk_prescaled),
      .reset(reset),
      .din(dout0),
      .out_data(dout1)
    );

  assign out_data = dout0;

  prescaler #(.BITS(BITS))
    Pres1(.clk_in(clk), .clk_out(clk_prescaled));
endmodule
