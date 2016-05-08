module shift_register
  #(parameter BITS = 8)
  (
    input wire clk, reset, s_in,
    output wire s_out
  );

  reg [BITS-1:0] r_reg;
  wire [BITS-1:0] r_next;

  always @ ( posedge clk, negedge reset ) begin
    if (~reset)
      r_reg <= 0;
    else
      r_reg <= r_next;
  end

    assign r_next = {s_in, r_reg[BITS-1:1]};
    assign s_out = r_reg[0];
endmodule
