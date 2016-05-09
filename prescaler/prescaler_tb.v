module prescaler_tb;
  reg clk = 0;
  wire out;

  reg [1:0] count = 0;

  parameter BITS = 2;

  prescaler #(.BITS(BITS))
    Pres1(
      .clk(clk),
      .clk_out(out)
    );

  always #1 clk = ~clk;

  always @ ( posedge clk ) begin
    count <= count + 1;

    $monitor($time, ": count=%d, clk=%b, out=%b", count, clk, out);
  end

  initial begin
    $dumpfile("prescaler.vcd");
    $dumpvars(0, prescaler_tb);
    #20 $finish;
  end
endmodule
