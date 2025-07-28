`timescale 1ns/1ps

module min_detect_4in #(
	parameter LZC_WIDTH  = 5
)(
	input clk,
	input rstn,
	input en,
	input [LZC_WIDTH-1:0] din_RE[0:3],
	input [LZC_WIDTH-1:0] din_IM[0:3],

	output logic [LZC_WIDTH-1:0] scaling_fac
);

	//1st Stage
	logic [LZC_WIDTH - 1: 0] re_1st_out [0:1];
	logic [LZC_WIDTH - 1: 0] im_1st_out [0:1];


	//Real
	min_2in #(.LZC_WIDTH(5))
	RE_1st_0(
	.min_in1(din_RE[0]),
	.min_in2(din_RE[1]),

	.min_out(re_1st_out[0])
	);

	min_2in #(.LZC_WIDTH(5))
	RE_1st_1(
	.min_in1(din_RE[2]),
	.min_in2(din_RE[3]),

	.min_out(re_1st_out[1])
	);

	//Imag
	min_2in #(.LZC_WIDTH(5))
	IM_1st_0(
	.min_in1(din_IM[0]),
	.min_in2(din_IM[1]),

	.min_out(im_1st_out[0])
	);

	min_2in #(.LZC_WIDTH(5))
	IM_1st_1(
	.min_in1(din_IM[2]),
	.min_in2(din_IM[3]),

	.min_out(im_1st_out[1])
	);

	//2nd Stage
	logic [LZC_WIDTH - 1: 0] re_2nd_out;
	logic [LZC_WIDTH - 1: 0] im_2nd_out;

	min_2in #(.LZC_WIDTH(5))
	RE_2nd(
	.min_in1(re_1st_out[0]),
	.min_in2(re_1st_out[1]),

	.min_out(re_2nd_out)
	);

	min_2in #(.LZC_WIDTH(5))
	IM_2nd(
	.min_in1(im_1st_out[0]),
	.min_in2(im_1st_out[1]),

	.min_out(im_2nd_out)
	);

	//3rd Stage
	logic [LZC_WIDTH - 1:0] scaling_fac_reg; 

	min_2in #(.LZC_WIDTH(5))
	scale_pipe_in(
	.min_in1(re_2nd_out),
	.min_in2(im_2nd_out),

	.min_out(scaling_fac_reg)
	);

	//Pipe Reg
	always_ff @( posedge clk or negedge rstn ) begin : scale_pipe_out
		if(!rstn) begin
			scaling_fac <= 0;
		end
		else if(en) begin
			scaling_fac <= scaling_fac_reg;
		end
	end

	
endmodule