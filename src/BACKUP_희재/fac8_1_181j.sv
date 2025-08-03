`timescale 1ns/1ps

// 0.707-j0.707를 곱함
module fac8_1_181j (
	input signed [13:0] din_R,

	input signed [13:0] din_Q,

	output logic signed [15:0] dout_R,

	output logic signed [15:0] dout_Q 
);
	
	logic signed [23:0] mul_R;
	logic signed [23:0] mul_Q;

	assign mul_R = (181 * din_R) + (181 * din_Q);
	assign mul_Q = (181 * din_Q) - (181 * din_R);

	assign dout_R = ((mul_R + 128) >>> 8);
	assign dout_Q = ((mul_Q + 128) >>> 8);

endmodule