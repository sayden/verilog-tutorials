`default_nettype none

module baud_tx(
  input wire clk,
  input wire load,
  output wire tx
  );

  //115200 baud
  parameter BAUD = 104;

  wire clk_baud;

  //Generate a pulse to the specified baud frequency
  divM #(BAUD)
  BAUD0(
    .clk_in(clk),
    .clk_out(clk_baud)
  );

  //Holds the 10 bit value that we'll pass
  reg [9:0] shifter;

  always @ (posedge clk_baud) begin
    if (load == 0)
      //Don't transmit. Set value to send (shifter) to "K" 01001011 + 01
      shifter <= {"K",2'b01};
    else
      //Transmission is activated. Shift to the left (leftmost bit to the first and shift the other 9 to left)
      shifter <= {shifter[0], shifter[9:1]};
  end

  assign tx = (load) ? shifter[0] : 1;

endmodule
