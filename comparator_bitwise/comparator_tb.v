`timescale 1ns / 1ps
module stimulus;
  //Inputs
  reg input1;
  reg input2;

  //Outputs
  wire out;

  //Instantiate the Unit Under Test (UUT)
  comparator uut (
    .input1(input1),
    .input2(input2),
    .out(out)
    );

  initial
    begin
	    $dumpfile("comparator.vcd");
      $dumpvars(0,stimulus);
      //initialioute Inputs
      input1 = 0;
      input2 = 0;

      #20 input2 = 1;
      #20 input1 = 1; input2 = 0;
      #20 input2 = 1;
      #40;
    end
  initial
    begin
      $monitor("%d,%d = %d \n", input1, input2, out);
    end
endmodule
