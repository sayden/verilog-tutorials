module ram_mem(
  input wire clk,
  input wire [3:0] address,
  input wire mode,
  input wire [3:0] data,
  output reg [3:0] out
  );

  reg [3:0] ram [0:15];

  initial begin
    ram[0] = 4'd0;
    ram[1] = 4'd1;
    ram[2] = 4'd2;
    ram[3] = 4'd3;
    ram[4] = 4'd4;
    ram[5] = 4'd5;
    ram[6] = 4'd6;
    ram[7] = 4'd7;
    ram[8] = 4'd8;
    ram[9] = 4'd9;
    ram[10] = 4'd10;
    ram[11] = 4'd11;
    ram[12] = 4'd12;
    ram[13] = 4'd13;
    ram[14] = 4'd14;
    ram[15] = 4'd15;
  end

  always @ ( posedge clk ) begin
    if(mode == 0) begin   //Read
      out <= ram[address];
    end
  end

  always @ ( posedge clk ) begin
    if (mode == 1) begin   //Write
      ram[address] <= data;
      out <= 0;
    end
  end

endmodule
