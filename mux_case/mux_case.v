module mux_case(input wire [1:0] in, input control, output reg out);

  always @ ( * ) begin
    case(control)
      1'b0:
        out = in[0];
      1'b1:
        out = in[1];
    endcase
  end
  endmodule
