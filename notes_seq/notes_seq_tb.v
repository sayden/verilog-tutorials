module notes_seq_tb;
  reg clk = 0;
  wire out;

  parameter TIME = 3;

  notes_seq #(.TIME(TIME)) uut(.clk_in(clk), .ch_out(out));

  always #1 clk = !clk;

  always @ ( posedge clk ) begin
    $monitor($time, ": clk=%b out=%d", clk, out);
  end

  initial begin
    $dumpfile("notes_seq_tb.vcd");
    $dumpvars;

    // $monitor($time, ": clk=%b out=%d", clk, out);

    #99 $display("End of simulation");
    #1 $finish;
  end
endmodule
