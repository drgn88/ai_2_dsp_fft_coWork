`timescale 1ns/1ps

module mod0_2 (
	input clk,
	input rstn,
	input alert_mod02,

	//bfly01 13bit <7.6>
	input signed [12:0] din_R_add02 [0:15],
	input signed [12:0] din_Q_add02 [0:15], 
	input signed [12:0] din_R_sub02 [0:15],
	input signed [12:0] din_Q_sub02 [0:15],

	//bfly02 23bit <10.13>
	output logic signed [22:0] dout_R_add02 [0:15],
	output logic signed [22:0] dout_Q_add02 [0:15],
	output logic signed [22:0] dout_R_sub02 [0:15],
	output logic signed [22:0] dout_Q_sub02 [0:15],

	output logic alert_CBFP
);

	//CU Wire
	logic w_bf_en02;
	logic w_mux_sel02;
	logic [8:0] w_addr;
	logic w_mul_en;

	//SUB SHIFT REG 128 OUT
	logic signed [12:0] sout_R_sub02 [0:15];
	logic signed [12:0] sout_Q_sub02 [0:15];

	//SHIFT REG MUX OUT
	logic signed [12:0] mux_out_R02 [0:15];
	logic signed [12:0] mux_out_Q02 [0:15];

	//SHIFT REG 64 OUT
	logic signed [12:0] sout_R_02 [0:15];
	logic signed [12:0] sout_Q_02 [0:15];

	//BF2I Out <8.6> 14bit
	logic signed [13:0] bfly02_R_add [0:15];
	logic signed [13:0] bfly02_R_sub [0:15];
	logic signed [13:0] bfly02_Q_add [0:15];
	logic signed [13:0] bfly02_Q_sub [0:15];

	cu_mod0_2 U_CU_02(
	.clk(clk),
	.rstn(rstn),
	.alert_mod02(alert_mod02),

	.bf_en02(w_bf_en02),
	.mux_sel02(w_mux_sel02),
	.addr(w_addr),
	.mul_en(w_mul_en),
	.alert_CBFP(alert_CBFP)
	);
	
	shift_reg #(
	.DATA_WIDTH(13),
	.NUM_IN_OUT(16),
	.REG_DEPTH(8)// SUB Store 128 values
	) SUB02_MEM_128(
	.clk(clk),
	.rstn(rstn),
	.din_i(din_R_sub02),
	.din_q(din_Q_sub02),

	.dout_i(sout_R_sub02),
	.dout_q(sout_Q_sub02)
	);

	mux_32_to_16 #(
	.DATA_WIDTH(13)
	) SHIFT_MUX02(
	.mux_sel(w_mux_sel02),

	.din_R_add00(din_R_add02),
	.din_Q_add00(din_Q_add02),
	.din_R_sub00(sout_R_sub02),
	.din_Q_sub00(sout_Q_sub02),
	
	.din_R_01(mux_out_R02),
	.din_Q_01(mux_out_Q02)
	);

	shift_reg #(
	.DATA_WIDTH(13),
	.NUM_IN_OUT(16),
	.REG_DEPTH(4)// Store 64 values
	) SHFIT02_MEM_64(
	.clk(clk),
	.rstn(rstn),
	.din_i(mux_out_R02),
	.din_q(mux_out_Q02),

	.dout_i(sout_R_02),
	.dout_q(sout_Q_02)
	);

	// bfly02_tmp 14bit <8.6>
	BF2I #(
    .WIDTH(13),
    .DEPTH(16)
	) U_BF2I_02(
    .clk(clk),
    .rst_n(rstn),
    .en(w_bf_en02),
    .din_R1(sout_R_02),
    .din_R2(mux_out_R02), 
    .din_Q1(sout_Q_02),
    .din_Q2(mux_out_Q02),

    .dout_R_add(bfly02_R_add),
    .dout_R_sub(bfly02_R_sub),
    .dout_Q_add(bfly02_Q_add), 
    .dout_Q_sub(bfly02_Q_sub) 
	);

	mul_fac8_2 #(
    .WIDTH      (14),                     // <8.6>
    .TWF_WIDTH  (9),                      // <2.7>
    .DOUT_WIDTH (23),  // <10.13>
    .DEPTH      (16),
    .ADDR_WIDTH (9),
    .OFFSET     (64)
	) MUL_FAC8_2_02(
    .clk(clk),
    .rst_n(rstn),
    .en(w_mul_en),
    .addr(w_addr),
    .din_R_add(bfly02_R_add),
    .din_Q_add(bfly02_Q_add),
    .din_R_sub(bfly02_R_sub),
    .din_Q_sub(bfly02_Q_sub),

    .dout_R_add(dout_R_add02),
    .dout_Q_add(dout_Q_add02),
    .dout_R_sub(dout_R_sub02),
    .dout_Q_sub(dout_Q_sub02)
	);
endmodule
