`timescale 1ns/1ps

module module2 (
	input clk,
	input rstn,
	input alert_cbfp1,

	input signed [11:0] din_R1_add_20 [7:0],
    input signed [11:0] din_R1_sub_20 [7:0],
	input signed [11:0] din_R2_add_20 [7:0],
    input signed [11:0] din_R2_sub_20 [7:0],

    input signed [11:0] din_Q1_add_20 [7:0],
    input signed [11:0] din_Q1_sub_20 [7:0],
    input signed [11:0] din_Q2_add_20 [7:0],
    input signed [11:0] din_Q2_sub_20 [7:0],

	output logic signed [15:0] dout_R_1st_fin,
	output logic signed [15:0] dout_Q_1st_fin,

	output logic signed [15:0] dout_R_2nd_fin,
	output logic signed [15:0] dout_Q_2nd_fin,

	output logic signed [15:0] dout_R_3rd_fin,
	output logic signed [15:0] dout_Q_3rd_fin,

	output logic signed [15:0] dout_R_4th_fin,
	output logic signed [15:0] dout_Q_4th_fin,

	output logic signed [15:0] dout_R_5th_fin,
	output logic signed [15:0] dout_Q_5th_fin,

	output logic signed [15:0] dout_R_6th_fin,
	output logic signed [15:0] dout_Q_6th_fin,

	output logic signed [15:0] dout_R_7th_fin,
	output logic signed [15:0] dout_Q_7th_fin,

	output logic signed [15:0] dout_R_8th_fin,
	output logic signed [15:0] dout_Q_8th_fin,

	output logic signed [15:0] dout_R_9th_fin,
	output logic signed [15:0] dout_Q_9th_fin,

	output logic signed [15:0] dout_R_10th_fin,
	output logic signed [15:0] dout_Q_10th_fin,

	output logic signed [15:0] dout_R_11th_fin,
	output logic signed [15:0] dout_Q_11th_fin,

	output logic signed [15:0] dout_R_12th_fin,
	output logic signed [15:0] dout_Q_12th_fin,

	output logic signed [15:0] dout_R_13th_fin,
	output logic signed [15:0] dout_Q_13th_fin,

	output logic signed [15:0] dout_R_14th_fin,
	output logic signed [15:0] dout_Q_14th_fin,

	output logic signed [15:0] dout_R_15th_fin,
	output logic signed [15:0] dout_Q_15th_fin,

	output logic signed [15:0] dout_R_16th_fin,
	output logic signed [15:0] dout_Q_16th_fin,

	output logic signed [15:0] dout_R_17th_fin,
	output logic signed [15:0] dout_Q_17th_fin,

	output logic signed [15:0] dout_R_18th_fin,
	output logic signed [15:0] dout_Q_18th_fin,

	output logic signed [15:0] dout_R_19th_fin,
	output logic signed [15:0] dout_Q_19th_fin,

	output logic signed [15:0] dout_R_20th_fin,
	output logic signed [15:0] dout_Q_20th_fin,

	output logic signed [15:0] dout_R_21th_fin,
	output logic signed [15:0] dout_Q_21th_fin,

	output logic signed [15:0] dout_R_22th_fin,
	output logic signed [15:0] dout_Q_22th_fin,

	output logic signed [15:0] dout_R_23th_fin,
	output logic signed [15:0] dout_Q_23th_fin,

	output logic signed [15:0] dout_R_24th_fin,
	output logic signed [15:0] dout_Q_24th_fin,

	output logic signed [15:0] dout_R_25th_fin,
	output logic signed [15:0] dout_Q_25th_fin,

	output logic signed [15:0] dout_R_26th_fin,
	output logic signed [15:0] dout_Q_26th_fin,

	output logic signed [15:0] dout_R_27th_fin,
	output logic signed [15:0] dout_Q_27th_fin,

	output logic signed [15:0] dout_R_28th_fin,
	output logic signed [15:0] dout_Q_28th_fin,

	output logic signed [15:0] dout_R_29th_fin,
	output logic signed [15:0] dout_Q_29th_fin,

	output logic signed [15:0] dout_R_30th_fin,
	output logic signed [15:0] dout_Q_30th_fin,

	output logic signed [15:0] dout_R_31th_fin,
	output logic signed [15:0] dout_Q_31th_fin,

	output logic signed [15:0] dout_R_32th_fin,
	output logic signed [15:0] dout_Q_32th_fin,

	output logic alert_cbfp2
);

	logic signed [12:0] w_dout_R_add_1_1st [1:0];
    logic signed [12:0] w_dout_R_add_1_2nd [1:0];
	logic signed [12:0] w_dout_Q_add_1_1st [1:0];
    logic signed [12:0] w_dout_Q_add_1_2nd [1:0];

	logic signed [12:0] w_dout_R_sub_1_3rd [1:0];
    logic signed [12:0] w_dout_R_sub_1_4th [1:0];
	logic signed [12:0] w_dout_Q_sub_1_3rd [1:0];
    logic signed [12:0] w_dout_Q_sub_1_4th [1:0];

	logic signed [12:0] w_dout_R_add_2_5th [1:0];
    logic signed [12:0] w_dout_R_add_2_6th [1:0];
	logic signed [12:0] w_dout_Q_add_2_5th [1:0];
    logic signed [12:0] w_dout_Q_add_2_6th [1:0];

	logic signed [12:0] w_dout_R_sub_2_7th [1:0];
    logic signed [12:0] w_dout_R_sub_2_8th [1:0];
	logic signed [12:0] w_dout_Q_sub_2_7th [1:0];
    logic signed [12:0] w_dout_Q_sub_2_8th [1:0];

	logic signed [12:0] w_dout_R_add_3_9th [1:0];
    logic signed [12:0] w_dout_R_add_3_10th [1:0];
	logic signed [12:0] w_dout_Q_add_3_9th [1:0];
    logic signed [12:0] w_dout_Q_add_3_10th [1:0];

	logic signed [12:0] w_dout_R_sub_3_11th [1:0];
    logic signed [12:0] w_dout_R_sub_3_12th [1:0];
	logic signed [12:0] w_dout_Q_sub_3_11th [1:0];
    logic signed [12:0] w_dout_Q_sub_3_12th [1:0];

	logic signed [12:0] w_dout_R_add_4_13th [1:0];
    logic signed [12:0] w_dout_R_add_4_14th [1:0];
	logic signed [12:0] w_dout_Q_add_4_13th [1:0];
    logic signed [12:0] w_dout_Q_add_4_14th [1:0];

	logic signed [12:0] w_dout_R_sub_4_15th [1:0];
    logic signed [12:0] w_dout_R_sub_4_16th [1:0];
	logic signed [12:0] w_dout_Q_sub_4_15th [1:0];
    logic signed [12:0] w_dout_Q_sub_4_16th [1:0];


	logic w_alert_mod20;

	mod2_0 MOD2_0(
	.clk(clk),
	.rstn(rstn),
	.alert_cbfp1(alert_cbfp1),

	.din_R1_add_20(din_R1_add_20),
    .din_R1_sub_20(din_R1_sub_20),
	.din_R2_add_20(din_R2_add_20),
    .din_R2_sub_20(din_R2_sub_20),

    .din_Q1_add_20(din_Q1_add_20),
    .din_Q1_sub_20(din_Q1_sub_20),
    .din_Q2_add_20(din_Q2_add_20),
    .din_Q2_sub_20(din_Q2_sub_20),

	.dout_R_add_1_1st(w_dout_R_add_1_1st),
    .dout_R_add_1_2nd(w_dout_R_add_1_2nd),
	.dout_Q_add_1_1st(w_dout_Q_add_1_1st),
    .dout_Q_add_1_2nd(w_dout_Q_add_1_2nd),

	.dout_R_sub_1_3rd(w_dout_R_sub_1_3rd),
    .dout_R_sub_1_4th(w_dout_R_sub_1_4th),
	.dout_Q_sub_1_3rd(w_dout_Q_sub_1_3rd),
    .dout_Q_sub_1_4th(w_dout_Q_sub_1_4th),

	.dout_R_add_2_5th(w_dout_R_add_2_5th),
    .dout_R_add_2_6th(w_dout_R_add_2_6th),
	.dout_Q_add_2_5th(w_dout_Q_add_2_5th),
    .dout_Q_add_2_6th(w_dout_Q_add_2_6th),

	.dout_R_sub_2_7th(w_dout_R_sub_2_7th),
    .dout_R_sub_2_8th(w_dout_R_sub_2_8th),
	.dout_Q_sub_2_7th(w_dout_Q_sub_2_7th),
    .dout_Q_sub_2_8th(w_dout_Q_sub_2_8th),

	.dout_R_add_3_9th(w_dout_R_add_3_9th),
    .dout_R_add_3_10th(w_dout_R_add_3_10th),
	.dout_Q_add_3_9th(w_dout_Q_add_3_9th),
    .dout_Q_add_3_10th(w_dout_Q_add_3_10th),

	.dout_R_sub_3_11th(w_dout_R_sub_3_11th),
    .dout_R_sub_3_12th(w_dout_R_sub_3_12th),
	.dout_Q_sub_3_11th(w_dout_Q_sub_3_11th),
    .dout_Q_sub_3_12th(w_dout_Q_sub_3_12th),

	.dout_R_add_4_13th(w_dout_R_add_4_13th),
    .dout_R_add_4_14th(w_dout_R_add_4_14th),
	.dout_Q_add_4_13th(w_dout_Q_add_4_13th),
    .dout_Q_add_4_14th(w_dout_Q_add_4_14th),

	.dout_R_sub_4_15th(w_dout_R_sub_4_15th),
    .dout_R_sub_4_16th(w_dout_R_sub_4_16th),
	.dout_Q_sub_4_15th(w_dout_Q_sub_4_15th),
    .dout_Q_sub_4_16th(w_dout_Q_sub_4_16th),

	.alert_mod20(w_alert_mod20)
	);

	logic signed [15:0] w_mod21_R_1st_fin;
	logic signed [15:0] w_mod21_Q_1st_fin;

	logic signed [15:0] w_mod21_R_2nd_fin;
	logic signed [15:0] w_mod21_Q_2nd_fin;

	logic signed [15:0] w_mod21_R_3rd_fin;
	logic signed [15:0] w_mod21_Q_3rd_fin;

	logic signed [15:0] w_mod21_R_4th_fin;
	logic signed [15:0] w_mod21_Q_4th_fin;

	logic signed [15:0] w_mod21_R_5th_fin;
	logic signed [15:0] w_mod21_Q_5th_fin;

	logic signed [15:0] w_mod21_R_6th_fin;
	logic signed [15:0] w_mod21_Q_6th_fin;

	logic signed [15:0] w_mod21_R_7th_fin;
	logic signed [15:0] w_mod21_Q_7th_fin;

	logic signed [15:0] w_mod21_R_8th_fin;
	logic signed [15:0] w_mod21_Q_8th_fin;

	logic signed [15:0] w_mod21_R_9th_fin;
	logic signed [15:0] w_mod21_Q_9th_fin;

	logic signed [15:0] w_mod21_R_10th_fin;
	logic signed [15:0] w_mod21_Q_10th_fin;

	logic signed [15:0] w_mod21_R_11th_fin;
	logic signed [15:0] w_mod21_Q_11th_fin;

	logic signed [15:0] w_mod21_R_12th_fin;
	logic signed [15:0] w_mod21_Q_12th_fin;

	logic signed [15:0] w_mod21_R_13th_fin;
	logic signed [15:0] w_mod21_Q_13th_fin;

	logic signed [15:0] w_mod21_R_14th_fin;
	logic signed [15:0] w_mod21_Q_14th_fin;

	logic signed [15:0] w_mod21_R_15th_fin;
	logic signed [15:0] w_mod21_Q_15th_fin;

	logic signed [15:0] w_mod21_R_16th_fin;
	logic signed [15:0] w_mod21_Q_16th_fin;

	logic signed [15:0] w_mod21_R_17th_fin;
	logic signed [15:0] w_mod21_Q_17th_fin;

	logic signed [15:0] w_mod21_R_18th_fin;
	logic signed [15:0] w_mod21_Q_18th_fin;

	logic signed [15:0] w_mod21_R_19th_fin;
	logic signed [15:0] w_mod21_Q_19th_fin;

	logic signed [15:0] w_mod21_R_20th_fin;
	logic signed [15:0] w_mod21_Q_20th_fin;

	logic signed [15:0] w_mod21_R_21th_fin;
	logic signed [15:0] w_mod21_Q_21th_fin;

	logic signed [15:0] w_mod21_R_22th_fin;
	logic signed [15:0] w_mod21_Q_22th_fin;

	logic signed [15:0] w_mod21_R_23th_fin;
	logic signed [15:0] w_mod21_Q_23th_fin;

	logic signed [15:0] w_mod21_R_24th_fin;
	logic signed [15:0] w_mod21_Q_24th_fin;

	logic signed [15:0] w_mod21_R_25th_fin;
	logic signed [15:0] w_mod21_Q_25th_fin;

	logic signed [15:0] w_mod21_R_26th_fin;
	logic signed [15:0] w_mod21_Q_26th_fin;

	logic signed [15:0] w_mod21_R_27th_fin;
	logic signed [15:0] w_mod21_Q_27th_fin;

	logic signed [15:0] w_mod21_R_28th_fin;
	logic signed [15:0] w_mod21_Q_28th_fin;

	logic signed [15:0] w_mod21_R_29th_fin;
	logic signed [15:0] w_mod21_Q_29th_fin;

	logic signed [15:0] w_mod21_R_30th_fin;
	logic signed [15:0] w_mod21_Q_30th_fin;

	logic signed [15:0] w_mod21_R_31th_fin;
	logic signed [15:0] w_mod21_Q_31th_fin;

	logic signed [15:0] w_mod21_R_32th_fin;
	logic signed [15:0] w_mod21_Q_32th_fin;

	logic w_alert_mod21;

	mod2_1 MOD2_1(
	.clk(clk),
	.rstn(rstn),
	.alert_mod20(w_alert_mod20),

	.din_R_1st(w_dout_R_add_1_1st),
    .din_R_2nd(w_dout_R_add_1_2nd),
	.din_Q_1st(w_dout_Q_add_1_1st),
    .din_Q_2nd(w_dout_Q_add_1_2nd),

	.din_R_3rd(w_dout_R_sub_1_3rd),
    .din_R_4th(w_dout_R_sub_1_4th),
	.din_Q_3rd(w_dout_Q_sub_1_3rd),
    .din_Q_4th(w_dout_Q_sub_1_4th),

	.din_R_5th(w_dout_R_add_2_5th),
    .din_R_6th(w_dout_R_add_2_6th),
	.din_Q_5th(w_dout_Q_add_2_5th),
    .din_Q_6th(w_dout_Q_add_2_6th),

	.din_R_7th(w_dout_R_sub_2_7th),
    .din_R_8th(w_dout_R_sub_2_8th),
	.din_Q_7th(w_dout_Q_sub_2_7th),
    .din_Q_8th(w_dout_Q_sub_2_8th),

	.din_R_9th(w_dout_R_add_3_9th),
    .din_R_10th(w_dout_R_add_3_10th),
	.din_Q_9th(w_dout_Q_add_3_9th),
    .din_Q_10th(w_dout_Q_add_3_10th),

	.din_R_11th(w_dout_R_sub_3_11th),
    .din_R_12th(w_dout_R_sub_3_12th),
	.din_Q_11th(w_dout_Q_sub_3_11th),
    .din_Q_12th(w_dout_Q_sub_3_12th),

	.din_R_13th(w_dout_R_add_4_13th),
    .din_R_14th(w_dout_R_add_4_14th),
	.din_Q_13th(w_dout_Q_add_4_13th),
    .din_Q_14th(w_dout_Q_add_4_14th),

	.din_R_15th(w_dout_R_sub_4_15th),
    .din_R_16th(w_dout_R_sub_4_16th),
	.din_Q_15th(w_dout_Q_sub_4_15th),
    .din_Q_16th(w_dout_Q_sub_4_16th),

	.dout_R_1st_fin(w_mod21_R_1st_fin),
	.dout_Q_1st_fin(w_mod21_Q_1st_fin),

	.dout_R_2nd_fin(w_mod21_R_2nd_fin),
	.dout_Q_2nd_fin(w_mod21_Q_2nd_fin),

	.dout_R_3rd_fin(w_mod21_R_3rd_fin),
	.dout_Q_3rd_fin(w_mod21_Q_3rd_fin),

	.dout_R_4th_fin(w_mod21_R_4th_fin),
	.dout_Q_4th_fin(w_mod21_Q_4th_fin),

	.dout_R_5th_fin(w_mod21_R_5th_fin),
	.dout_Q_5th_fin(w_mod21_Q_5th_fin),

	.dout_R_6th_fin(w_mod21_R_6th_fin),
	.dout_Q_6th_fin(w_mod21_Q_6th_fin),

	.dout_R_7th_fin(w_mod21_R_7th_fin),
	.dout_Q_7th_fin(w_mod21_Q_7th_fin),

	.dout_R_8th_fin(w_mod21_R_8th_fin),
	.dout_Q_8th_fin(w_mod21_Q_8th_fin),

	.dout_R_9th_fin(w_mod21_R_9th_fin),
	.dout_Q_9th_fin(w_mod21_Q_9th_fin),

	.dout_R_10th_fin(w_mod21_R_10th_fin),
	.dout_Q_10th_fin(w_mod21_Q_10th_fin),

	.dout_R_11th_fin(w_mod21_R_11th_fin),
	.dout_Q_11th_fin(w_mod21_Q_11th_fin),

	.dout_R_12th_fin(w_mod21_R_12th_fin),
	.dout_Q_12th_fin(w_mod21_Q_12th_fin),

	.dout_R_13th_fin(w_mod21_R_13th_fin),
	.dout_Q_13th_fin(w_mod21_Q_13th_fin),

	.dout_R_14th_fin(w_mod21_R_14th_fin),
	.dout_Q_14th_fin(w_mod21_Q_14th_fin),

	.dout_R_15th_fin(w_mod21_R_15th_fin),
	.dout_Q_15th_fin(w_mod21_Q_15th_fin),

	.dout_R_16th_fin(w_mod21_R_16th_fin),
	.dout_Q_16th_fin(w_mod21_Q_16th_fin),

	.dout_R_17th_fin(w_mod21_R_17th_fin),
	.dout_Q_17th_fin(w_mod21_Q_17th_fin),

	.dout_R_18th_fin(w_mod21_R_18th_fin),
	.dout_Q_18th_fin(w_mod21_Q_18th_fin),

	.dout_R_19th_fin(w_mod21_R_19th_fin),
	.dout_Q_19th_fin(w_mod21_Q_19th_fin),

	.dout_R_20th_fin(w_mod21_R_20th_fin),
	.dout_Q_20th_fin(w_mod21_Q_20th_fin),

	.dout_R_21th_fin(w_mod21_R_21th_fin),
	.dout_Q_21th_fin(w_mod21_Q_21th_fin),

	.dout_R_22th_fin(w_mod21_R_22th_fin),
	.dout_Q_22th_fin(w_mod21_Q_22th_fin),

	.dout_R_23th_fin(w_mod21_R_23th_fin),
	.dout_Q_23th_fin(w_mod21_Q_23th_fin),

	.dout_R_24th_fin(w_mod21_R_24th_fin),
	.dout_Q_24th_fin(w_mod21_Q_24th_fin),

	.dout_R_25th_fin(w_mod21_R_25th_fin),
	.dout_Q_25th_fin(w_mod21_Q_25th_fin),

	.dout_R_26th_fin(w_mod21_R_26th_fin),
	.dout_Q_26th_fin(w_mod21_Q_26th_fin),

	.dout_R_27th_fin(w_mod21_R_27th_fin),
	.dout_Q_27th_fin(w_mod21_Q_27th_fin),

	.dout_R_28th_fin(w_mod21_R_28th_fin),
	.dout_Q_28th_fin(w_mod21_Q_28th_fin),

	.dout_R_29th_fin(w_mod21_R_29th_fin),
	.dout_Q_29th_fin(w_mod21_Q_29th_fin),

	.dout_R_30th_fin(w_mod21_R_30th_fin),
	.dout_Q_30th_fin(w_mod21_Q_30th_fin),

	.dout_R_31th_fin(w_mod21_R_31th_fin),
	.dout_Q_31th_fin(w_mod21_Q_31th_fin),

	.dout_R_32th_fin(w_mod21_R_32th_fin),
	.dout_Q_32th_fin(w_mod21_Q_32th_fin),

	.alert_mod21(w_alert_mod21)
	);

	mod2_2 MOD2_2(
	.clk(clk),
	.rstn(rstn),
	.alert_mod21(w_alert_mod21),

	.din_R_1st(w_mod21_R_1st_fin),
	.din_Q_1st(w_mod21_Q_1st_fin),

	.din_R_2nd(w_mod21_R_2nd_fin),
	.din_Q_2nd(w_mod21_Q_2nd_fin),

	.din_R_3rd(w_mod21_R_3rd_fin),
	.din_Q_3rd(w_mod21_Q_3rd_fin),

	.din_R_4th(w_mod21_R_4th_fin),
	.din_Q_4th(w_mod21_Q_4th_fin),

	.din_R_5th(w_mod21_R_5th_fin),
	.din_Q_5th(w_mod21_Q_5th_fin),

	.din_R_6th(w_mod21_R_6th_fin),
	.din_Q_6th(w_mod21_Q_6th_fin),

	.din_R_7th(w_mod21_R_7th_fin),
	.din_Q_7th(w_mod21_Q_7th_fin),

	.din_R_8th(w_mod21_R_8th_fin),
	.din_Q_8th(w_mod21_Q_8th_fin),

	.din_R_9th(w_mod21_R_9th_fin),
	.din_Q_9th(w_mod21_Q_9th_fin),

	.din_R_10th(w_mod21_R_10th_fin),
	.din_Q_10th(w_mod21_Q_10th_fin),

	.din_R_11th(w_mod21_R_11th_fin),
	.din_Q_11th(w_mod21_Q_11th_fin),

	.din_R_12th(w_mod21_R_12th_fin),
	.din_Q_12th(w_mod21_Q_12th_fin),

	.din_R_13th(w_mod21_R_13th_fin),
	.din_Q_13th(w_mod21_Q_13th_fin),

	.din_R_14th(w_mod21_R_14th_fin),
	.din_Q_14th(w_mod21_Q_14th_fin),

	.din_R_15th(w_mod21_R_15th_fin),
	.din_Q_15th(w_mod21_Q_15th_fin),

	.din_R_16th(w_mod21_R_16th_fin),
	.din_Q_16th(w_mod21_Q_16th_fin),

	.din_R_17th(w_mod21_R_17th_fin),
	.din_Q_17th(w_mod21_Q_17th_fin),

	.din_R_18th(w_mod21_R_18th_fin),
	.din_Q_18th(w_mod21_Q_18th_fin),

	.din_R_19th(w_mod21_R_19th_fin),
	.din_Q_19th(w_mod21_Q_19th_fin),

	.din_R_20th(w_mod21_R_20th_fin),
	.din_Q_20th(w_mod21_Q_20th_fin),

	.din_R_21th(w_mod21_R_21th_fin),
	.din_Q_21th(w_mod21_Q_21th_fin),

	.din_R_22th(w_mod21_R_22th_fin),
	.din_Q_22th(w_mod21_Q_22th_fin),

	.din_R_23th(w_mod21_R_23th_fin),
	.din_Q_23th(w_mod21_Q_23th_fin),

	.din_R_24th(w_mod21_R_24th_fin),
	.din_Q_24th(w_mod21_Q_24th_fin),

	.din_R_25th(w_mod21_R_25th_fin),
	.din_Q_25th(w_mod21_Q_25th_fin),

	.din_R_26th(w_mod21_R_26th_fin),
	.din_Q_26th(w_mod21_Q_26th_fin),

	.din_R_27th(w_mod21_R_27th_fin),
	.din_Q_27th(w_mod21_Q_27th_fin),

	.din_R_28th(w_mod21_R_28th_fin),
	.din_Q_28th(w_mod21_Q_28th_fin),

	.din_R_29th(w_mod21_R_29th_fin),
	.din_Q_29th(w_mod21_Q_29th_fin),

	.din_R_30th(w_mod21_R_30th_fin),
	.din_Q_30th(w_mod21_Q_30th_fin),

	.din_R_31th(w_mod21_R_31th_fin),
	.din_Q_31th(w_mod21_Q_31th_fin),

	.din_R_32th(w_mod21_R_32th_fin),
	.din_Q_32th(w_mod21_Q_32th_fin),

	.dout_R_1st_fin(dout_R_1st_fin),
	.dout_Q_1st_fin(dout_Q_1st_fin),

	.dout_R_2nd_fin(dout_R_2nd_fin),
	.dout_Q_2nd_fin(dout_Q_2nd_fin),

	.dout_R_3rd_fin(dout_R_3rd_fin),
	.dout_Q_3rd_fin(dout_Q_3rd_fin),

	.dout_R_4th_fin(dout_R_4th_fin),
	.dout_Q_4th_fin(dout_Q_4th_fin),

	.dout_R_5th_fin(dout_R_5th_fin),
	.dout_Q_5th_fin(dout_Q_5th_fin),

	.dout_R_6th_fin(dout_R_6th_fin),
	.dout_Q_6th_fin(dout_Q_6th_fin),

	.dout_R_7th_fin(dout_R_7th_fin),
	.dout_Q_7th_fin(dout_Q_7th_fin),

	.dout_R_8th_fin(dout_R_8th_fin),
	.dout_Q_8th_fin(dout_Q_8th_fin),

	.dout_R_9th_fin(dout_R_9th_fin),
	.dout_Q_9th_fin(dout_Q_9th_fin),

	.dout_R_10th_fin(dout_R_10th_fin),
	.dout_Q_10th_fin(dout_Q_10th_fin),

	.dout_R_11th_fin(dout_R_11th_fin),
	.dout_Q_11th_fin(dout_Q_11th_fin),

	.dout_R_12th_fin(dout_R_12th_fin),
	.dout_Q_12th_fin(dout_Q_12th_fin),

	.dout_R_13th_fin(dout_R_13th_fin),
	.dout_Q_13th_fin(dout_Q_13th_fin),

	.dout_R_14th_fin(dout_R_14th_fin),
	.dout_Q_14th_fin(dout_Q_14th_fin),

	.dout_R_15th_fin(dout_R_15th_fin),
	.dout_Q_15th_fin(dout_Q_15th_fin),

	.dout_R_16th_fin(dout_R_16th_fin),
	.dout_Q_16th_fin(dout_Q_16th_fin),

	.dout_R_17th_fin(dout_R_17th_fin),
	.dout_Q_17th_fin(dout_Q_17th_fin),

	.dout_R_18th_fin(dout_R_18th_fin),
	.dout_Q_18th_fin(dout_Q_18th_fin),

	.dout_R_19th_fin(dout_R_19th_fin),
	.dout_Q_19th_fin(dout_Q_19th_fin),

	.dout_R_20th_fin(dout_R_20th_fin),
	.dout_Q_20th_fin(dout_Q_20th_fin),

	.dout_R_21th_fin(dout_R_21th_fin),
	.dout_Q_21th_fin(dout_Q_21th_fin),

	.dout_R_22th_fin(dout_R_22th_fin),
	.dout_Q_22th_fin(dout_Q_22th_fin),

	.dout_R_23th_fin(dout_R_23th_fin),
	.dout_Q_23th_fin(dout_Q_23th_fin),

	.dout_R_24th_fin(dout_R_24th_fin),
	.dout_Q_24th_fin(dout_Q_24th_fin),

	.dout_R_25th_fin(dout_R_25th_fin),
	.dout_Q_25th_fin(dout_Q_25th_fin),

	.dout_R_26th_fin(dout_R_26th_fin),
	.dout_Q_26th_fin(dout_Q_26th_fin),

	.dout_R_27th_fin(dout_R_27th_fin),
	.dout_Q_27th_fin(dout_Q_27th_fin),

	.dout_R_28th_fin(dout_R_28th_fin),
	.dout_Q_28th_fin(dout_Q_28th_fin),

	.dout_R_29th_fin(dout_R_29th_fin),
	.dout_Q_29th_fin(dout_Q_29th_fin),

	.dout_R_30th_fin(dout_R_30th_fin),
	.dout_Q_30th_fin(dout_Q_30th_fin),

	.dout_R_31th_fin(dout_R_31th_fin),
	.dout_Q_31th_fin(dout_Q_31th_fin),

	.dout_R_32th_fin(dout_R_32th_fin),
	.dout_Q_32th_fin(dout_Q_32th_fin),

	.alert_cbfp2(alert_cbfp2)
	);
	
endmodule