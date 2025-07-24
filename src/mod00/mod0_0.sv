`timescale 1ns/1ps

module mod0_0 #(
	DATA_WIDTH = 9,
	NUM_IN_OUT = 16
)(
	input clk,
	input rstn,
	input logic signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1],
	input logic signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1],

	output logic signed [DATA_WIDTH:0] dout_R_add_00 [0:NUM_IN_OUT-1],
	output logic signed [DATA_WIDTH:0] dout_R_sub_00 [0:NUM_IN_OUT-1],
	output logic signed [DATA_WIDTH:0] dout_Q_add_00 [0:NUM_IN_OUT-1],
	output logic signed [DATA_WIDTH:0] dout_Q_sub_00 [0:NUM_IN_OUT-1]
);

	logic w_bf_en;
	logic w_valid_fac8_0;

	logic signed [DATA_WIDTH - 1:0] w_dout_i [0:NUM_IN_OUT-1];
	logic signed [DATA_WIDTH - 1:0] w_dout_q [0:NUM_IN_OUT-1];

	logic signed [9:0] w_dout_R_add [0:15];
	logic signed [9:0] w_dout_R_sub [0:15];
	logic signed [9:0] w_dout_Q_add [0:15];
	logic signed [9:0] w_dout_Q_sub [0:15];

	cu_mod0_0 U_CU_MOD00(
	.clk(clk),
	.rstn(rstn),
	
	.bf_en(w_bf_en),
	.valid_fac8_0(w_valid_fac8_0)
	);

	//256 shift register
	shift_reg #(
	.DATA_WIDTH(9),
	.NUM_IN_OUT(16),
	.REG_DEPTH(16)
	) U_SHIFT_REG_256(
	.clk(clk),
	.rstn(rstn),
	.din_i(din_i),
	.din_q(din_q),

	.dout_i(w_dout_i),
	.dout_q(w_dout_q)
	);


	BF2I #(
    .WIDTH(9),
    .DEPTH(16)
	) U_BF2I00(
    .clk(clk),
    .rst_n(rstn),
    .en(w_bf_en),
    .din_R1(w_dout_i),
    .din_R2(din_i), 
    .din_Q1(w_dout_q),
    .din_Q2(din_q),

    .dout_R_add(w_dout_R_add),
    .dout_R_sub(w_dout_R_sub),
    .dout_Q_add(w_dout_Q_add), 
    .dout_Q_sub(w_dout_Q_sub) 
	);
	
	mul_fac8_0 #(
    .WIDTH(10),
    .DEPTH(16)
	) U_FAC80_00(
    .clk(clk),
    .rst_n(rstn),
    .en(w_valid_fac8_0),
    .din_R_add(w_dout_R_add),
    .din_R_sub(w_dout_R_sub),
    .din_Q_add(w_dout_Q_add),
    .din_Q_sub(w_dout_Q_sub),

    .dout_R_add(dout_R_add_00),
    .dout_R_sub(dout_R_sub_00),
    .dout_Q_add(dout_Q_add_00),
    .dout_Q_sub(dout_Q_sub_00)
	);

endmodule