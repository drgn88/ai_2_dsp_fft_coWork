`timescale 1ns/1ps

module cu_mod0_2 (
	input clk,
	input rstn,
	input alert_mod02,

	output logic bf_en02,
	output logic mux_sel02,
	output logic [8:0] addr,
	output logic mul_en,
	output logic alert_CBFP
);
	
	//logic w_cnt_ctrl;

	cnt_3b_fsm U_CNT_3B_FSM(
	.clk(clk),
	.rstn(rstn),
	.alert_mod02(alert_mod02),

	.cnt_ctrl(bf_en02)
	);

	mux_sel_ctrl_02 U_MUX_SEL02_CTRL(
	.clk(clk),
	.rstn(rstn),
	.alert_mod02(alert_mod02),

	.mux_sel(mux_sel02)
	);

	mul_twf_ctrl #(
	.OFFSET(128),
	.GROUP_SIZE(4),
	.ADDRESS_WIDTH(9),
	.DATA_NUM(16)
	) MUL_TWF_CTRL_02(
	.clk(clk),
	.rstn(rstn),
	.bf_en(bf_en02),

	.addr(addr),
	.mul_en(mul_en),
	.alert_CBFP(alert_CBFP)
	);

endmodule