module mux2_tb;
  reg clk = 0;
  reg in1;
  reg in2;
  reg sel;
  wire [3:0] data;

  mux2 uut(.clk(clk), .out_data(data));

  always #1 clk = ~clk;

  always #5 sel = ~sel;

  initial begin
    $dumpfile("mux2_tb.vcd");
    $dumpvars(0, mux2_tb);

    $monitor($time, " clk=%1b sel=%1b out=%4b in1=%4b in2=$4b", clk, sel, data, in1, in2);
    #99 $display("Finishing simulation");
    #1 $finish;
  end

endmodule
