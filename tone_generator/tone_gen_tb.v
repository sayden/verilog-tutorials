module tone_gen_tb;
  reg clk=0;
  wire out_freq3;
  wire out_freq5;
  wire out_freq7;
  wire out_freq10;

  tone_gen #(.freq(3)) uut(.clk_in(clk), .tone(out_freq3));
  tone_gen #(.freq(5)) uut2(.clk_in(clk), .tone(out_freq5));
  tone_gen #(.freq(7)) uut3(.clk_in(clk), .tone(out_freq7));
  tone_gen #(.freq(10)) uut4(.clk_in(clk), .tone(out_freq10));

  always #1 clk <= !clk;

  initial begin
    $dumpfile("tone_gen_tb.vcd");
    $dumpvars;

    $monitor($time, ": clk=%b out3=%d out5=%d out7=%d out10=%d", clk, out_freq3, out_freq5, out_freq7, out_freq10);

    #100 $finish;
  end
endmodule
