module Mux4_2(out, control1, control2, in1, in2, in3, in4);
  input control1, control2, in1, in2, in3, in4;
  output out;
  assign out = control1 ? (control2 ? in4 : in3) : (control2 ? in2 : in1);
endmodule
