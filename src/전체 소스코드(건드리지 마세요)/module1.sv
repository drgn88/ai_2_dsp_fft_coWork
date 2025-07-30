`timescale 1ns/1ps

module module1 (
	input clk,
	input rstn,
	input valid,

	input signed [10:0] d_in_R [0:15],
	input signed [10:0] d_in_Q [0:15],

	output logic signed [11:0] dout_R1_add [7:0],
    output logic signed [11:0] dout_R1_sub [7:0],
	output logic signed [11:0] dout_R2_add [7:0],
    output logic signed [11:0] dout_R2_sub [7:0],

    output logic signed [11:0] dout_Q1_add [7:0],
    output logic signed [11:0] dout_Q1_sub [7:0],
    output logic signed [11:0] dout_Q2_add [7:0],
    output logic signed [11:0] dout_Q2_sub [7:0],

	output logic alert_cbfp1
);

/////////////////////////////////////////////////////////////////////////////
//								MODULE1_0								   //
/////////////////////////////////////////////////////////////////////////////

	logic signed [11:0] w_dout_R_add_10 [0:15];
	logic signed [11:0] w_dout_Q_add_10 [0:15];
	logic signed [11:0] w_dout_R_sub_10 [0:15];
	logic signed [11:0] w_dout_Q_sub_10 [0:15];

	logic w_alert_mod10;

	mod1_0 MOD1_0(
	.clk(clk),
	.rstn(rstn),
	.valid(valid),

	.d_in_R(d_in_R),
	.d_in_Q(d_in_Q),

	.dout_R_add_10(w_dout_R_add_10),
	.dout_Q_add_10(w_dout_Q_add_10),
	.dout_R_sub_10(w_dout_R_sub_10),
	.dout_Q_sub_10(w_dout_Q_sub_10),

	.alert_mod10(w_alert_mod10)
	);
	
/////////////////////////////////////////////////////////////////////////////
//								MODULE1_1								   //
/////////////////////////////////////////////////////////////////////////////

	logic signed [14:0] w_dout_R_add_1[7:0];
	logic signed [14:0] w_dout_R_add_2[7:0];
    logic signed [14:0] w_dout_R_sub_1[7:0];
	logic signed [14:0] w_dout_R_sub_2[7:0];

    logic signed [14:0] w_dout_Q_add_1[7:0];
	logic signed [14:0] w_dout_Q_add_2[7:0];
    logic signed [14:0] w_dout_Q_sub_1[7:0];
    logic signed [14:0] w_dout_Q_sub_2[7:0];

	logic w_alert_mod11;

	mod1_1 MOD1_1(
	.clk(clk),
	.rstn(rstn),
	.alert_mod10(w_alert_mod10),
	.din_R_add_10(w_dout_R_add_10),
	.din_Q_add_10(w_dout_Q_add_10),
	.din_R_sub_10(w_dout_R_sub_10),
	.din_Q_sub_10(w_dout_Q_sub_10),

	.dout_R_add_1(w_dout_R_add_1),
	.dout_R_add_2(w_dout_R_add_2),
    .dout_R_sub_1(w_dout_R_sub_1),
	.dout_R_sub_2(w_dout_R_sub_2),

    .dout_Q_add_1(w_dout_Q_add_1),
	.dout_Q_add_2(w_dout_Q_add_2),
    .dout_Q_sub_1(w_dout_Q_sub_1),
    .dout_Q_sub_2(w_dout_Q_sub_2),

	.alert_mod11(w_alert_mod11)
	);

/////////////////////////////////////////////////////////////////////////////
//								MODULE1_2								   //
/////////////////////////////////////////////////////////////////////////////

	logic signed [24:0] w_dout_R1_add[7:0];
    logic signed [24:0] w_dout_R1_sub[7:0];
	logic signed [24:0] w_dout_R2_add[7:0];
    logic signed [24:0] w_dout_R2_sub[7:0];

    logic signed [24:0] w_dout_Q1_add[7:0];
    logic signed [24:0] w_dout_Q1_sub[7:0];
    logic signed [24:0] w_dout_Q2_add[7:0];
    logic signed [24:0] w_dout_Q2_sub[7:0];

	logic w_alert_mod12;

	mod1_2 MOD1_2(
	.clk(clk),
	.rstn(rstn),
	.alert_mod11(w_alert_mod11),

	.din_R_add_1(w_dout_R_add_1),
	.din_R_add_2(w_dout_R_add_2),
    .din_R_sub_1(w_dout_R_sub_1),
	.din_R_sub_2(w_dout_R_sub_2),

    .din_Q_add_1(w_dout_Q_add_1),
	.din_Q_add_2(w_dout_Q_add_2),
    .din_Q_sub_1(w_dout_Q_sub_1),
    .din_Q_sub_2(w_dout_Q_sub_2),

	.dout_R1_add(w_dout_R1_add),
    .dout_R1_sub(w_dout_R1_sub),
	.dout_R2_add(w_dout_R2_add),
    .dout_R2_sub(w_dout_R2_sub),

    .dout_Q1_add(w_dout_Q1_add),
    .dout_Q1_sub(w_dout_Q1_sub),
    .dout_Q2_add(w_dout_Q2_add),
    .dout_Q2_sub(w_dout_Q2_sub),

	.alert_mod12(w_alert_mod12)
	);

/////////////////////////////////////////////////////////////////////////////
//								CBFP1									   //
/////////////////////////////////////////////////////////////////////////////



	cbfp1 CBFP1(
	.clk(clk),
	.rstn(rstn),
	.alert_mod12(w_alert_mod12),

	.din_R1_add(w_dout_R1_add),
    .din_R1_sub(w_dout_R1_sub),
	.din_R2_add(w_dout_R2_add),
    .din_R2_sub(w_dout_R2_sub),

    .din_Q1_add(w_dout_Q1_add),
    .din_Q1_sub(w_dout_Q1_sub),
    .din_Q2_add(w_dout_Q2_add),
    .din_Q2_sub(w_dout_Q2_sub),

	.dout_R1_add(dout_R1_add),
    .dout_R1_sub(dout_R1_sub),
	.dout_R2_add(dout_R2_add),
    .dout_R2_sub(dout_R2_sub),

    .dout_Q1_add(dout_Q1_add),
    .dout_Q1_sub(dout_Q1_sub),
    .dout_Q2_add(dout_Q2_add),
    .dout_Q2_sub(dout_Q2_sub),

	.alert_cbfp1(alert_cbfp1)
	);

endmodule