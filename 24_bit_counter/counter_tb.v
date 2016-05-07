module bit_counter_tb;
  reg clk;
  wire [23:0] out;

  bit_counter uut (
    .clk(clk),
    .out(out)
    );

  initial begin
    clk = 0;
  end

  always #1 clk = ~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    $monitor($time, ": %b clk:%b\n", out, clk);
  end

  endmodule
