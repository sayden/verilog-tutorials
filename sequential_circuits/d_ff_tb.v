module d_ff_tb;
  reg clk;
  reg d;
  reg reset;
  wire out;

  d_ff uut(.clk(clk), .d(d), .reset(reset), .out(out));

  integer i;

  initial begin
    $dumpfile("d_ff_tb.vcd");
    $dumpvars;

    d = 0; reset=1;

    #8  d=1;
    #10 d=0;
    #10 d=0; reset=0;
    #1  d=0; reset=1;
    #10 d=1;
    #10 d=0;
    #10 d=1; reset=1;
    #10 d=0;
    #10 d=0;
    #10 d=1;
    #10 d=1; reset=0;
    #40;
  end

  initial begin
    clk = 0;
    for (i=0; i<=10; i= i+1)
      #10 clk = ~clk;
  end

  initial begin
    $monitor($time, ": clk=%d d=%d out=%d\n", clk, d, out);
  end
endmodule
