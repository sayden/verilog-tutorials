module adder_gate(input x, input y, input cin, output res, output cout);

  wire p, s, r;

  xor(p, x, y);
  and(s, x, y);
  and(r, p, cin);
  or(cout, r, s);
  xor(res, p, cin);

endmodule
