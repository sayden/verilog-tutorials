module delete_tb;
  reg clk=0;
  reg in = 1;
  wire out1;

  blocking uut(
    .in(in),
    .clk(clk),
    .out(out1)
  );

  always #1 clk = ~clk;

  always #5 in = ~in;

  initial begin
    $dumpfile("blocking_tb.vcd");
    $dumpvars(0, delete_tb);

    $monitor($time, " clock=%1b in=%1b out=%4b", clk, in, out1);
    #99 $display("Finishing simulation");
    #1 $finish;
   end

endmodule
