`timescale 1ns/1ps

module cu_mod1_1 (
	input clk,
	input rstn,
	input alert_mod10,

	output logic cnt_ctrl,
	output logic mux_sel,
	output logic en_fac8_1,
	output logic mul_val_sel,
	output logic alert_mod11
);
	
	cnt_1b_fsm U_CNT_1B(
	.clk(clk),
	.rstn(rstn),
	.alert_mod10(alert_mod10),

	.cnt_ctrl(cnt_ctrl),
	.mux_sel(mux_sel)
	);

	ctrl_mod1_fac8_1 U_FAC8_1_MOD1_CTRL(
	.clk(clk),
	.rstn(rstn),
	.en(cnt_ctrl),

	.en_fac8_1(en_fac8_1),
	.mul_val_sel(mul_val_sel),
	.alert_mod11(alert_mod11)
	);
	
endmodule