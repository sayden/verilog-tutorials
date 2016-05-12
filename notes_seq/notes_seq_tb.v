module notes_seq_tb;
  reg clk = 0;
  wire out;

  parameter TIME = 5;

  notes_seq #(.TIME(TIME)) uut(.clk_in(clk), .tone(out));

  always #1 clk = !clk;

  initial begin
    $dumpfile("notes_seq_tb.vcd");
    $dumpvars;

    $monitor($time, ": clk=%b out=%d", clk, out);

    #1000 $finish;
  end
endmodule
