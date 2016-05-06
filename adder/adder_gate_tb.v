`timescale 1ns / 100ps

module adder_gate_tb;

  reg input1;
  reg input2;
  reg carryin;

  wire out;
  wire carryout;

  adder_gate uut (
    .x(input1),
    .y(input2),
    .cin(carryin),
    .res(res),
    .cout(carryout)
    );

  initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0,adder_gate_tb);
    input1 = 0;
    input2 = 0;
    carryin = 0;

    #20  input1 = 1;
    #20; input2 = 1;
    #20; input1 = 0;
    #20; carryin = 1;
    #20; input2 = 0;
    #20; input1 = 1;
    #20; input2 = 1;
    #40;
  end

  initial begin
    $monitor("time = %2d, CIN =%1b, IN1=%1b, IN2=%1b, COUT=%1b, OUT_A=%1b", $time,carryin,input2, input1,carryout,res);
  end
endmodule
