module echowire_tb;
  reg clk = 0;
  reg rts = 0;
  reg dtr = 0;
  reg rx = 0;

  wire tx, l1, l2;

  echowire uut(
    .rx(rx),
    .dtr(dtr),
    .rts(rts),
    .tx(tx),
    .l1(l1),
    .l2(l2)
    );

  always #1 clk = !clk;

  initial begin
    $dumpfile("echowire_tb.vcd");
    $dumpvars;

    $monitor($time, " rts=%b dtr=%b rx=%b tx=%b l1=%b l2=%b", rts, dtr, rx, tx, l1, l2);

    #1 rx <= 1;
    #5 rx <= 0; dtr <= 1;
    #5 rts <= 1; rx <= 0;
    #5 rts <= 0; rx <= 1;


    #5 $finish;
  end
endmodule
