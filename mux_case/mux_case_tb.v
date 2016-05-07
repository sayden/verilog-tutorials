module mux_case_tb;
  wire out;
  reg control;
  reg [1:0] in;

  mux_case uut(.in(in), .control(control), .out(out));

  initial begin
    $monitor($time, ": IN_1=%b IN_2=%b CTRL=%b OUT=%b", in[0], in[1], control, out);
    control=0; in = 2'b00;

    #1 in=2'b10;
    #1 in=2'b01;
    #1 in=2'b11;
    #1 control=1;
    #1 in=2'b00;
    #1 in=2'b01;
    #1 in=2'b10;
    #1 in=2'b11;
    #10; $finish;
  end
endmodule
