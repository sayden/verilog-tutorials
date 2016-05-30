// Add 7 segment digits
`include "digits.vh"

module seven(
    input wire clk,
    output wire [7:0] SevenSegment,
    output wire [2:0] SevenSegmentEnable
  );

  //####################################################################
  //Iterates over every 7segment to activate them sequentially
  reg [2:0] iter;

  initial begin
    iter = 3'b001;
  end

  always @ ( posedge clk ) begin
    iter <= {iter[0], iter[2:1]};
  end

  assign SevenSegmentEnable = iter;
  //####################################################################

  //Assign a different number every time we change the "ON" led.
  reg [7:0] number;
  initial begin
    number = 0;
  end

  always @ ( posedge clk ) begin
    case (iter)
      3'b001: number <= `ONE;
      3'b010: number <= `TWO;
      3'b100: number <= `THREE;
    endcase
  end

  assign SevenSegment = number;

endmodule
