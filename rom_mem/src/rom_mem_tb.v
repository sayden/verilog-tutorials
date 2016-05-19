module rom_32x4_tb;

  reg clk = 0;
  reg [4:0] address = 5'b0;
  wire [3:0] data;

  always #1 clk = !clk;

  rom_32x4 uut(.clk(clk), .address(address), .data(data) );

  initial begin
    $dumpfile("src/rom_mem_tb.vcd");
    $dumpvars;

    $monitor($time, ": clk=%b address=%b data=%b", clk, address, data);

    #2 address = 1;
    #2 address = 2;
    #2 address = 3;
    #2 address = 4;
    #2 address = 5;
    #2 address = 6;
    #2 address = 7;
    #2 address = 8;

    #2 $finish;
  end

endmodule
