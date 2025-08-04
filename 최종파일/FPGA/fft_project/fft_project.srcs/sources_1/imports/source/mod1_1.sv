`timescale 1ns/1ps

module mod1_1 (
	input clk,
	input rstn,
	input alert_mod10,
	input signed [11:0] din_R_add_10 [0:15],
	input signed [11:0] din_Q_add_10 [0:15],
	input signed [11:0] din_R_sub_10 [0:15],
	input signed [11:0] din_Q_sub_10 [0:15],

	output logic signed [14:0] dout_R_add_1[7:0],
	output logic signed [14:0] dout_R_add_2[7:0],
    output logic signed [14:0] dout_R_sub_1[7:0],
	output logic signed [14:0] dout_R_sub_2[7:0],

    output logic signed [14:0] dout_Q_add_1[7:0],
	output logic signed [14:0] dout_Q_add_2[7:0],
    output logic signed [14:0] dout_Q_sub_1[7:0],
    output logic signed [14:0] dout_Q_sub_2[7:0],

	output logic alert_mod11
);
	logic w_cnt_ctrl;
	logic w_mux_sel;
	logic w_en_fac8_1;
	logic w_mul_val_sel;
	
	cu_mod1_1 U_CU_MOD11(
	.clk(clk),
	.rstn(rstn),
	.alert_mod10(alert_mod10),

	.cnt_ctrl(w_cnt_ctrl),
	.mux_sel(w_mux_sel),
	.en_fac8_1(w_en_fac8_1),
	.mul_val_sel(w_mul_val_sel),
	.alert_mod11(alert_mod11)
	);
	
	logic signed [11:0] sout_R_sub [0:15];
	logic signed [11:0] sout_Q_sub [0:15];
	shift_reg #(
	.DATA_WIDTH(12),
	.NUM_IN_OUT(16),
	.REG_DEPTH(2)
	) U_SHIFT_SUB_32_11(
	.clk(clk),
	.rstn(rstn),
	.din_i(din_R_sub_10),
	.din_q(din_Q_sub_10),

	.dout_i(sout_R_sub),
	.dout_q(sout_Q_sub)
	);



	logic signed [11:0] mout_R [0:15];
	logic signed [11:0] mout_Q [0:15];
	mux_32_to_16 #(
	.DATA_WIDTH(12)
	) MUX_MOD11(
	.mux_sel(w_mux_sel),

	.din_R_add00(din_R_add_10),
	.din_Q_add00(din_Q_add_10),
	.din_R_sub00(sout_R_sub),
	.din_Q_sub00(sout_Q_sub),
	
	.din_R_01(mout_R),
	.din_Q_01(mout_Q)
	);


	logic signed [11:0] reg_out_R [0:15];
	logic signed [11:0] reg_out_Q [0:15];
	shift_reg16_mod11 #(
    .DATA_WIDTH(12),
    .NUM_IN_OUT(16)
	) U_SHIFT_REG_16_11(
    .clk(clk),
    .rstn(rstn),
    .din_i(mout_R),
    .din_q(mout_Q),

    .dout_i(reg_out_R),
    .dout_q(reg_out_Q)
	);

	logic signed [12:0] bf_out_R_add [0:15];
	logic signed [12:0] bf_out_Q_add [0:15];
	logic signed [12:0] bf_out_R_sub [0:15];
	logic signed [12:0] bf_out_Q_sub [0:15];
	BF2I #(
    .WIDTH(12),
    .DEPTH(16)
	)U_BF2I_11(
    .clk(clk),
    .rst_n(rstn),
    .en(w_cnt_ctrl),
    .din_R1(reg_out_R),
    .din_R2(mout_R), 
    .din_Q1(reg_out_Q),
    .din_Q2(mout_Q),

    .dout_R_add(bf_out_R_add),
    .dout_R_sub(bf_out_R_sub),
    .dout_Q_add(bf_out_Q_add), 
    .dout_Q_sub(bf_out_Q_sub) 
	);

	logic signed [12:0] w_din_R_add_1[0:7];
	logic signed [12:0] w_din_R_add_2[0:7];
    logic signed [12:0] w_din_R_sub_1[0:7];
	logic signed [12:0] w_din_R_sub_2[0:7];

    logic signed [12:0] w_din_Q_add_1[0:7];
	logic signed [12:0] w_din_Q_add_2[0:7];
    logic signed [12:0] w_din_Q_sub_1[0:7];
	logic signed [12:0] w_din_Q_sub_2[0:7];

	assign w_din_R_add_2 = bf_out_R_add[0:7];
	assign w_din_R_add_1 = bf_out_R_add[8:15];
	assign w_din_R_sub_2 = bf_out_R_sub[0:7];
	assign w_din_R_sub_1 = bf_out_R_sub[8:15];

	assign w_din_Q_add_2 = bf_out_Q_add[0:7];
	assign w_din_Q_add_1 = bf_out_Q_add[8:15];
	assign w_din_Q_sub_2 = bf_out_Q_sub[0:7];
	assign w_din_Q_sub_1 = bf_out_Q_sub[8:15];

	mul_fac8_1_mod11 #(
    .WIDTH      (13),                     // <5.6>
    .TWF_WIDTH (10),                     // <2.8>
    .MUL_WIDTH (23),      // <7.14>
    .DOUT_WIDTH (15),  // <7.6>
    .DEPTH     (8)
	) U_MUL_FAC8_1_MOD11(
    .clk(clk),
    .rst_n(rstn),
    .select(w_mul_val_sel),
    .en(w_en_fac8_1),
    .din_R_add_1(w_din_R_add_1),
	.din_R_add_2(w_din_R_add_2),
    .din_R_sub_1(w_din_R_sub_1),
	.din_R_sub_2(w_din_R_sub_2),

    .din_Q_add_1(w_din_Q_add_1),
	.din_Q_add_2(w_din_Q_add_2),
    .din_Q_sub_1(w_din_Q_sub_1),
	.din_Q_sub_2(w_din_Q_sub_2),

    .dout_R_add_1(dout_R_add_1),
	.dout_R_add_2(dout_R_add_2),
    .dout_R_sub_1(dout_R_sub_1),
	.dout_R_sub_2(dout_R_sub_2),

    .dout_Q_add_1(dout_Q_add_1),
	.dout_Q_add_2(dout_Q_add_2),
    .dout_Q_sub_1(dout_Q_sub_1),
    .dout_Q_sub_2(dout_Q_sub_2)
	);
endmodule