`timescale 1ns/1ps

module cu_mod0_1 (
	input clk,
	input rstn,
	input alert_mod01,

	output logic mux_sel,
	output logic bf_en01,
	output logic en_fac8_1,
	output logic [1:0] mul_val_sel,
	output logic alert_mod02
);
	
	logic w_cnt_ctrl;

	assign bf_en01 = w_cnt_ctrl;

	cnt_4b_fsm U_CNT_4B(
	.clk(clk),
	.rstn(rstn),
	.alert_mod01(alert_mod01),
	
	.cnt_ctrl(w_cnt_ctrl)
	);

	ctrl_mux_shift_reg U_MUX01_SEL_CTRL(
	.clk(clk),
	.rstn(rstn),
	.alert_mod01(alert_mod01),

	.mux_sel(mux_sel)
	);

	// bf2i_ctrl U_BF2I01_CTRL(
	// .clk(clk),
	// .rstn(rstn),
	// .cnt_en(w_cnt_ctrl),

	// .bf_en(bf_en01)
	// );

	ctrl_mod0_fac8_1 U_CTRL_01_FAC8_1(
	.clk(clk),
	.rstn(rstn),
	.en(w_cnt_ctrl),

	.en_fac8_1(en_fac8_1),
	.mul_val_sel(mul_val_sel),
	.alert_mod02(alert_mod02)
	);
	
endmodule