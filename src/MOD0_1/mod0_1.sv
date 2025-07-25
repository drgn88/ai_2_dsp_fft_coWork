`timescale 1ns/1ps

module mod0_1 (
	input clk,
	input rstn,
	input alert_mod01,

	input signed [9:0] din_R_add00 [0:15],
	input signed [9:0] din_Q_add00 [0:15],
	input signed [9:0] din_R_sub00 [0:15],
	input signed [9:0] din_Q_sub00 [0:15],

	output logic signed [12:0] dout_R_add01 [0:15],
	output logic signed [12:0] dout_Q_add01 [0:15],
	output logic signed [12:0] dout_R_sub01 [0:15],
	output logic signed [12:0] dout_Q_sub01 [0:15],

	output logic alert_mod02
);

	//내부 제어신호
	logic w_mux_sel;
	logic w_bf_en01;
	logic w_en_fac8_1;
	logic [1:0] w_mul_val_sel;

	logic signed [9:0] w_R_sub00 [0:15];
	logic signed [9:0] w_Q_sub00 [0:15];

	logic signed [9:0] w_mux_R_01 [0:15];
	logic signed [9:0] w_mux_Q_01 [0:15];

	logic signed [9:0] din_bf01_R_01 [0:15];
	logic signed [9:0] din_bf01_Q_01 [0:15];

	logic signed [10:0] bf01_R_add [0:15];
	logic signed [10:0] bf01_Q_add [0:15];
	logic signed [10:0] bf01_R_sub [0:15];
	logic signed [10:0] bf01_Q_sub [0:15];

	cu_mod0_1 U_CU_MOD01(
	.clk(clk),
	.rstn(rstn),
	.alert_mod01(alert_mod01),

	.mux_sel(w_mux_sel),
	.bf_en01(w_bf_en01),
	.en_fac8_1(w_en_fac8_1),
	.mul_val_sel(w_mul_val_sel),
	.alert_mod02(alert_mod02)
	);

	// 뺄셈부 저장 레지스터
	shift_reg #(
	.DATA_WIDTH(10),
	.NUM_IN_OUT(16),
	.REG_DEPTH(16)
	) U_SHIFT_REG01_SUB_256(
	.clk(clk),
	.rstn(rstn),
	.din_i(din_R_sub00),
	.din_q(din_Q_sub00),

	.dout_i(w_R_sub00),
	.dout_q(w_Q_sub00)
	);

	//SR = SHIFT REGISTER
	mux_32_to_16 U_MUX_SR01(
	.mux_sel(w_mux_sel),

	.din_R_add00(din_R_add00),
	.din_Q_add00(din_Q_add00),
	.din_R_sub00(w_R_sub00),
	.din_Q_sub00(w_Q_sub00),
	
	.din_R_01(w_mux_R_01),
	.din_Q_01(w_mux_Q_01)
	);

	shift_reg #(
	.DATA_WIDTH(10),
	.NUM_IN_OUT(16),
	.REG_DEPTH(8)
	) U_SHIFT_REG01_128(
	.clk(clk),
	.rstn(rstn),
	.din_i(w_mux_R_01),
	.din_q(w_mux_Q_01),

	.dout_i(din_bf01_R_01),
	.dout_q(din_bf01_Q_01)
	);

	BF2I #(
    .WIDTH(10),
    .DEPTH(16)
	) U_BF2I_01(
    .clk(clk),
    .rst_n(rstn),
    .en(w_bf_en01),
    .din_R1(din_bf01_R_01),
    .din_R2(w_mux_R_01), 
    .din_Q1(din_bf01_Q_01),
    .din_Q2(w_mux_Q_01),

    .dout_R_add(bf01_R_add),
    .dout_R_sub(bf01_R_sub),
    .dout_Q_add(bf01_Q_add), 
    .dout_Q_sub(bf01_Q_sub) 
	);

	mul_fac8_1 #(
    .WIDTH(11),                     // <5.6>
    .TWF_WIDTH(10),                     // <2.8>
    .MUL_WIDTH(21),      // <7.14>
    .DOUT_WIDTH(13),  // <7.6>
    .DEPTH(16)
	) U_MUL01_FAC8_1(
    .clk(clk),
    .rst_n(rstn),
    .select(w_mul_val_sel),
    .en(w_en_fac8_1),
    .din_R_add(bf01_R_add),
    .din_R_sub(bf01_R_sub),
    .din_Q_add(bf01_Q_add),
    .din_Q_sub(bf01_Q_sub),

    .dout_R_add(dout_R_add01),
    .dout_R_sub(dout_R_sub01),
    .dout_Q_add(dout_Q_add01),
    .dout_Q_sub(dout_Q_sub01)
	);

endmodule