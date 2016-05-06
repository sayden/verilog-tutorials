`timescale 1ns / 1ps

/* Stimulus
Example showing two bit comparator
referencedesigner.com
*/

module udp_tb;

	reg  x;
	reg  y;
  wire z;

	// Instantiate the Unit Under Test (UUT)
	udp uut (.x(x), .y(y), .z(z));

	 initial begin
      // Initialize Inputs
      x = 0;
      y = 0;

      // Wait 100 ns for global reset to finish
      #100;
      #20 y = 1; //01
      #20 x = 1; //11
      #20 y = 0; //10
      #20 ;
    end


  initial begin
    $monitor("x=%d,y=%d,z=%d \n",x,y,z);
  end

endmodule
