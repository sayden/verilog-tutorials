module decoder(input wire enable, input wire [1:0] in, output reg [3:0] out);

  always @ ( enable, in[0], in[1] ) begin
    if (enable == 1'b0)
      out = 4'b0000;
    else
      case (in)
        2'b00:
          out = 4'b0001;
        2'b01:
          out = 4'b0010;
        2'b10:
          out = 4'b0100;
        2'b11:
          out = 4'b1000;
      endcase
  end
endmodule
