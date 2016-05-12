module divM(input wire clk_in, output wire clk_out);
  parameter number = 12_000_000;
  //-- Numero de bits para almacenar el divisor
  //-- Se calculan con la funcion de verilog $clog2, que nos devuelve el
  //-- numero de bits necesarios para representar el numero M
  //-- Es un parametro local, que no se puede modificar al instanciar
  localparam N = $clog2(number);

  //-- Registro para implementar el contador modulo M
  reg [N-1:0] divcounter = 0;

  always @(posedge clk_in) begin
    divcounter <= (divcounter == number - 1) ? 0 : divcounter + 1;
  end

  //Take out MSB
  assign clk_out = divcounter[N-1];

endmodule
