module shifter_tb;
  reg clk = 0;
  wire [3:0] data;

  always #1 clk = ~clk;

  shifter #(.BITS(1), .INI(4'b1001))
    Shifter(.clk(clk), .data(data));

  initial begin
    $dumpfile("shifter_tb.vcd");
    $dumpvars(0, shifter_tb);
    $monitor($time, ": %b", data);

    #100 $finish;
  end
endmodule
