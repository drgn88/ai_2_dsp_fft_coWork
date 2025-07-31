`timescale 1ns/1ps

module BF2I_2bundle #(
	parameter WIDTH = 13,
	parameter DEPTH = 2
)(
	input clk,
	input rstn,
	input en,

	input signed [WIDTH-1:0] din_R_1[DEPTH-1:0],
	input signed [WIDTH-1:0] din_R_2[DEPTH-1:0],

    input signed [WIDTH-1:0] din_Q_1[DEPTH-1:0],
	input signed [WIDTH-1:0] din_Q_2[DEPTH-1:0],

	output logic signed [WIDTH:0] dout_R_add [DEPTH-1:0],
	output logic signed [WIDTH:0] dout_R_sub [DEPTH-1:0],

	output logic signed [WIDTH:0] dout_Q_add [DEPTH-1:0],
	output logic signed [WIDTH:0] dout_Q_sub [DEPTH-1:0]
);
	
	integer i;

	always_ff @( posedge clk or negedge rstn ) begin : BF2I_8Bundle
		if(!rstn) begin
			for(i = 0; i < DEPTH; i = i + 1) begin
				dout_R_add[i] <= 0;
				dout_R_sub[i] <= 0;

				dout_Q_add[i] <= 0;
				dout_Q_sub[i] <= 0;
			end
		end
		else if(en) begin
			for(i = 0; i < DEPTH; i = i + 1) begin
				dout_R_add[i] <= din_R_1[i] + din_R_2[i];
				dout_R_sub[i] <= din_R_1[i] - din_R_2[i];

				dout_Q_add[i] <= din_Q_1[i] + din_Q_2[i];
				dout_Q_sub[i] <= din_Q_1[i] - din_Q_2[i];
			end
		end
	end
endmodule