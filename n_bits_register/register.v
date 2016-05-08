//register.v

//N bits register
module register(clk, reset, din, out_data);

  parameter BITS = 4;
  parameter INI = 0;

  input wire clk;
  input wire reset;
  input wire [BITS-1:0] din;
  output reg [BITS-1:0] out_data;

  always @(posedge clk) begin
    out_data <= (reset == 0) ? INI : din;
  end

endmodule
