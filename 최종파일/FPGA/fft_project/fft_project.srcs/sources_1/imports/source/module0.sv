`timescale 1ns/1ps

module module0 (
	input clk,
	input rstn,
	input valid,
	input logic signed [8:0] din_R [0:15],
	input logic signed [8:0] din_Q [0:15],

	output logic signed [10:0] dout_R [0:15],
	output logic signed [10:0] dout_Q [0:15],
	output logic valid_mod1,

	output logic [4:0] cbfp0_scale_fac,
	output logic cbfp0_mem_push
);


	//MOD00
	logic w_alert_mod01;
	logic signed [9:0] w_dout_R_add_00 [0:15];
	logic signed [9:0] w_dout_Q_add_00 [0:15];
	logic signed [9:0] w_dout_R_sub_00 [0:15];
	logic signed [9:0] w_dout_Q_sub_00 [0:15];

	mod0_0 #(
	.DATA_WIDTH(9),
	.NUM_IN_OUT(16)
	)U_MOD00(
	.clk(clk),
	.rstn(rstn),
	.valid(valid),
	.din_i(din_R),
	.din_q(din_Q),

	.dout_R_add_00(w_dout_R_add_00),
	.dout_R_sub_00(w_dout_R_sub_00),
	.dout_Q_add_00(w_dout_Q_add_00),
	.dout_Q_sub_00(w_dout_Q_sub_00),

	.alert_mod01(w_alert_mod01)
	);


	//MOD01
	logic w_alert_mod02;	
	logic signed [12:0] w_dout_R_add_01 [0:15];
	logic signed [12:0] w_dout_Q_add_01 [0:15];
	logic signed [12:0] w_dout_R_sub_01 [0:15];
	logic signed [12:0] w_dout_Q_sub_01 [0:15];

	mod0_1 U_MOD01(
	.clk(clk),
	.rstn(rstn),
	.alert_mod01(w_alert_mod01),

	.din_R_add00(w_dout_R_add_00),
	.din_Q_add00(w_dout_Q_add_00),
	.din_R_sub00(w_dout_R_sub_00),
	.din_Q_sub00(w_dout_Q_sub_00),

	.dout_R_add01(w_dout_R_add_01),
	.dout_Q_add01(w_dout_Q_add_01),
	.dout_R_sub01(w_dout_R_sub_01),
	.dout_Q_sub01(w_dout_Q_sub_01),

	.alert_mod02(w_alert_mod02)
	);

	//MOD02
	logic w_alert_cbfp;
	logic signed [22:0] w_dout_R_add_02 [0:15];
	logic signed [22:0] w_dout_Q_add_02 [0:15];
	logic signed [22:0] w_dout_R_sub_02 [0:15];
	logic signed [22:0] w_dout_Q_sub_02 [0:15];

	mod0_2 U_MOD02(
	.clk(clk),
	.rstn(rstn),
	.alert_mod02(w_alert_mod02),

	//bfly01 13bit <7.6>
	.din_R_add02(w_dout_R_add_01),
	.din_Q_add02(w_dout_Q_add_01), 
	.din_R_sub02(w_dout_R_sub_01),
	.din_Q_sub02(w_dout_Q_sub_01),

	//bfly02 23bit <10.13>
	.dout_R_add02(w_dout_R_add_02),
	.dout_Q_add02(w_dout_Q_add_02),
	.dout_R_sub02(w_dout_R_sub_02),
	.dout_Q_sub02(w_dout_Q_sub_02),

	.alert_CBFP(w_alert_cbfp)
	);

	//CBFP0
	cbfp0 U_CBFP0(
	.clk(clk),
	.rstn(rstn),
	.alert_cbfp(w_alert_cbfp),

	.din_R_add_CBFP(w_dout_R_add_02),
	.din_Q_add_CBFP(w_dout_Q_add_02),
	.din_R_sub_CBFP(w_dout_R_sub_02),
	.din_Q_sub_CBFP(w_dout_Q_sub_02),

	.dout_R_CBFP(dout_R),
	.dout_Q_CBFP(dout_Q),
	.valid_mod1(valid_mod1),

	.cbfp0_scale_fac(cbfp0_scale_fac),
	.cbfp0_mem_push(cbfp0_mem_push)
	);
	
endmodule