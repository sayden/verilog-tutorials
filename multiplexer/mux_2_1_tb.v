module mux2tb;
  wire out;
  reg cntrl,in1,in2;
  
  Mux2_1 uut(out,cntrl,in1,in2);

  initial begin
    $monitor("in1=%b in2=%b cntrl=%b out=%b",in1,in2,cntrl,out);
    cntrl=0;in1=0;in2=0;
    #1 in1=1;in2=0;
    #1 in1=0;in2=1;
    #1 in1=1; in2=1;
    #1 cntrl=1;
    #1 in1=0;in2=0;
    #1 in1=1;in2=0;
    #1 in1=0;in2=1;
    #1 in1=1; in2=1;
    #10 $finish;
  end
endmodule
