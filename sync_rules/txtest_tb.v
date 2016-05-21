`include "baudgen.vh"

module txtest_tb();

  reg clk = 0;
  localparam  BAUD = `B115200;

  //-- Tics de reloj para envio de datos a esa velocidad
  //-- Se multiplica por 2 porque el periodo del reloj es de 2 unidades
  localparam BITRATE = (BAUD << 1);

  //-- Tics necesarios para enviar una trama serie completa, mas un bit adicional
  localparam FRAME = (BITRATE * 11);

  //-- Tiempo entre dos bits enviados
  localparam FRAME_WAIT = (BITRATE * 4);

  //-- Linea de tranmision
  wire tx;

  //-- Simulacion de la señal dtr
  reg dtr = 0;

  //-- Instanciar el componente
  txtest #(.BAUD(BAUD))
    dut(.clk(clk),
        .load(dtr),
        .tx(tx)
    );

  //-- Generador de reloj. Periodo 2 unidades
  always #1 clk <= ~clk;

  initial begin
    //-- Fichero donde almacenar los resultados
    $dumpfile("txtest_tb.vcd");
    $dumpvars(0, txtest_tb);

    #1 dtr <= 0;

    //-- Enviar primer caracter
    #FRAME_WAIT dtr <= 1;
    #FRAME dtr <=0;

    //-- Segundo envio
    #FRAME_WAIT dtr <=1;
    #FRAME dtr <=0;

    #FRAME_WAIT $display("FIN de la simulacion");
    $finish;
  end

endmodule
