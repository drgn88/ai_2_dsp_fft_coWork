`timescale 1ns/1ps

module mod1_0 (
	input clk,
	input rstn,
	input valid,

	input signed [10:0] d_in_R [0:15],
	input signed [10:0] d_in_Q [0:15],

	output logic signed [11:0] dout_R_add_10 [0:15],
	output logic signed [11:0] dout_Q_add_10 [0:15],
	output logic signed [11:0] dout_R_sub_10 [0:15],
	output logic signed [11:0] dout_Q_sub_10 [0:15],

	output logic alert_mod10
);
	
	logic w_bf_en;
	logic w_valid_fac8_0;
	logic w_alert_mod10;

	cu_mod1_0 U_CU_MOD10(
	.clk(clk),
	.rstn(rstn),
	.valid(valid),

	.bf_en(w_bf_en),
	.valid_fac8_0(w_valid_fac8_0),
	.alert_mod10(alert_mod10)
	);

	logic signed [10:0] sout_R [0:15];
	logic signed [10:0] sout_Q [0:15];

	shift_reg #(
	.DATA_WIDTH(11),
	.NUM_IN_OUT(16),
	.REG_DEPTH(2)
	) U_SHIFT_REG_32(
	.clk(clk),
	.rstn(rstn),
	.din_i(d_in_R),
	.din_q(d_in_Q),

	.dout_i(sout_R),
	.dout_q(sout_Q)
	);


	logic signed [11:0] bf_R_add [0:15];
	logic signed [11:0] bf_Q_add [0:15];
	logic signed [11:0] bf_R_sub [0:15];
	logic signed [11:0] bf_Q_sub [0:15];
	BF2I #(
    .WIDTH(11),
    .DEPTH(16)
	) U_BF2I_MOD10(
    .clk(clk),
    .rst_n(rstn),
    .en(w_bf_en),
    .din_R1(sout_R),
    .din_R2(d_in_R), 
    .din_Q1(sout_Q),
    .din_Q2(d_in_Q),
	
    .dout_R_add(bf_R_add),
    .dout_R_sub(bf_R_sub),
    .dout_Q_add(bf_Q_add), 
    .dout_Q_sub(bf_Q_sub) 
	);

	mul_fac8_0 #(
    .WIDTH(12),
    .DEPTH(16)
	) MUL_FAC80_MOD11(
    .clk(clk),
    .rst_n(rstn),
    .en(w_valid_fac8_0),
    .din_R_add(bf_R_add),
    .din_R_sub(bf_R_sub),
    .din_Q_add(bf_Q_add),
    .din_Q_sub(bf_Q_sub),

    .dout_R_add(dout_R_add_10),
    .dout_R_sub(dout_R_sub_10),
    .dout_Q_add(dout_Q_add_10),
    .dout_Q_sub(dout_Q_sub_10)
	);
endmodule