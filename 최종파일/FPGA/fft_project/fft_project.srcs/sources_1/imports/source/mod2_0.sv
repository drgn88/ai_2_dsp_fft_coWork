`timescale 1ps/1ps

module mod2_0 (
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

	output logic signed [12:0] dout_R_add_1_1st [1:0],
    output logic signed [12:0] dout_R_add_1_2nd [1:0],
	output logic signed [12:0] dout_Q_add_1_1st [1:0],
    output logic signed [12:0] dout_Q_add_1_2nd [1:0],

	output logic signed [12:0] dout_R_sub_1_3rd [1:0],
    output logic signed [12:0] dout_R_sub_1_4th [1:0],
	output logic signed [12:0] dout_Q_sub_1_3rd [1:0],
    output logic signed [12:0] dout_Q_sub_1_4th [1:0],

	output logic signed [12:0] dout_R_add_2_5th [1:0],
    output logic signed [12:0] dout_R_add_2_6th [1:0],
	output logic signed [12:0] dout_Q_add_2_5th [1:0],
    output logic signed [12:0] dout_Q_add_2_6th [1:0],

	output logic signed [12:0] dout_R_sub_2_7th [1:0],
    output logic signed [12:0] dout_R_sub_2_8th [1:0],
	output logic signed [12:0] dout_Q_sub_2_7th [1:0],
    output logic signed [12:0] dout_Q_sub_2_8th [1:0],

	output logic signed [12:0] dout_R_add_3_9th [1:0],
    output logic signed [12:0] dout_R_add_3_10th [1:0],
	output logic signed [12:0] dout_Q_add_3_9th [1:0],
    output logic signed [12:0] dout_Q_add_3_10th [1:0],

	output logic signed [12:0] dout_R_sub_3_11th [1:0],
    output logic signed [12:0] dout_R_sub_3_12th [1:0],
	output logic signed [12:0] dout_Q_sub_3_11th [1:0],
    output logic signed [12:0] dout_Q_sub_3_12th [1:0],

	output logic signed [12:0] dout_R_add_4_13th [1:0],
    output logic signed [12:0] dout_R_add_4_14th [1:0],
	output logic signed [12:0] dout_Q_add_4_13th [1:0],
    output logic signed [12:0] dout_Q_add_4_14th [1:0],

	output logic signed [12:0] dout_R_sub_4_15th [1:0],
    output logic signed [12:0] dout_R_sub_4_16th [1:0],
	output logic signed [12:0] dout_Q_sub_4_15th [1:0],
    output logic signed [12:0] dout_Q_sub_4_16th [1:0],


	output logic alert_mod20
);

	always_ff @( posedge clk or negedge rstn ) begin : make_alert_mod20
		if(!rstn) begin
			alert_mod20 <= 0;
		end
		else begin
			alert_mod20 <= alert_cbfp1;
		end
	end

/////////////////////////////////////////////////////////////////////////////////
//							BF2I_4Bundle									   //
/////////////////////////////////////////////////////////////////////////////////

	//1ST BF OUT
	logic signed [12:0] bf_out_R_add_1 [3:0];
	logic signed [12:0] bf_out_R_sub_1 [3:0];
	logic signed [12:0] bf_out_Q_add_1 [3:0];
	logic signed [12:0] bf_out_Q_sub_1 [3:0];

	assign dout_R_add_1_1st = bf_out_R_add_1[3:2];
	assign dout_R_add_1_2nd = bf_out_R_add_1[1:0];
	assign dout_Q_add_1_1st = bf_out_Q_add_1[3:2];
	assign dout_Q_add_1_2nd = bf_out_Q_add_1[1:0];

	assign dout_R_sub_1_3rd = bf_out_R_sub_1[3:2];
	assign dout_Q_sub_1_3rd = bf_out_Q_sub_1[3:2];
	
	fac8_0_mod20 FAC8_0_MOD20_4TH(
	.bf_in_R_sub(bf_out_R_sub_1[1:0]),

	.bf_in_Q_sub(bf_out_Q_sub_1[1:0]),

	.reverse_R_sub(dout_R_sub_1_4th),

	.reverse_Q_sub(dout_Q_sub_1_4th)
	);

	//2ND BF OUT
	logic signed [12:0] bf_out_R_add_2 [3:0];
	logic signed [12:0] bf_out_R_sub_2 [3:0];
	logic signed [12:0] bf_out_Q_add_2 [3:0];
	logic signed [12:0] bf_out_Q_sub_2 [3:0];

	assign dout_R_add_2_5th = bf_out_R_add_2[3:2];
	assign dout_R_add_2_6th = bf_out_R_add_2[1:0];
	assign dout_Q_add_2_5th = bf_out_Q_add_2[3:2];
	assign dout_Q_add_2_6th = bf_out_Q_add_2[1:0];

	assign dout_R_sub_2_7th = bf_out_R_sub_2[3:2];
	assign dout_Q_sub_2_7th = bf_out_Q_sub_2[3:2];
	
	fac8_0_mod20 FAC8_0_MOD20_8TH(
	.bf_in_R_sub(bf_out_R_sub_2[1:0]),

	.bf_in_Q_sub(bf_out_Q_sub_2[1:0]),

	.reverse_R_sub(dout_R_sub_2_8th),

	.reverse_Q_sub(dout_Q_sub_2_8th)
	);

	//3RD BF OUT
	logic signed [12:0] bf_out_R_add_3 [3:0];
	logic signed [12:0] bf_out_R_sub_3 [3:0];
	logic signed [12:0] bf_out_Q_add_3 [3:0];
	logic signed [12:0] bf_out_Q_sub_3 [3:0];

	assign dout_R_add_3_9th = bf_out_R_add_3[3:2];
	assign dout_R_add_3_10th = bf_out_R_add_3[1:0];
	assign dout_Q_add_3_9th = bf_out_Q_add_3[3:2];
	assign dout_Q_add_3_10th = bf_out_Q_add_3[1:0];

	assign dout_R_sub_3_11th = bf_out_R_sub_3[3:2];
	assign dout_Q_sub_3_11th = bf_out_Q_sub_3[3:2];

	fac8_0_mod20 FAC8_0_MOD20_12TH(
	.bf_in_R_sub(bf_out_R_sub_3[1:0]),

	.bf_in_Q_sub(bf_out_Q_sub_3[1:0]),

	.reverse_R_sub(dout_R_sub_3_12th),

	.reverse_Q_sub(dout_Q_sub_3_12th)
	);

	//4TH BF OUT
	logic signed [12:0] bf_out_R_add_4 [3:0];
	logic signed [12:0] bf_out_R_sub_4 [3:0];
	logic signed [12:0] bf_out_Q_add_4 [3:0];
	logic signed [12:0] bf_out_Q_sub_4 [3:0];

	assign dout_R_add_4_13th = bf_out_R_add_4[3:2];
	assign dout_R_add_4_14th = bf_out_R_add_4[1:0];
	assign dout_Q_add_4_13th = bf_out_Q_add_4[3:2];
	assign dout_Q_add_4_14th = bf_out_Q_add_4[1:0];

	assign dout_R_sub_4_15th = bf_out_R_sub_4[3:2];
	assign dout_Q_sub_4_15th = bf_out_Q_sub_4[3:2];

	fac8_0_mod20 FAC8_0_MOD20_16TH(
	.bf_in_R_sub(bf_out_R_sub_4[1:0]),

	.bf_in_Q_sub(bf_out_Q_sub_4[1:0]),

	.reverse_R_sub(dout_R_sub_4_16th),

	.reverse_Q_sub(dout_Q_sub_4_16th)
	);

	BF2I_4bundle #(
	.WIDTH(12),
	.DEPTH(4)
	) BF2I_4B_1ST(
	.clk(clk),
	.rstn(rstn),
	.en(alert_cbfp1),

	.din_R_1(din_R1_add_20[7:4]),
	.din_R_2(din_R1_add_20[3:0]),

    .din_Q_1(din_Q1_add_20[7:4]),
	.din_Q_2(din_Q1_add_20[3:0]),

	.dout_R_add(bf_out_R_add_1),
	.dout_R_sub(bf_out_R_sub_1),

	.dout_Q_add(bf_out_Q_add_1),
	.dout_Q_sub(bf_out_Q_sub_1)
	);

	BF2I_4bundle #(
	.WIDTH(12),
	.DEPTH(4)
	) BF2I_4B_2ND(
	.clk(clk),
	.rstn(rstn),
	.en(alert_cbfp1),

	.din_R_1(din_R1_sub_20[7:4]),
	.din_R_2(din_R1_sub_20[3:0]),

    .din_Q_1(din_Q1_sub_20[7:4]),
	.din_Q_2(din_Q1_sub_20[3:0]),

	.dout_R_add(bf_out_R_add_2),
	.dout_R_sub(bf_out_R_sub_2),

	.dout_Q_add(bf_out_Q_add_2),
	.dout_Q_sub(bf_out_Q_sub_2)
	);

	BF2I_4bundle #(
	.WIDTH(12),
	.DEPTH(4)
	) BF2I_4B_3RD(
	.clk(clk),
	.rstn(rstn),
	.en(alert_cbfp1),

	.din_R_1(din_R2_add_20[7:4]),
	.din_R_2(din_R2_add_20[3:0]),

    .din_Q_1(din_Q2_add_20[7:4]),
	.din_Q_2(din_Q2_add_20[3:0]),

	.dout_R_add(bf_out_R_add_3),
	.dout_R_sub(bf_out_R_sub_3),

	.dout_Q_add(bf_out_Q_add_3),
	.dout_Q_sub(bf_out_Q_sub_3)
	);

	BF2I_4bundle #(
	.WIDTH(12),
	.DEPTH(4)
	) BF2I_4B_4TH(
	.clk(clk),
	.rstn(rstn),
	.en(alert_cbfp1),

	.din_R_1(din_R2_sub_20[7:4]),
	.din_R_2(din_R2_sub_20[3:0]),

    .din_Q_1(din_Q2_sub_20[7:4]),
	.din_Q_2(din_Q2_sub_20[3:0]),

	.dout_R_add(bf_out_R_add_4),
	.dout_R_sub(bf_out_R_sub_4),

	.dout_Q_add(bf_out_Q_add_4),
	.dout_Q_sub(bf_out_Q_sub_4)
	);


	
	
endmodule