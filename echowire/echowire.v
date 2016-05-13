module echowire(
  input wire rx,
  input wire dtr,
  input wire rts,
  output wire tx,
  output wire l1,
  output wire l2
  );

  assign tx = rx;
  assign l1 = dtr;
  assign l2 = rts;

endmodule
