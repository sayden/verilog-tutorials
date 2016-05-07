`timescale 1ns / 1ps
module stimulus;
	reg[1:0] in_;
	reg enable_;
	wire[3:0] out_;
	// Instantiate the Unit Under Test (UUT)
	decoder uut (
		.in(in_),
		.enable(enable_),
		.out(out_)
	);

	initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, stimulus);

		// Initialize Inputs
    in_ = 4'b0000;
    enable_ = 0;

  	#20 enable_  = 1;
  	#20 in_ = 2'b01;
  	#20 in_ = 2'b10;
  	#20 in_ = 2'b11;
  	#40 ;

	end

	initial begin
	  $monitor("t=%3d enable_=%1b,in=%2b, out_=%4b",$time,enable_,in_,out_ );
	end

endmodule
