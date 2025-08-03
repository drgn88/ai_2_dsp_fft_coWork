`timescale 1ns / 1ps

module top_cbfp2 (
	input clk,
	input rstn,

	input logic push_idx1,
	input logic push_idx2,
	input logic pop,
	input logic [4:0] push_data_idx1,
	
	input logic [4:0] push_data_idx2_1,
	input logic [4:0] push_data_idx2_2,
   	input logic [4:0] push_data_idx2_3,
   	input logic [4:0] push_data_idx2_4,

	input logic signed [15:0] din_R_1st_cbfp2,
	input logic signed [15:0] din_Q_1st_cbfp2,

	input logic signed [15:0] din_R_2nd_cbfp2,
	input logic signed [15:0] din_Q_2nd_cbfp2,

	input logic signed [15:0] din_R_3rd_cbfp2,
	input logic signed [15:0] din_Q_3rd_cbfp2,

	input logic signed [15:0] din_R_4th_cbfp2,
	input logic signed [15:0] din_Q_4th_cbfp2,

	input logic signed [15:0] din_R_5th_cbfp2,
	input logic signed [15:0] din_Q_5th_cbfp2,

	input logic signed [15:0] din_R_6th_cbfp2,
	input logic signed [15:0] din_Q_6th_cbfp2,

	input logic signed [15:0] din_R_7th_cbfp2,
	input logic signed [15:0] din_Q_7th_cbfp2,

	input logic signed [15:0] din_R_8th_cbfp2,
	input logic signed [15:0] din_Q_8th_cbfp2,

	input logic signed [15:0] din_R_9th_cbfp2,
	input logic signed [15:0] din_Q_9th_cbfp2,

	input logic signed [15:0] din_R_10th_cbfp2,
	input logic signed [15:0] din_Q_10th_cbfp2,

	input logic signed [15:0] din_R_11th_cbfp2,
	input logic signed [15:0] din_Q_11th_cbfp2,

	input logic signed [15:0] din_R_12th_cbfp2,
	input logic signed [15:0] din_Q_12th_cbfp2,

	input logic signed [15:0] din_R_13th_cbfp2,
	input logic signed [15:0] din_Q_13th_cbfp2,

	input logic signed [15:0] din_R_14th_cbfp2,
	input logic signed [15:0] din_Q_14th_cbfp2,

	input logic signed [15:0] din_R_15th_cbfp2,
	input logic signed [15:0] din_Q_15th_cbfp2,

	input logic signed [15:0] din_R_16th_cbfp2,
	input logic signed [15:0] din_Q_16th_cbfp2,

	input logic signed [15:0] din_R_17th_cbfp2,
	input logic signed [15:0] din_Q_17th_cbfp2,

	input logic signed [15:0] din_R_18th_cbfp2,
	input logic signed [15:0] din_Q_18th_cbfp2,

	input logic signed [15:0] din_R_19th_cbfp2,
	input logic signed [15:0] din_Q_19th_cbfp2,

	input logic signed [15:0] din_R_20th_cbfp2,
	input logic signed [15:0] din_Q_20th_cbfp2,

	input logic signed [15:0] din_R_21st_cbfp2,
	input logic signed [15:0] din_Q_21st_cbfp2,

	input logic signed [15:0] din_R_22nd_cbfp2,
	input logic signed [15:0] din_Q_22nd_cbfp2,

	input logic signed [15:0] din_R_23rd_cbfp2,
	input logic signed [15:0] din_Q_23rd_cbfp2,
	 
	input logic signed [15:0] din_R_24th_cbfp2,
	input logic signed [15:0] din_Q_24th_cbfp2,

	input logic signed [15:0] din_R_25th_cbfp2,
	input logic signed [15:0] din_Q_25th_cbfp2,

	input logic signed [15:0] din_R_26th_cbfp2,
	input logic signed [15:0] din_Q_26th_cbfp2,

	input logic signed [15:0] din_R_27th_cbfp2,
	input logic signed [15:0] din_Q_27th_cbfp2,

	input logic signed [15:0] din_R_28th_cbfp2,
	input logic signed [15:0] din_Q_28th_cbfp2,

	input logic signed [15:0] din_R_29th_cbfp2,
	input logic signed [15:0] din_Q_29th_cbfp2,

	input logic signed [15:0] din_R_30th_cbfp2,
	input logic signed [15:0] din_Q_30th_cbfp2,

	input logic signed [15:0] din_R_31st_cbfp2,
	input logic signed [15:0] din_Q_31st_cbfp2,

	input logic signed [15:0] din_R_32nd_cbfp2,
	input logic signed [15:0] din_Q_32nd_cbfp2,
	
	output logic signed [12:0] dout_R_reorder [0:511],
	output logic signed [12:0] dout_Q_reorder [0:511],

	output logic done
);

	logic signed [12:0] w_dout_R_1st_cbfp2;
	logic signed [12:0] w_dout_Q_1st_cbfp2;
	logic signed [12:0] w_dout_R_2nd_cbfp2;
	logic signed [12:0] w_dout_Q_2nd_cbfp2;
	logic signed [12:0] w_dout_R_3rd_cbfp2;
	logic signed [12:0] w_dout_Q_3rd_cbfp2;
	logic signed [12:0] w_dout_R_4th_cbfp2;
	logic signed [12:0] w_dout_Q_4th_cbfp2;
	logic signed [12:0] w_dout_R_5th_cbfp2;
	logic signed [12:0] w_dout_Q_5th_cbfp2;
	logic signed [12:0] w_dout_R_6th_cbfp2;
	logic signed [12:0] w_dout_Q_6th_cbfp2;
	logic signed [12:0] w_dout_R_7th_cbfp2;
	logic signed [12:0] w_dout_Q_7th_cbfp2;
	logic signed [12:0] w_dout_R_8th_cbfp2;
	logic signed [12:0] w_dout_Q_8th_cbfp2;
	logic signed [12:0] w_dout_R_9th_cbfp2;
	logic signed [12:0] w_dout_Q_9th_cbfp2;
	logic signed [12:0] w_dout_R_10th_cbfp2;
	logic signed [12:0] w_dout_Q_10th_cbfp2;
	logic signed [12:0] w_dout_R_11th_cbfp2;
	logic signed [12:0] w_dout_Q_11th_cbfp2;
	logic signed [12:0] w_dout_R_12th_cbfp2;
	logic signed [12:0] w_dout_Q_12th_cbfp2;
	logic signed [12:0] w_dout_R_13th_cbfp2;
	logic signed [12:0] w_dout_Q_13th_cbfp2;
	logic signed [12:0] w_dout_R_14th_cbfp2;
	logic signed [12:0] w_dout_Q_14th_cbfp2;
	logic signed [12:0] w_dout_R_15th_cbfp2;
	logic signed [12:0] w_dout_Q_15th_cbfp2;
	logic signed [12:0] w_dout_R_16th_cbfp2;
	logic signed [12:0] w_dout_Q_16th_cbfp2;
	logic signed [12:0] w_dout_R_17th_cbfp2;
	logic signed [12:0] w_dout_Q_17th_cbfp2;
	logic signed [12:0] w_dout_R_18th_cbfp2;
	logic signed [12:0] w_dout_Q_18th_cbfp2;
	logic signed [12:0] w_dout_R_19th_cbfp2;
	logic signed [12:0] w_dout_Q_19th_cbfp2;
	logic signed [12:0] w_dout_R_20th_cbfp2;
	logic signed [12:0] w_dout_Q_20th_cbfp2;
	logic signed [12:0] w_dout_R_21st_cbfp2;
	logic signed [12:0] w_dout_Q_21st_cbfp2;
	logic signed [12:0] w_dout_R_22nd_cbfp2;
	logic signed [12:0] w_dout_Q_22nd_cbfp2;
	logic signed [12:0] w_dout_R_23rd_cbfp2;
	logic signed [12:0] w_dout_Q_23rd_cbfp2;
	logic signed [12:0] w_dout_R_24th_cbfp2;
	logic signed [12:0] w_dout_Q_24th_cbfp2;
	logic signed [12:0] w_dout_R_25th_cbfp2;
	logic signed [12:0] w_dout_Q_25th_cbfp2;
	logic signed [12:0] w_dout_R_26th_cbfp2;
	logic signed [12:0] w_dout_Q_26th_cbfp2;
	logic signed [12:0] w_dout_R_27th_cbfp2;
	logic signed [12:0] w_dout_Q_27th_cbfp2;
	logic signed [12:0] w_dout_R_28th_cbfp2;
	logic signed [12:0] w_dout_Q_28th_cbfp2;
	logic signed [12:0] w_dout_R_29th_cbfp2;
	logic signed [12:0] w_dout_Q_29th_cbfp2;
	logic signed [12:0] w_dout_R_30th_cbfp2;
	logic signed [12:0] w_dout_Q_30th_cbfp2;
	logic signed [12:0] w_dout_R_31st_cbfp2;
	logic signed [12:0] w_dout_Q_31st_cbfp2;
	logic signed [12:0] w_dout_R_32nd_cbfp2;
	logic signed [12:0] w_dout_Q_32nd_cbfp2;	

	cbfp2 U_CBFP2 (
		.clk(clk),
		.rstn(rstn),

		.push_idx1(push_idx1),
		.push_idx2(push_idx2),
		.pop(pop),
		.push_data_idx1(push_data_idx1),
		.push_data_idx2_1(push_data_idx2_1),
		.push_data_idx2_2(push_data_idx2_2),
		.push_data_idx2_3(push_data_idx2_3),
		.push_data_idx2_4(push_data_idx2_4),

		.din_R_1st_cbfp2(din_R_1st_cbfp2),
		.din_Q_1st_cbfp2(din_Q_1st_cbfp2),
		.din_R_2nd_cbfp2(din_R_2nd_cbfp2),
		.din_Q_2nd_cbfp2(din_Q_2nd_cbfp2),
		.din_R_3rd_cbfp2(din_R_3rd_cbfp2),
		.din_Q_3rd_cbfp2(din_Q_3rd_cbfp2),
		.din_R_4th_cbfp2(din_R_4th_cbfp2),
		.din_Q_4th_cbfp2(din_Q_4th_cbfp2),
		.din_R_5th_cbfp2(din_R_5th_cbfp2),
		.din_Q_5th_cbfp2(din_Q_5th_cbfp2),
		.din_R_6th_cbfp2(din_R_6th_cbfp2),
		.din_Q_6th_cbfp2(din_Q_6th_cbfp2),
		.din_R_7th_cbfp2(din_R_7th_cbfp2),
		.din_Q_7th_cbfp2(din_Q_7th_cbfp2),
		.din_R_8th_cbfp2(din_R_8th_cbfp2),
		.din_Q_8th_cbfp2(din_Q_8th_cbfp2),
		.din_R_9th_cbfp2(din_R_9th_cbfp2),
		.din_Q_9th_cbfp2(din_Q_9th_cbfp2),
		.din_R_10th_cbfp2(din_R_10th_cbfp2),
		.din_Q_10th_cbfp2(din_Q_10th_cbfp2),
		.din_R_11th_cbfp2(din_R_11th_cbfp2),
		.din_Q_11th_cbfp2(din_Q_11th_cbfp2),
		.din_R_12th_cbfp2(din_R_12th_cbfp2),
		.din_Q_12th_cbfp2(din_Q_12th_cbfp2),
		.din_R_13th_cbfp2(din_R_13th_cbfp2),
		.din_Q_13th_cbfp2(din_Q_13th_cbfp2),
		.din_R_14th_cbfp2(din_R_14th_cbfp2),
		.din_Q_14th_cbfp2(din_Q_14th_cbfp2),
		.din_R_15th_cbfp2(din_R_15th_cbfp2),
		.din_Q_15th_cbfp2(din_Q_15th_cbfp2),
		.din_R_16th_cbfp2(din_R_16th_cbfp2),
		.din_Q_16th_cbfp2(din_Q_16th_cbfp2),
		.din_R_17th_cbfp2(din_R_17th_cbfp2),
		.din_Q_17th_cbfp2(din_Q_17th_cbfp2),
		.din_R_18th_cbfp2(din_R_18th_cbfp2),
		.din_Q_18th_cbfp2(din_Q_18th_cbfp2),
		.din_R_19th_cbfp2(din_R_19th_cbfp2),
		.din_Q_19th_cbfp2(din_Q_19th_cbfp2),
		.din_R_20th_cbfp2(din_R_20th_cbfp2),
		.din_Q_20th_cbfp2(din_Q_20th_cbfp2),
		.din_R_21st_cbfp2(din_R_21st_cbfp2),
		.din_Q_21st_cbfp2(din_Q_21st_cbfp2),
		.din_R_22nd_cbfp2(din_R_22nd_cbfp2),
		.din_Q_22nd_cbfp2(din_Q_22nd_cbfp2),
		.din_R_23rd_cbfp2(din_R_23rd_cbfp2),
		.din_Q_23rd_cbfp2(din_Q_23rd_cbfp2),
		.din_R_24th_cbfp2(din_R_24th_cbfp2),
		.din_Q_24th_cbfp2(din_Q_24th_cbfp2),
		.din_R_25th_cbfp2(din_R_25th_cbfp2),
		.din_Q_25th_cbfp2(din_Q_25th_cbfp2),
		.din_R_26th_cbfp2(din_R_26th_cbfp2),
		.din_Q_26th_cbfp2(din_Q_26th_cbfp2),
		.din_R_27th_cbfp2(din_R_27th_cbfp2),
		.din_Q_27th_cbfp2(din_Q_27th_cbfp2),
		.din_R_28th_cbfp2(din_R_28th_cbfp2),
		.din_Q_28th_cbfp2(din_Q_28th_cbfp2),
		.din_R_29th_cbfp2(din_R_29th_cbfp2),
		.din_Q_29th_cbfp2(din_Q_29th_cbfp2),
		.din_R_30th_cbfp2(din_R_30th_cbfp2),
		.din_Q_30th_cbfp2(din_Q_30th_cbfp2),
		.din_R_31st_cbfp2(din_R_31st_cbfp2),
		.din_Q_31st_cbfp2(din_Q_31st_cbfp2),
		.din_R_32nd_cbfp2(din_R_32nd_cbfp2),
		.din_Q_32nd_cbfp2(din_Q_32nd_cbfp2),

		.dout_R_1st_cbfp2(w_dout_R_1st_cbfp2),
		.dout_Q_1st_cbfp2(w_dout_Q_1st_cbfp2),
		.dout_R_2nd_cbfp2(w_dout_R_2nd_cbfp2),
		.dout_Q_2nd_cbfp2(w_dout_Q_2nd_cbfp2),
		.dout_R_3rd_cbfp2(w_dout_R_3rd_cbfp2),
		.dout_Q_3rd_cbfp2(w_dout_Q_3rd_cbfp2),
		.dout_R_4th_cbfp2(w_dout_R_4th_cbfp2),
		.dout_Q_4th_cbfp2(w_dout_Q_4th_cbfp2),
		.dout_R_5th_cbfp2(w_dout_R_5th_cbfp2),
		.dout_Q_5th_cbfp2(w_dout_Q_5th_cbfp2),
		.dout_R_6th_cbfp2(w_dout_R_6th_cbfp2),
		.dout_Q_6th_cbfp2(w_dout_Q_6th_cbfp2),
		.dout_R_7th_cbfp2(w_dout_R_7th_cbfp2),
		.dout_Q_7th_cbfp2(w_dout_Q_7th_cbfp2),
		.dout_R_8th_cbfp2(w_dout_R_8th_cbfp2),
		.dout_Q_8th_cbfp2(w_dout_Q_8th_cbfp2),
		.dout_R_9th_cbfp2(w_dout_R_9th_cbfp2),
		.dout_Q_9th_cbfp2(w_dout_Q_9th_cbfp2),
		.dout_R_10th_cbfp2(w_dout_R_10th_cbfp2),
		.dout_Q_10th_cbfp2(w_dout_Q_10th_cbfp2),
		.dout_R_11th_cbfp2(w_dout_R_11th_cbfp2),
		.dout_Q_11th_cbfp2(w_dout_Q_11th_cbfp2),
		.dout_R_12th_cbfp2(w_dout_R_12th_cbfp2),
		.dout_Q_12th_cbfp2(w_dout_Q_12th_cbfp2),
		.dout_R_13th_cbfp2(w_dout_R_13th_cbfp2),
		.dout_Q_13th_cbfp2(w_dout_Q_13th_cbfp2),
		.dout_R_14th_cbfp2(w_dout_R_14th_cbfp2),
		.dout_Q_14th_cbfp2(w_dout_Q_14th_cbfp2),
		.dout_R_15th_cbfp2(w_dout_R_15th_cbfp2),
		.dout_Q_15th_cbfp2(w_dout_Q_15th_cbfp2),
		.dout_R_16th_cbfp2(w_dout_R_16th_cbfp2),
		.dout_Q_16th_cbfp2(w_dout_Q_16th_cbfp2),
		.dout_R_17th_cbfp2(w_dout_R_17th_cbfp2),
		.dout_Q_17th_cbfp2(w_dout_Q_17th_cbfp2),
		.dout_R_18th_cbfp2(w_dout_R_18th_cbfp2),
		.dout_Q_18th_cbfp2(w_dout_Q_18th_cbfp2),
		.dout_R_19th_cbfp2(w_dout_R_19th_cbfp2),
		.dout_Q_19th_cbfp2(w_dout_Q_19th_cbfp2),
		.dout_R_20th_cbfp2(w_dout_R_20th_cbfp2),
		.dout_Q_20th_cbfp2(w_dout_Q_20th_cbfp2),
		.dout_R_21st_cbfp2(w_dout_R_21st_cbfp2),
		.dout_Q_21st_cbfp2(w_dout_Q_21st_cbfp2),
		.dout_R_22nd_cbfp2(w_dout_R_22nd_cbfp2),
		.dout_Q_22nd_cbfp2(w_dout_Q_22nd_cbfp2),
		.dout_R_23rd_cbfp2(w_dout_R_23rd_cbfp2),
		.dout_Q_23rd_cbfp2(w_dout_Q_23rd_cbfp2),
		.dout_R_24th_cbfp2(w_dout_R_24th_cbfp2),
		.dout_Q_24th_cbfp2(w_dout_Q_24th_cbfp2),
		.dout_R_25th_cbfp2(w_dout_R_25th_cbfp2),
		.dout_Q_25th_cbfp2(w_dout_Q_25th_cbfp2),
		.dout_R_26th_cbfp2(w_dout_R_26th_cbfp2),
		.dout_Q_26th_cbfp2(w_dout_Q_26th_cbfp2),
		.dout_R_27th_cbfp2(w_dout_R_27th_cbfp2),
		.dout_Q_27th_cbfp2(w_dout_Q_27th_cbfp2),
		.dout_R_28th_cbfp2(w_dout_R_28th_cbfp2),
		.dout_Q_28th_cbfp2(w_dout_Q_28th_cbfp2),
		.dout_R_29th_cbfp2(w_dout_R_29th_cbfp2),
		.dout_Q_29th_cbfp2(w_dout_Q_29th_cbfp2),
		.dout_R_30th_cbfp2(w_dout_R_30th_cbfp2),
		.dout_Q_30th_cbfp2(w_dout_Q_30th_cbfp2),
		.dout_R_31st_cbfp2(w_dout_R_31st_cbfp2),
		.dout_Q_31st_cbfp2(w_dout_Q_31st_cbfp2),
		.dout_R_32nd_cbfp2(w_dout_R_32nd_cbfp2),
		.dout_Q_32nd_cbfp2(w_dout_Q_32nd_cbfp2)
	);

	reorder U_REORDER (
		.clk(clk),
		.rstn(rstn),

		.cbfp2_pop(pop),

		.din_R_1st_reorder(w_dout_R_1st_cbfp2),
		.din_Q_1st_reorder(w_dout_Q_1st_cbfp2),
		.din_R_2nd_reorder(w_dout_R_2nd_cbfp2),
		.din_Q_2nd_reorder(w_dout_Q_2nd_cbfp2),
		.din_R_3rd_reorder(w_dout_R_3rd_cbfp2),
		.din_Q_3rd_reorder(w_dout_Q_3rd_cbfp2),
		.din_R_4th_reorder(w_dout_R_4th_cbfp2),
		.din_Q_4th_reorder(w_dout_Q_4th_cbfp2),
		.din_R_5th_reorder(w_dout_R_5th_cbfp2),
		.din_Q_5th_reorder(w_dout_Q_5th_cbfp2),
		.din_R_6th_reorder(w_dout_R_6th_cbfp2),
		.din_Q_6th_reorder(w_dout_Q_6th_cbfp2),
		.din_R_7th_reorder(w_dout_R_7th_cbfp2),
		.din_Q_7th_reorder(w_dout_Q_7th_cbfp2),
		.din_R_8th_reorder(w_dout_R_8th_cbfp2),
		.din_Q_8th_reorder(w_dout_Q_8th_cbfp2),
		.din_R_9th_reorder(w_dout_R_9th_cbfp2),
		.din_Q_9th_reorder(w_dout_Q_9th_cbfp2),
		.din_R_10th_reorder(w_dout_R_10th_cbfp2),
		.din_Q_10th_reorder(w_dout_Q_10th_cbfp2),
		.din_R_11th_reorder(w_dout_R_11th_cbfp2),
		.din_Q_11th_reorder(w_dout_Q_11th_cbfp2),
		.din_R_12th_reorder(w_dout_R_12th_cbfp2),
		.din_Q_12th_reorder(w_dout_Q_12th_cbfp2),
		.din_R_13th_reorder(w_dout_R_13th_cbfp2),
		.din_Q_13th_reorder(w_dout_Q_13th_cbfp2),
		.din_R_14th_reorder(w_dout_R_14th_cbfp2),
		.din_Q_14th_reorder(w_dout_Q_14th_cbfp2),
		.din_R_15th_reorder(w_dout_R_15th_cbfp2),
		.din_Q_15th_reorder(w_dout_Q_15th_cbfp2),
		.din_R_16th_reorder(w_dout_R_16th_cbfp2),
		.din_Q_16th_reorder(w_dout_Q_16th_cbfp2),
		.din_R_17th_reorder(w_dout_R_17th_cbfp2),
		.din_Q_17th_reorder(w_dout_Q_17th_cbfp2),
		.din_R_18th_reorder(w_dout_R_18th_cbfp2),
		.din_Q_18th_reorder(w_dout_Q_18th_cbfp2),
		.din_R_19th_reorder(w_dout_R_19th_cbfp2),
		.din_Q_19th_reorder(w_dout_Q_19th_cbfp2),
		.din_R_20th_reorder(w_dout_R_20th_cbfp2),
		.din_Q_20th_reorder(w_dout_Q_20th_cbfp2),
		.din_R_21st_reorder(w_dout_R_21st_cbfp2),
		.din_Q_21st_reorder(w_dout_Q_21st_cbfp2),
		.din_R_22nd_reorder(w_dout_R_22nd_cbfp2),
		.din_Q_22nd_reorder(w_dout_Q_22nd_cbfp2),
		.din_R_23rd_reorder(w_dout_R_23rd_cbfp2),
		.din_Q_23rd_reorder(w_dout_Q_23rd_cbfp2),
		.din_R_24th_reorder(w_dout_R_24th_cbfp2),
		.din_Q_24th_reorder(w_dout_Q_24th_cbfp2),
		.din_R_25th_reorder(w_dout_R_25th_cbfp2),
		.din_Q_25th_reorder(w_dout_Q_25th_cbfp2),
		.din_R_26th_reorder(w_dout_R_26th_cbfp2),
		.din_Q_26th_reorder(w_dout_Q_26th_cbfp2),
		.din_R_27th_reorder(w_dout_R_27th_cbfp2),
		.din_Q_27th_reorder(w_dout_Q_27th_cbfp2),
		.din_R_28th_reorder(w_dout_R_28th_cbfp2),
		.din_Q_28th_reorder(w_dout_Q_28th_cbfp2),
		.din_R_29th_reorder(w_dout_R_29th_cbfp2),
		.din_Q_29th_reorder(w_dout_Q_29th_cbfp2),
		.din_R_30th_reorder(w_dout_R_30th_cbfp2),
		.din_Q_30th_reorder(w_dout_Q_30th_cbfp2),
		.din_R_31st_reorder(w_dout_R_31st_cbfp2),
		.din_Q_31st_reorder(w_dout_Q_31st_cbfp2),
		.din_R_32nd_reorder(w_dout_R_32nd_cbfp2),
		.din_Q_32nd_reorder(w_dout_Q_32nd_cbfp2),
	
		.dout_R_reorder(dout_R_reorder),
		.dout_Q_reorder(dout_Q_reorder),

		.done(done)
	);

endmodule
