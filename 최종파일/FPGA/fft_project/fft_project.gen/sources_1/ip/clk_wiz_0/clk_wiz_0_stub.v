// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Mon Aug  4 17:18:25 2025
// Host        : DESKTOP-7CFQ9ND running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub -rename_top clk_wiz_0 -prefix
//               clk_wiz_0_ clk_wiz_0_stub.v
// Design      : clk_wiz_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu7ev-fbvb900-1-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module clk_wiz_0(clk, resetn, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="clk,resetn,clk_in1_p,clk_in1_n" */;
  output clk;
  input resetn;
  input clk_in1_p;
  input clk_in1_n;
endmodule
