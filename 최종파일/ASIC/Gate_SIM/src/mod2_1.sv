// `timescale 1ns/1ps

// module mod2_1 (
// 	input clk,
// 	input rstn,
// 	input alert_mod20,

// 	input signed [12:0] din_R_1st [1:0],
//     input signed [12:0] din_R_2nd [1:0],
// 	input signed [12:0] din_Q_1st [1:0],
//     input signed [12:0] din_Q_2nd [1:0],

// 	input signed [12:0] din_R_3rd [1:0],
//     input signed [12:0] din_R_4th [1:0],
// 	input signed [12:0] din_Q_3rd [1:0],
//     input signed [12:0] din_Q_4th [1:0],

// 	input signed [12:0] din_R_5th [1:0],
//     input signed [12:0] din_R_6th [1:0],
// 	input signed [12:0] din_Q_5th [1:0],
//     input signed [12:0] din_Q_6th [1:0],

// 	input signed [12:0] din_R_7th [1:0],
//     input signed [12:0] din_R_8th [1:0],
// 	input signed [12:0] din_Q_7th [1:0],
//     input signed [12:0] din_Q_8th [1:0],

// 	input signed [12:0] din_R_9th [1:0],
//     input signed [12:0] din_R_10th [1:0],
// 	input signed [12:0] din_Q_9th [1:0],
//     input signed [12:0] din_Q_10th [1:0],

// 	input signed [12:0] din_R_11th [1:0],
//     input signed [12:0] din_R_12th [1:0],
// 	input signed [12:0] din_Q_11th [1:0],
//     input signed [12:0] din_Q_12th [1:0],

// 	input signed [12:0] din_R_13th [1:0],
//     input signed [12:0] din_R_14th [1:0],
// 	input signed [12:0] din_Q_13th [1:0],
//     input signed [12:0] din_Q_14th [1:0],

// 	input signed [12:0] din_R_15th [1:0],
//     input signed [12:0] din_R_16th [1:0],
// 	input signed [12:0] din_Q_15th [1:0],
//     input signed [12:0] din_Q_16th [1:0],

// 	output logic signed [15:0] dout_R_1st_fin,
// 	output logic signed [15:0] dout_Q_1st_fin,

// 	output logic signed [15:0] dout_R_2nd_fin,
// 	output logic signed [15:0] dout_Q_2nd_fin,

// 	output logic signed [15:0] dout_R_3rd_fin,
// 	output logic signed [15:0] dout_Q_3rd_fin,

// 	output logic signed [15:0] dout_R_4th_fin,
// 	output logic signed [15:0] dout_Q_4th_fin,

// 	output logic signed [15:0] dout_R_5th_fin,
// 	output logic signed [15:0] dout_Q_5th_fin,

// 	output logic signed [15:0] dout_R_6th_fin,
// 	output logic signed [15:0] dout_Q_6th_fin,

// 	output logic signed [15:0] dout_R_7th_fin,
// 	output logic signed [15:0] dout_Q_7th_fin,

// 	output logic signed [15:0] dout_R_8th_fin,
// 	output logic signed [15:0] dout_Q_8th_fin,

// 	output logic signed [15:0] dout_R_9th_fin,
// 	output logic signed [15:0] dout_Q_9th_fin,

// 	output logic signed [15:0] dout_R_10th_fin,
// 	output logic signed [15:0] dout_Q_10th_fin,

// 	output logic signed [15:0] dout_R_11th_fin,
// 	output logic signed [15:0] dout_Q_11th_fin,

// 	output logic signed [15:0] dout_R_12th_fin,
// 	output logic signed [15:0] dout_Q_12th_fin,

// 	output logic signed [15:0] dout_R_13th_fin,
// 	output logic signed [15:0] dout_Q_13th_fin,

// 	output logic signed [15:0] dout_R_14th_fin,
// 	output logic signed [15:0] dout_Q_14th_fin,

// 	output logic signed [15:0] dout_R_15th_fin,
// 	output logic signed [15:0] dout_Q_15th_fin,

// 	output logic signed [15:0] dout_R_16th_fin,
// 	output logic signed [15:0] dout_Q_16th_fin,

// 	output logic signed [15:0] dout_R_17th_fin,
// 	output logic signed [15:0] dout_Q_17th_fin,

// 	output logic signed [15:0] dout_R_18th_fin,
// 	output logic signed [15:0] dout_Q_18th_fin,

// 	output logic signed [15:0] dout_R_19th_fin,
// 	output logic signed [15:0] dout_Q_19th_fin,

// 	output logic signed [15:0] dout_R_20th_fin,
// 	output logic signed [15:0] dout_Q_20th_fin,

// 	output logic signed [15:0] dout_R_21th_fin,
// 	output logic signed [15:0] dout_Q_21th_fin,

// 	output logic signed [15:0] dout_R_22th_fin,
// 	output logic signed [15:0] dout_Q_22th_fin,

// 	output logic signed [15:0] dout_R_23th_fin,
// 	output logic signed [15:0] dout_Q_23th_fin,

// 	output logic signed [15:0] dout_R_24th_fin,
// 	output logic signed [15:0] dout_Q_24th_fin,

// 	output logic signed [15:0] dout_R_25th_fin,
// 	output logic signed [15:0] dout_Q_25th_fin,

// 	output logic signed [15:0] dout_R_26th_fin,
// 	output logic signed [15:0] dout_Q_26th_fin,

// 	output logic signed [15:0] dout_R_27th_fin,
// 	output logic signed [15:0] dout_Q_27th_fin,

// 	output logic signed [15:0] dout_R_28th_fin,
// 	output logic signed [15:0] dout_Q_28th_fin,

// 	output logic signed [15:0] dout_R_29th_fin,
// 	output logic signed [15:0] dout_Q_29th_fin,

// 	output logic signed [15:0] dout_R_30th_fin,
// 	output logic signed [15:0] dout_Q_30th_fin,

// 	output logic signed [15:0] dout_R_31th_fin,
// 	output logic signed [15:0] dout_Q_31th_fin,

// 	output logic signed [15:0] dout_R_32th_fin,
// 	output logic signed [15:0] dout_Q_32th_fin,

// 	output logic alert_mod21
// );

// //////////////////////////////////////////////////////////////////////////////
// 					//PIPE REGISTER
// //////////////////////////////////////////////////////////////////////////////


// 	logic signed [15:0] dout_R_1st;
// 	logic signed [15:0] dout_Q_1st;

// 	logic signed [15:0] dout_R_2nd;
// 	logic signed [15:0] dout_Q_2nd;

// 	logic signed [15:0] dout_R_3rd;
// 	logic signed [15:0] dout_Q_3rd;

// 	logic signed [15:0] dout_R_4th;
// 	logic signed [15:0] dout_Q_4th;

// 	logic signed [15:0] dout_R_5th;
// 	logic signed [15:0] dout_Q_5th;

// 	logic signed [15:0] dout_R_6th;
// 	logic signed [15:0] dout_Q_6th;

// 	logic signed [15:0] dout_R_7th;
// 	logic signed [15:0] dout_Q_7th;

// 	logic signed [15:0] dout_R_8th;
// 	logic signed [15:0] dout_Q_8th;

// 	logic signed [15:0] dout_R_9th;
// 	logic signed [15:0] dout_Q_9th;

// 	logic signed [15:0] dout_R_10th;
// 	logic signed [15:0] dout_Q_10th;

// 	logic signed [15:0] dout_R_11th;
// 	logic signed [15:0] dout_Q_11th;

// 	logic signed [15:0] dout_R_12th;
// 	logic signed [15:0] dout_Q_12th;

// 	logic signed [15:0] dout_R_13th;
// 	logic signed [15:0] dout_Q_13th;

// 	logic signed [15:0] dout_R_14th;
// 	logic signed [15:0] dout_Q_14th;

// 	logic signed [15:0] dout_R_15th;
// 	logic signed [15:0] dout_Q_15th;

// 	logic signed [15:0] dout_R_16th;
// 	logic signed [15:0] dout_Q_16th;

// 	logic signed [15:0] dout_R_17th;
// 	logic signed [15:0] dout_Q_17th;

// 	logic signed [15:0] dout_R_18th;
// 	logic signed [15:0] dout_Q_18th;

// 	logic signed [15:0] dout_R_19th;
// 	logic signed [15:0] dout_Q_19th;

// 	logic signed [15:0] dout_R_20th;
// 	logic signed [15:0] dout_Q_20th;

// 	logic signed [15:0] dout_R_21th;
// 	logic signed [15:0] dout_Q_21th;

// 	logic signed [15:0] dout_R_22th;
// 	logic signed [15:0] dout_Q_22th;

// 	logic signed [15:0] dout_R_23th;
// 	logic signed [15:0] dout_Q_23th;

// 	logic signed [15:0] dout_R_24th;
// 	logic signed [15:0] dout_Q_24th;

// 	logic signed [15:0] dout_R_25th;
// 	logic signed [15:0] dout_Q_25th;

// 	logic signed [15:0] dout_R_26th;
// 	logic signed [15:0] dout_Q_26th;

// 	logic signed [15:0] dout_R_27th;
// 	logic signed [15:0] dout_Q_27th;

// 	logic signed [15:0] dout_R_28th;
// 	logic signed [15:0] dout_Q_28th;

// 	logic signed [15:0] dout_R_29th;
// 	logic signed [15:0] dout_Q_29th;

// 	logic signed [15:0] dout_R_30th;
// 	logic signed [15:0] dout_Q_30th;

// 	logic signed [15:0] dout_R_31th;
// 	logic signed [15:0] dout_Q_31th;

// 	logic signed [15:0] dout_R_32th;
// 	logic signed [15:0] dout_Q_32th;

// 	always_ff @( posedge clk or negedge rstn ) begin : PIPE_REGISTER
// 		if(!rstn) begin
// 			dout_R_1st_fin <= 0;
// 			dout_Q_1st_fin <= 0;

// 			dout_R_2nd_fin <= 0;
// 			dout_Q_2nd_fin <= 0;

// 			dout_R_3rd_fin <= 0;
// 			dout_Q_3rd_fin <= 0;

// 			dout_R_4th_fin <= 0;
// 			dout_Q_4th_fin <= 0;

// 			dout_R_5th_fin <= 0;
// 			dout_Q_5th_fin <= 0;

// 			dout_R_6th_fin <= 0;
// 			dout_Q_6th_fin <= 0;

// 			dout_R_7th_fin <= 0;
// 			dout_Q_7th_fin <= 0;

// 			dout_R_8th_fin <= 0;
// 			dout_Q_8th_fin <= 0;

// 			dout_R_9th_fin <= 0;
// 			dout_Q_9th_fin <= 0;

// 			dout_R_10th_fin <= 0;
// 			dout_Q_10th_fin <= 0;

// 			dout_R_11th_fin <= 0;
// 			dout_Q_11th_fin <= 0;

// 			dout_R_12th_fin <= 0;
// 			dout_Q_12th_fin <= 0;

// 			dout_R_13th_fin <= 0;
// 			dout_Q_13th_fin <= 0;

// 			dout_R_14th_fin <= 0;
// 			dout_Q_14th_fin <= 0;

// 			dout_R_15th_fin <= 0;
// 			dout_Q_15th_fin <= 0;

// 			dout_R_16th_fin <= 0;
// 			dout_Q_16th_fin <= 0;

// 			dout_R_17th_fin <= 0;
// 			dout_Q_17th_fin <= 0;

// 			dout_R_18th_fin <= 0;
// 			dout_Q_18th_fin <= 0;

// 			dout_R_19th_fin <= 0;
// 			dout_Q_19th_fin <= 0;

// 			dout_R_20th_fin <= 0;
// 			dout_Q_20th_fin <= 0;

// 			dout_R_21th_fin <= 0;
// 			dout_Q_21th_fin <= 0;

// 			dout_R_22th_fin <= 0;
// 			dout_Q_22th_fin <= 0;

// 			dout_R_23th_fin <= 0;
// 			dout_Q_23th_fin <= 0;

// 			dout_R_24th_fin <= 0;
// 			dout_Q_24th_fin <= 0;

// 			dout_R_25th_fin <= 0;
// 			dout_Q_25th_fin <= 0;

// 			dout_R_26th_fin <= 0;
// 			dout_Q_26th_fin <= 0;

// 			dout_R_27th_fin <= 0;
// 			dout_Q_27th_fin <= 0;

// 			dout_R_28th_fin <= 0;
// 			dout_Q_28th_fin <= 0;

// 			dout_R_29th_fin <= 0;
// 			dout_Q_29th_fin <= 0;

// 			dout_R_30th_fin <= 0;
// 			dout_Q_30th_fin <= 0;

// 			dout_R_31th_fin <= 0;
// 			dout_Q_31th_fin <= 0;

// 			dout_R_32th_fin <= 0;
// 			dout_Q_32th_fin <= 0;
// 		end
// 		else begin
// 			dout_R_1st_fin <= dout_R_1st;
// 			dout_Q_1st_fin <= dout_Q_1st;

// 			dout_R_2nd_fin <= dout_R_2nd;
// 			dout_Q_2nd_fin <= dout_Q_2nd;

// 			dout_R_3rd_fin <= dout_R_3rd;
// 			dout_Q_3rd_fin <= dout_Q_3rd;

// 			dout_R_4th_fin <= dout_R_4th;
// 			dout_Q_4th_fin <= dout_Q_4th;

// 			dout_R_5th_fin <= dout_R_5th;
// 			dout_Q_5th_fin <= dout_Q_5th;

// 			dout_R_6th_fin <= dout_R_6th;
// 			dout_Q_6th_fin <= dout_Q_6th;

// 			dout_R_7th_fin <= dout_R_7th;
// 			dout_Q_7th_fin <= dout_Q_7th;

// 			dout_R_8th_fin <= dout_R_8th;
// 			dout_Q_8th_fin <= dout_Q_8th;

// 			dout_R_9th_fin <= dout_R_9th;
// 			dout_Q_9th_fin <= dout_Q_9th;

// 			dout_R_10th_fin <= dout_R_10th;
// 			dout_Q_10th_fin <= dout_Q_10th;

// 			dout_R_11th_fin <= dout_R_11th;
// 			dout_Q_11th_fin <= dout_Q_11th;

// 			dout_R_12th_fin <= dout_R_12th;
// 			dout_Q_12th_fin <= dout_Q_12th;

// 			dout_R_13th_fin <= dout_R_13th;
// 			dout_Q_13th_fin <= dout_Q_13th;

// 			dout_R_14th_fin <= dout_R_14th;
// 			dout_Q_14th_fin <= dout_Q_14th;

// 			dout_R_15th_fin <= dout_R_15th;
// 			dout_Q_15th_fin <= dout_Q_15th;

// 			dout_R_16th_fin <= dout_R_16th;
// 			dout_Q_16th_fin <= dout_Q_16th;

// 			dout_R_17th_fin <= dout_R_17th;
// 			dout_Q_17th_fin <= dout_Q_17th;

// 			dout_R_18th_fin <= dout_R_18th;
// 			dout_Q_18th_fin <= dout_Q_18th;

// 			dout_R_19th_fin <= dout_R_19th;
// 			dout_Q_19th_fin <= dout_Q_19th;

// 			dout_R_20th_fin <= dout_R_20th;
// 			dout_Q_20th_fin <= dout_Q_20th;

// 			dout_R_21th_fin <= dout_R_21th;
// 			dout_Q_21th_fin <= dout_Q_21th;

// 			dout_R_22th_fin <= dout_R_22th;
// 			dout_Q_22th_fin <= dout_Q_22th;

// 			dout_R_23th_fin <= dout_R_23th;
// 			dout_Q_23th_fin <= dout_Q_23th;

// 			dout_R_24th_fin <= dout_R_24th;
// 			dout_Q_24th_fin <= dout_Q_24th;

// 			dout_R_25th_fin <= dout_R_25th;
// 			dout_Q_25th_fin <= dout_Q_25th;

// 			dout_R_26th_fin <= dout_R_26th;
// 			dout_Q_26th_fin <= dout_Q_26th;

// 			dout_R_27th_fin <= dout_R_27th;
// 			dout_Q_27th_fin <= dout_Q_27th;

// 			dout_R_28th_fin <= dout_R_28th;
// 			dout_Q_28th_fin <= dout_Q_28th;

// 			dout_R_29th_fin <= dout_R_29th;
// 			dout_Q_29th_fin <= dout_Q_29th;

// 			dout_R_30th_fin <= dout_R_30th;
// 			dout_Q_30th_fin <= dout_Q_30th;

// 			dout_R_31th_fin <= dout_R_31th;
// 			dout_Q_31th_fin <= dout_Q_31th;

// 			dout_R_32th_fin <= dout_R_32th;
// 			dout_Q_32th_fin <= dout_Q_32th;
// 		end
// 	end
// ////////////////////////////////////////////////////////////////////////////////////////
// 						//CONTROL SIGNAL
// ////////////////////////////////////////////////////////////////////////////////////////

// 	logic alert_mod21_tmp;
	
// 	always_ff @( posedge clk or negedge rstn ) begin : make_alert_mod21
// 		if(!rstn) begin
// 			alert_mod21 <= 0;
// 			alert_mod21_tmp <= 0;
// 		end
// 		else begin
// 			alert_mod21_tmp <= alert_mod20;
// 			alert_mod21 <= alert_mod21_tmp;
// 		end
// 	end

// ////////////////////////////////////////////////////////////////////////////////////////
// 						//BF2I
// ////////////////////////////////////////////////////////////////////////////////////////

// ////////////////////////////////////////////////////////////////////////////////////////
// 						//1-2: 1st ~ 4th
// ////////////////////////////////////////////////////////////////////////////////////////

// 	logic signed [13:0] bf_R_1st [1:0];
// 	logic signed [13:0] bf_R_2nd [1:0];
// 	logic signed [13:0] bf_Q_1st [1:0];
// 	logic signed [13:0] bf_Q_2nd [1:0];

// 	assign dout_R_1st = bf_R_1st[1];
// 	assign dout_Q_1st = bf_Q_1st[1];

// 	assign dout_R_2nd = bf_R_1st[0];
// 	assign dout_Q_2nd = bf_Q_1st[0];

// 	assign dout_R_3rd = bf_R_2nd[1];
// 	assign dout_Q_3rd = bf_Q_2nd[1];

// 	BF2I_2bundle #(
// 	.WIDTH(13),
// 	.DEPTH(2)
// 	) U_MOD21_BF2I_1to4(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.en(alert_mod20),

// 	.din_R_1(din_R_1st),
// 	.din_R_2(din_R_2nd),

//     .din_Q_1(din_Q_1st),
// 	.din_Q_2(din_Q_2nd),

// 	.dout_R_add(bf_R_1st),
// 	.dout_R_sub(bf_R_2nd),

// 	.dout_Q_add(bf_Q_1st),
// 	.dout_Q_sub(bf_Q_2nd)
// 	);

// 	fac8_1_mj MUL8_1_4TH(
// 	.din_R(bf_R_2nd[0]),

// 	.din_Q(bf_Q_2nd[0]),

// 	.dout_R(dout_R_4th),

// 	.dout_Q(dout_Q_4th) 
// 	);

// ////////////////////////////////////////////////////////////////////////////////////////
// 						//3-4: 5th ~ 8th
// ////////////////////////////////////////////////////////////////////////////////////////

// 	logic signed [13:0] bf_R_3rd [1:0];
// 	logic signed [13:0] bf_R_4th [1:0];
// 	logic signed [13:0] bf_Q_3rd [1:0];
// 	logic signed [13:0] bf_Q_4th [1:0];

// 	assign dout_R_5th = bf_R_3rd[1];
// 	assign dout_Q_5th = bf_Q_3rd[1];

// 	assign dout_R_7th = bf_R_4th[1];
// 	assign dout_Q_7th = bf_Q_4th[1];

// 	BF2I_2bundle #(
// 	.WIDTH(13),
// 	.DEPTH(2)
// 	) U_MOD21_BF2I_5to8(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.en(alert_mod20),

// 	.din_R_1(din_R_3rd),
// 	.din_R_2(din_R_4th),

//     .din_Q_1(din_Q_3rd),
// 	.din_Q_2(din_Q_4th),

// 	.dout_R_add(bf_R_3rd),
// 	.dout_R_sub(bf_R_4th),

// 	.dout_Q_add(bf_Q_3rd),
// 	.dout_Q_sub(bf_Q_4th)
// 	);
	
// 	fac8_1_181j MUL8_1_6TH(
// 	.din_R(bf_R_3rd[0]),

// 	.din_Q(bf_Q_3rd[0]),

// 	.dout_R(dout_R_6th),

// 	.dout_Q(dout_Q_6th) 
// 	);

// 	fac8_1_m181j MUL8_1_8TH(
// 	.din_R(bf_R_4th[0]),

// 	.din_Q(bf_Q_4th[0]),

// 	.dout_R(dout_R_8th),

// 	.dout_Q(dout_Q_8th) 
// 	);

// ////////////////////////////////////////////////////////////////////////////////////////
// 						//5-6: 9th ~ 12th
// ////////////////////////////////////////////////////////////////////////////////////////

// 	logic signed [13:0] bf_R_5th [1:0];
// 	logic signed [13:0] bf_R_6th [1:0];
// 	logic signed [13:0] bf_Q_5th [1:0];
// 	logic signed [13:0] bf_Q_6th [1:0];

// 	assign dout_R_9th = bf_R_5th[1];
// 	assign dout_Q_9th = bf_Q_5th[1];

// 	assign dout_R_10th = bf_R_5th[0];
// 	assign dout_Q_10th = bf_Q_5th[0];

// 	assign dout_R_11th = bf_R_6th[1];
// 	assign dout_Q_11th = bf_Q_6th[1];

// 	BF2I_2bundle #(
// 	.WIDTH(13),
// 	.DEPTH(2)
// 	) U_MOD21_BF2I_9to12(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.en(alert_mod20),

// 	.din_R_1(din_R_5th),
// 	.din_R_2(din_R_6th),

//     .din_Q_1(din_Q_5th),
// 	.din_Q_2(din_Q_6th),

// 	.dout_R_add(bf_R_5th),
// 	.dout_R_sub(bf_R_6th),

// 	.dout_Q_add(bf_Q_5th),
// 	.dout_Q_sub(bf_Q_6th)
// 	);
	
// 	fac8_1_mj MUL8_1_12TH(
// 	.din_R(bf_R_6th[0]),

// 	.din_Q(bf_Q_6th[0]),

// 	.dout_R(dout_R_12th),

// 	.dout_Q(dout_Q_12th) 
// 	);

// ////////////////////////////////////////////////////////////////////////////////////////
// 						//7-8: 13th ~ 16th
// ////////////////////////////////////////////////////////////////////////////////////////

// 	logic signed [13:0] bf_R_7th [1:0];
// 	logic signed [13:0] bf_R_8th [1:0];
// 	logic signed [13:0] bf_Q_7th [1:0];
// 	logic signed [13:0] bf_Q_8th [1:0];

// 	assign dout_R_13th = bf_R_7th[1];
// 	assign dout_Q_13th = bf_Q_7th[1];

// 	assign dout_R_15th = bf_R_8th[1];
// 	assign dout_Q_15th = bf_Q_8th[1];

// 	BF2I_2bundle #(
// 	.WIDTH(13),
// 	.DEPTH(2)
// 	) U_MOD21_BF2I_13to16(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.en(alert_mod20),

// 	.din_R_1(din_R_7th),
// 	.din_R_2(din_R_8th),

//     .din_Q_1(din_Q_7th),
// 	.din_Q_2(din_Q_8th),

// 	.dout_R_add(bf_R_7th),
// 	.dout_R_sub(bf_R_8th),

// 	.dout_Q_add(bf_Q_7th),
// 	.dout_Q_sub(bf_Q_8th)
// 	);
	
// 	fac8_1_181j MUL8_1_14TH(
// 	.din_R(bf_R_7th[0]),

// 	.din_Q(bf_Q_7th[0]),

// 	.dout_R(dout_R_14th),

// 	.dout_Q(dout_Q_14th) 
// 	);

// 	fac8_1_m181j MUL8_1_16TH(
// 	.din_R(bf_R_8th[0]),

// 	.din_Q(bf_Q_8th[0]),

// 	.dout_R(dout_R_16th),

// 	.dout_Q(dout_Q_16th) 
// 	);

// ////////////////////////////////////////////////////////////////////////////////////////
// 						//9-10: 17th ~ 20th
// ////////////////////////////////////////////////////////////////////////////////////////

// 	logic signed [13:0] bf_R_9th [1:0];
// 	logic signed [13:0] bf_R_10th [1:0];
// 	logic signed [13:0] bf_Q_9th [1:0];
// 	logic signed [13:0] bf_Q_10th [1:0];

// 	assign dout_R_17th = bf_R_9th[1];
// 	assign dout_Q_17th = bf_Q_9th[1];

// 	assign dout_R_18th = bf_R_9th[0];
// 	assign dout_Q_18th = bf_Q_9th[0];

// 	assign dout_R_19th = bf_R_10th[1];
// 	assign dout_Q_19th = bf_Q_10th[1];

// 	BF2I_2bundle #(
// 	.WIDTH(13),
// 	.DEPTH(2)
// 	) U_MOD21_BF2I_17to20(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.en(alert_mod20),

// 	.din_R_1(din_R_9th),
// 	.din_R_2(din_R_10th),

//     .din_Q_1(din_Q_9th),
// 	.din_Q_2(din_Q_10th),

// 	.dout_R_add(bf_R_9th),
// 	.dout_R_sub(bf_R_10th),

// 	.dout_Q_add(bf_Q_9th),
// 	.dout_Q_sub(bf_Q_10th)
// 	);
	
// 	fac8_1_mj MUL8_1_20TH(
// 	.din_R(bf_R_10th[0]),

// 	.din_Q(bf_Q_10th[0]),

// 	.dout_R(dout_R_20th),

// 	.dout_Q(dout_Q_20th) 
// 	);

// ////////////////////////////////////////////////////////////////////////////////////////
// 						//11-12: 21th ~ 24th
// ////////////////////////////////////////////////////////////////////////////////////////

// 	logic signed [13:0] bf_R_11th [1:0];
// 	logic signed [13:0] bf_R_12th [1:0];
// 	logic signed [13:0] bf_Q_11th [1:0];
// 	logic signed [13:0] bf_Q_12th [1:0];

// 	assign dout_R_21th = bf_R_11th[1];
// 	assign dout_Q_21th = bf_Q_11th[1];

// 	assign dout_R_23th = bf_R_12th[1];
// 	assign dout_Q_23th = bf_Q_12th[1];

// 	BF2I_2bundle #(
// 	.WIDTH(13),
// 	.DEPTH(2)
// 	) U_MOD21_BF2I_21to24(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.en(alert_mod20),

// 	.din_R_1(din_R_11th),
// 	.din_R_2(din_R_12th),

//     .din_Q_1(din_Q_11th),
// 	.din_Q_2(din_Q_12th),

// 	.dout_R_add(bf_R_11th),
// 	.dout_R_sub(bf_R_12th),

// 	.dout_Q_add(bf_Q_11th),
// 	.dout_Q_sub(bf_Q_12th)
// 	);
	
// 	fac8_1_181j MUL8_1_22TH(
// 	.din_R(bf_R_11th[0]),

// 	.din_Q(bf_Q_11th[0]),

// 	.dout_R(dout_R_22th),

// 	.dout_Q(dout_Q_22th) 
// 	);

// 	fac8_1_m181j MUL8_1_24TH(
// 	.din_R(bf_R_12th[0]),

// 	.din_Q(bf_Q_12th[0]),

// 	.dout_R(dout_R_24th),

// 	.dout_Q(dout_Q_24th) 
// 	);

// ////////////////////////////////////////////////////////////////////////////////////////
// 						//13-14: 25th ~ 28th
// ////////////////////////////////////////////////////////////////////////////////////////

// 	logic signed [13:0] bf_R_13th [1:0];
// 	logic signed [13:0] bf_R_14th [1:0];
// 	logic signed [13:0] bf_Q_13th [1:0];
// 	logic signed [13:0] bf_Q_14th [1:0];

// 	assign dout_R_25th = bf_R_13th[1];
// 	assign dout_Q_25th = bf_Q_13th[1];

// 	assign dout_R_26th = bf_R_13th[0];
// 	assign dout_Q_26th = bf_Q_13th[0];

// 	assign dout_R_27th = bf_R_14th[1];
// 	assign dout_Q_27th = bf_Q_14th[1];

// 	BF2I_2bundle #(
// 	.WIDTH(13),
// 	.DEPTH(2)
// 	) U_MOD21_BF2I_25to28(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.en(alert_mod20),

// 	.din_R_1(din_R_13th),
// 	.din_R_2(din_R_14th),

//     .din_Q_1(din_Q_13th),
// 	.din_Q_2(din_Q_14th),

// 	.dout_R_add(bf_R_13th),
// 	.dout_R_sub(bf_R_14th),

// 	.dout_Q_add(bf_Q_13th),
// 	.dout_Q_sub(bf_Q_14th)
// 	);
	
// 	fac8_1_mj MUL8_1_28TH(
// 	.din_R(bf_R_14th[0]),

// 	.din_Q(bf_Q_14th[0]),

// 	.dout_R(dout_R_28th),

// 	.dout_Q(dout_Q_28th) 
// 	);

// ////////////////////////////////////////////////////////////////////////////////////////
// 						//15-16: 29th ~ 32th
// ////////////////////////////////////////////////////////////////////////////////////////

// 	logic signed [13:0] bf_R_15th [1:0];
// 	logic signed [13:0] bf_R_16th [1:0];
// 	logic signed [13:0] bf_Q_15th [1:0];
// 	logic signed [13:0] bf_Q_16th [1:0];

// 	assign dout_R_29th = bf_R_15th[1];
// 	assign dout_Q_29th = bf_Q_15th[1];

// 	assign dout_R_31th = bf_R_16th[1];
// 	assign dout_Q_31th = bf_Q_16th[1];

// 	BF2I_2bundle #(
// 	.WIDTH(13),
// 	.DEPTH(2)
// 	) U_MOD21_BF2I_29to32(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.en(alert_mod20),

// 	.din_R_1(din_R_15th),
// 	.din_R_2(din_R_16th),

//     .din_Q_1(din_Q_15th),
// 	.din_Q_2(din_Q_16th),

// 	.dout_R_add(bf_R_15th),
// 	.dout_R_sub(bf_R_16th),

// 	.dout_Q_add(bf_Q_15th),
// 	.dout_Q_sub(bf_Q_16th)
// 	);
	
// 	fac8_1_181j MUL8_1_30TH(
// 	.din_R(bf_R_15th[0]),

// 	.din_Q(bf_Q_15th[0]),

// 	.dout_R(dout_R_30th),

// 	.dout_Q(dout_Q_30th) 
// 	);

// 	fac8_1_m181j MUL8_1_32TH(
// 	.din_R(bf_R_16th[0]),

// 	.din_Q(bf_Q_16th[0]),

// 	.dout_R(dout_R_32th),

// 	.dout_Q(dout_Q_32th) 
// 	);


// endmodule

`timescale 1ns/1ps

module mod2_1 (
	input clk,
	input rstn,
	input alert_mod20,

	input signed [12:0] din_R_1st [1:0],
    input signed [12:0] din_R_2nd [1:0],
	input signed [12:0] din_Q_1st [1:0],
    input signed [12:0] din_Q_2nd [1:0],

	input signed [12:0] din_R_3rd [1:0],
    input signed [12:0] din_R_4th [1:0],
	input signed [12:0] din_Q_3rd [1:0],
    input signed [12:0] din_Q_4th [1:0],

	input signed [12:0] din_R_5th [1:0],
    input signed [12:0] din_R_6th [1:0],
	input signed [12:0] din_Q_5th [1:0],
    input signed [12:0] din_Q_6th [1:0],

	input signed [12:0] din_R_7th [1:0],
    input signed [12:0] din_R_8th [1:0],
	input signed [12:0] din_Q_7th [1:0],
    input signed [12:0] din_Q_8th [1:0],

	input signed [12:0] din_R_9th [1:0],
    input signed [12:0] din_R_10th [1:0],
	input signed [12:0] din_Q_9th [1:0],
    input signed [12:0] din_Q_10th [1:0],

	input signed [12:0] din_R_11th [1:0],
    input signed [12:0] din_R_12th [1:0],
	input signed [12:0] din_Q_11th [1:0],
    input signed [12:0] din_Q_12th [1:0],

	input signed [12:0] din_R_13th [1:0],
    input signed [12:0] din_R_14th [1:0],
	input signed [12:0] din_Q_13th [1:0],
    input signed [12:0] din_Q_14th [1:0],

	input signed [12:0] din_R_15th [1:0],
    input signed [12:0] din_R_16th [1:0],
	input signed [12:0] din_Q_15th [1:0],
    input signed [12:0] din_Q_16th [1:0],

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

	output logic alert_mod21
);

//////////////////////////////////////////////////////////////////////////////
					//PIPE REGISTER
//////////////////////////////////////////////////////////////////////////////


	logic signed [15:0] dout_R_1st;
	logic signed [15:0] dout_Q_1st;

	logic signed [15:0] dout_R_2nd;
	logic signed [15:0] dout_Q_2nd;

	logic signed [15:0] dout_R_3rd;
	logic signed [15:0] dout_Q_3rd;

	logic signed [15:0] dout_R_4th;
	logic signed [15:0] dout_Q_4th;

	logic signed [15:0] dout_R_5th;
	logic signed [15:0] dout_Q_5th;

	logic signed [15:0] dout_R_6th;
	logic signed [15:0] dout_Q_6th;

	logic signed [15:0] dout_R_7th;
	logic signed [15:0] dout_Q_7th;

	logic signed [15:0] dout_R_8th;
	logic signed [15:0] dout_Q_8th;

	logic signed [15:0] dout_R_9th;
	logic signed [15:0] dout_Q_9th;

	logic signed [15:0] dout_R_10th;
	logic signed [15:0] dout_Q_10th;

	logic signed [15:0] dout_R_11th;
	logic signed [15:0] dout_Q_11th;

	logic signed [15:0] dout_R_12th;
	logic signed [15:0] dout_Q_12th;

	logic signed [15:0] dout_R_13th;
	logic signed [15:0] dout_Q_13th;

	logic signed [15:0] dout_R_14th;
	logic signed [15:0] dout_Q_14th;

	logic signed [15:0] dout_R_15th;
	logic signed [15:0] dout_Q_15th;

	logic signed [15:0] dout_R_16th;
	logic signed [15:0] dout_Q_16th;

	logic signed [15:0] dout_R_17th;
	logic signed [15:0] dout_Q_17th;

	logic signed [15:0] dout_R_18th;
	logic signed [15:0] dout_Q_18th;

	logic signed [15:0] dout_R_19th;
	logic signed [15:0] dout_Q_19th;

	logic signed [15:0] dout_R_20th;
	logic signed [15:0] dout_Q_20th;

	logic signed [15:0] dout_R_21th;
	logic signed [15:0] dout_Q_21th;

	logic signed [15:0] dout_R_22th;
	logic signed [15:0] dout_Q_22th;

	logic signed [15:0] dout_R_23th;
	logic signed [15:0] dout_Q_23th;

	logic signed [15:0] dout_R_24th;
	logic signed [15:0] dout_Q_24th;

	logic signed [15:0] dout_R_25th;
	logic signed [15:0] dout_Q_25th;

	logic signed [15:0] dout_R_26th;
	logic signed [15:0] dout_Q_26th;

	logic signed [15:0] dout_R_27th;
	logic signed [15:0] dout_Q_27th;

	logic signed [15:0] dout_R_28th;
	logic signed [15:0] dout_Q_28th;

	logic signed [15:0] dout_R_29th;
	logic signed [15:0] dout_Q_29th;

	logic signed [15:0] dout_R_30th;
	logic signed [15:0] dout_Q_30th;

	logic signed [15:0] dout_R_31th;
	logic signed [15:0] dout_Q_31th;

	logic signed [15:0] dout_R_32th;
	logic signed [15:0] dout_Q_32th;

	always_ff @( posedge clk or negedge rstn ) begin : PIPE_REGISTER
		if(!rstn) begin
			dout_R_1st_fin <= 0;
			dout_Q_1st_fin <= 0;

			dout_R_2nd_fin <= 0;
			dout_Q_2nd_fin <= 0;

			dout_R_3rd_fin <= 0;
			dout_Q_3rd_fin <= 0;

			dout_R_4th_fin <= 0;
			dout_Q_4th_fin <= 0;

			dout_R_5th_fin <= 0;
			dout_Q_5th_fin <= 0;

			dout_R_6th_fin <= 0;
			dout_Q_6th_fin <= 0;

			dout_R_7th_fin <= 0;
			dout_Q_7th_fin <= 0;

			dout_R_8th_fin <= 0;
			dout_Q_8th_fin <= 0;

			dout_R_9th_fin <= 0;
			dout_Q_9th_fin <= 0;

			dout_R_10th_fin <= 0;
			dout_Q_10th_fin <= 0;

			dout_R_11th_fin <= 0;
			dout_Q_11th_fin <= 0;

			dout_R_12th_fin <= 0;
			dout_Q_12th_fin <= 0;

			dout_R_13th_fin <= 0;
			dout_Q_13th_fin <= 0;

			dout_R_14th_fin <= 0;
			dout_Q_14th_fin <= 0;

			dout_R_15th_fin <= 0;
			dout_Q_15th_fin <= 0;

			dout_R_16th_fin <= 0;
			dout_Q_16th_fin <= 0;

			dout_R_17th_fin <= 0;
			dout_Q_17th_fin <= 0;

			dout_R_18th_fin <= 0;
			dout_Q_18th_fin <= 0;

			dout_R_19th_fin <= 0;
			dout_Q_19th_fin <= 0;

			dout_R_20th_fin <= 0;
			dout_Q_20th_fin <= 0;

			dout_R_21th_fin <= 0;
			dout_Q_21th_fin <= 0;

			dout_R_22th_fin <= 0;
			dout_Q_22th_fin <= 0;

			dout_R_23th_fin <= 0;
			dout_Q_23th_fin <= 0;

			dout_R_24th_fin <= 0;
			dout_Q_24th_fin <= 0;

			dout_R_25th_fin <= 0;
			dout_Q_25th_fin <= 0;

			dout_R_26th_fin <= 0;
			dout_Q_26th_fin <= 0;

			dout_R_27th_fin <= 0;
			dout_Q_27th_fin <= 0;

			dout_R_28th_fin <= 0;
			dout_Q_28th_fin <= 0;

			dout_R_29th_fin <= 0;
			dout_Q_29th_fin <= 0;

			dout_R_30th_fin <= 0;
			dout_Q_30th_fin <= 0;

			dout_R_31th_fin <= 0;
			dout_Q_31th_fin <= 0;

			dout_R_32th_fin <= 0;
			dout_Q_32th_fin <= 0;
		end
		else begin
			dout_R_1st_fin <= dout_R_1st;
			dout_Q_1st_fin <= dout_Q_1st;

			dout_R_2nd_fin <= dout_R_2nd;
			dout_Q_2nd_fin <= dout_Q_2nd;

			dout_R_3rd_fin <= dout_R_3rd;
			dout_Q_3rd_fin <= dout_Q_3rd;

			dout_R_4th_fin <= dout_R_4th;
			dout_Q_4th_fin <= dout_Q_4th;

			dout_R_5th_fin <= dout_R_5th;
			dout_Q_5th_fin <= dout_Q_5th;

			dout_R_6th_fin <= dout_R_6th;
			dout_Q_6th_fin <= dout_Q_6th;

			dout_R_7th_fin <= dout_R_7th;
			dout_Q_7th_fin <= dout_Q_7th;

			dout_R_8th_fin <= dout_R_8th;
			dout_Q_8th_fin <= dout_Q_8th;

			dout_R_9th_fin <= dout_R_9th;
			dout_Q_9th_fin <= dout_Q_9th;

			dout_R_10th_fin <= dout_R_10th;
			dout_Q_10th_fin <= dout_Q_10th;

			dout_R_11th_fin <= dout_R_11th;
			dout_Q_11th_fin <= dout_Q_11th;

			dout_R_12th_fin <= dout_R_12th;
			dout_Q_12th_fin <= dout_Q_12th;

			dout_R_13th_fin <= dout_R_13th;
			dout_Q_13th_fin <= dout_Q_13th;

			dout_R_14th_fin <= dout_R_14th;
			dout_Q_14th_fin <= dout_Q_14th;

			dout_R_15th_fin <= dout_R_15th;
			dout_Q_15th_fin <= dout_Q_15th;

			dout_R_16th_fin <= dout_R_16th;
			dout_Q_16th_fin <= dout_Q_16th;

			dout_R_17th_fin <= dout_R_17th;
			dout_Q_17th_fin <= dout_Q_17th;

			dout_R_18th_fin <= dout_R_18th;
			dout_Q_18th_fin <= dout_Q_18th;

			dout_R_19th_fin <= dout_R_19th;
			dout_Q_19th_fin <= dout_Q_19th;

			dout_R_20th_fin <= dout_R_20th;
			dout_Q_20th_fin <= dout_Q_20th;

			dout_R_21th_fin <= dout_R_21th;
			dout_Q_21th_fin <= dout_Q_21th;

			dout_R_22th_fin <= dout_R_22th;
			dout_Q_22th_fin <= dout_Q_22th;

			dout_R_23th_fin <= dout_R_23th;
			dout_Q_23th_fin <= dout_Q_23th;

			dout_R_24th_fin <= dout_R_24th;
			dout_Q_24th_fin <= dout_Q_24th;

			dout_R_25th_fin <= dout_R_25th;
			dout_Q_25th_fin <= dout_Q_25th;

			dout_R_26th_fin <= dout_R_26th;
			dout_Q_26th_fin <= dout_Q_26th;

			dout_R_27th_fin <= dout_R_27th;
			dout_Q_27th_fin <= dout_Q_27th;

			dout_R_28th_fin <= dout_R_28th;
			dout_Q_28th_fin <= dout_Q_28th;

			dout_R_29th_fin <= dout_R_29th;
			dout_Q_29th_fin <= dout_Q_29th;

			dout_R_30th_fin <= dout_R_30th;
			dout_Q_30th_fin <= dout_Q_30th;

			dout_R_31th_fin <= dout_R_31th;
			dout_Q_31th_fin <= dout_Q_31th;

			dout_R_32th_fin <= dout_R_32th;
			dout_Q_32th_fin <= dout_Q_32th;
		end
	end
////////////////////////////////////////////////////////////////////////////////////////
						//CONTROL SIGNAL
////////////////////////////////////////////////////////////////////////////////////////

	logic alert_mod21_tmp;
	
	always_ff @( posedge clk or negedge rstn ) begin : make_alert_mod21
		if(!rstn) begin
			alert_mod21 <= 0;
			alert_mod21_tmp <= 0;
		end
		else begin
			alert_mod21_tmp <= alert_mod20;
			alert_mod21 <= alert_mod21_tmp;
		end
	end

////////////////////////////////////////////////////////////////////////////////////////
						//BF2I
////////////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////////////
						//1-2: 1st ~ 4th
////////////////////////////////////////////////////////////////////////////////////////

	logic signed [13:0] bf_R_1st [1:0];
	logic signed [13:0] bf_R_2nd [1:0];
	logic signed [13:0] bf_Q_1st [1:0];
	logic signed [13:0] bf_Q_2nd [1:0];

	assign dout_R_1st = bf_R_1st[0];
	assign dout_Q_1st = bf_Q_1st[0];

	assign dout_R_2nd = bf_R_1st[1];
	assign dout_Q_2nd = bf_Q_1st[1];

	assign dout_R_3rd = bf_R_2nd[0];
	assign dout_Q_3rd = bf_Q_2nd[0];

	BF2I_2bundle #(
	.WIDTH(13),
	.DEPTH(2)
	) U_MOD21_BF2I_1to4(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod20),

	.din_R_1(din_R_1st),
	.din_R_2(din_R_2nd),

    .din_Q_1(din_Q_1st),
	.din_Q_2(din_Q_2nd),

	.dout_R_add(bf_R_1st),
	.dout_R_sub(bf_R_2nd),

	.dout_Q_add(bf_Q_1st),
	.dout_Q_sub(bf_Q_2nd)
	);

	fac8_1_mj MUL8_1_4TH(
	.din_R(bf_R_2nd[1]),

	.din_Q(bf_Q_2nd[1]),

	.dout_R(dout_R_4th),

	.dout_Q(dout_Q_4th) 
	);

////////////////////////////////////////////////////////////////////////////////////////
						//3-4: 5th ~ 8th
////////////////////////////////////////////////////////////////////////////////////////

	logic signed [13:0] bf_R_3rd [1:0];
	logic signed [13:0] bf_R_4th [1:0];
	logic signed [13:0] bf_Q_3rd [1:0];
	logic signed [13:0] bf_Q_4th [1:0];

	assign dout_R_5th = bf_R_3rd[0];
	assign dout_Q_5th = bf_Q_3rd[0];

	assign dout_R_7th = bf_R_4th[0];
	assign dout_Q_7th = bf_Q_4th[0];

	BF2I_2bundle #(
	.WIDTH(13),
	.DEPTH(2)
	) U_MOD21_BF2I_5to8(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod20),

	.din_R_1(din_R_3rd),
	.din_R_2(din_R_4th),

    .din_Q_1(din_Q_3rd),
	.din_Q_2(din_Q_4th),

	.dout_R_add(bf_R_3rd),
	.dout_R_sub(bf_R_4th),

	.dout_Q_add(bf_Q_3rd),
	.dout_Q_sub(bf_Q_4th)
	);
	
	fac8_1_181j MUL8_1_6TH(
	.din_R(bf_R_3rd[1]),

	.din_Q(bf_Q_3rd[1]),

	.dout_R(dout_R_6th),

	.dout_Q(dout_Q_6th) 
	);

	fac8_1_m181j MUL8_1_8TH(
	.din_R(bf_R_4th[1]),

	.din_Q(bf_Q_4th[1]),

	.dout_R(dout_R_8th),

	.dout_Q(dout_Q_8th) 
	);

////////////////////////////////////////////////////////////////////////////////////////
						//5-6: 9th ~ 12th
////////////////////////////////////////////////////////////////////////////////////////

	logic signed [13:0] bf_R_5th [1:0];
	logic signed [13:0] bf_R_6th [1:0];
	logic signed [13:0] bf_Q_5th [1:0];
	logic signed [13:0] bf_Q_6th [1:0];

	assign dout_R_9th = bf_R_5th[0];
	assign dout_Q_9th = bf_Q_5th[0];

	assign dout_R_10th = bf_R_5th[1];
	assign dout_Q_10th = bf_Q_5th[1];

	assign dout_R_11th = bf_R_6th[0];
	assign dout_Q_11th = bf_Q_6th[0];

	BF2I_2bundle #(
	.WIDTH(13),
	.DEPTH(2)
	) U_MOD21_BF2I_9to12(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod20),

	.din_R_1(din_R_5th),
	.din_R_2(din_R_6th),

    .din_Q_1(din_Q_5th),
	.din_Q_2(din_Q_6th),

	.dout_R_add(bf_R_5th),
	.dout_R_sub(bf_R_6th),

	.dout_Q_add(bf_Q_5th),
	.dout_Q_sub(bf_Q_6th)
	);
	
	fac8_1_mj MUL8_1_12TH(
	.din_R(bf_R_6th[1]),

	.din_Q(bf_Q_6th[1]),

	.dout_R(dout_R_12th),

	.dout_Q(dout_Q_12th) 
	);

////////////////////////////////////////////////////////////////////////////////////////
						//7-8: 13th ~ 16th
////////////////////////////////////////////////////////////////////////////////////////

	logic signed [13:0] bf_R_7th [1:0];
	logic signed [13:0] bf_R_8th [1:0];
	logic signed [13:0] bf_Q_7th [1:0];
	logic signed [13:0] bf_Q_8th [1:0];

	assign dout_R_13th = bf_R_7th[0];
	assign dout_Q_13th = bf_Q_7th[0];

	assign dout_R_15th = bf_R_8th[0];
	assign dout_Q_15th = bf_Q_8th[0];

	BF2I_2bundle #(
	.WIDTH(13),
	.DEPTH(2)
	) U_MOD21_BF2I_13to16(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod20),

	.din_R_1(din_R_7th),
	.din_R_2(din_R_8th),

    .din_Q_1(din_Q_7th),
	.din_Q_2(din_Q_8th),

	.dout_R_add(bf_R_7th),
	.dout_R_sub(bf_R_8th),

	.dout_Q_add(bf_Q_7th),
	.dout_Q_sub(bf_Q_8th)
	);
	
	fac8_1_181j MUL8_1_14TH(
	.din_R(bf_R_7th[1]),

	.din_Q(bf_Q_7th[1]),

	.dout_R(dout_R_14th),

	.dout_Q(dout_Q_14th) 
	);

	fac8_1_m181j MUL8_1_16TH(
	.din_R(bf_R_8th[1]),

	.din_Q(bf_Q_8th[1]),

	.dout_R(dout_R_16th),

	.dout_Q(dout_Q_16th) 
	);

////////////////////////////////////////////////////////////////////////////////////////
						//9-10: 17th ~ 20th
////////////////////////////////////////////////////////////////////////////////////////

	logic signed [13:0] bf_R_9th [1:0];
	logic signed [13:0] bf_R_10th [1:0];
	logic signed [13:0] bf_Q_9th [1:0];
	logic signed [13:0] bf_Q_10th [1:0];

	assign dout_R_17th = bf_R_9th[0];
	assign dout_Q_17th = bf_Q_9th[0];

	assign dout_R_18th = bf_R_9th[1];
	assign dout_Q_18th = bf_Q_9th[1];

	assign dout_R_19th = bf_R_10th[0];
	assign dout_Q_19th = bf_Q_10th[0];

	BF2I_2bundle #(
	.WIDTH(13),
	.DEPTH(2)
	) U_MOD21_BF2I_17to20(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod20),

	.din_R_1(din_R_9th),
	.din_R_2(din_R_10th),

    .din_Q_1(din_Q_9th),
	.din_Q_2(din_Q_10th),

	.dout_R_add(bf_R_9th),
	.dout_R_sub(bf_R_10th),

	.dout_Q_add(bf_Q_9th),
	.dout_Q_sub(bf_Q_10th)
	);
	
	fac8_1_mj MUL8_1_20TH(
	.din_R(bf_R_10th[1]),

	.din_Q(bf_Q_10th[1]),

	.dout_R(dout_R_20th),

	.dout_Q(dout_Q_20th) 
	);

////////////////////////////////////////////////////////////////////////////////////////
						//11-12: 21th ~ 24th
////////////////////////////////////////////////////////////////////////////////////////

	logic signed [13:0] bf_R_11th [1:0];
	logic signed [13:0] bf_R_12th [1:0];
	logic signed [13:0] bf_Q_11th [1:0];
	logic signed [13:0] bf_Q_12th [1:0];

	assign dout_R_21th = bf_R_11th[0];
	assign dout_Q_21th = bf_Q_11th[0];

	assign dout_R_23th = bf_R_12th[0];
	assign dout_Q_23th = bf_Q_12th[0];

	BF2I_2bundle #(
	.WIDTH(13),
	.DEPTH(2)
	) U_MOD21_BF2I_21to24(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod20),

	.din_R_1(din_R_11th),
	.din_R_2(din_R_12th),

    .din_Q_1(din_Q_11th),
	.din_Q_2(din_Q_12th),

	.dout_R_add(bf_R_11th),
	.dout_R_sub(bf_R_12th),

	.dout_Q_add(bf_Q_11th),
	.dout_Q_sub(bf_Q_12th)
	);
	
	fac8_1_181j MUL8_1_22TH(
	.din_R(bf_R_11th[1]),

	.din_Q(bf_Q_11th[1]),

	.dout_R(dout_R_22th),

	.dout_Q(dout_Q_22th) 
	);

	fac8_1_m181j MUL8_1_24TH(
	.din_R(bf_R_12th[1]),

	.din_Q(bf_Q_12th[1]),

	.dout_R(dout_R_24th),

	.dout_Q(dout_Q_24th) 
	);

////////////////////////////////////////////////////////////////////////////////////////
						//13-14: 25th ~ 28th
////////////////////////////////////////////////////////////////////////////////////////

	logic signed [13:0] bf_R_13th [1:0];
	logic signed [13:0] bf_R_14th [1:0];
	logic signed [13:0] bf_Q_13th [1:0];
	logic signed [13:0] bf_Q_14th [1:0];

	assign dout_R_25th = bf_R_13th[0];
	assign dout_Q_25th = bf_Q_13th[0];

	assign dout_R_26th = bf_R_13th[1];
	assign dout_Q_26th = bf_Q_13th[1];

	assign dout_R_27th = bf_R_14th[0];
	assign dout_Q_27th = bf_Q_14th[0];

	BF2I_2bundle #(
	.WIDTH(13),
	.DEPTH(2)
	) U_MOD21_BF2I_25to28(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod20),

	.din_R_1(din_R_13th),
	.din_R_2(din_R_14th),

    .din_Q_1(din_Q_13th),
	.din_Q_2(din_Q_14th),

	.dout_R_add(bf_R_13th),
	.dout_R_sub(bf_R_14th),

	.dout_Q_add(bf_Q_13th),
	.dout_Q_sub(bf_Q_14th)
	);
	
	fac8_1_mj MUL8_1_28TH(
	.din_R(bf_R_14th[1]),

	.din_Q(bf_Q_14th[1]),

	.dout_R(dout_R_28th),

	.dout_Q(dout_Q_28th) 
	);

////////////////////////////////////////////////////////////////////////////////////////
						//15-16: 29th ~ 32th
////////////////////////////////////////////////////////////////////////////////////////

	logic signed [13:0] bf_R_15th [1:0];
	logic signed [13:0] bf_R_16th [1:0];
	logic signed [13:0] bf_Q_15th [1:0];
	logic signed [13:0] bf_Q_16th [1:0];

	assign dout_R_29th = bf_R_15th[0];
	assign dout_Q_29th = bf_Q_15th[0];

	assign dout_R_31th = bf_R_16th[0];
	assign dout_Q_31th = bf_Q_16th[0];

	BF2I_2bundle #(
	.WIDTH(13),
	.DEPTH(2)
	) U_MOD21_BF2I_29to32(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod20),

	.din_R_1(din_R_15th),
	.din_R_2(din_R_16th),

    .din_Q_1(din_Q_15th),
	.din_Q_2(din_Q_16th),

	.dout_R_add(bf_R_15th),
	.dout_R_sub(bf_R_16th),

	.dout_Q_add(bf_Q_15th),
	.dout_Q_sub(bf_Q_16th)
	);
	
	fac8_1_181j MUL8_1_30TH(
	.din_R(bf_R_15th[1]),

	.din_Q(bf_Q_15th[1]),

	.dout_R(dout_R_30th),

	.dout_Q(dout_Q_30th) 
	);

	fac8_1_m181j MUL8_1_32TH(
	.din_R(bf_R_16th[1]),

	.din_Q(bf_Q_16th[1]),

	.dout_R(dout_R_32th),

	.dout_Q(dout_Q_32th) 
	);


endmodule

