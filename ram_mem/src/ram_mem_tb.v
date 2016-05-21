module ram_mem_tb;

  reg clk = 0;
  reg [3:0] address = 4'd0;
  reg [3:0] data;
  reg mode;
  wire [3:0] out;

  ram_mem uut(.clk(clk), .address(address), .data(data), .mode(mode), .out(out));

  always #1 clk = !clk;

  initial begin
    $dumpfile("ram_mem_tb.vcd");
    $dumpvars;

    $monitor($time, ": clk=%b data=%b address=%b mode=%b out=%d", clk, data, address, mode, out);

    #1 mode=0; data=4'b0; address=0;
    #1 mode=0; data=4'b0; address=1;
    #1 mode=0; data=4'b0; address=2;
    #1 mode=0; data=4'b0; address=5;
    #1 mode=0; data=4'b0; address=10;
    #1 mode=0; data=4'b0; address=12;
    #1 mode=0; data=4'b0; address=15;
    #2 mode=1;
    data=4'd9; address=0;
    #2 mode=0;
    data=4'b0; address=0;
    #2 mode=1;
    data=4'd11; address=0;
    #2 mode=0;
    data=4'b0; address=0;
    #2 mode=0;
    data=4'b0; address=0;
    #2 mode=1;
    data=4'd13; address=0;
    #2 mode=0;
    data=4'b0; address=0;

    $finish;
  end

endmodule
