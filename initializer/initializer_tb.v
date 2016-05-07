module initializer_tb;
  reg clk = 0;

  wire ini;

  init
    INIT(
      .clk(clk),
      .ini(ini)
      );

  always #2 clk = ~clk;

  initial begin
    $dumpfile("initializer.vcd");
    $dumpvars;

    #20 $display("End of simulation");
    $finish;
  end
endmodule
