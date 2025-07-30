`timescale 1ns/1ps

module mod2_2 (
	input clk,
	input rstn,
	input alert_mod21,

	input signed [15:0] din_R_1st,
	input signed [15:0] din_Q_1st,

	input signed [15:0] din_R_2nd,
	input signed [15:0] din_Q_2nd,

	input signed [15:0] din_R_3rd,
	input signed [15:0] din_Q_3rd,

	input signed [15:0] din_R_4th,
	input signed [15:0] din_Q_4th,

	input signed [15:0] din_R_5th,
	input signed [15:0] din_Q_5th,

	input signed [15:0] din_R_6th,
	input signed [15:0] din_Q_6th,

	input signed [15:0] din_R_7th,
	input signed [15:0] din_Q_7th,

	input signed [15:0] din_R_8th,
	input signed [15:0] din_Q_8th,

	input signed [15:0] din_R_9th,
	input signed [15:0] din_Q_9th,

	input signed [15:0] din_R_10th,
	input signed [15:0] din_Q_10th,

	input signed [15:0] din_R_11th,
	input signed [15:0] din_Q_11th,

	input signed [15:0] din_R_12th,
	input signed [15:0] din_Q_12th,

	input signed [15:0] din_R_13th,
	input signed [15:0] din_Q_13th,

	input signed [15:0] din_R_14th,
	input signed [15:0] din_Q_14th,

	input signed [15:0] din_R_15th,
	input signed [15:0] din_Q_15th,

	input signed [15:0] din_R_16th,
	input signed [15:0] din_Q_16th,

	input signed [15:0] din_R_17th,
	input signed [15:0] din_Q_17th,

	input signed [15:0] din_R_18th,
	input signed [15:0] din_Q_18th,

	input signed [15:0] din_R_19th,
	input signed [15:0] din_Q_19th,

	input signed [15:0] din_R_20th,
	input signed [15:0] din_Q_20th,

	input signed [15:0] din_R_21th,
	input signed [15:0] din_Q_21th,

	input signed [15:0] din_R_22th,
	input signed [15:0] din_Q_22th,

	input signed [15:0] din_R_23th,
	input signed [15:0] din_Q_23th,

	input signed [15:0] din_R_24th,
	input signed [15:0] din_Q_24th,

	input signed [15:0] din_R_25th,
	input signed [15:0] din_Q_25th,

	input signed [15:0] din_R_26th,
	input signed [15:0] din_Q_26th,

	input signed [15:0] din_R_27th,
	input signed [15:0] din_Q_27th,

	input signed [15:0] din_R_28th,
	input signed [15:0] din_Q_28th,

	input signed [15:0] din_R_29th,
	input signed [15:0] din_Q_29th,

	input signed [15:0] din_R_30th,
	input signed [15:0] din_Q_30th,

	input signed [15:0] din_R_31th,
	input signed [15:0] din_Q_31th,

	input signed [15:0] din_R_32th,
	input signed [15:0] din_Q_32th,

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

////////////////////////////////////////////////////////////////////////////////////////
							//CONTROL SIGNAL
////////////////////////////////////////////////////////////////////////////////////////
	logic sat_en;

	always_ff @( posedge clk or negedge rstn ) begin : make_CTRL_SINGAL
		if(!rstn) begin
			sat_en <= 0;
			alert_cbfp2 <= 0;
		end
		else begin
			sat_en <= alert_mod21;
			alert_cbfp2 <= sat_en;
		end
	end
	

////////////////////////////////////////////////////////////////////////////////////////
							//BF2I
////////////////////////////////////////////////////////////////////////////////////////

	logic signed [16:0] bf_R_1st;
	logic signed [16:0] bf_Q_1st;

	logic signed [16:0] bf_R_2nd;
	logic signed [16:0] bf_Q_2nd;

	logic signed [16:0] bf_R_3rd;
	logic signed [16:0] bf_Q_3rd;

	logic signed [16:0] bf_R_4th;
	logic signed [16:0] bf_Q_4th;

	logic signed [16:0] bf_R_5th;
	logic signed [16:0] bf_Q_5th;

	logic signed [16:0] bf_R_6th;
	logic signed [16:0] bf_Q_6th;

	logic signed [16:0] bf_R_7th;
	logic signed [16:0] bf_Q_7th;

	logic signed [16:0] bf_R_8th;
	logic signed [16:0] bf_Q_8th;

	logic signed [16:0] bf_R_9th;
	logic signed [16:0] bf_Q_9th;

	logic signed [16:0] bf_R_10th;
	logic signed [16:0] bf_Q_10th;

	logic signed [16:0] bf_R_11th;
	logic signed [16:0] bf_Q_11th;

	logic signed [16:0] bf_R_12th;
	logic signed [16:0] bf_Q_12th;

	logic signed [16:0] bf_R_13th;
	logic signed [16:0] bf_Q_13th;

	logic signed [16:0] bf_R_14th;
	logic signed [16:0] bf_Q_14th;

	logic signed [16:0] bf_R_15th;
	logic signed [16:0] bf_Q_15th;

	logic signed [16:0] bf_R_16th;
	logic signed [16:0] bf_Q_16th;

	logic signed [16:0] bf_R_17th;
	logic signed [16:0] bf_Q_17th;

	logic signed [16:0] bf_R_18th;
	logic signed [16:0] bf_Q_18th;

	logic signed [16:0] bf_R_19th;
	logic signed [16:0] bf_Q_19th;

	logic signed [16:0] bf_R_20th;
	logic signed [16:0] bf_Q_20th;

	logic signed [16:0] bf_R_21th;
	logic signed [16:0] bf_Q_21th;

	logic signed [16:0] bf_R_22th;
	logic signed [16:0] bf_Q_22th;

	logic signed [16:0] bf_R_23th;
	logic signed [16:0] bf_Q_23th;

	logic signed [16:0] bf_R_24th;
	logic signed [16:0] bf_Q_24th;

	logic signed [16:0] bf_R_25th;
	logic signed [16:0] bf_Q_25th;

	logic signed [16:0] bf_R_26th;
	logic signed [16:0] bf_Q_26th;

	logic signed [16:0] bf_R_27th;
	logic signed [16:0] bf_Q_27th;

	logic signed [16:0] bf_R_28th;
	logic signed [16:0] bf_Q_28th;

	logic signed [16:0] bf_R_29th;
	logic signed [16:0] bf_Q_29th;

	logic signed [16:0] bf_R_30th;
	logic signed [16:0] bf_Q_30th;

	logic signed [16:0] bf_R_31th;
	logic signed [16:0] bf_Q_31th;

	logic signed [16:0] bf_R_32th;
	logic signed [16:0] bf_Q_32th;

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_1to2(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_1st),
	.din_R_2(din_R_2nd),

    .din_Q_1(din_Q_1st),
	.din_Q_2(din_Q_2nd),

	.dout_R_add(bf_R_1st),
	.dout_R_sub(bf_R_2nd),

	.dout_Q_add(bf_Q_1st),
	.dout_Q_sub(bf_Q_2nd) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_3to4(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_3rd),
	.din_R_2(din_R_4th),

    .din_Q_1(din_Q_3rd),
	.din_Q_2(din_Q_4th),

	.dout_R_add(bf_R_3rd),
	.dout_R_sub(bf_R_4th),

	.dout_Q_add(bf_Q_3rd),
	.dout_Q_sub(bf_Q_4th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_5to6(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_5th),
	.din_R_2(din_R_6th),

    .din_Q_1(din_Q_5th),
	.din_Q_2(din_Q_6th),

	.dout_R_add(bf_R_5th),
	.dout_R_sub(bf_R_6th),

	.dout_Q_add(bf_Q_5th),
	.dout_Q_sub(bf_Q_6th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_7to8(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_7th),
	.din_R_2(din_R_8th),

    .din_Q_1(din_Q_7th),
	.din_Q_2(din_Q_8th),

	.dout_R_add(bf_R_7th),
	.dout_R_sub(bf_R_8th),

	.dout_Q_add(bf_Q_7th),
	.dout_Q_sub(bf_Q_8th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_9to10(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_9th),
	.din_R_2(din_R_10th),

    .din_Q_1(din_Q_9th),
	.din_Q_2(din_Q_10th),

	.dout_R_add(bf_R_9th),
	.dout_R_sub(bf_R_10th),

	.dout_Q_add(bf_Q_9th),
	.dout_Q_sub(bf_Q_10th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_11to12(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_11th),
	.din_R_2(din_R_12th),

    .din_Q_1(din_Q_11th),
	.din_Q_2(din_Q_12th),

	.dout_R_add(bf_R_11th),
	.dout_R_sub(bf_R_12th),

	.dout_Q_add(bf_Q_11th),
	.dout_Q_sub(bf_Q_12th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_13to14(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_13th),
	.din_R_2(din_R_14th),

    .din_Q_1(din_Q_13th),
	.din_Q_2(din_Q_14th),

	.dout_R_add(bf_R_13th),
	.dout_R_sub(bf_R_14th),

	.dout_Q_add(bf_Q_13th),
	.dout_Q_sub(bf_Q_14th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_15to16(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_15th),
	.din_R_2(din_R_16th),

    .din_Q_1(din_Q_15th),
	.din_Q_2(din_Q_16th),

	.dout_R_add(bf_R_15th),
	.dout_R_sub(bf_R_16th),

	.dout_Q_add(bf_Q_15th),
	.dout_Q_sub(bf_Q_16th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_17to18(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_17th),
	.din_R_2(din_R_18th),

    .din_Q_1(din_Q_17th),
	.din_Q_2(din_Q_18th),

	.dout_R_add(bf_R_17th),
	.dout_R_sub(bf_R_18th),

	.dout_Q_add(bf_Q_17th),
	.dout_Q_sub(bf_Q_18th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_19to20(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_19th),
	.din_R_2(din_R_20th),

    .din_Q_1(din_Q_19th),
	.din_Q_2(din_Q_20th),

	.dout_R_add(bf_R_19th),
	.dout_R_sub(bf_R_20th),

	.dout_Q_add(bf_Q_19th),
	.dout_Q_sub(bf_Q_20th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_21to22(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_21th),
	.din_R_2(din_R_22th),

    .din_Q_1(din_Q_21th),
	.din_Q_2(din_Q_22th),

	.dout_R_add(bf_R_21th),
	.dout_R_sub(bf_R_22th),

	.dout_Q_add(bf_Q_21th),
	.dout_Q_sub(bf_Q_22th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_23to24(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_23th),
	.din_R_2(din_R_24th),

    .din_Q_1(din_Q_23th),
	.din_Q_2(din_Q_24th),

	.dout_R_add(bf_R_23th),
	.dout_R_sub(bf_R_24th),

	.dout_Q_add(bf_Q_23th),
	.dout_Q_sub(bf_Q_24th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_25to26(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_25th),
	.din_R_2(din_R_26th),

    .din_Q_1(din_Q_25th),
	.din_Q_2(din_Q_26th),

	.dout_R_add(bf_R_25th),
	.dout_R_sub(bf_R_26th),

	.dout_Q_add(bf_Q_25th),
	.dout_Q_sub(bf_Q_26th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_27to28(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_27th),
	.din_R_2(din_R_28th),

    .din_Q_1(din_Q_27th),
	.din_Q_2(din_Q_28th),

	.dout_R_add(bf_R_27th),
	.dout_R_sub(bf_R_28th),

	.dout_Q_add(bf_Q_27th),
	.dout_Q_sub(bf_Q_28th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_29to30(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_29th),
	.din_R_2(din_R_30th),

    .din_Q_1(din_Q_29th),
	.din_Q_2(din_Q_30th),

	.dout_R_add(bf_R_29th),
	.dout_R_sub(bf_R_30th),

	.dout_Q_add(bf_Q_29th),
	.dout_Q_sub(bf_Q_30th) 
	);

	BF2I_1bundle #(
	.WIDTH(16)
	) BF2I_31to32(
	.clk(clk),
	.rstn(rstn),
	.en(alert_mod21),

	.din_R_1(din_R_31th),
	.din_R_2(din_R_32th),

    .din_Q_1(din_Q_31th),
	.din_Q_2(din_Q_32th),

	.dout_R_add(bf_R_31th),
	.dout_R_sub(bf_R_32th),

	.dout_Q_add(bf_Q_31th),
	.dout_Q_sub(bf_Q_32th) 
	);

////////////////////////////////////////////////////////////////////////////////////////
							//SATUARATION_16B
////////////////////////////////////////////////////////////////////////////////////////

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_1to2(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_1st),
    .din_R_sub(bf_R_2nd),
    .din_Q_add(bf_Q_1st),
    .din_Q_sub(bf_Q_2nd),

    .dout_R_add(dout_R_1st_fin),
    .dout_R_sub(dout_R_2nd_fin),
    .dout_Q_add(dout_Q_1st_fin),
    .dout_Q_sub(dout_Q_2nd_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_3to4(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_3rd),
    .din_R_sub(bf_R_4th),
    .din_Q_add(bf_Q_3rd),
    .din_Q_sub(bf_Q_4th),

    .dout_R_add(dout_R_3rd_fin),
    .dout_R_sub(dout_R_4th_fin),
    .dout_Q_add(dout_Q_3rd_fin),
    .dout_Q_sub(dout_Q_4th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_5to6(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_5th),
    .din_R_sub(bf_R_6th),
    .din_Q_add(bf_Q_5th),
    .din_Q_sub(bf_Q_6th),

    .dout_R_add(dout_R_5th_fin),
    .dout_R_sub(dout_R_6th_fin),
    .dout_Q_add(dout_Q_5th_fin),
    .dout_Q_sub(dout_Q_6th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_7to8(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_7th),
    .din_R_sub(bf_R_8th),
    .din_Q_add(bf_Q_7th),
    .din_Q_sub(bf_Q_8th),

    .dout_R_add(dout_R_7th_fin),
    .dout_R_sub(dout_R_8th_fin),
    .dout_Q_add(dout_Q_7th_fin),
    .dout_Q_sub(dout_Q_8th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_9to10(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_9th),
    .din_R_sub(bf_R_10th),
    .din_Q_add(bf_Q_9th),
    .din_Q_sub(bf_Q_10th),

    .dout_R_add(dout_R_9th_fin),
    .dout_R_sub(dout_R_10th_fin),
    .dout_Q_add(dout_Q_9th_fin),
    .dout_Q_sub(dout_Q_10th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_11to12(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_11th),
    .din_R_sub(bf_R_12th),
    .din_Q_add(bf_Q_11th),
    .din_Q_sub(bf_Q_12th),

    .dout_R_add(dout_R_11th_fin),
    .dout_R_sub(dout_R_12th_fin),
    .dout_Q_add(dout_Q_11th_fin),
    .dout_Q_sub(dout_Q_12th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_13to14(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_13th),
    .din_R_sub(bf_R_14th),
    .din_Q_add(bf_Q_13th),
    .din_Q_sub(bf_Q_14th),

    .dout_R_add(dout_R_13th_fin),
    .dout_R_sub(dout_R_14th_fin),
    .dout_Q_add(dout_Q_13th_fin),
    .dout_Q_sub(dout_Q_14th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_15to16(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_15th),
    .din_R_sub(bf_R_16th),
    .din_Q_add(bf_Q_15th),
    .din_Q_sub(bf_Q_16th),

    .dout_R_add(dout_R_15th_fin),
    .dout_R_sub(dout_R_16th_fin),
    .dout_Q_add(dout_Q_15th_fin),
    .dout_Q_sub(dout_Q_16th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_17to18(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_17th),
    .din_R_sub(bf_R_18th),
    .din_Q_add(bf_Q_17th),
    .din_Q_sub(bf_Q_18th),

    .dout_R_add(dout_R_17th_fin),
    .dout_R_sub(dout_R_18th_fin),
    .dout_Q_add(dout_Q_17th_fin),
    .dout_Q_sub(dout_Q_18th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_19to20(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_19th),
    .din_R_sub(bf_R_20th),
    .din_Q_add(bf_Q_19th),
    .din_Q_sub(bf_Q_20th),

    .dout_R_add(dout_R_19th_fin),
    .dout_R_sub(dout_R_20th_fin),
    .dout_Q_add(dout_Q_19th_fin),
    .dout_Q_sub(dout_Q_20th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_21to22(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_21th),
    .din_R_sub(bf_R_22th),
    .din_Q_add(bf_Q_21th),
    .din_Q_sub(bf_Q_22th),

    .dout_R_add(dout_R_21th_fin),
    .dout_R_sub(dout_R_22th_fin),
    .dout_Q_add(dout_Q_21th_fin),
    .dout_Q_sub(dout_Q_22th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_23to24(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_23th),
    .din_R_sub(bf_R_24th),
    .din_Q_add(bf_Q_23th),
    .din_Q_sub(bf_Q_24th),

    .dout_R_add(dout_R_23th_fin),
    .dout_R_sub(dout_R_24th_fin),
    .dout_Q_add(dout_Q_23th_fin),
    .dout_Q_sub(dout_Q_24th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_25to26(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_25th),
    .din_R_sub(bf_R_26th),
    .din_Q_add(bf_Q_25th),
    .din_Q_sub(bf_Q_26th),

    .dout_R_add(dout_R_25th_fin),
    .dout_R_sub(dout_R_26th_fin),
    .dout_Q_add(dout_Q_25th_fin),
    .dout_Q_sub(dout_Q_26th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_27to28(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_27th),
    .din_R_sub(bf_R_28th),
    .din_Q_add(bf_Q_27th),
    .din_Q_sub(bf_Q_28th),

    .dout_R_add(dout_R_27th_fin),
    .dout_R_sub(dout_R_28th_fin),
    .dout_Q_add(dout_Q_27th_fin),
    .dout_Q_sub(dout_Q_28th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_29to30(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_29th),
    .din_R_sub(bf_R_30th),
    .din_Q_add(bf_Q_29th),
    .din_Q_sub(bf_Q_30th),

    .dout_R_add(dout_R_29th_fin),
    .dout_R_sub(dout_R_30th_fin),
    .dout_Q_add(dout_Q_29th_fin),
    .dout_Q_sub(dout_Q_30th_fin)
	);

	saturation #(
    .WIDTH(17),
    .DOUT_WIDTH(16),
    .SAT_MAX_VAL(32767),
    .SAT_MIN_VAL(-32768)
	) SAT_31to32(
    .clk(clk),
    .rst_n(rstn),
    .en(sat_en),
    .din_R_add(bf_R_31th),
    .din_R_sub(bf_R_32th),
    .din_Q_add(bf_Q_31th),
    .din_Q_sub(bf_Q_32th),

    .dout_R_add(dout_R_31th_fin),
    .dout_R_sub(dout_R_32th_fin),
    .dout_Q_add(dout_Q_31th_fin),
    .dout_Q_sub(dout_Q_32th_fin)
	);
endmodule