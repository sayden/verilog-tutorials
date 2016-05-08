//-------------------------------------------------------------------
//-- mux4_tb.v
//-- Banco de pruebas para el secuenciador de 4 estados con multiplexor
//-- de 4 a 1
//-------------------------------------------------------------------
//-- BQ August 2015. Written by Juan Gonzalez (Obijuan)
//-------------------------------------------------------------------

module mux4_tb();

//-- Registro para generar la señal de reloj
reg clk = 0;

//-- Datos de salida del componente
wire [3:0] data;

//-- Instanciar el componente, con prescaler de 1 bit (para la simulacion)
muxm #(.BITS(1))
  dut(
	  .clk(clk),
	  .out_data(data)
  );

//-- Generador de reloj. Periodo 2 unidades
always #1 clk = ~clk;


//-- Proceso al inicio
initial begin

	//-- Fichero donde almacenar los resultados
	$dumpfile("muxm_tb.vcd");
	$dumpvars(0, mux4_tb);

	# 30 $display("FIN de la simulacion");
	$finish;
end

endmodule
