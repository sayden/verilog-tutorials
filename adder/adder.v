module adder(input x, input y, input cin, output res, output cout);

  assign {cout, res} = cin + y + x;

endmodule
