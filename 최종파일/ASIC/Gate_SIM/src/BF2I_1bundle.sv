`timescale 1ns/1ps

module BF2I_1bundle #(
	parameter WIDTH = 16
)(
	input clk,
	input rstn,
	input en,

	input signed [WIDTH-1:0] din_R_1,
	input signed [WIDTH-1:0] din_R_2,

    input signed [WIDTH-1:0] din_Q_1,
	input signed [WIDTH-1:0] din_Q_2,

	output logic signed [WIDTH:0] dout_R_add,
	output logic signed [WIDTH:0] dout_R_sub,

	output logic signed [WIDTH:0] dout_Q_add,
	output logic signed [WIDTH:0] dout_Q_sub 
);

	always_ff @( posedge clk or negedge rstn ) begin : BF2I_1Bundle
		if(!rstn) begin
			dout_R_add <= 0;
			dout_R_sub <= 0;

			dout_Q_add <= 0;
			dout_Q_sub <= 0;
		end
		else if(en) begin
			dout_R_add <= din_R_1 + din_R_2;
			dout_R_sub <= din_R_1 - din_R_2;

			dout_Q_add <= din_Q_1 + din_Q_2;
			dout_Q_sub <= din_Q_1 - din_Q_2;
		end
		else begin
			dout_R_add <= 0;
			dout_R_sub <= {WIDTH+1{1'b1}};

			dout_Q_add <= 0;
			dout_Q_sub <= {WIDTH+1{1'b1}};
		end
	end
endmodule