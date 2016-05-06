`timescale 1ns / 100ps

module adder_udp_tb;

  reg x;
  reg y;
  reg cin;

  wire res;
  wire cout;

  adder_udp uut (
    .x(x),
    .y(y),
    .cin(cin),
    .res(res),
    .cout(cout)
    );

  initial begin
    $dumpfile("adder_udp.vcd");
    $dumpvars(0, adder_udp_tb);
    x = 0;
    y = 0;
    cin = 0;

    #20  x = 1;
    #20; y = 1;
    #20; x = 0;
    #20; cin = 1;
    #20; y = 0;
    #20; x = 1;
    #20; y = 1;
    #40;
  end

  initial begin
    $monitor("time = %2d, CIN =%1b, X=%1b, Y=%1b, COUT=%1b, RES=%1b", $time, cin, y, x, cout, res);
  end
endmodule
