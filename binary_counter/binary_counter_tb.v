`timescale 1ns / 1ps
module binary_counter_tb;
	// Inputs
	reg clk ;
	reg reset;
	// Output
	wire[3:0] binary;
	// Instantiate the Binary Counter
	binary_counter  #(4) s1  (
		.clk(clk),
		.reset(reset),
		.binary(binary)
	);

 integer i;
 initial
 begin

 clk = 0;
 for(i =0; i<=40; i=i+1)
 begin
  #10 clk = ~clk;
 end
 end

initial
begin

$dumpfile("binary_counter_tb.vcd");
$dumpvars(0,binary_counter_tb);

reset =1;
#2 reset = 0;
#2 reset =1;
end


		initial begin
		 $monitor("clk=%d binary=%4b",clk,binary);
		 end

endmodule
