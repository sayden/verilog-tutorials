module my_gate_tb;
  reg x;
  reg y;

  wire z;

  my_gate uut (.x(x), .y(y), .z(z));

    initial begin
		// Initialize Inputs
		x = 0;
		y = 0;

		// Wait 100 ns for global reset to finish
		#20;
    //Current state is 00
    #20 y = 1; //01
    #20 x = 1; //11
    #20 y = 0; //10
    #20 ;
	end

  initial begin
    $monitor("TIME=%3d:     x=%2b y=%2b z=%d \n",$time,x,y,z, );
  end
endmodule
