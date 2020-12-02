module modulo (
    input Clock,
    input Reset,
    input a,  
    input b,  
    output out
  );

  /* Combinational Logic */
  always @* begin
    out = a % b;
  end
  
  /* Sequential Logic */
  always @(posedge clk) begin
    if (rst) begin
      // Add flip-flop reset values here
    end else begin
      // Add flip-flop q <= d statements here
    end
  end
  
endmodule
