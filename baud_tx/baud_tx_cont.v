module baud_tx_cont(
  input wire clk,
  input wire load,
  output wire tx
  );

  //115200
  parameter BAUD =104;

  wire clk_baud;

  divM #(BAUD) BAUD0(.clk_in(clk), .clk_out(clk_baud));

  reg [9:0] shifter;

  always @ ( posedge clk_baud ) begin
    shifter <= (load == 0) ? {"K", 2'b01} : {shifter[0], shifter[9:1]};
  end

  assign tx = (load) ? shifter[0] : 1;

endmodule
