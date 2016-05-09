//-- Incluir las constantes del modulo del divisor
`include "divider.vh"

module notes_seq(input wire clk_in, output wire ch_out);
  parameter TIME = 3_000_000;

  //Wire to take the output of the following divisor that'll generate a 250ms clock
  wire time_delay;
  divM #(`T_1s) DURATION(.clk_in(clk_in), .clk_out(time_delay));

  //Output of the tones
  wire ch0, ch1, ch2;

  //Create the three tones
  tone_gen #(`DO_4) CH0(.clk_in(clk_in), .ch_out(ch0));
  tone_gen #(`RE_4) CH1(.clk_in(clk_in), .ch_out(ch1));
  tone_gen #(`MI_4) CH2(.clk_in(clk_in), .ch_out(ch2));

  //Mux channel selector
  reg [1:0] chSel = 0;

  //-- Multiplexor de seleccion del canal de salida
  always @*
    case (chSel)
       0 : ch_out <= ch0;
       1 : ch_out <= ch1;
       2 : ch_out <= ch2;
       3 : ch_out <= 0;
       default : ch_out <= 0;
    endcase

  always @ ( posedge time_delay ) begin
    chSel <= chSel + 1;
  end


endmodule
