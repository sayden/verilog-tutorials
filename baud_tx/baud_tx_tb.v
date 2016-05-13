`timescale 1ns / 100ps

module baud_tx_tb;
  reg clk = 0;
  wire tx;
  reg load = 0;

  baud_tx #(3) uut(.clk(clk), .load(load), .tx(tx));

  always #1 clk = !clk;

  initial begin
  $dumpfile("baud_tx_tb.vcd");
  $dumpvars;

  $monitor($time, ": clk=%b tx=%b load=%b", clk, tx, load);

  #5 load = !load;

  #100 load = !load;

  #5 load = !load;

  #100 load = !load;

  #5 load = !load;


  #100 $finish;
  end
endmodule
