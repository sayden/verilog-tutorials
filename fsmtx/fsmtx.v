//-- Fichero fsmtx.v
`default_nettype none

`include "baudgen.vh"

//Send a character when load=1
module fsmtx (input wire clk,       //-- System clock (12MHz in ICEstick)
              input wire start,     //-- Activate 1 to transmit
              output reg tx         //-- Serial out to PC
             );

parameter BAUD =  `B300;  //baud rate
parameter CAR = "A";      //char to send
reg [9:0] shifter;        //Variable to store the char

reg start_r;
wire clk_baud;
reg rstn = 0;
reg [3:0] bitCounter;

//--------- Microorders
wire load;    //-- Load shifter. bit counter = 0
wire baud_en; //-- Turn on baud gen

//-- DATA ROUTE
always @(posedge clk)
  start_r <= start;

// Shift reg, parallel load
// When load_r is 0, "char" is loaded
// When load_r is 1 and baud clock is 1, shift to right and add a '1' through left
always @(posedge clk)
  if (rstn == 0)                        //-- Reset
    shifter <= 10'b11_1111_1111;
  else if (load == 1)                   //-- Load
    shifter <= {CAR,2'b01};
  else if (load == 0 && clk_baud == 1)  //Shift
    shifter <= {1'b1, shifter[9:1]};

always @(posedge clk)
  if (load == 1)
    bitCounter <= 0;
  else if (load == 0 && clk_baud == 1)
    bitCounter <= bitCounter + 1;

//-- Sacar por tx el bit menos significativo del registros de desplazamiento
//-- Cuando estamos en modo carga (load_r == 0), se saca siempre un 1 para
//-- que la linea este siempre a un estado de reposo. De esta forma en el
//-- inicio tx esta en reposo, aunque el valor del registro de desplazamiento
//-- sea desconocido
//-- ES UNA SALIDA REGISTRADA, puesto que tx se conecta a un bus sincrono
//-- y hay que evitar que salgan pulsos espureos (glitches)
always @(posedge clk)
  tx <= shifter[0];

//-- Divisor para obtener el reloj de transmision
baudgen #(BAUD)
  BAUD0 (
    .clk(clk),
    .clk_ena(baud_en),
    .clk_out(clk_baud)
  );

//------------------------------
//-- CONTROLADOR
//------------------------------

//-- Estados del automata finito del controlador
localparam IDLE = 0;
localparam START = 1;
localparam TRANS = 2;


reg [1:0] state;        //-- Estados del autómata del controlador
always @(posedge clk)   //-- Transiciones entre los estados
  if (rstn == 0)        //-- Reset del automata. Al estado inicial
    state <= IDLE;
  else
    case (state)        //-- Transiciones a los siguientes estados
      //-- Estado de reposo. Se sale cuando la señal
      //-- de start se pone a 1
      IDLE:
        if (start_r == 1)
          state <= START;
        else
          state <= IDLE;

      //-- Estado de comienzo. Prepararse para empezar
      //-- a transmitir. Duracion: 1 ciclo de reloj
      START:
        state <= TRANS;

      //-- Transmitiendo. Se esta en este estado hasta
      //-- que se hayan transmitido todos los bits pendientes
      TRANS:
        if (bitCounter == 11)
          state <= IDLE;
        else
          state <= TRANS;

      //-- Por defecto. NO USADO. Puesto para
      //-- cubrir todos los casos y que no se generen latches
      default:
        state <= IDLE;

    endcase

//-- Generacion de las microordenes
assign load = (state == START) ? 1 : 0;
assign baud_en = (state == IDLE) ? 0 : 1;


//-- Inicializador
always @(posedge clk)
  rstn <= 1;

endmodule
