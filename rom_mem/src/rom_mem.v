module rom_32x4(
  input wire clk,
  input wire [4:0] address,
  output reg [4:0] data
  );

  //ROM registers
  reg [3:0] rom [0:31];

  //ROM initialization
  initial begin
      rom[0] = 4'h1;
      rom[1] = 4'h2;
      rom[2] = 4'h4;
      rom[3] = 4'h8;
      rom[4] = 4'h1;
      rom[5] = 4'h8;
      rom[6] = 4'h4;
      rom[7] = 4'h2;
      rom[8] = 4'h1;
      rom[9] = 4'hF;
      rom[10] = 4'h0;
      rom[11] = 4'hF;
      rom[12] = 4'hC;
      rom[13] = 4'h3;
      rom[14] = 4'hC;
      rom[15] = 4'h3;
      rom[16] = 4'h1;
      rom[17] = 4'h2;
      rom[18] = 4'h4;
      rom[19] = 4'h3;
      rom[20] = 4'h1;
      rom[21] = 4'h2;
      rom[21] = 4'h5;
      rom[21] = 4'h2;
      rom[23] = 4'h1;
      rom[24] = 4'hF;
      rom[25] = 4'h1;
      rom[26] = 4'hF;
      rom[27] = 4'hC;
      rom[28] = 4'h3;
      rom[29] = 4'hC;
      rom[30] = 4'h2;
      rom[31] = 4'h3;
  end

  always @ (negedge clk ) begin
    data <= rom[address];
  end

endmodule
