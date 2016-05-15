//-- Fichero: txtest.v
`default_nettype none

//--- Modulo que envia un caracter cuando load esta a 1
//--- La salida tx ESTA REGISTRADA
module txtest(input wire clk,       //-- Reloj del sistema (12MHz en ICEstick)
              input wire load,      //-- Señal de cargar / desplazamiento
              output reg tx         //-- Salida de datos serie (hacia el PC)
             );

//-- Parametro: velocidad de transmision
//-- Pruebas del caso peor: a 300 baudios
parameter BAUD =  40000;

//-- Registro de 10 bits para almacenar la trama a enviar:
//-- 1 bit start + 8 bits datos + 1 bit stop
reg [9:0] shifter;

//-- Señal de load registrada
reg load_r;

//-- Reloj para la transmision
wire clk_baud;

//-- Registrar la entrada load
//-- (para cumplir con las reglas de diseño sincrono)
always @(posedge clk)
  load_r <= load;

//-- Registro de desplazamiento, con carga paralela
//-- Cuando load_r es 0, se carga la trama
//-- Cuando load_r es 1 y el reloj de baudios esta a 1 se desplaza hacia
//-- la derecha, enviando el siguiente bit
//-- Se introducen '1's por la izquierda
always @(posedge clk)
  //-- Modo carga
  if (load_r == 0)
    shifter <= {"K",2'b01};

  //-- Modo desplazamiento
  else if (load_r == 1 && clk_baud == 1)
    shifter <= {shifter[0], shifter[9:1]};

//-- Sacar por tx el bit menos significativo del registros de desplazamiento
//-- Cuando estamos en modo carga (load_r == 0), se saca siempre un 1 para
//-- que la linea este siempre a un estado de reposo. De esta forma en el
//-- inicio tx esta en reposo, aunque el valor del registro de desplazamiento
//-- sea desconocido
//-- ES UNA SALIDA REGISTRADA, puesto que tx se conecta a un bus sincrono
//-- y hay que evitar que salgan pulsos espureos (glitches)
always @(posedge clk)
  tx <= (load_r) ? shifter[0] : 1;

//-- Divisor para obtener el reloj de transmision
divider #(BAUD)
  BAUD0 (
    .clk_in(clk),
    .clk_out(clk_baud)
  );

endmodule
