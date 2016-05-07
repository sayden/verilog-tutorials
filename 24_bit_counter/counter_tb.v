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
    $dumpfile("counter.vcd");
    $dumpvars(0, bit_counter_tb);

    $monitor($time, ": %b clk:%b\n", out, clk);

    # 99 $display("END of simulation");
    # 100 $finish;
  end

  endmodule
