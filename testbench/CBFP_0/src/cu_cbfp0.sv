`timescale 1ns/1ps

module cu_cbfp0 (
	input clk,
	input rstn,
	input alert_cbfp,

	output logic mux_sel,
	output logic mag_en,
	output logic min_4s_en,
	output logic min_fin_en,
	output logic bit_shift_en,
	output logic valid_mod1
);
	mux_sel_cbfp0 U_MUX_SEL_CBFP0(
	.clk(clk),
	.rstn(rstn),
	.alert_cbfp(alert_cbfp),

	.mux_sel(mux_sel)
	);

	mag_ctrl_cbfp0 U_MAG_CTRL_0(
	.clk(clk),
	.rstn(rstn),
	.alert_cbfp(alert_cbfp),

	.mag_en(mag_en)
	);

	min_4s_ctrl_cbfp0 U_MIN_4S_CTRL(
	.clk(clk),
	.rstn(rstn),
	.mag_en(mag_en),

	.min_4s_en(min_4s_en)
	);

	min_fin_ctrl_cbfp0 U_MIN_FIN_CTRL(
	.clk(clk),
	.rstn(rstn),
	.min_4s_en(min_4s_en),

	.min_fin_en(min_fin_en)
	);

	bit_shift_ctrl U_BIT_SHIFT_CTRL(
	.clk(clk),
	.rstn(rstn),
	.min_fin_en(min_fin_en),

	.bit_shift_en(bit_shift_en),
	.valid_mod1(valid_mod1)
	);

endmodule