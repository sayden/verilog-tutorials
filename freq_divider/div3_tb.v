module div3_tb;

  reg clk_in = 0;
  wire clk_out;

  div3 uut(.clk_in(clk_in), .clk_out(clk_out));

  //Clock generator
  always #1 clk_in = ~clk_in;

  initial begin
    $dumpfile("div3_tb.vcd");
    $dumpvars;

    #30 $display("Simulation finished");
    $finish;
  end
endmodule
