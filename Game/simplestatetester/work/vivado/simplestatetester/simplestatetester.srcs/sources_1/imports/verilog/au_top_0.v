/*
   This file was generated automatically by Alchitry Labs version 1.2.1.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module au_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input usb_rx,
    output reg usb_tx,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip
  );
  
  
  
  reg rst;
  
  reg [1:0] coin;
  
  reg collect;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [(3'h5+0)-1:0] M_edge_det_out;
  reg [(3'h5+0)-1:0] M_edge_det_in;
  
  genvar GEN_edge_det0;
  generate
  for (GEN_edge_det0=0;GEN_edge_det0<3'h5;GEN_edge_det0=GEN_edge_det0+1) begin: edge_det_gen_0
    edge_detector_2 edge_det (
      .clk(clk),
      .in(M_edge_det_in[GEN_edge_det0*(1)+(1)-1-:(1)]),
      .out(M_edge_det_out[GEN_edge_det0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [(3'h5+0)-1:0] M_btn_cnd_out;
  reg [(3'h5+0)-1:0] M_btn_cnd_in;
  
  genvar GEN_btn_cnd0;
  generate
  for (GEN_btn_cnd0=0;GEN_btn_cnd0<3'h5;GEN_btn_cnd0=GEN_btn_cnd0+1) begin: btn_cnd_gen_0
    button_conditioner_3 btn_cnd (
      .clk(clk),
      .in(M_btn_cnd_in[GEN_btn_cnd0*(1)+(1)-1-:(1)]),
      .out(M_btn_cnd_out[GEN_btn_cnd0*(1)+(1)-1-:(1)])
    );
  end
  endgenerate
  wire [1-1:0] M_sutdcm_dispense;
  wire [2-1:0] M_sutdcm_change;
  wire [1-1:0] M_sutdcm_display;
  wire [1-1:0] M_sutdcm_test;
  reg [2-1:0] M_sutdcm_coin;
  finitesm_4 sutdcm (
    .clk(clk),
    .rst(rst),
    .coin(M_sutdcm_coin),
    .dispense(M_sutdcm_dispense),
    .change(M_sutdcm_change),
    .display(M_sutdcm_display),
    .test(M_sutdcm_test)
  );
  reg M_displaylatch_d, M_displaylatch_q = 1'h0;
  reg [1:0] M_changelatch_d, M_changelatch_q = 1'h0;
  reg M_dispenselatch_d, M_dispenselatch_q = 1'h0;
  
  always @* begin
    M_changelatch_d = M_changelatch_q;
    M_dispenselatch_d = M_dispenselatch_q;
    M_displaylatch_d = M_displaylatch_q;
    
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    usb_tx = usb_rx;
    led = 8'h00;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_btn_cnd_in = io_button;
    M_edge_det_in = M_btn_cnd_out;
    coin = 1'h0;
    collect = 1'h0;
    if (M_edge_det_out == 5'h01) begin
      coin = 2'h1;
    end else begin
      if (M_edge_det_out == 5'h10) begin
        coin = 2'h2;
      end else begin
        if (M_edge_det_out == 5'h04) begin
          coin = 2'h3;
        end else begin
          if (M_edge_det_out == 5'h08) begin
            collect = 1'h1;
          end
        end
      end
    end
    M_sutdcm_coin = coin;
    io_led[16+7+0-:1] = M_sutdcm_test;
    io_led[16+0+0-:1] = M_displaylatch_q;
    io_led[8+0+1-:2] = M_changelatch_q;
    io_led[0+0+0-:1] = M_dispenselatch_q;
    M_dispenselatch_d = M_dispenselatch_q;
    M_changelatch_d = M_changelatch_q;
    M_displaylatch_d = M_displaylatch_q;
    if (M_sutdcm_dispense != 1'h0) begin
      M_dispenselatch_d = M_sutdcm_dispense;
    end
    if (M_sutdcm_change != 1'h0) begin
      M_changelatch_d = M_sutdcm_change;
    end
    if (M_sutdcm_display != 1'h0) begin
      M_displaylatch_d = M_sutdcm_display;
    end
    if (collect == 1'h1) begin
      M_dispenselatch_d = 1'h0;
      M_changelatch_d = 1'h0;
    end
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_displaylatch_q <= 1'h0;
      M_changelatch_q <= 1'h0;
      M_dispenselatch_q <= 1'h0;
    end else begin
      M_displaylatch_q <= M_displaylatch_d;
      M_changelatch_q <= M_changelatch_d;
      M_dispenselatch_q <= M_dispenselatch_d;
    end
  end
  
endmodule
