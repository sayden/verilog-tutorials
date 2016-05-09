//-- Fichero: secnotas.v

//-- Incluir las constantes del modulo del divisor
`include "divider.vh"

//-- Parameteros:
//-- clk: Reloj de entrada de la placa iCEstick
//-- ch_out: Canal de salida
module secnotas(input wire clk, output reg ch_out);

//-- Parametros: notas a tocar
//-- Se define como parametro para poder modificarlas desde el testbench
//-- para hacer pruebas
reg N0 = `DO_4;
reg N1 = `RE_4;
reg N2 = `MI_4;
reg DUR = `T_1s;

//-- Cables de salida de los canales
wire ch0, ch1, ch2;

//-- Selección del canal del multiplexor
reg [1:0] sel = 0;

//-- Reloj con la duracion de la nota
wire clk_dur;

//-- Canal 0
tone_gen #(N0)
  CH0 (
    .clk_in(clk),
    .clk_out(ch0)
  );

//-- Canal 1
tone_gen #(N1)
  CH1 (
    .clk_in(clk),
    .clk_out(ch1)
  );

//-- canal 2
tone_gen #(N2)
  CH2 (
    .clk_in(clk),
    .clk_out(ch2)
  );

//-- Multiplexor de seleccion del canal de salida
always @*
  case (sel)
     0 : ch_out <= ch0;
     1 : ch_out <= ch1;
     2 : ch_out <= ch2;
     3 : ch_out <= 0;
     default : ch_out <= 0;
  endcase

//-- Contador para seleccion de nota
always @(posedge clk_dur)
  sel <= sel + 1;

//-- Divisor para marcar la duración de cada nota
divM #(DUR)
  TIMER0 (
    .clk_in(clk),
    .clk_out(clk_dur)
  );

endmodule
