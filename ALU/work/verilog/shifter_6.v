/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module shifter_6 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out
  );
  
  
  
  reg num_bits;
  reg [15:0] expr;
  
  always @* begin
    out = 1'h0;
    num_bits = b[4+0-:1] * 5'h10 + b[3+0-:1] * 4'h8 + b[2+0-:1] * 3'h4 + b[1+0-:1] * 2'h2 + b[0+0-:1] * 1'h1;
    expr[0+15-:16] = $signed(a[0+15-:16]);
    if ({alufn[1+0-:1], alufn[0+0-:1]} == 2'h0) begin
      out[0+15-:16] = expr[0+15-:16] << num_bits;
    end
    if ({alufn[1+0-:1], alufn[0+0-:1]} == 2'h1) begin
      out[0+15-:16] = expr[0+15-:16] >> num_bits;
    end
    if ({alufn[1+0-:1], alufn[0+0-:1]} == 2'h2) begin
      out[0+15-:16] = expr[0+15-:16] <<< num_bits;
    end
    if ({alufn[1+0-:1], alufn[0+0-:1]} == 2'h3) begin
      out[0+15-:16] = expr[0+15-:16] >>> num_bits;
    end
  end
endmodule