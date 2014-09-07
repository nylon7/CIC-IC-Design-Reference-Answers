`define tb1

`ifdef tb1
  `define IMAGE "image1.dat"
`endif


`ifdef tb2
  `define IMAGE "image2.dat"
`endif

`timescale 1 ns/10 ps

module IROM(CLK, CEN, A, Q);
  input CLK;
  input CEN;
  input [5:0] A;
  output [7:0] Q;

  reg [7:0] mem [63:0];
  reg [5:0] add;
  reg [7:0] Q;

  initial
    $readmemb(`IMAGE,mem);

  always @(negedge CLK)
    if (!CEN)
      add <= A;

  always @(negedge CLK)
      Q <= mem[add];

endmodule
