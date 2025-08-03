module fft_top (
	input clk,
	input rstn,
	input valid,

	input logic signed [8:0] din_i [15:0],
	input logic signed [8:0] din_q [15:0],

	output logic do_en,
	output logic signed [12:0] do_re [0:511],
	output logic signed [12:0] do_im [0:511]
);

//////////////////////////////////////////////////////////////////////////
/////////					FFT_Module0							/////////
/////////////////////////////////////////////////////////////////////////
	
	logic signed [10:0] w_mod0_R [0:15];
	logic signed [10:0] w_mod0_Q [0:15];
	logic w_valid_mod1;
	
	logic [4:0] w_idx1;
	logic w_idx1_push;

	module0 U_FFT_MOD0 (
		.clk(clk),
		.rstn(rstn),
		.valid(valid),
		.din_R(din_i),
		.din_Q(din_q),

		.dout_R(w_mod0_R),
		.dout_Q(w_mod0_Q),
		.valid_mod1(w_valid_mod1),

		.cbfp0_scale_fac(w_idx1),
		.cbfp0_mem_push(w_idx1_push)

	);

/////////////////////////////////////////////////////////////////////////
/////////					FFT_Module1							/////////
/////////////////////////////////////////////////////////////////////////

	logic signed [11:0] w_mod1_R1_add [7:0];
	logic signed [11:0] w_mod1_R1_sub [7:0];
	logic signed [11:0] w_mod1_R2_add [7:0];
	logic signed [11:0] w_mod1_R2_sub [7:0];
	
	logic signed [11:0] w_mod1_Q1_add [7:0];
	logic signed [11:0] w_mod1_Q1_sub [7:0];
	logic signed [11:0] w_mod1_Q2_add [7:0];
	logic signed [11:0] w_mod1_Q2_sub [7:0];
	logic w_valid_mod2;

	logic w_idx2_push;
	logic [4:0] w_idx2_1st;
	logic [4:0] w_idx2_2nd;
	logic [4:0] w_idx2_3rd;
	logic [4:0] w_idx2_4th;
	
	module1 U_FFT_MOD1 (
		.clk(clk),
		.rstn(rstn),
		.valid(w_valid_mod1),

		.d_in_R(w_mod0_R),
		.d_in_Q(w_mod0_Q),

		.dout_R1_add(w_mod1_R1_add),
		.dout_R1_sub(w_mod1_R1_sub),
		.dout_R2_add(w_mod1_R2_add),
		.dout_R2_sub(w_mod1_R2_sub),

		.dout_Q1_add(w_mod1_Q1_add),
		.dout_Q1_sub(w_mod1_Q1_sub),
		.dout_Q2_add(w_mod1_Q2_add),
		.dout_Q2_sub(w_mod1_Q2_sub),

		.alert_cbfp1(w_valid_mod2),

		.cbfp1_mem_push(w_idx2_push),
		.scale_fac_1st_add(w_idx2_1st),
		.scale_fac_1st_sub(w_idx2_2nd),
		.scale_fac_2nd_add(w_idx2_3rd),
		.scale_fac_2nd_sub(w_idx2_4th)
    );


/////////////////////////////////////////////////////////////////////////
/////////					FFT_Module2							/////////
/////////////////////////////////////////////////////////////////////////
	logic signed [15:0] w_mod2_R_1st;
	logic signed [15:0] w_mod2_Q_1st;

	logic signed [15:0] w_mod2_R_2nd;
	logic signed [15:0] w_mod2_Q_2nd;

	logic signed [15:0] w_mod2_R_3rd;
	logic signed [15:0] w_mod2_Q_3rd;

	logic signed [15:0] w_mod2_R_4th;
	logic signed [15:0] w_mod2_Q_4th;

	logic signed [15:0] w_mod2_R_5th;
	logic signed [15:0] w_mod2_Q_5th;

	logic signed [15:0] w_mod2_R_6th;
	logic signed [15:0] w_mod2_Q_6th;

	logic signed [15:0] w_mod2_R_7th;
	logic signed [15:0] w_mod2_Q_7th;

	logic signed [15:0] w_mod2_R_8th;
	logic signed [15:0] w_mod2_Q_8th;

	logic signed [15:0] w_mod2_R_9th;
	logic signed [15:0] w_mod2_Q_9th;

	logic signed [15:0] w_mod2_R_10th;
	logic signed [15:0] w_mod2_Q_10th;

	logic signed [15:0] w_mod2_R_11th;
	logic signed [15:0] w_mod2_Q_11th;

	logic signed [15:0] w_mod2_R_12th;
	logic signed [15:0] w_mod2_Q_12th;

	logic signed [15:0] w_mod2_R_13th;
	logic signed [15:0] w_mod2_Q_13th;

	logic signed [15:0] w_mod2_R_14th;
	logic signed [15:0] w_mod2_Q_14th;

	logic signed [15:0] w_mod2_R_15th;
	logic signed [15:0] w_mod2_Q_15th;

	logic signed [15:0] w_mod2_R_16th;
	logic signed [15:0] w_mod2_Q_16th;

	logic signed [15:0] w_mod2_R_17th;
	logic signed [15:0] w_mod2_Q_17th;

	logic signed [15:0] w_mod2_R_18th;
	logic signed [15:0] w_mod2_Q_18th;

	logic signed [15:0] w_mod2_R_19th;
	logic signed [15:0] w_mod2_Q_19th;

	logic signed [15:0] w_mod2_R_20th;
	logic signed [15:0] w_mod2_Q_20th;

	logic signed [15:0] w_mod2_R_21th;
	logic signed [15:0] w_mod2_Q_21th;

	logic signed [15:0] w_mod2_R_22th;
	logic signed [15:0] w_mod2_Q_22th;

	logic signed [15:0] w_mod2_R_23th;
	logic signed [15:0] w_mod2_Q_23th;

	logic signed [15:0] w_mod2_R_24th;
	logic signed [15:0] w_mod2_Q_24th;

	logic signed [15:0] w_mod2_R_25th;
	logic signed [15:0] w_mod2_Q_25th;

	logic signed [15:0] w_mod2_R_26th;
	logic signed [15:0] w_mod2_Q_26th;

	logic signed [15:0] w_mod2_R_27th;
	logic signed [15:0] w_mod2_Q_27th;

	logic signed [15:0] w_mod2_R_28th;
	logic signed [15:0] w_mod2_Q_28th;

	logic signed [15:0] w_mod2_R_29th;
	logic signed [15:0] w_mod2_Q_29th;

	logic signed [15:0] w_mod2_R_30th;
	logic signed [15:0] w_mod2_Q_30th;

	logic signed [15:0] w_mod2_R_31th;
	logic signed [15:0] w_mod2_Q_31th;

	logic signed [15:0] w_mod2_R_32th;
	logic signed [15:0] w_mod2_Q_32th;
	logic w_valid_cbfp2;


	module2 U_FFT_MOD2 (
		.clk(clk),
		.rstn(rstn),
		.alert_cbfp1(w_valid_mod2),

		.din_R1_add_20(w_mod1_R1_add),
		.din_R1_sub_20(w_mod1_R1_sub),
		.din_R2_add_20(w_mod1_R2_add),
		.din_R2_sub_20(w_mod1_R2_sub),

		.din_Q1_add_20(w_mod1_Q1_add),
		.din_Q1_sub_20(w_mod1_Q1_sub),
		.din_Q2_add_20(w_mod1_Q2_add),
		.din_Q2_sub_20(w_mod1_Q2_sub),

		.dout_R_1st_fin(w_mod2_R_1st),
		.dout_Q_1st_fin(w_mod2_Q_1st),

		.dout_R_2nd_fin(w_mod2_R_2nd),
		.dout_Q_2nd_fin(w_mod2_Q_2nd),

		.dout_R_3rd_fin(w_mod2_R_3rd),
		.dout_Q_3rd_fin(w_mod2_Q_3rd),

		.dout_R_4th_fin(w_mod2_R_4th),
		.dout_Q_4th_fin(w_mod2_Q_4th),

		.dout_R_5th_fin(w_mod2_R_5th),
		.dout_Q_5th_fin(w_mod2_Q_5th),

		.dout_R_6th_fin(w_mod2_R_6th),
		.dout_Q_6th_fin(w_mod2_Q_6th),

		.dout_R_7th_fin(w_mod2_R_7th),
		.dout_Q_7th_fin(w_mod2_Q_7th),

		.dout_R_8th_fin(w_mod2_R_8th),
		.dout_Q_8th_fin(w_mod2_Q_8th),

		.dout_R_9th_fin(w_mod2_R_9th),
		.dout_Q_9th_fin(w_mod2_Q_9th),

		.dout_R_10th_fin(w_mod2_R_10th),
		.dout_Q_10th_fin(w_mod2_Q_10th),

		.dout_R_11th_fin(w_mod2_R_11th),
		.dout_Q_11th_fin(w_mod2_Q_11th),

		.dout_R_12th_fin(w_mod2_R_12th),
		.dout_Q_12th_fin(w_mod2_Q_12th),

		.dout_R_13th_fin(w_mod2_R_13th),
		.dout_Q_13th_fin(w_mod2_Q_13th),

		.dout_R_14th_fin(w_mod2_R_14th),
		.dout_Q_14th_fin(w_mod2_Q_14th),

		.dout_R_15th_fin(w_mod2_R_15th),
		.dout_Q_15th_fin(w_mod2_Q_15th),

		.dout_R_16th_fin(w_mod2_R_16th),
		.dout_Q_16th_fin(w_mod2_Q_16th),

		.dout_R_17th_fin(w_mod2_R_17th),
		.dout_Q_17th_fin(w_mod2_Q_17th),

		.dout_R_18th_fin(w_mod2_R_18th),
		.dout_Q_18th_fin(w_mod2_Q_18th),

		.dout_R_19th_fin(w_mod2_R_19th),
		.dout_Q_19th_fin(w_mod2_Q_19th),

		.dout_R_20th_fin(w_mod2_R_20th),
		.dout_Q_20th_fin(w_mod2_Q_20th),

		.dout_R_21th_fin(w_mod2_R_21th),
		.dout_Q_21th_fin(w_mod2_Q_21th),

		.dout_R_22th_fin(w_mod2_R_22th),
		.dout_Q_22th_fin(w_mod2_Q_22th),

		.dout_R_23th_fin(w_mod2_R_23th),
		.dout_Q_23th_fin(w_mod2_Q_23th),

		.dout_R_24th_fin(w_mod2_R_24th),
		.dout_Q_24th_fin(w_mod2_Q_24th),

		.dout_R_25th_fin(w_mod2_R_25th),
		.dout_Q_25th_fin(w_mod2_Q_25th),

		.dout_R_26th_fin(w_mod2_R_26th),
		.dout_Q_26th_fin(w_mod2_Q_26th),

		.dout_R_27th_fin(w_mod2_R_27th),
		.dout_Q_27th_fin(w_mod2_Q_27th),

		.dout_R_28th_fin(w_mod2_R_28th),
		.dout_Q_28th_fin(w_mod2_Q_28th),

		.dout_R_29th_fin(w_mod2_R_29th),
		.dout_Q_29th_fin(w_mod2_Q_29th),

		.dout_R_30th_fin(w_mod2_R_30th),
		.dout_Q_30th_fin(w_mod2_Q_30th),

		.dout_R_31th_fin(w_mod2_R_31th),
		.dout_Q_31th_fin(w_mod2_Q_31th),

		.dout_R_32th_fin(w_mod2_R_32th),
		.dout_Q_32th_fin(w_mod2_Q_32th),

		.alert_cbfp2(w_valid_cbfp2)
	);

/////////////////////////////////////////////////////////////////////////
/////////						CBPF2							/////////
/////////////////////////////////////////////////////////////////////////

	top_cbfp2 U_CBFP2 (
		.clk(clk),
		.rstn(rstn),

		.push_idx1(w_idx1_push),
		.push_idx2(w_idx2_push),
		.pop(w_valid_cbfp2),
		.push_data_idx1(w_idx1),
		.push_data_idx2_1(w_idx2_1st),
		.push_data_idx2_2(w_idx2_2nd),
		.push_data_idx2_3(w_idx2_3rd),
		.push_data_idx2_4(w_idx2_4th),

		.din_R_1st_cbfp2(w_mod2_R_1st),
		.din_Q_1st_cbfp2(w_mod2_Q_1st),

		.din_R_2nd_cbfp2(w_mod2_R_2nd),
		.din_Q_2nd_cbfp2(w_mod2_Q_2nd),

		.din_R_3rd_cbfp2(w_mod2_R_3rd),
		.din_Q_3rd_cbfp2(w_mod2_Q_3rd),

		.din_R_4th_cbfp2(w_mod2_R_4th),
		.din_Q_4th_cbfp2(w_mod2_Q_4th),

		.din_R_5th_cbfp2(w_mod2_R_5th),
		.din_Q_5th_cbfp2(w_mod2_Q_5th),

		.din_R_6th_cbfp2(w_mod2_R_6th),
		.din_Q_6th_cbfp2(w_mod2_Q_6th),

		.din_R_7th_cbfp2(w_mod2_R_7th),
		.din_Q_7th_cbfp2(w_mod2_Q_7th),

		.din_R_8th_cbfp2(w_mod2_R_8th),
		.din_Q_8th_cbfp2(w_mod2_Q_8th),

		.din_R_9th_cbfp2(w_mod2_R_9th),
		.din_Q_9th_cbfp2(w_mod2_Q_9th),

		.din_R_10th_cbfp2(w_mod2_R_10th),
		.din_Q_10th_cbfp2(w_mod2_Q_10th),

		.din_R_11th_cbfp2(w_mod2_R_11th),
		.din_Q_11th_cbfp2(w_mod2_Q_11th),

		.din_R_12th_cbfp2(w_mod2_R_12th),
		.din_Q_12th_cbfp2(w_mod2_Q_12th),

		.din_R_13th_cbfp2(w_mod2_R_13th),
		.din_Q_13th_cbfp2(w_mod2_Q_13th),

		.din_R_14th_cbfp2(w_mod2_R_14th),
		.din_Q_14th_cbfp2(w_mod2_Q_14th),

		.din_R_15th_cbfp2(w_mod2_R_15th),
		.din_Q_15th_cbfp2(w_mod2_Q_15th),

		.din_R_16th_cbfp2(w_mod2_R_16th),
		.din_Q_16th_cbfp2(w_mod2_Q_16th),

		.din_R_17th_cbfp2(w_mod2_R_17th),
		.din_Q_17th_cbfp2(w_mod2_Q_17th),

		.din_R_18th_cbfp2(w_mod2_R_18th),
		.din_Q_18th_cbfp2(w_mod2_Q_18th),

		.din_R_19th_cbfp2(w_mod2_R_19th),
		.din_Q_19th_cbfp2(w_mod2_Q_19th),

		.din_R_20th_cbfp2(w_mod2_R_20th),
		.din_Q_20th_cbfp2(w_mod2_Q_20th),

		.din_R_21st_cbfp2(w_mod2_R_21th),
		.din_Q_21st_cbfp2(w_mod2_Q_21th),

		.din_R_22nd_cbfp2(w_mod2_R_22th),
		.din_Q_22nd_cbfp2(w_mod2_Q_22th),

		.din_R_23rd_cbfp2(w_mod2_R_23th),
		.din_Q_23rd_cbfp2(w_mod2_Q_23th),

		.din_R_24th_cbfp2(w_mod2_R_24th),
		.din_Q_24th_cbfp2(w_mod2_Q_24th),

		.din_R_25th_cbfp2(w_mod2_R_25th),
		.din_Q_25th_cbfp2(w_mod2_Q_25th),

		.din_R_26th_cbfp2(w_mod2_R_26th),
		.din_Q_26th_cbfp2(w_mod2_Q_26th),

		.din_R_27th_cbfp2(w_mod2_R_27th),
		.din_Q_27th_cbfp2(w_mod2_Q_27th),

		.din_R_28th_cbfp2(w_mod2_R_28th),
		.din_Q_28th_cbfp2(w_mod2_Q_28th),

		.din_R_29th_cbfp2(w_mod2_R_29th),
		.din_Q_29th_cbfp2(w_mod2_Q_29th),

		.din_R_30th_cbfp2(w_mod2_R_30th),
		.din_Q_30th_cbfp2(w_mod2_Q_30th),

		.din_R_31st_cbfp2(w_mod2_R_31th),
		.din_Q_31st_cbfp2(w_mod2_Q_31th),

		.din_R_32nd_cbfp2(w_mod2_R_32th),
		.din_Q_32nd_cbfp2(w_mod2_Q_32th),
		

		.done(do_en),
		.dout_R_reorder(do_re),
		.dout_Q_reorder(do_im)
	);


endmodule
