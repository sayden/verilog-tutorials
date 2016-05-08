module div3(input wire clk_in, output wire clk_out);
  reg [1:0] divcounter = 0;

  //-- Modulus 3 counter
  always @(posedge clk_in) begin
    divcounter <= (divcounter == 2) ? 0 : divcounter + 1;
  end

  //Take out MSB
  assign clk_out = divcounter[1];
endmodule
