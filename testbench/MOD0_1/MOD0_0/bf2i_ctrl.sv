`timescale 1ns/1ps

module bf2i_ctrl (
	input clk,
	input rstn,
	input cnt_en,

	output logic bf_en
);

	always_ff @( posedge clk or negedge rstn ) begin : make_bf_ctrl
		if(!rstn) begin
			bf_en <= 0;
		end
		else if(cnt_en) begin
			bf_en <= 1;
		end
		else begin
			bf_en <= 0;
		end
	end
	
endmodule