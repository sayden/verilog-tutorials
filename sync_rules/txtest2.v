//-- txtest.v file
`default_nettype none

`include "baudgen.vh"

module txtest2(
    input wire clk,
    input wire load,
    output reg tx
  );

  parameter BAUD = `B300;

  reg [9:0] shifter;

  reg load_r;

  wire clk_baud;

  always @( posedge clk ) begin
    load_r <= load;
  end

  always @ ( posedge clk ) begin
    if(load_r == 0)
      shifter <= {"K", 2'b01};
    else if (load_r == 1 && clk_baud == 1)
      shifter <= {shifter[0], shifter[9:1]};
  end

  always @ ( posedge clk ) begin
    tx <= (load_r) ? shifter[0] : 1;
  end

  baudgen #(BAUD) BAUD0(.clk(clk), .clk_ena(load_r), .clk_out(clk_baud));

endmodule
