`timescale 1ns / 1ps

module tb_dut();

    // Parameters
    localparam DATA_WIDTH = 9;
    localparam NUM_IN_OUT = 16;
    localparam FILE_DEPTH = 2048;
    localparam CLK_PERIOD = 10;

    // DUT signals
    reg clk;
    reg rstn;
    reg signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1];
    reg signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1];
    reg valid;

    // mod0_0 (dummy)
    wire signed [DATA_WIDTH:0] dout_R_add_00 [0:NUM_IN_OUT-1];
    wire signed [DATA_WIDTH:0] dout_R_sub_00 [0:NUM_IN_OUT-1];
    wire signed [DATA_WIDTH:0] dout_Q_add_00 [0:NUM_IN_OUT-1];
    wire signed [DATA_WIDTH:0] dout_Q_sub_00 [0:NUM_IN_OUT-1];

    // mod0_1 FINAL OUTPUTS (dummy)
    wire signed [12:0] dout_R_add01 [0:15];
    wire signed [12:0] dout_Q_add01 [0:15];
    wire signed [12:0] dout_R_sub01 [0:15];
    wire signed [12:0] dout_Q_sub01 [0:15];
    wire alert_mod01, alert_mod02;

    // Internal signals and variables
    integer i, j;
    integer file_i, file_q;
    integer file_real_out, file_imag_out;

    reg signed [DATA_WIDTH - 1:0] cos_i_data [0:FILE_DEPTH-1];
    reg signed [DATA_WIDTH - 1:0] cos_q_data [0:FILE_DEPTH-1];

    reg first_minus_one_detected = 0;
    reg first_one_two_seven_detected = 0;

    integer phase1_real_count = 0;
    integer phase1_imag_count = 0;
    integer phase2_real_count = 0;
    integer phase2_imag_count = 0;

    // DUT instance (dummy ports, replace with real ones)
    wire signed [10:0] dout_R_CBFP [0:15];
    wire signed [10:0] dout_Q_CBFP [0:15];
    wire valid_mod1;

	logic [4:0] cbfp0_scale_fac;
	logic cbfp0_mem_push;

    module0 DUT(
        .clk(clk),
        .rstn(rstn),
        .valid(valid),
        .din_R(din_i),
        .din_Q(din_q),

        .dout_R(dout_R_CBFP),
        .dout_Q(dout_Q_CBFP),
        .valid_mod1(valid_mod1),

		.cbfp0_scale_fac(cbfp0_scale_fac),
		.cbfp0_mem_push(cbfp0_mem_push)
    );

    logic signed [11:0] dout_R1_add [7:0];
    logic signed [11:0] dout_R1_sub [7:0];
	logic signed [11:0] dout_R2_add [7:0];
    logic signed [11:0] dout_R2_sub [7:0];

    logic signed [11:0] dout_Q1_add [7:0];
    logic signed [11:0] dout_Q1_sub [7:0];
    logic signed [11:0] dout_Q2_add [7:0];
    logic signed [11:0] dout_Q2_sub [7:0];

	logic alert_cbfp1;

	logic cbfp1_mem_push;
    logic [4:0] scale_fac_1st_add;
    logic [4:0] scale_fac_1st_sub;
    logic [4:0] scale_fac_2nd_add;
    logic [4:0] scale_fac_2nd_sub;

    module1 DUT_MODUULE_1(
	.clk(clk),
	.rstn(rstn),
	.valid(valid_mod1),

	.d_in_R(dout_R_CBFP),
	.d_in_Q(dout_Q_CBFP),

	.dout_R1_add(dout_R1_add),
    .dout_R1_sub(dout_R1_sub),
	.dout_R2_add(dout_R2_add),
    .dout_R2_sub(dout_R2_sub),

    .dout_Q1_add(dout_Q1_add),
    .dout_Q1_sub(dout_Q1_sub),
    .dout_Q2_add(dout_Q2_add),
    .dout_Q2_sub(dout_Q2_sub),

	.alert_cbfp1(alert_cbfp1),

	.cbfp1_mem_push(cbfp1_mem_push),
    .scale_fac_1st_add(scale_fac_1st_add),
    .scale_fac_1st_sub(scale_fac_1st_sub),
    .scale_fac_2nd_add(scale_fac_2nd_add),
    .scale_fac_2nd_sub(scale_fac_2nd_sub)
    );

    logic signed [12:0] dout_R_add_1_1st [1:0];
    logic signed [12:0] dout_R_add_1_2nd [1:0];
	logic signed [12:0] dout_Q_add_1_1st [1:0];
    logic signed [12:0] dout_Q_add_1_2nd [1:0];

	logic signed [12:0] dout_R_sub_1_3rd [1:0];
    logic signed [12:0] dout_R_sub_1_4th [1:0];
	logic signed [12:0] dout_Q_sub_1_3rd [1:0];
    logic signed [12:0] dout_Q_sub_1_4th [1:0];

	logic signed [12:0] dout_R_add_2_5th [1:0];
    logic signed [12:0] dout_R_add_2_6th [1:0];
	logic signed [12:0] dout_Q_add_2_5th [1:0];
    logic signed [12:0] dout_Q_add_2_6th [1:0];

	logic signed [12:0] dout_R_sub_2_7th [1:0];
    logic signed [12:0] dout_R_sub_2_8th [1:0];
	logic signed [12:0] dout_Q_sub_2_7th [1:0];
    logic signed [12:0] dout_Q_sub_2_8th [1:0];

	logic signed [12:0] dout_R_add_3_9th [1:0];
    logic signed [12:0] dout_R_add_3_10th [1:0];
	logic signed [12:0] dout_Q_add_3_9th [1:0];
    logic signed [12:0] dout_Q_add_3_10th [1:0];

	logic signed [12:0] dout_R_sub_3_11th [1:0];
    logic signed [12:0] dout_R_sub_3_12th [1:0];
	logic signed [12:0] dout_Q_sub_3_11th [1:0];
    logic signed [12:0] dout_Q_sub_3_12th [1:0];

	logic signed [12:0] dout_R_add_4_13th [1:0];
    logic signed [12:0] dout_R_add_4_14th [1:0];
	logic signed [12:0] dout_Q_add_4_13th [1:0];
    logic signed [12:0] dout_Q_add_4_14th [1:0];

	logic signed [12:0] dout_R_sub_4_15th [1:0];
    logic signed [12:0] dout_R_sub_4_16th [1:0];
	logic signed [12:0] dout_Q_sub_4_15th [1:0];
    logic signed [12:0] dout_Q_sub_4_16th [1:0];

	logic alert_mod20;

    mod2_0 DUT_MOD20(
	.clk(clk),
	.rstn(rstn),
	.alert_cbfp1(alert_cbfp1),

	.din_R1_add_20(dout_R1_add),
    .din_R1_sub_20(dout_R1_sub),
	.din_R2_add_20(dout_R2_add),
    .din_R2_sub_20(dout_R2_sub),

    .din_Q1_add_20(dout_Q1_add),
    .din_Q1_sub_20(dout_Q1_sub),
    .din_Q2_add_20(dout_Q2_add),
    .din_Q2_sub_20(dout_Q2_sub),

	.dout_R_add_1_1st (dout_R_add_1_1st),
    .dout_R_add_1_2nd (dout_R_add_1_2nd),
	.dout_Q_add_1_1st (dout_Q_add_1_1st),
    .dout_Q_add_1_2nd (dout_Q_add_1_2nd),

	.dout_R_sub_1_3rd (dout_R_sub_1_3rd),
    .dout_R_sub_1_4th (dout_R_sub_1_4th),
	.dout_Q_sub_1_3rd (dout_Q_sub_1_3rd),
    .dout_Q_sub_1_4th (dout_Q_sub_1_4th),

	.dout_R_add_2_5th (dout_R_add_2_5th),
    .dout_R_add_2_6th (dout_R_add_2_6th),
	.dout_Q_add_2_5th (dout_Q_add_2_5th),
    .dout_Q_add_2_6th (dout_Q_add_2_6th),

	.dout_R_sub_2_7th (dout_R_sub_2_7th),
    .dout_R_sub_2_8th (dout_R_sub_2_8th),
	.dout_Q_sub_2_7th (dout_Q_sub_2_7th),
    .dout_Q_sub_2_8th (dout_Q_sub_2_8th),

	.dout_R_add_3_9th (dout_R_add_3_9th),
    .dout_R_add_3_10th(dout_R_add_3_10th),
	.dout_Q_add_3_9th (dout_Q_add_3_9th),
    .dout_Q_add_3_10th(dout_Q_add_3_10th),

	.dout_R_sub_3_11th(dout_R_sub_3_11th),
    .dout_R_sub_3_12th(dout_R_sub_3_12th),
	.dout_Q_sub_3_11th(dout_Q_sub_3_11th),
    .dout_Q_sub_3_12th(dout_Q_sub_3_12th),

	.dout_R_add_4_13th(dout_R_add_4_13th),
    .dout_R_add_4_14th(dout_R_add_4_14th),
	.dout_Q_add_4_13th(dout_Q_add_4_13th),
    .dout_Q_add_4_14th(dout_Q_add_4_14th),

	.dout_R_sub_4_15th(dout_R_sub_4_15th),
    .dout_R_sub_4_16th(dout_R_sub_4_16th),
	.dout_Q_sub_4_15th(dout_Q_sub_4_15th),
    .dout_Q_sub_4_16th(dout_Q_sub_4_16th),


	.alert_mod20(alert_mod20)
    );


    logic signed [15:0] dout_R_1st_fin;
	logic signed [15:0] dout_Q_1st_fin;

	logic signed [15:0] dout_R_2nd_fin;
	logic signed [15:0] dout_Q_2nd_fin;

	logic signed [15:0] dout_R_3rd_fin;
	logic signed [15:0] dout_Q_3rd_fin;

	logic signed [15:0] dout_R_4th_fin;
	logic signed [15:0] dout_Q_4th_fin;

	logic signed [15:0] dout_R_5th_fin;
	logic signed [15:0] dout_Q_5th_fin;

	logic signed [15:0] dout_R_6th_fin;
	logic signed [15:0] dout_Q_6th_fin;

	logic signed [15:0] dout_R_7th_fin;
	logic signed [15:0] dout_Q_7th_fin;

	logic signed [15:0] dout_R_8th_fin;
	logic signed [15:0] dout_Q_8th_fin;

	logic signed [15:0] dout_R_9th_fin;
	logic signed [15:0] dout_Q_9th_fin;

	logic signed [15:0] dout_R_10th_fin;
	logic signed [15:0] dout_Q_10th_fin;

	logic signed [15:0] dout_R_11th_fin;
	logic signed [15:0] dout_Q_11th_fin;

	logic signed [15:0] dout_R_12th_fin;
	logic signed [15:0] dout_Q_12th_fin;

	logic signed [15:0] dout_R_13th_fin;
	logic signed [15:0] dout_Q_13th_fin;

	logic signed [15:0] dout_R_14th_fin;
	logic signed [15:0] dout_Q_14th_fin;

	logic signed [15:0] dout_R_15th_fin;
	logic signed [15:0] dout_Q_15th_fin;

	logic signed [15:0] dout_R_16th_fin;
	logic signed [15:0] dout_Q_16th_fin;

	logic signed [15:0] dout_R_17th_fin;
	logic signed [15:0] dout_Q_17th_fin;

	logic signed [15:0] dout_R_18th_fin;
	logic signed [15:0] dout_Q_18th_fin;

	logic signed [15:0] dout_R_19th_fin;
	logic signed [15:0] dout_Q_19th_fin;

	logic signed [15:0] dout_R_20th_fin;
	logic signed [15:0] dout_Q_20th_fin;

	logic signed [15:0] dout_R_21th_fin;
	logic signed [15:0] dout_Q_21th_fin;

	logic signed [15:0] dout_R_22th_fin;
	logic signed [15:0] dout_Q_22th_fin;

	logic signed [15:0] dout_R_23th_fin;
	logic signed [15:0] dout_Q_23th_fin;

	logic signed [15:0] dout_R_24th_fin;
	logic signed [15:0] dout_Q_24th_fin;

	logic signed [15:0] dout_R_25th_fin;
	logic signed [15:0] dout_Q_25th_fin;

	logic signed [15:0] dout_R_26th_fin;
	logic signed [15:0] dout_Q_26th_fin;

	logic signed [15:0] dout_R_27th_fin;
	logic signed [15:0] dout_Q_27th_fin;

	logic signed [15:0] dout_R_28th_fin;
	logic signed [15:0] dout_Q_28th_fin;

	logic signed [15:0] dout_R_29th_fin;
	logic signed [15:0] dout_Q_29th_fin;

	logic signed [15:0] dout_R_30th_fin;
	logic signed [15:0] dout_Q_30th_fin;

	logic signed [15:0] dout_R_31th_fin;
	logic signed [15:0] dout_Q_31th_fin;

	logic signed [15:0] dout_R_32th_fin;
	logic signed [15:0] dout_Q_32th_fin;

	logic alert_mod21;

    mod2_1 DUT_MOD21(
    .clk(clk),
	.rstn(rstn),
	.alert_mod20(alert_mod20),
	.din_R_1st (dout_R_add_1_1st),
    .din_R_2nd (dout_R_add_1_2nd),
	.din_Q_1st (dout_Q_add_1_1st),
    .din_Q_2nd (dout_Q_add_1_2nd),

	.din_R_3rd (dout_R_sub_1_3rd),
    .din_R_4th (dout_R_sub_1_4th),
	.din_Q_3rd (dout_Q_sub_1_3rd),
    .din_Q_4th (dout_Q_sub_1_4th),

	.din_R_5th (dout_R_add_2_5th),
    .din_R_6th (dout_R_add_2_6th),
	.din_Q_5th (dout_Q_add_2_5th),
    .din_Q_6th (dout_Q_add_2_6th),

	.din_R_7th (dout_R_sub_2_7th),
    .din_R_8th (dout_R_sub_2_8th),
	.din_Q_7th (dout_Q_sub_2_7th),
    .din_Q_8th (dout_Q_sub_2_8th),

	.din_R_9th (dout_R_add_3_9th),
    .din_R_10th(dout_R_add_3_10th),
	.din_Q_9th (dout_Q_add_3_9th),
    .din_Q_10th(dout_Q_add_3_10th),

	.din_R_11th(dout_R_sub_3_11th),
    .din_R_12th(dout_R_sub_3_12th),
	.din_Q_11th(dout_Q_sub_3_11th),
    .din_Q_12th(dout_Q_sub_3_12th),

	.din_R_13th(dout_R_add_4_13th),
    .din_R_14th(dout_R_add_4_14th),
	.din_Q_13th(dout_Q_add_4_13th),
    .din_Q_14th(dout_Q_add_4_14th),

	.din_R_15th(dout_R_sub_4_15th),
    .din_R_16th(dout_R_sub_4_16th),
	.din_Q_15th(dout_Q_sub_4_15th),
    .din_Q_16th(dout_Q_sub_4_16th),

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

	.alert_mod21(alert_mod21)
    );

    logic signed [15:0] dout_R_1st_mod22;
	logic signed [15:0] dout_Q_1st_mod22;

	logic signed [15:0] dout_R_2nd_mod22;
	logic signed [15:0] dout_Q_2nd_mod22;

	logic signed [15:0] dout_R_3rd_mod22;
	logic signed [15:0] dout_Q_3rd_mod22;

	logic signed [15:0] dout_R_4th_mod22;
	logic signed [15:0] dout_Q_4th_mod22;

	logic signed [15:0] dout_R_5th_mod22;
	logic signed [15:0] dout_Q_5th_mod22;

	logic signed [15:0] dout_R_6th_mod22;
	logic signed [15:0] dout_Q_6th_mod22;

	logic signed [15:0] dout_R_7th_mod22;
	logic signed [15:0] dout_Q_7th_mod22;

	logic signed [15:0] dout_R_8th_mod22;
	logic signed [15:0] dout_Q_8th_mod22;

	logic signed [15:0] dout_R_9th_mod22;
	logic signed [15:0] dout_Q_9th_mod22;

	logic signed [15:0] dout_R_10th_mod22;
	logic signed [15:0] dout_Q_10th_mod22;

	logic signed [15:0] dout_R_11th_mod22;
	logic signed [15:0] dout_Q_11th_mod22;

	logic signed [15:0] dout_R_12th_mod22;
	logic signed [15:0] dout_Q_12th_mod22;

	logic signed [15:0] dout_R_13th_mod22;
	logic signed [15:0] dout_Q_13th_mod22;

	logic signed [15:0] dout_R_14th_mod22;
	logic signed [15:0] dout_Q_14th_mod22;

	logic signed [15:0] dout_R_15th_mod22;
	logic signed [15:0] dout_Q_15th_mod22;

	logic signed [15:0] dout_R_16th_mod22;
	logic signed [15:0] dout_Q_16th_mod22;

	logic signed [15:0] dout_R_17th_mod22;
	logic signed [15:0] dout_Q_17th_mod22;

	logic signed [15:0] dout_R_18th_mod22;
	logic signed [15:0] dout_Q_18th_mod22;

	logic signed [15:0] dout_R_19th_mod22;
	logic signed [15:0] dout_Q_19th_mod22;

	logic signed [15:0] dout_R_20th_mod22;
	logic signed [15:0] dout_Q_20th_mod22;

	logic signed [15:0] dout_R_21th_mod22;
	logic signed [15:0] dout_Q_21th_mod22;

	logic signed [15:0] dout_R_22th_mod22;
	logic signed [15:0] dout_Q_22th_mod22;

	logic signed [15:0] dout_R_23th_mod22;
	logic signed [15:0] dout_Q_23th_mod22;

	logic signed [15:0] dout_R_24th_mod22;
	logic signed [15:0] dout_Q_24th_mod22;

	logic signed [15:0] dout_R_25th_mod22;
	logic signed [15:0] dout_Q_25th_mod22;

	logic signed [15:0] dout_R_26th_mod22;
	logic signed [15:0] dout_Q_26th_mod22;

	logic signed [15:0] dout_R_27th_mod22;
	logic signed [15:0] dout_Q_27th_mod22;

	logic signed [15:0] dout_R_28th_mod22;
	logic signed [15:0] dout_Q_28th_mod22;

	logic signed [15:0] dout_R_29th_mod22;
	logic signed [15:0] dout_Q_29th_mod22;

	logic signed [15:0] dout_R_30th_mod22;
	logic signed [15:0] dout_Q_30th_mod22;

	logic signed [15:0] dout_R_31th_mod22;
	logic signed [15:0] dout_Q_31th_mod22;

	logic signed [15:0] dout_R_32th_mod22;
	logic signed [15:0] dout_Q_32th_mod22;

	logic alert_cbfp2;

    mod2_2 DUT_MOD22(
	.clk(clk),
	.rstn(rstn),
	.alert_mod21(alert_mod21),

	.din_R_1st(dout_R_1st_fin),
	.din_Q_1st(dout_Q_1st_fin),

	.din_R_2nd(dout_R_2nd_fin),
	.din_Q_2nd(dout_Q_2nd_fin),

	.din_R_3rd(dout_R_3rd_fin),
	.din_Q_3rd(dout_Q_3rd_fin),

	.din_R_4th(dout_R_4th_fin),
	.din_Q_4th(dout_Q_4th_fin),

	.din_R_5th(dout_R_5th_fin),
	.din_Q_5th(dout_Q_5th_fin),

	.din_R_6th(dout_R_6th_fin),
	.din_Q_6th(dout_Q_6th_fin),

	.din_R_7th(dout_R_7th_fin),
	.din_Q_7th(dout_Q_7th_fin),

	.din_R_8th(dout_R_8th_fin),
	.din_Q_8th(dout_Q_8th_fin),

	.din_R_9th(dout_R_9th_fin),
	.din_Q_9th(dout_Q_9th_fin),

	.din_R_10th(dout_R_10th_fin),
	.din_Q_10th(dout_Q_10th_fin),

	.din_R_11th(dout_R_11th_fin),
	.din_Q_11th(dout_Q_11th_fin),

	.din_R_12th(dout_R_12th_fin),
	.din_Q_12th(dout_Q_12th_fin),

	.din_R_13th(dout_R_13th_fin),
	.din_Q_13th(dout_Q_13th_fin),

	.din_R_14th(dout_R_14th_fin),
	.din_Q_14th(dout_Q_14th_fin),

	.din_R_15th(dout_R_15th_fin),
	.din_Q_15th(dout_Q_15th_fin),

	.din_R_16th(dout_R_16th_fin),
	.din_Q_16th(dout_Q_16th_fin),

	.din_R_17th(dout_R_17th_fin),
	.din_Q_17th(dout_Q_17th_fin),

	.din_R_18th(dout_R_18th_fin),
	.din_Q_18th(dout_Q_18th_fin),

	.din_R_19th(dout_R_19th_fin),
	.din_Q_19th(dout_Q_19th_fin),

	.din_R_20th(dout_R_20th_fin),
	.din_Q_20th(dout_Q_20th_fin),

	.din_R_21th(dout_R_21th_fin),
	.din_Q_21th(dout_Q_21th_fin),

	.din_R_22th(dout_R_22th_fin),
	.din_Q_22th(dout_Q_22th_fin),

	.din_R_23th(dout_R_23th_fin),
	.din_Q_23th(dout_Q_23th_fin),

	.din_R_24th(dout_R_24th_fin),
	.din_Q_24th(dout_Q_24th_fin),

	.din_R_25th(dout_R_25th_fin),
	.din_Q_25th(dout_Q_25th_fin),

	.din_R_26th(dout_R_26th_fin),
	.din_Q_26th(dout_Q_26th_fin),

	.din_R_27th(dout_R_27th_fin),
	.din_Q_27th(dout_Q_27th_fin),

	.din_R_28th(dout_R_28th_fin),
	.din_Q_28th(dout_Q_28th_fin),

	.din_R_29th(dout_R_29th_fin),
	.din_Q_29th(dout_Q_29th_fin),

	.din_R_30th(dout_R_30th_fin),
	.din_Q_30th(dout_Q_30th_fin),

	.din_R_31th(dout_R_31th_fin),
	.din_Q_31th(dout_Q_31th_fin),

	.din_R_32th(dout_R_32th_fin),
	.din_Q_32th(dout_Q_32th_fin),

	.dout_R_1st_fin(dout_R_1st_mod22),
	.dout_Q_1st_fin(dout_Q_1st_mod22),

	.dout_R_2nd_fin(dout_R_2nd_mod22),
	.dout_Q_2nd_fin(dout_Q_2nd_mod22),

	.dout_R_3rd_fin(dout_R_3rd_mod22),
	.dout_Q_3rd_fin(dout_Q_3rd_mod22),

	.dout_R_4th_fin(dout_R_4th_mod22),
	.dout_Q_4th_fin(dout_Q_4th_mod22),

	.dout_R_5th_fin(dout_R_5th_mod22),
	.dout_Q_5th_fin(dout_Q_5th_mod22),

	.dout_R_6th_fin(dout_R_6th_mod22),
	.dout_Q_6th_fin(dout_Q_6th_mod22),

	.dout_R_7th_fin(dout_R_7th_mod22),
	.dout_Q_7th_fin(dout_Q_7th_mod22),

	.dout_R_8th_fin(dout_R_8th_mod22),
	.dout_Q_8th_fin(dout_Q_8th_mod22),

	.dout_R_9th_fin(dout_R_9th_mod22),
	.dout_Q_9th_fin(dout_Q_9th_mod22),

	.dout_R_10th_fin(dout_R_10th_mod22),
	.dout_Q_10th_fin(dout_Q_10th_mod22),

	.dout_R_11th_fin(dout_R_11th_mod22),
	.dout_Q_11th_fin(dout_Q_11th_mod22),

	.dout_R_12th_fin(dout_R_12th_mod22),
	.dout_Q_12th_fin(dout_Q_12th_mod22),

	.dout_R_13th_fin(dout_R_13th_mod22),
	.dout_Q_13th_fin(dout_Q_13th_mod22),

	.dout_R_14th_fin(dout_R_14th_mod22),
	.dout_Q_14th_fin(dout_Q_14th_mod22),

	.dout_R_15th_fin(dout_R_15th_mod22),
	.dout_Q_15th_fin(dout_Q_15th_mod22),

	.dout_R_16th_fin(dout_R_16th_mod22),
	.dout_Q_16th_fin(dout_Q_16th_mod22),

	.dout_R_17th_fin(dout_R_17th_mod22),
	.dout_Q_17th_fin(dout_Q_17th_mod22),

	.dout_R_18th_fin(dout_R_18th_mod22),
	.dout_Q_18th_fin(dout_Q_18th_mod22),

	.dout_R_19th_fin(dout_R_19th_mod22),
	.dout_Q_19th_fin(dout_Q_19th_mod22),

	.dout_R_20th_fin(dout_R_20th_mod22),
	.dout_Q_20th_fin(dout_Q_20th_mod22),

	.dout_R_21th_fin(dout_R_21th_mod22),
	.dout_Q_21th_fin(dout_Q_21th_mod22),

	.dout_R_22th_fin(dout_R_22th_mod22),
	.dout_Q_22th_fin(dout_Q_22th_mod22),

	.dout_R_23th_fin(dout_R_23th_mod22),
	.dout_Q_23th_fin(dout_Q_23th_mod22),

	.dout_R_24th_fin(dout_R_24th_mod22),
	.dout_Q_24th_fin(dout_Q_24th_mod22),

	.dout_R_25th_fin(dout_R_25th_mod22),
	.dout_Q_25th_fin(dout_Q_25th_mod22),

	.dout_R_26th_fin(dout_R_26th_mod22),
	.dout_Q_26th_fin(dout_Q_26th_mod22),

	.dout_R_27th_fin(dout_R_27th_mod22),
	.dout_Q_27th_fin(dout_Q_27th_mod22),

	.dout_R_28th_fin(dout_R_28th_mod22),
	.dout_Q_28th_fin(dout_Q_28th_mod22),

	.dout_R_29th_fin(dout_R_29th_mod22),
	.dout_Q_29th_fin(dout_Q_29th_mod22),

	.dout_R_30th_fin(dout_R_30th_mod22),
	.dout_Q_30th_fin(dout_Q_30th_mod22),

	.dout_R_31th_fin(dout_R_31th_mod22),
	.dout_Q_31th_fin(dout_Q_31th_mod22),

	.dout_R_32th_fin(dout_R_32th_mod22),
	.dout_Q_32th_fin(dout_Q_32th_mod22),

	.alert_cbfp2(alert_cbfp2)
    );

///////////////////////////////////////////////////////////////
					//Full Signal
///////////////////////////////////////////////////////////////
	logic full_512;

	full_512_mem_ctrl FULL_512_DUT(
	.clk(clk),
	.rstn(rstn),
	.cbfp2_pop(alert_cbfp2),

	.full_512(full_512)
	);

// ////////////////////////////////////////////////////////////////////
// 					// INDEX MEMORY
// ////////////////////////////////////////////////////////////////////

// 	logic [4:0] sc_fac_cbfp0[31:0];
// 	logic [4:0] sc_fac_cbfp1[31:0];

// 	mem_cbfp0 #(
//     .DEPTH(512),
//     .ADDR_WIDTH(9),
//     .FACTOR_WIDTH(5),
//     .IN1_OFFSET(64),			// 1개 scaling factor 64개 단위
//     .DATA_OUT(32)
// 	) CBFP0_MEM(
//     .clk(clk),
//     .rstn(rstn),

//     .push1(cbfp0_mem_push),			//CBFP0 PUSH
// 	.pop(alert_cbfp2),			//CBFP2 POP

//     .in_data1(cbfp0_scale_fac),
    
//     .sc_fac_cbfp0(sc_fac_cbfp0)
// 	);

// 	mem_cbfp1 #(
//     .DEPTH(512),
//     .ADDR_WIDTH(9),
//     .FACTOR_WIDTH(5),
//     .IN2_OFFSET(8),			//4개 scaling factor 8개 단위
//     .DATA_OUT(32)
// 	) CBFP1_MEM(
//     .clk(clk),
//     .rstn(rstn),

//     .push2(cbfp1_mem_push),			//CBFP1 PUSH
// 	.pop(alert_cbfp2),			//CBFP2 POP

//     .in_data2_0(scale_fac_1st_add),
//     .in_data2_1(scale_fac_1st_sub),
//     .in_data2_2(scale_fac_2nd_add),
//     .in_data2_3(scale_fac_2nd_sub),
    
//     .sc_fac_cbfp1(sc_fac_cbfp1)
// 	);

// 	logic [5:0] final_sc_fac [31:0];

// 	index_sum #(
// 	.FACTOR_WIDTH(5),
//     .DATA_OUT(32)
// 	) U_INDEX_SUM(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.alert_cbfp2(alert_cbfp2),

// 	.sc_fac_cbfp0(sc_fac_cbfp0),
// 	.sc_fac_cbfp1(sc_fac_cbfp1),

// 	.final_sc_fac(final_sc_fac)
// 	);

////////////////////////////////////////////////////////////////////////////////////////
						//CBFP2
////////////////////////////////////////////////////////////////////////////////////////
	
		logic signed [12:0] dout_R_1st_cbfp2;
		logic signed [12:0] dout_Q_1st_cbfp2;

		logic signed [12:0] dout_R_2nd_cbfp2;
		logic signed [12:0] dout_Q_2nd_cbfp2;

		logic signed [12:0] dout_R_3rd_cbfp2;
		logic signed [12:0] dout_Q_3rd_cbfp2;

		logic signed [12:0] dout_R_4th_cbfp2;
		logic signed [12:0] dout_Q_4th_cbfp2;

		logic signed [12:0] dout_R_5th_cbfp2;
		logic signed [12:0] dout_Q_5th_cbfp2;

		logic signed [12:0] dout_R_6th_cbfp2;
		logic signed [12:0] dout_Q_6th_cbfp2;

		logic signed [12:0] dout_R_7th_cbfp2;
		logic signed [12:0] dout_Q_7th_cbfp2;

		logic signed [12:0] dout_R_8th_cbfp2;
		logic signed [12:0] dout_Q_8th_cbfp2;

		logic signed [12:0] dout_R_9th_cbfp2;
		logic signed [12:0] dout_Q_9th_cbfp2;

		logic signed [12:0] dout_R_10th_cbfp2;
		logic signed [12:0] dout_Q_10th_cbfp2;

		logic signed [12:0] dout_R_11th_cbfp2;
		logic signed [12:0] dout_Q_11th_cbfp2;

		logic signed [12:0] dout_R_12th_cbfp2;
		logic signed [12:0] dout_Q_12th_cbfp2;

		logic signed [12:0] dout_R_13th_cbfp2;
		logic signed [12:0] dout_Q_13th_cbfp2;

		logic signed [12:0] dout_R_14th_cbfp2;
		logic signed [12:0] dout_Q_14th_cbfp2;

		logic signed [12:0] dout_R_15th_cbfp2;
		logic signed [12:0] dout_Q_15th_cbfp2;

		logic signed [12:0] dout_R_16th_cbfp2;
		logic signed [12:0] dout_Q_16th_cbfp2;

		logic signed [12:0] dout_R_17th_cbfp2;
		logic signed [12:0] dout_Q_17th_cbfp2;

		logic signed [12:0] dout_R_18th_cbfp2;
		logic signed [12:0] dout_Q_18th_cbfp2;

		logic signed [12:0] dout_R_19th_cbfp2;
		logic signed [12:0] dout_Q_19th_cbfp2;

		logic signed [12:0] dout_R_20th_cbfp2;
		logic signed [12:0] dout_Q_20th_cbfp2;

		logic signed [12:0] dout_R_21st_cbfp2;
		logic signed [12:0] dout_Q_21st_cbfp2;

		logic signed [12:0] dout_R_22nd_cbfp2;
		logic signed [12:0] dout_Q_22nd_cbfp2;

		logic signed [12:0] dout_R_23rd_cbfp2;
		logic signed [12:0] dout_Q_23rd_cbfp2;

		logic signed [12:0] dout_R_24th_cbfp2;
		logic signed [12:0] dout_Q_24th_cbfp2;

		logic signed [12:0] dout_R_25th_cbfp2;
		logic signed [12:0] dout_Q_25th_cbfp2;

		logic signed [12:0] dout_R_26th_cbfp2;
		logic signed [12:0] dout_Q_26th_cbfp2;

		logic signed [12:0] dout_R_27th_cbfp2;
		logic signed [12:0] dout_Q_27th_cbfp2;

		logic signed [12:0] dout_R_28th_cbfp2;
		logic signed [12:0] dout_Q_28th_cbfp2;

		logic signed [12:0] dout_R_29th_cbfp2;
		logic signed [12:0] dout_Q_29th_cbfp2;

		logic signed [12:0] dout_R_30th_cbfp2;
		logic signed [12:0] dout_Q_30th_cbfp2;

		logic signed [12:0] dout_R_31st_cbfp2;
		logic signed [12:0] dout_Q_31st_cbfp2;

		logic signed [12:0] dout_R_32nd_cbfp2;
		logic signed [12:0] dout_Q_32nd_cbfp2;

	cbfp2 CBFP2(
		.clk(clk),
		.rstn(rstn),

		.push_idx1(cbfp0_mem_push),
		.push_idx2(cbfp1_mem_push),
		.pop(alert_cbfp2),
		.push_data_idx1(cbfp0_scale_fac),

		.push_data_idx2_1(scale_fac_1st_add),
		.push_data_idx2_2(scale_fac_1st_sub),
		.push_data_idx2_3(scale_fac_2nd_add),
		.push_data_idx2_4(scale_fac_2nd_sub),

		.din_R_1st_cbfp2(dout_R_1st_mod22),
		.din_Q_1st_cbfp2(dout_Q_1st_mod22),

		.din_R_2nd_cbfp2(dout_R_2nd_mod22),
		.din_Q_2nd_cbfp2(dout_Q_2nd_mod22),

		.din_R_3rd_cbfp2(dout_R_3rd_mod22),
		.din_Q_3rd_cbfp2(dout_Q_3rd_mod22),

		.din_R_4th_cbfp2(dout_R_4th_mod22),
		.din_Q_4th_cbfp2(dout_Q_4th_mod22),

		.din_R_5th_cbfp2(dout_R_5th_mod22),
		.din_Q_5th_cbfp2(dout_Q_5th_mod22),

		.din_R_6th_cbfp2(dout_R_6th_mod22),
		.din_Q_6th_cbfp2(dout_Q_6th_mod22),

		.din_R_7th_cbfp2(dout_R_7th_mod22),
		.din_Q_7th_cbfp2(dout_Q_7th_mod22),

		.din_R_8th_cbfp2(dout_R_8th_mod22),
		.din_Q_8th_cbfp2(dout_Q_8th_mod22),

		.din_R_9th_cbfp2(dout_R_9th_mod22),
		.din_Q_9th_cbfp2(dout_Q_9th_mod22),

		.din_R_10th_cbfp2(dout_R_10th_mod22),
		.din_Q_10th_cbfp2(dout_Q_10th_mod22),

		.din_R_11th_cbfp2(dout_R_11th_mod22),
		.din_Q_11th_cbfp2(dout_Q_11th_mod22),

		.din_R_12th_cbfp2(dout_R_12th_mod22),
		.din_Q_12th_cbfp2(dout_Q_12th_mod22),

		.din_R_13th_cbfp2(dout_R_13th_mod22),
		.din_Q_13th_cbfp2(dout_Q_13th_mod22),

		.din_R_14th_cbfp2(dout_R_14th_mod22),
		.din_Q_14th_cbfp2(dout_Q_14th_mod22),

		.din_R_15th_cbfp2(dout_R_15th_mod22),
		.din_Q_15th_cbfp2(dout_Q_15th_mod22),

		.din_R_16th_cbfp2(dout_R_16th_mod22),
		.din_Q_16th_cbfp2(dout_Q_16th_mod22),

		.din_R_17th_cbfp2(dout_R_17th_mod22),
		.din_Q_17th_cbfp2(dout_Q_17th_mod22),

		.din_R_18th_cbfp2(dout_R_18th_mod22),
		.din_Q_18th_cbfp2(dout_Q_18th_mod22),

		.din_R_19th_cbfp2(dout_R_19th_mod22),
		.din_Q_19th_cbfp2(dout_Q_19th_mod22),

		.din_R_20th_cbfp2(dout_R_20th_mod22),
		.din_Q_20th_cbfp2(dout_Q_20th_mod22),

		.din_R_21st_cbfp2(dout_R_21th_mod22),
		.din_Q_21st_cbfp2(dout_Q_21th_mod22),

		.din_R_22nd_cbfp2(dout_R_22th_mod22),
		.din_Q_22nd_cbfp2(dout_Q_22th_mod22),

		.din_R_23rd_cbfp2(dout_R_23th_mod22),
		.din_Q_23rd_cbfp2(dout_Q_23th_mod22),

		.din_R_24th_cbfp2(dout_R_24th_mod22),
		.din_Q_24th_cbfp2(dout_Q_24th_mod22),

		.din_R_25th_cbfp2(dout_R_25th_mod22),
		.din_Q_25th_cbfp2(dout_Q_25th_mod22),

		.din_R_26th_cbfp2(dout_R_26th_mod22),
		.din_Q_26th_cbfp2(dout_Q_26th_mod22),

		.din_R_27th_cbfp2(dout_R_27th_mod22),
		.din_Q_27th_cbfp2(dout_Q_27th_mod22),

		.din_R_28th_cbfp2(dout_R_28th_mod22),
		.din_Q_28th_cbfp2(dout_Q_28th_mod22),

		.din_R_29th_cbfp2(dout_R_29th_mod22),
		.din_Q_29th_cbfp2(dout_Q_29th_mod22),

		.din_R_30th_cbfp2(dout_R_30th_mod22),
		.din_Q_30th_cbfp2(dout_Q_30th_mod22),

		.din_R_31st_cbfp2(dout_R_31th_mod22),
		.din_Q_31st_cbfp2(dout_Q_31th_mod22),

		.din_R_32nd_cbfp2(dout_R_32th_mod22),
		.din_Q_32nd_cbfp2(dout_Q_32th_mod22),

		// Output signals for all 64 channels
		.dout_R_1st_cbfp2(dout_R_1st_cbfp2),
		.dout_Q_1st_cbfp2(dout_Q_1st_cbfp2),

		.dout_R_2nd_cbfp2(dout_R_2nd_cbfp2),
		.dout_Q_2nd_cbfp2(dout_Q_2nd_cbfp2),

		.dout_R_3rd_cbfp2(dout_R_3rd_cbfp2),
		.dout_Q_3rd_cbfp2(dout_Q_3rd_cbfp2),

		.dout_R_4th_cbfp2(dout_R_4th_cbfp2),
		.dout_Q_4th_cbfp2(dout_Q_4th_cbfp2),

		.dout_R_5th_cbfp2(dout_R_5th_cbfp2),
		.dout_Q_5th_cbfp2(dout_Q_5th_cbfp2),

		.dout_R_6th_cbfp2(dout_R_6th_cbfp2),
		.dout_Q_6th_cbfp2(dout_Q_6th_cbfp2),

		.dout_R_7th_cbfp2(dout_R_7th_cbfp2),
		.dout_Q_7th_cbfp2(dout_Q_7th_cbfp2),

		.dout_R_8th_cbfp2(dout_R_8th_cbfp2),
		.dout_Q_8th_cbfp2(dout_Q_8th_cbfp2),

		.dout_R_9th_cbfp2(dout_R_9th_cbfp2),
		.dout_Q_9th_cbfp2(dout_Q_9th_cbfp2),

		.dout_R_10th_cbfp2(dout_R_10th_cbfp2),
		.dout_Q_10th_cbfp2(dout_Q_10th_cbfp2),

		.dout_R_11th_cbfp2(dout_R_11th_cbfp2),
		.dout_Q_11th_cbfp2(dout_Q_11th_cbfp2),

		.dout_R_12th_cbfp2(dout_R_12th_cbfp2),
		.dout_Q_12th_cbfp2(dout_Q_12th_cbfp2),

		.dout_R_13th_cbfp2(dout_R_13th_cbfp2),
		.dout_Q_13th_cbfp2(dout_Q_13th_cbfp2),

		.dout_R_14th_cbfp2(dout_R_14th_cbfp2),
		.dout_Q_14th_cbfp2(dout_Q_14th_cbfp2),

		.dout_R_15th_cbfp2(dout_R_15th_cbfp2),
		.dout_Q_15th_cbfp2(dout_Q_15th_cbfp2),

		.dout_R_16th_cbfp2(dout_R_16th_cbfp2),
		.dout_Q_16th_cbfp2(dout_Q_16th_cbfp2),

		.dout_R_17th_cbfp2(dout_R_17th_cbfp2),
		.dout_Q_17th_cbfp2(dout_Q_17th_cbfp2),

		.dout_R_18th_cbfp2(dout_R_18th_cbfp2),
		.dout_Q_18th_cbfp2(dout_Q_18th_cbfp2),

		.dout_R_19th_cbfp2(dout_R_19th_cbfp2),
		.dout_Q_19th_cbfp2(dout_Q_19th_cbfp2),

		.dout_R_20th_cbfp2(dout_R_20th_cbfp2),
		.dout_Q_20th_cbfp2(dout_Q_20th_cbfp2),

		.dout_R_21st_cbfp2(dout_R_21st_cbfp2),
		.dout_Q_21st_cbfp2(dout_Q_21st_cbfp2),

		.dout_R_22nd_cbfp2(dout_R_22nd_cbfp2),
		.dout_Q_22nd_cbfp2(dout_Q_22nd_cbfp2),

		.dout_R_23rd_cbfp2(dout_R_23rd_cbfp2),
		.dout_Q_23rd_cbfp2(dout_Q_23rd_cbfp2),

		.dout_R_24th_cbfp2(dout_R_24th_cbfp2),
		.dout_Q_24th_cbfp2(dout_Q_24th_cbfp2),

		.dout_R_25th_cbfp2(dout_R_25th_cbfp2),
		.dout_Q_25th_cbfp2(dout_Q_25th_cbfp2),

		.dout_R_26th_cbfp2(dout_R_26th_cbfp2),
		.dout_Q_26th_cbfp2(dout_Q_26th_cbfp2),

		.dout_R_27th_cbfp2(dout_R_27th_cbfp2),
		.dout_Q_27th_cbfp2(dout_Q_27th_cbfp2),

		.dout_R_28th_cbfp2(dout_R_28th_cbfp2),
		.dout_Q_28th_cbfp2(dout_Q_28th_cbfp2),

		.dout_R_29th_cbfp2(dout_R_29th_cbfp2),
		.dout_Q_29th_cbfp2(dout_Q_29th_cbfp2),

		.dout_R_30th_cbfp2(dout_R_30th_cbfp2),
		.dout_Q_30th_cbfp2(dout_Q_30th_cbfp2),

		.dout_R_31st_cbfp2(dout_R_31st_cbfp2),
		.dout_Q_31st_cbfp2(dout_Q_31st_cbfp2),

		.dout_R_32nd_cbfp2(dout_R_32nd_cbfp2),
		.dout_Q_32nd_cbfp2(dout_Q_32nd_cbfp2)
	);

    // 클럭 생성
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // 테스트 스티뮬러스
    initial begin
        // 1. 신호 초기화
        rstn = 1'b0;
        valid = 1'b0;
        for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
            din_i[i] = 0;
            din_q[i] = 0;
        end

        // (플래그, 카운터 초기화는 위에 default 대입)
        first_minus_one_detected = 1'b0;
        first_one_two_seven_detected = 1'b0;
        phase1_real_count = 0;
        phase1_imag_count = 0;
        phase2_real_count = 0;
        phase2_imag_count = 0;

        // 입력 파일 열기
        file_i = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_i_dat.txt", "r");
        file_q = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_q_dat.txt", "r");
        file_real_out = $fopen("bfly01_real.txt", "w");
        if (file_real_out == 0) $display("Error: Could not open bfly01_real.txt");
        file_imag_out = $fopen("bfly01_imag.txt", "w");
        if (file_imag_out == 0) $display("Error: Could not open bfly01_imag.txt");

        // 입력 데이터 읽기
        for (i = 0; i < FILE_DEPTH; i = i + 1) begin
            if ($fscanf(file_i, "%d\n", cos_i_data[i]) == 0) begin
                $display("Error: Failed to read from cos_i_dat.txt at index %0d", i);
                for (integer k = i; k < FILE_DEPTH; k = k + 1) begin
                    cos_i_data[k] = 0;
                    cos_q_data[k] = 0;
                end
                break;
            end
            if ($fscanf(file_q, "%d\n", cos_q_data[i]) == 0) begin
                $display("Error: Failed to read from cos_q_dat.txt at index %0d", i);
                for (integer k = i; k < FILE_DEPTH; k = k + 1) begin
                    cos_i_data[k] = 0;
                    cos_q_data[k] = 0;
                end
                break;
            end
        end

        $fclose(file_i);
        $fclose(file_q);

        // 2. 리셋 시퀀스
        #(CLK_PERIOD * 2);
        rstn = 1'b1;

        // [바뀌는 구간 시작]
        // 3. 첫 입력 & valid: negative edge에
        @(negedge clk);
        valid = 1'b1;
        $display("Valid asserted + first input at negedge clk, t=%0t", $time);
        for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
            din_i[j] = cos_i_data[j];
            din_q[j] = cos_q_data[j];
        end

        // 4. 두 번째 입력부터는 positive edge마다 
        // (i==NUM_IN_OUT부터 32*NUM_IN_OUT까지)
        for (i = NUM_IN_OUT; i < 32 * NUM_IN_OUT; i = i + NUM_IN_OUT) begin
            @(posedge clk);
            for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                if ((i + j) < FILE_DEPTH) begin
                    din_i[j] = cos_i_data[i+j];
                    din_q[j] = cos_q_data[i+j];
                end else begin
                    din_i[j] = 0;
                    din_q[j] = 0;
                end
            end
        end

        // 5. 32클럭(32*NUM_IN_OUT 샘플) 후 valid 내리기 (마지막 입력 뒤)
        @(posedge clk);
        valid = 1'b0;
        $display("Valid deasserted at time %0t", $time);

        // 6. 남은 입력: valid=0 상태에서 계속 적용
        for (; i < FILE_DEPTH; i = i + NUM_IN_OUT) begin
            @(posedge clk);
            for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                if ((i + j) < FILE_DEPTH) begin
                    din_i[j] = cos_i_data[i+j];
                    din_q[j] = cos_q_data[i+j];
                end else begin
                    din_i[j] = 0;
                    din_q[j] = 0;
                end
            end
        end

        // 7. 시뮬레이션 정리 및 종료
        repeat (100) @(posedge clk);
        if ((phase1_real_count >= 256 && phase1_imag_count >= 256) &&
            (phase2_real_count >= 256 && phase2_imag_count >= 256)) begin
            $display("All 512 outputs written. Finishing simulation.");
        end else begin
            $display("Warning: Not all 512 outputs were written. Check simulation time or output conditions.");
        end
        
        $fclose(file_real_out);
        $fclose(file_imag_out);
        @(posedge clk);
        $stop;
    end

    // 출력 쓰기 로직 (기존과 동일)
    always @(posedge clk) begin
        if (rstn) begin
            // Phase 1
            if (!first_minus_one_detected) begin
                for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                    if (dout_R_add01[j] == -1) begin
                        first_minus_one_detected = 1'b1;
                        $display("First -1 in dout_R_add01 detected at time %0t. Starting Phase 1 file write.", $time);
                    end
                end
            end
            if (first_minus_one_detected && (phase1_real_count < 256 || phase1_imag_count < 256)) begin
                for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                    if (phase1_real_count < 256) begin
                        if (phase1_real_count < 128)
                            $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase1_real_count + 1, dout_R_add01[j]);
                        else
                            $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase1_real_count + 1, dout_R_sub01[j]);
                        phase1_real_count = phase1_real_count + 1;
                    end
                    if (phase1_imag_count < 256) begin
                        if (phase1_imag_count < 128)
                            $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase1_imag_count + 1, dout_Q_add01[j]);
                        else
                            $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase1_imag_count + 1, dout_Q_sub01[j]);
                        phase1_imag_count = phase1_imag_count + 1;
                    end
                end
            end

            // Phase 2
            if (!first_one_two_seven_detected) begin
                for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                    if (dout_R_add01[j] == 127) begin
                        first_one_two_seven_detected = 1'b1;
                        $display("First 127 in dout_R_add01 detected at time %0t. Starting Phase 2 file write.", $time);
                    end
                end
            end
            if (first_one_two_seven_detected && (phase2_real_count < 256 || phase2_imag_count < 256)) begin
                for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                    if (phase2_real_count < 256) begin
                        if (phase2_real_count < 128)
                            $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase2_real_count + 257, dout_R_add01[j]);
                        else
                            $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase2_real_count + 257, dout_R_sub01[j]);
                        phase2_real_count = phase2_real_count + 1;
                    end
                    if (phase2_imag_count < 256) begin
                        if (phase2_imag_count < 128)
                            $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase2_imag_count + 257, dout_Q_add01[j]);
                        else
                            $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase2_imag_count + 257, dout_Q_sub01[j]);
                        phase2_imag_count = phase2_imag_count + 1;
                    end
                end
            end
        end
    end
endmodule
