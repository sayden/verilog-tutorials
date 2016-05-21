`default_nettype none

`include "baudgen.vh"

module fsmtx(input  wire clk,
             input  wire start,
             output reg  tx
);

  parameter BAUD = `B300;
  parameter CHAR = "A";

  reg [9:0] shifter;    //10 bits reg to store the bits array
  reg start_r;          //Start signal
  wire clk_baud;        //Baud out clock
  reg reset = 0;
  reg [3:0] bitCounter; //Bit counter

  //Microorders
  wire load;            //Load shifter. Activated when state is START
  wire baud_en;         //Enable baud generator. Activated when state isn't IDLE


  //--DATA ROUTE

  //Pass the start wire into a register so that we follow sync rules
  always @(posedge clk) begin
    start_r <= start;
  end

  //Loads shifter reg with either the default value, the char or displaces
  //shifter one bit
  always @ (posedge clk) begin
    if (reset == 0)
      shifter <= 10'b11_111_111;
    else if (load == 1)
      shifter <= {CHAR, 2'b01};
    else if (load == 0 && clk_baud == 1)
      shifter <= {1'b1, shifter[9:1]};
  end

  //Resets bitcounter when load or add 1 to it.
  always @(posedge clk) begin
    if (load == 1)
      bitCounter <= 0;
    else if (load == 0 && clk_baud == 1)
      bitCounter <= bitCounter + 1;
  end

  //Shifter mode
  always @(posedge clk) begin
    tx <= shifter[0];
  end

  baudgen #(BAUD)
  BAUD0 (
    .clk(clk),
    .clk_ena(baud_en),
    .clk_out(clk_baud)
  );

  //--
  //-- CONTROLLER
  //--
  localparam  IDLE = 0;
  localparam START = 1;
  localparam TRANS = 2;

  reg [1:0] state;

  // Define state transitions
  // IDLE--> START--> TRANS --> IDLE
  always @(posedge clk) begin
    if (reset == 0) begin
      state <= IDLE;
    end else begin
      case (state)
        IDLE:
          if (start_r == 1) begin
            state <= START;
          end else begin
            state <= IDLE;
          end
        START:
          state <= TRANS;
        TRANS:
          if (bitCounter == 11) begin
            state <= IDLE;
          end else begin
            state <= TRANS;
          end
        default:
          state <= IDLE;
      endcase
    end
  end

  //Orders assign
  assign load = (state == START) ? 1 : 0;
  assign baud_en = (state == IDLE) ? 0 : 1;

  //Init
  always @(posedge clk)
    reset <= 1;

endmodule
