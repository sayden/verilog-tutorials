module test_tb;
  reg [9:0] r;

  reg [9:0] number = 345;
  reg [4:0] cent;
  reg [4:0] dec;
  reg [4:0] uni;

  initial begin
    r = 0;
  end

  initial begin
    $dumpfile("test_tv.vcd");
    $dumpvars;

    $monitor($time, ": r=%d cent=%d dec=%d uni=%d", r, cent, dec, uni);

    #1
    cent = number / 100;
    dec = (number - (cent*100)) / 10;
    uni = number - ((cent*100) + (dec*10));
  end

endmodule
