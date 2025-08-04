`timescale 1ns/1ps

module FFT_TOP (
	input clk,
	input rstn,
	input valid,
	input logic signed [8:0] din_R [0:15],
	input logic signed [8:0] din_Q [0:15],

	output logic signed [12:0] dout_R_reorder [0:511],
	output logic signed [12:0] dout_Q_reorder [0:511],

	output logic done
);

	///////////////////////////////////////////////////////////////////////////
	//							MODULE_0									 //
	///////////////////////////////////////////////////////////////////////////
	
	logic signed [10:0] w_dout_R [0:15];
	logic signed [10:0] w_dout_Q [0:15];
	logic w_valid_mod1;

	logic [4:0] w_cbfp0_scale_fac;
	logic w_cbfp0_mem_push;

	module0 MODULE_0(
	.clk(clk),
	.rstn(rstn),
	.valid(valid),
	.din_R(din_R),
	.din_Q(din_Q),

	.dout_R(w_dout_R),
	.dout_Q(w_dout_Q),
	.valid_mod1(w_valid_mod1),

	.cbfp0_scale_fac(w_cbfp0_scale_fac),
	.cbfp0_mem_push(w_cbfp0_mem_push)
	);

	///////////////////////////////////////////////////////////////////////////
	//							MODULE_1									 //
	///////////////////////////////////////////////////////////////////////////

	logic signed [11:0] w_dout_R1_add [7:0];
    logic signed [11:0] w_dout_R1_sub [7:0];
	logic signed [11:0] w_dout_R2_add [7:0];
    logic signed [11:0] w_dout_R2_sub [7:0];

    logic signed [11:0] w_dout_Q1_add [7:0];
    logic signed [11:0] w_dout_Q1_sub [7:0];
    logic signed [11:0] w_dout_Q2_add [7:0];
    logic signed [11:0] w_dout_Q2_sub [7:0];

	logic w_alert_cbfp1;

	logic w_cbfp1_mem_push;
    logic [4:0] w_scale_fac_1st_add;
    logic [4:0] w_scale_fac_1st_sub;
    logic [4:0] w_scale_fac_2nd_add;
    logic [4:0] w_scale_fac_2nd_sub;

	module1 MODULE_1(
	.clk(clk),
	.rstn(rstn),
	.valid(w_valid_mod1),

	.d_in_R(w_dout_R),
	.d_in_Q(w_dout_Q),

	.dout_R1_add(w_dout_R1_add),
    .dout_R1_sub(w_dout_R1_sub),
	.dout_R2_add(w_dout_R2_add),
    .dout_R2_sub(w_dout_R2_sub),

    .dout_Q1_add(w_dout_Q1_add),
    .dout_Q1_sub(w_dout_Q1_sub),
    .dout_Q2_add(w_dout_Q2_add),
    .dout_Q2_sub(w_dout_Q2_sub),

	.alert_cbfp1(w_alert_cbfp1),

	.cbfp1_mem_push(w_cbfp1_mem_push),
    .scale_fac_1st_add(w_scale_fac_1st_add),
    .scale_fac_1st_sub(w_scale_fac_1st_sub),
    .scale_fac_2nd_add(w_scale_fac_2nd_add),
    .scale_fac_2nd_sub(w_scale_fac_2nd_sub)
	);

	///////////////////////////////////////////////////////////////////////////
	//							MODULE_2									 //
	///////////////////////////////////////////////////////////////////////////

	logic signed [15:0] w_dout_R_1st_fin;
	logic signed [15:0] w_dout_Q_1st_fin;

	logic signed [15:0] w_dout_R_2nd_fin;
	logic signed [15:0] w_dout_Q_2nd_fin;

	logic signed [15:0] w_dout_R_3rd_fin;
	logic signed [15:0] w_dout_Q_3rd_fin;

	logic signed [15:0] w_dout_R_4th_fin;
	logic signed [15:0] w_dout_Q_4th_fin;

	logic signed [15:0] w_dout_R_5th_fin;
	logic signed [15:0] w_dout_Q_5th_fin;

	logic signed [15:0] w_dout_R_6th_fin;
	logic signed [15:0] w_dout_Q_6th_fin;

	logic signed [15:0] w_dout_R_7th_fin;
	logic signed [15:0] w_dout_Q_7th_fin;

	logic signed [15:0] w_dout_R_8th_fin;
	logic signed [15:0] w_dout_Q_8th_fin;

	logic signed [15:0] w_dout_R_9th_fin;
	logic signed [15:0] w_dout_Q_9th_fin;

	logic signed [15:0] w_dout_R_10th_fin;
	logic signed [15:0] w_dout_Q_10th_fin;

	logic signed [15:0] w_dout_R_11th_fin;
	logic signed [15:0] w_dout_Q_11th_fin;

	logic signed [15:0] w_dout_R_12th_fin;
	logic signed [15:0] w_dout_Q_12th_fin;

	logic signed [15:0] w_dout_R_13th_fin;
	logic signed [15:0] w_dout_Q_13th_fin;

	logic signed [15:0] w_dout_R_14th_fin;
	logic signed [15:0] w_dout_Q_14th_fin;

	logic signed [15:0] w_dout_R_15th_fin;
	logic signed [15:0] w_dout_Q_15th_fin;

	logic signed [15:0] w_dout_R_16th_fin;
	logic signed [15:0] w_dout_Q_16th_fin;

	logic signed [15:0] w_dout_R_17th_fin;
	logic signed [15:0] w_dout_Q_17th_fin;

	logic signed [15:0] w_dout_R_18th_fin;
	logic signed [15:0] w_dout_Q_18th_fin;

	logic signed [15:0] w_dout_R_19th_fin;
	logic signed [15:0] w_dout_Q_19th_fin;

	logic signed [15:0] w_dout_R_20th_fin;
	logic signed [15:0] w_dout_Q_20th_fin;

	logic signed [15:0] w_dout_R_21th_fin;
	logic signed [15:0] w_dout_Q_21th_fin;

	logic signed [15:0] w_dout_R_22th_fin;
	logic signed [15:0] w_dout_Q_22th_fin;

	logic signed [15:0] w_dout_R_23th_fin;
	logic signed [15:0] w_dout_Q_23th_fin;

	logic signed [15:0] w_dout_R_24th_fin;
	logic signed [15:0] w_dout_Q_24th_fin;

	logic signed [15:0] w_dout_R_25th_fin;
	logic signed [15:0] w_dout_Q_25th_fin;

	logic signed [15:0] w_dout_R_26th_fin;
	logic signed [15:0] w_dout_Q_26th_fin;

	logic signed [15:0] w_dout_R_27th_fin;
	logic signed [15:0] w_dout_Q_27th_fin;

	logic signed [15:0] w_dout_R_28th_fin;
	logic signed [15:0] w_dout_Q_28th_fin;

	logic signed [15:0] w_dout_R_29th_fin;
	logic signed [15:0] w_dout_Q_29th_fin;

	logic signed [15:0] w_dout_R_30th_fin;
	logic signed [15:0] w_dout_Q_30th_fin;

	logic signed [15:0] w_dout_R_31th_fin;
	logic signed [15:0] w_dout_Q_31th_fin;

	logic signed [15:0] w_dout_R_32th_fin;
	logic signed [15:0] w_dout_Q_32th_fin;

	logic w_alert_cbfp2;

	module2 MODULE_2(
	.clk(clk),
	.rstn(rstn),
	.alert_cbfp1(w_alert_cbfp1),

	.din_R1_add_20(w_dout_R1_add),
    .din_R1_sub_20(w_dout_R1_sub),
	.din_R2_add_20(w_dout_R2_add),
    .din_R2_sub_20(w_dout_R2_sub),

    .din_Q1_add_20(w_dout_Q1_add),
    .din_Q1_sub_20(w_dout_Q1_sub),
    .din_Q2_add_20(w_dout_Q2_add),
    .din_Q2_sub_20(w_dout_Q2_sub),

	.dout_R_1st_fin(w_dout_R_1st_fin),
	.dout_Q_1st_fin(w_dout_Q_1st_fin),

	.dout_R_2nd_fin(w_dout_R_2nd_fin),
	.dout_Q_2nd_fin(w_dout_Q_2nd_fin),

	.dout_R_3rd_fin(w_dout_R_3rd_fin),
	.dout_Q_3rd_fin(w_dout_Q_3rd_fin),

	.dout_R_4th_fin(w_dout_R_4th_fin),
	.dout_Q_4th_fin(w_dout_Q_4th_fin),

	.dout_R_5th_fin(w_dout_R_5th_fin),
	.dout_Q_5th_fin(w_dout_Q_5th_fin),

	.dout_R_6th_fin(w_dout_R_6th_fin),
	.dout_Q_6th_fin(w_dout_Q_6th_fin),

	.dout_R_7th_fin(w_dout_R_7th_fin),
	.dout_Q_7th_fin(w_dout_Q_7th_fin),

	.dout_R_8th_fin(w_dout_R_8th_fin),
	.dout_Q_8th_fin(w_dout_Q_8th_fin),

	.dout_R_9th_fin(w_dout_R_9th_fin),
	.dout_Q_9th_fin(w_dout_Q_9th_fin),

	.dout_R_10th_fin(w_dout_R_10th_fin),
	.dout_Q_10th_fin(w_dout_Q_10th_fin),

	.dout_R_11th_fin(w_dout_R_11th_fin),
	.dout_Q_11th_fin(w_dout_Q_11th_fin),

	.dout_R_12th_fin(w_dout_R_12th_fin),
	.dout_Q_12th_fin(w_dout_Q_12th_fin),

	.dout_R_13th_fin(w_dout_R_13th_fin),
	.dout_Q_13th_fin(w_dout_Q_13th_fin),

	.dout_R_14th_fin(w_dout_R_14th_fin),
	.dout_Q_14th_fin(w_dout_Q_14th_fin),

	.dout_R_15th_fin(w_dout_R_15th_fin),
	.dout_Q_15th_fin(w_dout_Q_15th_fin),

	.dout_R_16th_fin(w_dout_R_16th_fin),
	.dout_Q_16th_fin(w_dout_Q_16th_fin),

	.dout_R_17th_fin(w_dout_R_17th_fin),
	.dout_Q_17th_fin(w_dout_Q_17th_fin),

	.dout_R_18th_fin(w_dout_R_18th_fin),
	.dout_Q_18th_fin(w_dout_Q_18th_fin),

	.dout_R_19th_fin(w_dout_R_19th_fin),
	.dout_Q_19th_fin(w_dout_Q_19th_fin),

	.dout_R_20th_fin(w_dout_R_20th_fin),
	.dout_Q_20th_fin(w_dout_Q_20th_fin),

	.dout_R_21th_fin(w_dout_R_21th_fin),
	.dout_Q_21th_fin(w_dout_Q_21th_fin),

	.dout_R_22th_fin(w_dout_R_22th_fin),
	.dout_Q_22th_fin(w_dout_Q_22th_fin),

	.dout_R_23th_fin(w_dout_R_23th_fin),
	.dout_Q_23th_fin(w_dout_Q_23th_fin),

	.dout_R_24th_fin(w_dout_R_24th_fin),
	.dout_Q_24th_fin(w_dout_Q_24th_fin),

	.dout_R_25th_fin(w_dout_R_25th_fin),
	.dout_Q_25th_fin(w_dout_Q_25th_fin),

	.dout_R_26th_fin(w_dout_R_26th_fin),
	.dout_Q_26th_fin(w_dout_Q_26th_fin),

	.dout_R_27th_fin(w_dout_R_27th_fin),
	.dout_Q_27th_fin(w_dout_Q_27th_fin),

	.dout_R_28th_fin(w_dout_R_28th_fin),
	.dout_Q_28th_fin(w_dout_Q_28th_fin),

	.dout_R_29th_fin(w_dout_R_29th_fin),
	.dout_Q_29th_fin(w_dout_Q_29th_fin),

	.dout_R_30th_fin(w_dout_R_30th_fin),
	.dout_Q_30th_fin(w_dout_Q_30th_fin),

	.dout_R_31th_fin(w_dout_R_31th_fin),
	.dout_Q_31th_fin(w_dout_Q_31th_fin),

	.dout_R_32th_fin(w_dout_R_32th_fin),
	.dout_Q_32th_fin(w_dout_Q_32th_fin),

	.alert_cbfp2(w_alert_cbfp2)
	);

	///////////////////////////////////////////////////////////////////////////
	//							CBFP_2_REORDER								 //
	///////////////////////////////////////////////////////////////////////////

	top_cbfp2 TOP_CBFP_REORDER(
	.clk(clk),
	.rstn(rstn),

	.push_idx1(w_cbfp0_mem_push),
	.push_idx2(w_cbfp1_mem_push),
	.pop(w_alert_cbfp2),
	.push_data_idx1(w_cbfp0_scale_fac),
	
	.push_data_idx2_1(w_scale_fac_1st_add),
	.push_data_idx2_2(w_scale_fac_1st_sub),
   	.push_data_idx2_3(w_scale_fac_2nd_add),
   	.push_data_idx2_4(w_scale_fac_2nd_sub),

	.din_R_1st_cbfp2(w_dout_R_1st_fin),
	.din_Q_1st_cbfp2(w_dout_Q_1st_fin),

	.din_R_2nd_cbfp2(w_dout_R_2nd_fin),
	.din_Q_2nd_cbfp2(w_dout_Q_2nd_fin),

	.din_R_3rd_cbfp2(w_dout_R_3rd_fin),
	.din_Q_3rd_cbfp2(w_dout_Q_3rd_fin),

	.din_R_4th_cbfp2(w_dout_R_4th_fin),
	.din_Q_4th_cbfp2(w_dout_Q_4th_fin),

	.din_R_5th_cbfp2(w_dout_R_5th_fin),
	.din_Q_5th_cbfp2(w_dout_Q_5th_fin),

	.din_R_6th_cbfp2(w_dout_R_6th_fin),
	.din_Q_6th_cbfp2(w_dout_Q_6th_fin),

	.din_R_7th_cbfp2(w_dout_R_7th_fin),
	.din_Q_7th_cbfp2(w_dout_Q_7th_fin),

	.din_R_8th_cbfp2(w_dout_R_8th_fin),
	.din_Q_8th_cbfp2(w_dout_Q_8th_fin),

	.din_R_9th_cbfp2(w_dout_R_9th_fin),
	.din_Q_9th_cbfp2(w_dout_Q_9th_fin),

	.din_R_10th_cbfp2(w_dout_R_10th_fin),
	.din_Q_10th_cbfp2(w_dout_Q_10th_fin),

	.din_R_11th_cbfp2(w_dout_R_11th_fin),
	.din_Q_11th_cbfp2(w_dout_Q_11th_fin),

	.din_R_12th_cbfp2(w_dout_R_12th_fin),
	.din_Q_12th_cbfp2(w_dout_Q_12th_fin),

	.din_R_13th_cbfp2(w_dout_R_13th_fin),
	.din_Q_13th_cbfp2(w_dout_Q_13th_fin),

	.din_R_14th_cbfp2(w_dout_R_14th_fin),
	.din_Q_14th_cbfp2(w_dout_Q_14th_fin),

	.din_R_15th_cbfp2(w_dout_R_15th_fin),
	.din_Q_15th_cbfp2(w_dout_Q_15th_fin),

	.din_R_16th_cbfp2(w_dout_R_16th_fin),
	.din_Q_16th_cbfp2(w_dout_Q_16th_fin),

	.din_R_17th_cbfp2(w_dout_R_17th_fin),
	.din_Q_17th_cbfp2(w_dout_Q_17th_fin),

	.din_R_18th_cbfp2(w_dout_R_18th_fin),
	.din_Q_18th_cbfp2(w_dout_Q_18th_fin),

	.din_R_19th_cbfp2(w_dout_R_19th_fin),
	.din_Q_19th_cbfp2(w_dout_Q_19th_fin),

	.din_R_20th_cbfp2(w_dout_R_20th_fin),
	.din_Q_20th_cbfp2(w_dout_Q_20th_fin),

	.din_R_21st_cbfp2(w_dout_R_21th_fin),
	.din_Q_21st_cbfp2(w_dout_Q_21th_fin),

	.din_R_22nd_cbfp2(w_dout_R_22th_fin),
	.din_Q_22nd_cbfp2(w_dout_Q_22th_fin),

	.din_R_23rd_cbfp2(w_dout_R_23th_fin),
	.din_Q_23rd_cbfp2(w_dout_Q_23th_fin),
	 
	.din_R_24th_cbfp2(w_dout_R_24th_fin),
	.din_Q_24th_cbfp2(w_dout_Q_24th_fin),

	.din_R_25th_cbfp2(w_dout_R_25th_fin),
	.din_Q_25th_cbfp2(w_dout_Q_25th_fin),

	.din_R_26th_cbfp2(w_dout_R_26th_fin),
	.din_Q_26th_cbfp2(w_dout_Q_26th_fin),

	.din_R_27th_cbfp2(w_dout_R_27th_fin),
	.din_Q_27th_cbfp2(w_dout_Q_27th_fin),

	.din_R_28th_cbfp2(w_dout_R_28th_fin),
	.din_Q_28th_cbfp2(w_dout_Q_28th_fin),

	.din_R_29th_cbfp2(w_dout_R_29th_fin),
	.din_Q_29th_cbfp2(w_dout_Q_29th_fin),

	.din_R_30th_cbfp2(w_dout_R_30th_fin),
	.din_Q_30th_cbfp2(w_dout_Q_30th_fin),

	.din_R_31st_cbfp2(w_dout_R_31th_fin),
	.din_Q_31st_cbfp2(w_dout_Q_31th_fin),

	.din_R_32nd_cbfp2(w_dout_R_32th_fin),
	.din_Q_32nd_cbfp2(w_dout_Q_32th_fin),
	
	.dout_R_reorder(dout_R_reorder),
	.dout_Q_reorder(dout_Q_reorder),

	.done(done)
	);


endmodule