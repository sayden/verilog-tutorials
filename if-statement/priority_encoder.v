// Code your design here
module priority_encoder(input wire [3:0] in, output reg [2:0] out);

  always @(in[3], in[2], in[1], in[0])
    begin
      if (in[3] == 1'b1)
        out = 3'b100;
      else if (in[2] == 1'b1)
          out = 3'b011;
      else if (in[1] == 1'b1)
          out = 3'b010;
      else
          out = 3'b001;
    end
endmodule
