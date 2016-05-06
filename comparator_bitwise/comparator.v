module comparator(
  input input1,
  input input2,
  output out
  );

  assign out = (~input1 & ~input2) | (input1 & input2);
endmodule
