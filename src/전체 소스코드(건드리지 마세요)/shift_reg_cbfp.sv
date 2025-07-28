`timescale 1ns/1ps

module shift_reg_cbfp #(
	DATA_WIDTH = 5,
	REG_DEPTH = 4
) (
	input clk,
	input rstn,
	input logic [DATA_WIDTH - 1:0] din_i,
	input logic [DATA_WIDTH - 1:0] din_q,

	output logic [DATA_WIDTH - 1:0] dout_i [0:REG_DEPTH-1],
	output logic [DATA_WIDTH - 1:0] dout_q [0:REG_DEPTH-1]
);

	integer j;

	logic [DATA_WIDTH-1:0] shift_reg_i [0:REG_DEPTH-1];
	logic [DATA_WIDTH-1:0] shift_reg_q [0:REG_DEPTH-1];

	always_ff @( posedge clk or negedge rstn ) begin : shift_operate
		if(!rstn) begin
			for (j = 0; j < REG_DEPTH; j = j+1) begin
			shift_reg_i[j] <= 0;
			shift_reg_q[j] <= 0;
			end
		end
		else begin
			for (j = 0; j < REG_DEPTH - 1; j = j + 1) begin
			shift_reg_i[j+1] <= shift_reg_i[j];
			shift_reg_q[j+1] <= shift_reg_q[j];
			end

		shift_reg_i[0] <= din_i;
		shift_reg_q[0] <= din_q;
		end
	end

	genvar l;

	generate
		for (l=0; l < REG_DEPTH; l = l+1) begin : assign_shift_reg_out
			assign dout_i[l] = shift_reg_i[l];
			assign dout_q[l] = shift_reg_q[l];
		end
	endgenerate

endmodule