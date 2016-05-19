module sequencer(
  input wire clk,
  output wire [4:0] leds
  );

  parameter DELAY = 3_000_000;  //500ms as the clock runs at 12mhz

  reg [4:0] address;
  reg reset = 0;
  wire clk_delay;

  rom_32x4 ROM(.clk(clk_delay), .address(address), .data(leds));

  //Counter
  always @ (posedge clk) begin
    if(reset == 0) begin
      address <= 0;
    end else if (clk_delay) begin
      address <= address + 1;
    end
  end

  //Timer
  dividerp1 #(.M(DELAY)) TIMER(.clk(clk), .clk_out(clk_delay));

  always @ (negedge clk) begin
    reset <= 1;
  end

endmodule
