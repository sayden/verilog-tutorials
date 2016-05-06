`timescale 1ns / 100ps
module mux_4_2_tb;
  wire out;
  reg control1, control2, in1, in2, in3, in4;

  Mux4_2 uut(out, control1, control2, in1, in2, in3, in4);

  initial begin
    $dumpfile("mux_4_2.vcd");
    $dumpvars(0,mux_4_2_tb);
    $monitor("in1=%b in2=%b in3=%b in4=%b cntrl_a=%b cntrl_b=%b out=%b", in1, in2, in3, in4, control1, control2, out);
    control1=0; control2=0;in1=0;in2=0;in3=0;in4=0;
    #1 control1=0; control2=0;in1=0;in2=0;in3=0;in4=1;
    #1 control1=0; control2=0;in1=0;in2=0;in3=1;in4=0;
    #1 control1=0; control2=0;in1=0;in2=0;in3=1;in4=1;
    #1 control1=0; control2=0;in1=0;in2=1;in3=0;in4=0;
    #1 control1=0; control2=0;in1=0;in2=1;in3=0;in4=1;
    #1 control1=0; control2=0;in1=0;in2=1;in3=1;in4=0;
    #1 control1=0; control2=0;in1=0;in2=1;in3=1;in4=1;
    #1 control1=0; control2=0;in1=1;in2=0;in3=0;in4=0;
    #1 control1=0; control2=0;in1=1;in2=0;in3=0;in4=1;
    #1 control1=0; control2=0;in1=1;in2=0;in3=1;in4=0;
    #1 control1=0; control2=0;in1=1;in2=0;in3=1;in4=1;
    #1 control1=0; control2=0;in1=1;in2=1;in3=0;in4=0;
    #1 control1=0; control2=0;in1=1;in2=1;in3=0;in4=1;
    #1 control1=0; control2=0;in1=1;in2=1;in3=1;in4=0;
    #1 control1=0; control2=0;in1=1;in2=1;in3=1;in4=1;

    #1 control1=0; control2=1;in1=0;in2=0;in3=0;in4=0;
    #1 control1=0; control2=1;in1=0;in2=0;in3=0;in4=1;
    #1 control1=0; control2=1;in1=0;in2=0;in3=1;in4=0;
    #1 control1=0; control2=1;in1=0;in2=0;in3=1;in4=1;
    #1 control1=0; control2=1;in1=0;in2=1;in3=0;in4=0;
    #1 control1=0; control2=1;in1=0;in2=1;in3=0;in4=1;
    #1 control1=0; control2=1;in1=0;in2=1;in3=1;in4=0;
    #1 control1=0; control2=1;in1=0;in2=1;in3=1;in4=1;
    #1 control1=0; control2=1;in1=1;in2=0;in3=0;in4=0;
    #1 control1=0; control2=1;in1=1;in2=0;in3=0;in4=1;
    #1 control1=0; control2=1;in1=1;in2=0;in3=1;in4=0;
    #1 control1=0; control2=1;in1=1;in2=0;in3=1;in4=1;
    #1 control1=0; control2=1;in1=1;in2=1;in3=0;in4=0;
    #1 control1=0; control2=1;in1=1;in2=1;in3=0;in4=1;
    #1 control1=0; control2=1;in1=1;in2=1;in3=1;in4=0;
    #1 control1=0; control2=1;in1=1;in2=1;in3=1;in4=1;

    #1 control1=1; control2=0;in1=0;in2=0;in3=0;in4=0;
    #1 control1=1; control2=0;in1=0;in2=0;in3=0;in4=1;
    #1 control1=1; control2=0;in1=0;in2=0;in3=1;in4=0;
    #1 control1=1; control2=0;in1=0;in2=0;in3=1;in4=1;
    #1 control1=1; control2=0;in1=0;in2=1;in3=0;in4=0;
    #1 control1=1; control2=0;in1=0;in2=1;in3=0;in4=1;
    #1 control1=1; control2=0;in1=0;in2=1;in3=1;in4=0;
    #1 control1=1; control2=0;in1=0;in2=1;in3=1;in4=1;
    #1 control1=1; control2=0;in1=1;in2=0;in3=0;in4=0;
    #1 control1=1; control2=0;in1=1;in2=0;in3=0;in4=1;
    #1 control1=1; control2=0;in1=1;in2=0;in3=1;in4=0;
    #1 control1=1; control2=0;in1=1;in2=0;in3=1;in4=1;
    #1 control1=1; control2=0;in1=1;in2=1;in3=0;in4=0;
    #1 control1=1; control2=0;in1=1;in2=1;in3=0;in4=1;
    #1 control1=1; control2=0;in1=1;in2=1;in3=1;in4=0;
    #1 control1=1; control2=0;in1=1;in2=1;in3=1;in4=1;

    #1 control1=1; control2=1;in1=0;in2=0;in3=0;in4=0;
    #1 control1=1; control2=1;in1=0;in2=0;in3=0;in4=1;
    #1 control1=1; control2=1;in1=0;in2=0;in3=1;in4=0;
    #1 control1=1; control2=1;in1=0;in2=0;in3=1;in4=1;
    #1 control1=1; control2=1;in1=0;in2=1;in3=0;in4=0;
    #1 control1=1; control2=1;in1=0;in2=1;in3=0;in4=1;
    #1 control1=1; control2=1;in1=0;in2=1;in3=1;in4=0;
    #1 control1=1; control2=1;in1=0;in2=1;in3=1;in4=1;
    #1 control1=1; control2=1;in1=1;in2=0;in3=0;in4=0;
    #1 control1=1; control2=1;in1=1;in2=0;in3=0;in4=1;
    #1 control1=1; control2=1;in1=1;in2=0;in3=1;in4=0;
    #1 control1=1; control2=1;in1=1;in2=0;in3=1;in4=1;
    #1 control1=1; control2=1;in1=1;in2=1;in3=0;in4=0;
    #1 control1=1; control2=1;in1=1;in2=1;in3=0;in4=1;
    #1 control1=1; control2=1;in1=1;in2=1;in3=1;in4=0;
    #1 control1=1; control2=1;in1=1;in2=1;in3=1;in4=1;

    #10 $finish;
  end
endmodule
