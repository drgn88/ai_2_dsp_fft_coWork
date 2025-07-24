`timescale 1ns/1ps

module shift_reg #(
	DATA_WIDTH = 9,
	NUM_IN_OUT = 16,
	REG_DEPTH = 16
) (
	input clk,
	input rstn,
	input logic signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1],
	input logic signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1],

	output logic signed [DATA_WIDTH - 1:0] dout_i [0:NUM_IN_OUT-1],
	output logic signed [DATA_WIDTH - 1:0] dout_q [0:NUM_IN_OUT-1]
);

	integer i, j, k;

	logic [DATA_WIDTH-1:0] shift_reg_i [0:NUM_IN_OUT-1][0:REG_DEPTH-1];
	logic [DATA_WIDTH-1:0] shift_reg_q [0:NUM_IN_OUT-1][0:REG_DEPTH-1];

	always_ff @( posedge clk or negedge rstn ) begin : shift_operate
		if(!rstn) begin
			for(i = 0; i < NUM_IN_OUT; i = i+1 )begin
				for (j = 0; j < REG_DEPTH; j = j+1) begin	
				shift_reg_i[i][j] <= 0;
				shift_reg_q[i][j] <= 0;
				end
			end

			// for(k = 0; k < NUM_IN_OUT; k = k+1 )begin
			// 	dout_i[k] <= 0;
			// 	dout_q[k] <= 0;
			// end
		end
		else begin
			for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
				for (j = 0; j < REG_DEPTH - 1; j = j + 1) begin
					shift_reg_i[i][j+1] <= shift_reg_i[i][j];
					shift_reg_q[i][j+1] <= shift_reg_q[i][j];
				end
			end
			
			for (k = 0; k < NUM_IN_OUT; k = k+1) begin
				shift_reg_i[k][0] <= din_i[k];
				shift_reg_q[k][0] <= din_q[k];
			end

	// 		for (l=0; l < NUM_IN_OUT; l = l+1) begin
	// 			dout_i[l] <= shift_reg_i[l][REG_DEPTH-1];
	// 			dout_q[l] <= shift_reg_q[l][REG_DEPTH-1];
	// 		end	
	end	
	end

	genvar l;

	generate
		for (l=0; l < NUM_IN_OUT; l = l+1) begin : assign_shift_reg_out
			assign dout_i[l] = shift_reg_i[l][REG_DEPTH-1];
			assign dout_q[l] = shift_reg_q[l][REG_DEPTH-1];
		end
	endgenerate
	
endmodule