`timescale 1ns/1ps

module cbfp0 (
	input clk,
	input rstn,
	input alert_cbfp,

	input signed [22:0] din_R_add_CBFP [0:15],
	input signed [22:0] din_Q_add_CBFP [0:15],
	input signed [22:0] din_R_sub_CBFP [0:15],
	input signed [22:0] din_Q_sub_CBFP [0:15],

	output logic signed [10:0] dout_R_CBFP [0:15],
	output logic signed [10:0] dout_Q_CBFP [0:15],
	output logic valid_mod1,

	output logic [4:0] cbfp0_scale_fac,
	output logic cbfp0_mem_push
);

	// Internal Control Signal
	logic w_mux_sel;
	logic w_mag_en;
	logic w_min_4s_en;
	logic w_min_fin_en;
	logic w_bit_shift_en;


	logic [4:0] w_scaling_fac;
///////////////////////////////////////////////////////////////////////////////////////
					//CBFP0_INDEX_STORE
///////////////////////////////////////////////////////////////////////////////////////
	always_ff @( posedge clk or negedge rstn ) begin : push_mem_cbfp0_make
		if(!rstn) begin
			cbfp0_mem_push <= 0;
		end
		else begin
			cbfp0_mem_push <= w_min_fin_en;
		end
	end

	assign cbfp0_scale_fac = w_scaling_fac;
	
	
	cu_cbfp0 U_CU_CBFP(
	.clk(clk),
	.rstn(rstn),
	.alert_cbfp(alert_cbfp),

	.mux_sel(w_mux_sel),
	.mag_en(w_mag_en),
	.min_4s_en(w_min_4s_en),
	.min_fin_en(w_min_fin_en),
	.bit_shift_en(w_bit_shift_en),
	.valid_mod1(valid_mod1)
	);

	logic signed [22:0] sout_R_sub [0:15];
	logic signed [22:0] sout_Q_sub [0:15];


	// Sub In Store
	shift_reg #(
	.DATA_WIDTH(23),
	.NUM_IN_OUT(16),
	.REG_DEPTH(4)
	) U_SUB_REG_64(
	.clk(clk),
	.rstn(rstn),
	.din_i(din_R_sub_CBFP),
	.din_q(din_Q_sub_CBFP),

	.dout_i(sout_R_sub),
	.dout_q(sout_Q_sub)
	);

	logic signed [22:0] mout_R_cbfp [0:15];
	logic signed [22:0] mout_Q_cbfp [0:15];

	mux_32_to_16 #(
	.DATA_WIDTH(23)
	) U_MUX_CBFP(
	.mux_sel(w_mux_sel),

	.din_R_add00(din_R_add_CBFP),
	.din_Q_add00(din_Q_add_CBFP),
	.din_R_sub00(sout_R_sub),
	.din_Q_sub00(sout_Q_sub),
	
	.din_R_01(mout_R_cbfp),
	.din_Q_01(mout_Q_cbfp)
	);

	// Store Reg until Scale out

	logic signed [22:0] scale_R_out [0:15];
	logic signed [22:0] scale_Q_out [0:15];

	shift_reg #(
	.DATA_WIDTH(23),
	.NUM_IN_OUT(16),
	.REG_DEPTH(7)
	) U_STR_REG_7CLK(
	.clk(clk),
	.rstn(rstn),
	.din_i(mout_R_cbfp),
	.din_q(mout_Q_cbfp),

	.dout_i(scale_R_out),
	.dout_q(scale_Q_out)
	);

	//MAG DETECT
	logic [4:0] mag_R_out [0:15];
	logic [4:0] mag_Q_out [0:15];

	mag_detect U_MAG_R_CBFP0(
	.clk(clk),
	.rstn(rstn),
	.en(w_mag_en),
    .mag_in(mout_R_cbfp),

    .mag_out(mag_R_out)
	);

	mag_detect U_MAG_Q_CBFP0(
	.clk(clk),
	.rstn(rstn),
	.en(w_mag_en),
    .mag_in(mout_Q_cbfp),

    .mag_out(mag_Q_out)
	);

	logic [4:0] min_R_cbfp;
	logic [4:0] min_Q_cbfp;

	min_detect_16in #(
    .LZC_WIDTH(5)	//msb 개수 비트폭
	) U_MIN_R_16IN(
	.clk(clk),
	.rstn(rstn),
	.en(w_min_4s_en),
    .min_in(mag_R_out),

    .min_out(min_R_cbfp)
	);

	min_detect_16in #(
    .LZC_WIDTH(5)	//msb 개수 비트폭
	) U_MIN_Q_16IN(
	.clk(clk),
	.rstn(rstn),
	.en(w_min_4s_en),
    .min_in(mag_Q_out),

    .min_out(min_Q_cbfp)
	);


	logic [4:0] min_out_R [0:3];
	logic [4:0] min_out_Q [0:3];

	shift_reg_cbfp #(
	.DATA_WIDTH(5),
	.REG_DEPTH(4)
	) U_STORE_4CLK(
	.clk(clk),
	.rstn(rstn),
	.din_i(min_R_cbfp),
	.din_q(min_Q_cbfp),

	.dout_i(min_out_R),
	.dout_q(min_out_Q)
	);

	

	min_detect_4in #(
	.LZC_WIDTH(5)
	) U_MIN_4IN(
	.clk(clk),
	.rstn(rstn),
	.en(w_min_fin_en),
	.din_RE(min_out_R),
	.din_IM(min_out_Q),

	.scaling_fac(w_scaling_fac)
	);
	
	top_bit_shift #(
    .INPUT_WIDTH(23),
    .OUTPUT_WIDTH(11),
    .BLOCK_SIZE(16),
    .SHIFT_WIDTH(5),
    .SHIFT_TARGET(12)
	) U_BIT_SHIFT(
    .clk(clk),
    .rstn(rstn),

    .en(w_bit_shift_en),
    .shift_value(w_scaling_fac),

    .input_data_re(scale_R_out),
    .input_data_im(scale_Q_out),

    .output_data_re(dout_R_CBFP),
    .output_data_im(dout_Q_CBFP)    
	);
	
endmodule