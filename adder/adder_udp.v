module adder_udp(input x, input y, input cin, output res, output cout);

  addresult(res, cin, x, y);
  addcarry(cout, cin, x, y);

endmodule


primitive addresult(res, cin, x, y);
  output res;
  input cin,x,y;

  table
  //cin x   y   res
    0   0   0 : 0 ;
    0   0   1 : 1 ;
    0   1   0 : 1 ;
    0   1   1 : 0 ;
    1   0   0 : 1 ;
    1   0   1 : 0 ;
    1   1   0 : 0 ;
    1   1   1 : 1 ;
  endtable
endprimitive

primitive addcarry(cout, cin, x, y);
  output cout;
  input cin, x, y;

  table
  //cin   x   y : cout
    0     0   0 : 0 ;
    0     0   1 : 0 ;
    0     1   0 : 0 ;
    0     1   1 : 1 ;
    1     0   0 : 0 ;
    1     0   1 : 1 ;
    1     1   0 : 1 ;
    1     1   1 : 1 ;
  endtable
endprimitive
