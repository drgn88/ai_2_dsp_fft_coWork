`timescale 1ns/1ps

module cbfp1 (
	input clk,
	input rstn,
	input alert_mod12,

	input signed [24:0] din_R1_add [7:0],
    input signed [24:0] din_R1_sub [7:0],
	input signed [24:0] din_R2_add [7:0],
    input signed [24:0] din_R2_sub [7:0],

    input signed [24:0] din_Q1_add [7:0],
    input signed [24:0] din_Q1_sub [7:0],
    input signed [24:0] din_Q2_add [7:0],
    input signed [24:0] din_Q2_sub [7:0],

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

//////////////////////////////////////////////////////
//			CONTROL SIGNAL							//
//////////////////////////////////////////////////////

	logic w_mag_en;
	logic w_min_en;

	cu_cbfp1 CU_CBFP1(
    .clk(clk),
    .rstn(rstn),
    .alert_mod12(alert_mod12),

    .mag_en(w_mag_en),
    .min_en(w_min_en),
    .valid_mod1(alert_cbfp1)
	);

//////////////////////////////////////////////////////
//			SHIFT_REG_3CLK							//
//////////////////////////////////////////////////////

	logic signed [24:0] sout_R1_add [7:0];
    logic signed [24:0] sout_R1_sub [7:0];
	logic signed [24:0] sout_R2_add [7:0];
    logic signed [24:0] sout_R2_sub [7:0];

    logic signed [24:0] sout_Q1_add [7:0];
    logic signed [24:0] sout_Q1_sub [7:0];
    logic signed [24:0] sout_Q2_add [7:0];
    logic signed [24:0] sout_Q2_sub [7:0];

	shift_reg #(
	.DATA_WIDTH(25),
	.NUM_IN_OUT(8),
	.REG_DEPTH(3)
	) SHIFT_ADD_1st_3CLK(
	.clk(clk),
	.rstn(rstn),
	.din_i(din_R1_add),
	.din_q(din_Q1_add),

	.dout_i(sout_R1_add),
	.dout_q(sout_Q1_add)
	);

	shift_reg #(
	.DATA_WIDTH(25),
	.NUM_IN_OUT(8),
	.REG_DEPTH(3)
	) SHIFT_SUB_1st_3CLK(
	.clk(clk),
	.rstn(rstn),
	.din_i(din_R1_sub),
	.din_q(din_Q1_sub),

	.dout_i(sout_R1_sub),
	.dout_q(sout_Q1_sub)
	);

	shift_reg #(
	.DATA_WIDTH(25),
	.NUM_IN_OUT(8),
	.REG_DEPTH(3)
	) SHIFT_ADD_2nd_3CLK(
	.clk(clk),
	.rstn(rstn),
	.din_i(din_R2_add),
	.din_q(din_Q2_add),

	.dout_i(sout_R2_add),
	.dout_q(sout_Q2_add)
	);

	shift_reg #(
	.DATA_WIDTH(25),
	.NUM_IN_OUT(8),
	.REG_DEPTH(3)
	) SHIFT_SUB_2nd_3CLK(
	.clk(clk),
	.rstn(rstn),
	.din_i(din_R2_sub),
	.din_q(din_Q2_sub),

	.dout_i(sout_R2_sub),
	.dout_q(sout_Q2_sub)
	);

//////////////////////////////////////////////////////
//							MAG						//
//////////////////////////////////////////////////////

	logic [4:0] mag_out_R1_add[7:0];
    logic [4:0] mag_out_Q1_add[7:0];
    logic [4:0] mag_out_R1_sub[7:0];
    logic [4:0] mag_out_Q1_sub[7:0];

	mag_detect_cbfp1 MAG_1ST(
    .clk(clk),
    .rstn(rstn),
    .en(w_mag_en),

    .mag_in_R_add(din_R1_add),
    .mag_in_Q_add(din_Q1_add),
    .mag_in_R_sub(din_R1_sub),
    .mag_in_Q_sub(din_Q1_sub),

    .mag_out_R_add(mag_out_R1_add),
    .mag_out_Q_add(mag_out_Q1_add),
    .mag_out_R_sub(mag_out_R1_sub),
    .mag_out_Q_sub(mag_out_Q1_sub)
	);

	logic [4:0] mag_out_R2_add[7:0];
    logic [4:0] mag_out_Q2_add[7:0];
    logic [4:0] mag_out_R2_sub[7:0];
    logic [4:0] mag_out_Q2_sub[7:0];

	mag_detect_cbfp1 MAG_2ND(
    .clk(clk),
    .rstn(rstn),
    .en(w_mag_en),

    .mag_in_R_add(din_R2_add),
    .mag_in_Q_add(din_Q2_add),
    .mag_in_R_sub(din_R2_sub),
    .mag_in_Q_sub(din_Q2_sub),

    .mag_out_R_add(mag_out_R2_add),
    .mag_out_Q_add(mag_out_Q2_add),
    .mag_out_R_sub(mag_out_R2_sub),
    .mag_out_Q_sub(mag_out_Q2_sub)
	);

//////////////////////////////////////////////////////
//							MIN						//
//////////////////////////////////////////////////////

	logic [4:0] min_out_1st_add;
    logic [4:0] min_out_1st_sub;

	min_detect_cbfp1 #(
    .LZC_WIDTH(5)  //msb 개수 비트폭
	) MIN_1ST(
    .clk(clk),
    .rstn(rstn),
    .en(w_min_en),

    .min_in_R_add(mag_out_R1_add),
    .min_in_Q_add(mag_out_Q1_add),
    .min_in_R_sub(mag_out_R1_sub),
    .min_in_Q_sub(mag_out_Q1_sub),

    .min_out_add(min_out_1st_add),
    .min_out_sub(min_out_1st_sub)
	);

	logic [4:0] min_out_2nd_add;
    logic [4:0] min_out_2nd_sub;

	min_detect_cbfp1 #(
    .LZC_WIDTH(5)  //msb 개수 비트폭
	) MIN_2ND(
    .clk(clk),
    .rstn(rstn),
    .en(w_min_en),

    .min_in_R_add(mag_out_R2_add),
    .min_in_Q_add(mag_out_Q2_add),
    .min_in_R_sub(mag_out_R2_sub),
    .min_in_Q_sub(mag_out_Q2_sub),

    .min_out_add(min_out_2nd_add),
    .min_out_sub(min_out_2nd_sub)
	);

//////////////////////////////////////////////////////
//						BIT_SHIFT					//
//////////////////////////////////////////////////////

	top_bit_shift_cbfp1 #(
    .INPUT_WIDTH(25),
    .OUTPUT_WIDTH(12),
    .BLOCK_SIZE(8),
    .SHIFT_WIDTH(5),
    .SHIFT_TARGET(13)
	) BIT_SHIFT_1ST(
    .clk(clk),
    .rstn(rstn),

    .en(),
    .shift_value_add(min_out_1st_add),
    .shift_value_sub(min_out_1st_sub),

    .input_data_R_add(sout_R1_add),
    .input_data_Q_add(sout_Q1_add),
    .input_data_R_sub(sout_R1_sub),
    .input_data_Q_sub(sout_Q1_sub),

    .output_data_R_add(dout_R1_add),
    .output_data_Q_add(dout_Q1_add),
    .output_data_R_sub(dout_R1_sub),
    .output_data_Q_sub(dout_Q1_sub)
	);

	top_bit_shift_cbfp1 #(
    .INPUT_WIDTH(25),
    .OUTPUT_WIDTH(12),
    .BLOCK_SIZE(8),
    .SHIFT_WIDTH(5),
    .SHIFT_TARGET(13)
	) BIT_SHIFT_2ND(
    .clk(clk),
    .rstn(rstn),

    .en(),
    .shift_value_add(min_out_2nd_add),
    .shift_value_sub(min_out_2nd_sub),

    .input_data_R_add(sout_R2_add),
    .input_data_Q_add(sout_Q2_add),
    .input_data_R_sub(sout_R2_sub),
    .input_data_Q_sub(sout_Q2_sub),

    .output_data_R_add(dout_R2_add),
    .output_data_Q_add(dout_Q2_add),
    .output_data_R_sub(dout_R2_sub),
    .output_data_Q_sub(dout_Q2_sub)
	);
	
endmodule