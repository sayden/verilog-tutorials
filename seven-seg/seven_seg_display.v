// Add 7 segment digits
`include "digits.vh"

module seven_seg_display(
  input wire clk,
  input wire [9:0] number,
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
  reg [7:0] out;
  initial begin
    out = 0;
  end

  reg cent;
  reg dec;
  reg uni;

  reg n = 0;

  always @ ( posedge clk ) begin
    cent = number / 100;
    dec = (number - (cent*100)) / 10;
    uni = number - (cent + dec);

    case (iter)
      3'b001: n = cent;
      3'b010: n = dec;
      3'b100: n = uni;
    endcase
  end

  always @ ( posedge clk ) begin
    case (n)
      0: out = `ZERO;
      1: out = `ONE;
      2: out = `TWO;
      3: out = `THREE;
      4: out = `FOUR;
      5: out = `FIVE;
      6: out = `SIX;
      7: out = `SEVEN;
      8: out = `EIGHT;
      9: out = `NINE;
    endcase
  end

  assign SevenSegment = out;
endmodule
