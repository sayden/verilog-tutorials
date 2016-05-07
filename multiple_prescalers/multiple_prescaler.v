module prescaler(input wire clk_in, output wire clk_out);
  parameter BITS = 30;

  reg [BITS-1:0] count = 0;

  assign clk_out = count[BITS-1];

  always @ ( posedge(clk_in) ) begin
    count <= count + 1;
  end
endmodule

module mpres (
  input wire clk_in,
  output wire LED1,
  output wire LED2,
  output wire LED3,
  output wire LED4,
  output GREEN
  );

  parameter BITS0 = 22; //--Prescaler base
  parameter BITS1 = 1;
  parameter BITS2 = 2;
  parameter BITS3 = 3;
  parameter BITS4 = 4;

  wire clk_base;

  wire GREEN = 1'b1;

  prescaler #(.BITS(BITS0))
    Pres0(.clk_in(clk_in), .clk_out(clk_base));

  prescaler #(.BITS(BITS1))
    Pres1(.clk_in(clk_base), .clk_out(LED1));

  prescaler #(.BITS(BITS2))
    Pres2(.clk_in(clk_base), .clk_out(LED2));

  prescaler #(.BITS(BITS3))
    Pres3(.clk_in(clk_base), .clk_out(LED3));

  prescaler #(.BITS(BITS4))
    Pres4(.clk_in(clk_base), .clk_out(LED4));

endmodule // mpres
