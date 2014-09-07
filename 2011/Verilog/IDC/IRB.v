`timescale 1 ns/10 ps

module IRB (CLK, WENn, A, D);
    parameter WORD_WIDTH = 8;
    parameter WORD_DEPTH = 64;
    parameter ADDR_WIDTH = 6;
    
    input CLK, WENn;
    input [ADDR_WIDTH-1:0] A;
    input [WORD_WIDTH-1:0] D;
    
    reg [WORD_WIDTH-1:0] mem [WORD_DEPTH-1:0];
    reg [WORD_WIDTH-1:0] Q;
    
    always@(posedge CLK)
    if (!WENn)
	   mem[A] <= D;
    
endmodule
