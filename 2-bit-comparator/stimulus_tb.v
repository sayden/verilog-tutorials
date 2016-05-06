module two_bit_comparator_tb;
  reg[1:0] input0;
  reg[1:0] input1;

  wire outpu0;

  two_bit_comparator uut (
    .input0(input0),
    .input1(input1),
    .output0(output0)
    );

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, two_bit_comparator_tb);

    //Initialize inputs
    input0 = 0;
    input1 = 0;
    //Current state is 0000
    #20 input0 = 1; //0100
    #20 input1 = 1; //0101
    #20 input1 = 3; //0111
    #20 input0 = 3; //1111
    #20 input1 = 1; //1101
    #20 input1 = 0; //1100
    #20 input0 = 2; //1000
    #20 input1 = 2; //1010
    #40 ;

  end

  initial begin
    $monitor("TIME=%3d:     x=%2b y=%2b z=%d \n",$time,input0,input1,output0, );
  end
endmodule
