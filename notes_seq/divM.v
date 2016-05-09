module divM(input wire clk_in, output wire clk_out, output reg [3:0] out = 0);
  parameter BITS = 12_000_000;
  //-- Numero de bits para almacenar el divisor
  //-- Se calculan con la funcion de verilog $clog2, que nos devuelve el
  //-- numero de bits necesarios para representar el numero M
  //-- Es un parametro local, que no se puede modificar al instanciar
  localparam N = $clog2(BITS);

  //-- Registro para implementar el contador modulo M
  reg [N-1:0] divcounter = 0;

  //-- Modulus 3 counter
  always @(posedge clk_in) begin
    divcounter <= (divcounter == BITS - 1) ? 0 : divcounter + 1;
  end

  //Take out MSB
  assign clk_out = divcounter[N-1];

endmodule
