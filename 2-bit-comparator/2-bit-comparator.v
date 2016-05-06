module two_bit_comparator(
  input [1:0] input0,
  input [1:0] input1,
  output output0
  );

  assign output0 = (input0[0] & input1[0] & input0[1] & input1[1]) |
                    (~input0[0] & ~input1[0] & ~input0[1] & ~input1[1]) |
                    (~input0[0] & ~input1[0] & input0[1] & input1[1]) |
                    (input0[0] & input1[0] & ~input0[1] & ~input1[1]);

endmodule
