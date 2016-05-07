`timescale 1ns / 1ps
module stimulus;
	// Inputs
	reg x;
	reg y;
	// Outputs
	wire out;
	// Instantiate the Unit Under Test (UUT)
	comparator uut (
		.x(x),
		.y(y),
		.out(out)
	);

	initial begin
	$dumpfile("test.vcd");
    $dumpvars(0,stimulus);
		// Initialize Inputs
		x = 0;
		y = 0;

	#20 x = 1;
	#20 y = 1;
	#20 y = 0;
	#20 x = 1;
	#40 ;

	end

		initial begin
		 $monitor("t=%3d x=%d,y=%d,z=%d \n",$time,x,y,out, );
		 end

endmodule
