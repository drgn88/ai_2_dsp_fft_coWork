`timescale 1ns/1ps

module mod1_2 (
	input clk,
	input rstn,
	input alert_mod11,

	input signed [14:0] din_R_add_1[7:0],
	input signed [14:0] din_R_add_2[7:0],
    input signed [14:0] din_R_sub_1[7:0],
	input signed [14:0] din_R_sub_2[7:0],

    input signed [14:0] din_Q_add_1[7:0],
	input signed [14:0] din_Q_add_2[7:0],
    input signed [14:0] din_Q_sub_1[7:0],
    input signed [14:0] din_Q_sub_2[7:0],

	output logic signed [24:0] dout_R1_add[7:0],
    output logic signed [24:0] dout_R1_sub[7:0],
	output logic signed [24:0] dout_R2_add[7:0],
    output logic signed [24:0] dout_R2_sub[7:0],

    output logic signed [24:0] dout_Q1_add[7:0],
    output logic signed [24:0] dout_Q1_sub[7:0],
    output logic signed [24:0] dout_Q2_add[7:0],
    output logic signed [24:0] dout_Q2_sub[7:0],

	output logic alert_mod12
);

	logic w_bf_en;
	logic w_mul_en;
	logic [8:0] w_addr;

	cu_mod1_2 U_CU_MOD12(
	.clk(clk),
	.rstn(rstn),
	.alert_mod11(alert_mod11),

	.bf_en(w_bf_en),
	.mul_en(w_mul_en),
	.addr(w_addr),
	.alert_mod12(alert_mod12)
	);

	logic signed [15:0] bf_R1_add [7:0];
	logic signed [15:0] bf_R1_sub [7:0];
	logic signed [15:0] bf_Q1_add [7:0];
	logic signed [15:0] bf_Q1_sub [7:0];

	logic signed [15:0] bf_R2_add [7:0];
	logic signed [15:0] bf_R2_sub [7:0];
	logic signed [15:0] bf_Q2_add [7:0];
	logic signed [15:0] bf_Q2_sub [7:0];

	BF2I_8bundle #(
	.WIDTH(15),
	.DEPTH(8)
	) BF2I_RIN_ADD_MOD12(
	.clk(clk),
	.rstn(rstn),
	.en(w_bf_en),

	.din_R_1(din_R_add_1),
	.din_R_2(din_R_add_2),
	// .din_R_1(din_R_add_1),
	// .din_R_2(din_R_add_2),

    .din_Q_1(din_Q_add_1),
	.din_Q_2(din_Q_add_2),

	.dout_R_add(bf_R1_add),
	.dout_R_sub(bf_R1_sub),

	.dout_Q_add(bf_Q1_add),
	.dout_Q_sub(bf_Q1_sub)
	);

	BF2I_8bundle #(
	.WIDTH(15),
	.DEPTH(8)
	) BF2I_RIN_SUB_MOD12(
	.clk(clk),
	.rstn(rstn),
	.en(w_bf_en),

	.din_R_1(din_R_sub_1),
	.din_R_2(din_R_sub_2),

    .din_Q_1(din_Q_sub_1),
	.din_Q_2(din_Q_sub_2),

	.dout_R_add(bf_R2_add),
	.dout_R_sub(bf_R2_sub),

	.dout_Q_add(bf_Q2_add),
	.dout_Q_sub(bf_Q2_sub)
	);

	mul_fac8_2_mod12 FAC82_ADD_MOD12(
	.clk(clk),
	.rstn(rstn),
	.en(w_mul_en),
	.addr(w_addr),

	.din_R_add(bf_R1_add),
	.din_R_sub(bf_R1_sub),
	.din_Q_add(bf_Q1_add),
	.din_Q_sub(bf_Q1_sub),
    
	.dout_R_add(dout_R1_add),
    .dout_Q_add(dout_Q1_add),
    .dout_R_sub(dout_R1_sub),
    .dout_Q_sub(dout_Q1_sub)
	);

	mul_fac8_2_mod12 FAC82_SUB_MOD12(
	.clk(clk),
	.rstn(rstn),
	.en(w_mul_en),
	.addr((w_addr + 9'd16)),

	.din_R_add(bf_R2_add),
	.din_R_sub(bf_R2_sub),
	.din_Q_add(bf_Q2_add),
	.din_Q_sub(bf_Q2_sub),
    
	.dout_R_add(dout_R2_add),
    .dout_Q_add(dout_Q2_add),
    .dout_R_sub(dout_R2_sub),
    .dout_Q_sub(dout_Q2_sub)
	);
	
endmodule