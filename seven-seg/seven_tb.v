module seven_tb;
  reg clk;
  wire [7:0] SevenSegment;
  wire [2:0] SevenSegmentEnable;

  seven uut(.clk(clk), .SevenSegment(SevenSegment), .SevenSegmentEnable(SevenSegmentEnable));

  always #1 clk = !clk;

  initial begin
    clk = 0;

    $dumpfile("seven_tb.vcd");
    $dumpvars;

    $monitor($time, ": clk=%b 7seg=%b 7segEna=%b", clk, SevenSegment, SevenSegmentEnable);

    #30 $finish;
  end

endmodule
