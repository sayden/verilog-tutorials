`include "baudgen.vh"

module txtest2_tb();

//-- Baudios con los que realizar la simulacion
//-- A 300 baudios, la simulacion tarda mas en realizarse porque los
//-- tiempos son mas largos. A 115200 baudios la simulacion es mucho
//-- mas rapida
localparam BAUD = `B115200;

//-- Tics de reloj para envio de datos a esa velocidad
//-- Se multiplica por 2 porque el periodo del reloj es de 2 unidades
localparam BITRATE = (BAUD << 1);

//-- Tics necesarios para enviar una trama serie completa, mas un bit adicional
localparam FRAME = (BITRATE * 11);

//-- Tiempo entre dos bits enviados
localparam FRAME_WAIT = (BITRATE * 4);

//-- Registro para generar la señal de reloj
reg clk = 0;

//-- Linea de tranmision
wire tx;

//-- Simulacion de la señal dtr
reg dtr = 0;

//-- Instanciar el componente
txtest2 #(.BAUD(BAUD))
  dut(
    .clk(clk),
    .load(dtr),
    .tx(tx)
  );

//-- Generador de reloj. Periodo 2 unidades
always
  # 1 clk <= ~clk;

//-- Proceso al inicio
initial begin

  //-- Fichero donde almacenar los resultados
  $dumpfile("txtest2_tb.vcd");
  $dumpvars(0, txtest2_tb);

  #1 dtr <= 0;

  //-- Enviar primer caracter
  #FRAME_WAIT dtr <= 1;
  #(FRAME * 3) dtr <=0;

  //-- Segundo envio
  #FRAME_WAIT dtr <=1;
  #(FRAME * 3) dtr <=0;

  #FRAME_WAIT $display("FIN de la simulacion");
  $finish;
end

endmodule
