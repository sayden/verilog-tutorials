module mpres_tb();
  parameter BITS0 = 1;
  parameter BITS1 = 1;
  parameter BITS2 = 2;
  parameter BITS3 = 3;
  parameter BITS4 = 4;

  reg clk = 0;

  wire LED1, LED2, LED3, LED4, GREEN;

  mpres
    #(
      .BITS0(BITS0),
      .BITS1(BITS1),
      .BITS2(BITS2),
      .BITS3(BITS3),
      .BITS4(BITS4),
      .GREEN(1)
      )
    dut(
      .clk_in(clk),
      .LED1(LED1),
      .LED2(LED2),
      .LED3(LED3),
      .LED4(LED4)
      );

  always #1 clk = ~clk;

  initial begin
    $dumpfile("multiple_prescaler.vcd");
    $dumpvars;

    #20 $display("End of simulation");
    #21 $finish;
  end
endmodule
