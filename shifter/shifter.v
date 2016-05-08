module prescaler(input wire clk_in, output wire clk_out);
  parameter BITS = 28;

  reg [BITS-1:0] count = 0;

  assign clk_out = count[BITS-1];

  always @ ( posedge(clk_in) ) begin
    count <= count + 1;
  end
endmodule

module shifter(input wire clk, output reg [3:0] data);
  parameter BITS = 22;
  parameter INI = 1;

  wire clk_prescaled;
  wire ser_in;

  reg load_shift = 0;

  prescaler #(.BITS(BITS))
    Pres1(.clk_in(clk), .clk_out(clk_prescaled));

  //Init
  always @(posedge(clk_prescaled)) begin
    load_shift <= 1;
  end

  //Shifter
  always @ ( posedge(clk_prescaled) ) begin
    if(load_shift == 0)
      data <= INI;    //As they're 4 bits, it'll pass 0001
    else
      data <= {data[2:0], ser_in};
  end

  assign ser_in = data[3];

endmodule
