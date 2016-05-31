module seven_seg_display_tb;
  reg clk;
  wire [7:0] SevenSegment;
  wire [2:0] SevenSegmentEnable;
  reg [9:0] number;

  seven_seg_display uut(
    .clk(clk),
    .number(number),
    .SevenSegment(SevenSegment),
    .SevenSegmentEnable(SevenSegmentEnable)
  );

  always #1 clk = !clk;

  initial begin
    clk = 0;

    $dumpfile("seven_tb.vcd");
    $dumpvars;

    $monitor($time, ": clk=%b 7seg=%b 7segEna=%b, num=%d", clk, SevenSegment, SevenSegmentEnable, number);

    #10 number = 345;
    #10 number = 995;
    #10 number = 476;

    #1 $finish;
  end

endmodule
