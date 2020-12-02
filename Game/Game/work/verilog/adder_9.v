/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module adder_9 (
    input [15:0] a,
    input [15:0] b,
    input [5:0] alufn,
    output reg [15:0] out,
    output reg [0:0] z,
    output reg [0:0] v,
    output reg [0:0] n
  );
  
  
  
  reg [15:0] s;
  
  always @* begin
    s = 16'h0000;
    
    case (alufn[0+1-:2])
      2'h0: begin
        s = a + b;
      end
      2'h1: begin
        s = a - b;
      end
      2'h2: begin
        s = a * b;
      end
      2'h3: begin
        s = a / b;
      end
      default: begin
        s = 16'h0000;
      end
    endcase
    n = s[15+0-:1];
    v = (a[15+0-:1] & (b[15+0-:1] ^ alufn[0+0-:1]) & !s[15+0-:1]) | (!a[15+0-:1] & !(b[15+0-:1] ^ alufn[0+0-:1]) & s[15+0-:1]);
    z = (~|s);
    out = s;
  end
endmodule
