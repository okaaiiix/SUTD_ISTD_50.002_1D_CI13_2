/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module finitesm_4 (
    input clk,
    input rst,
    input [1:0] coin,
    output reg dispense,
    output reg [1:0] change,
    output reg display,
    output reg test
  );
  
  
  
  localparam NOCOIN_cm = 1'd0;
  localparam COIN_cm = 1'd1;
  
  reg M_cm_d, M_cm_q = NOCOIN_cm;
  
  always @* begin
    M_cm_d = M_cm_q;
    
    dispense = 1'h0;
    change = 1'h0;
    display = 1'h0;
    test = M_cm_q;
    
    case (M_cm_q)
      NOCOIN_cm: begin
        if (coin == 2'h2) begin
          M_cm_d = NOCOIN_cm;
          dispense = 1'h1;
          change = 1'h0;
          display = 1'h0;
        end else begin
          if (coin == 2'h1) begin
            M_cm_d = COIN_cm;
            dispense = 1'h0;
            change = 1'h0;
            display = 1'h1;
          end else begin
            M_cm_d = NOCOIN_cm;
            dispense = 1'h0;
            change = coin;
            display = 1'h0;
          end
        end
      end
      COIN_cm: begin
        if (coin == 2'h1) begin
          M_cm_d = NOCOIN_cm;
          dispense = 1'h1;
          change = 1'h0;
          display = 1'h0;
        end else begin
          if (coin == 2'h2) begin
            M_cm_d = NOCOIN_cm;
            dispense = 1'h1;
            change = 2'h1;
            display = 1'h0;
          end else begin
            M_cm_d = COIN_cm;
            dispense = 1'h0;
            change = coin;
            display = 1'h1;
          end
        end
      end
    endcase
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_cm_q <= 1'h0;
    end else begin
      M_cm_q <= M_cm_d;
    end
  end
  
endmodule
