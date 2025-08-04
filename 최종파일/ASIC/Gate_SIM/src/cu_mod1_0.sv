`timescale 1ns/1ps

module cu_mod1_0 (
	input clk,
	input rstn,
	input valid,

	output logic bf_en,
	output logic valid_fac8_0,
	output logic alert_mod10
);

	logic [1:0] w_cnt_ctrl;

	assign bf_en = w_cnt_ctrl[1];

	cnt_2b U_CNT_2B(
	.clk(clk),
	.rstn(rstn | valid),
	.valid(valid),
	
	.cnt_ctrl(w_cnt_ctrl)
	);
	
	// bf2i_ctrl U_BF_CTRL(
	// .clk(clk),
	// .rstn(rstn),
	// .cnt_en(w_cnt_ctrl[1]),

	// .bf_en(bf_en)
	// );

	ctrl_mod1_fac8_0 U_CTRL10_FAC8_0(
	.clk(clk),
	.rstn(rstn),
	.bf_en(w_cnt_ctrl[1]),

	.valid_fac8_0(valid_fac8_0),
	.alert_mod10(alert_mod10)
	);

endmodule