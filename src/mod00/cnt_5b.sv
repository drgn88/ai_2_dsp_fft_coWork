`timescale 1ns/1ps

module cnt_5b (
	input clk,
	input rstn,
	
	output logic [4:0] cnt_ctrl
);
	
	always_ff @( posedge clk or negedge rstn ) begin : make_ctrl_signal
		if(!rstn) begin
			cnt_ctrl <= 0;
		end
		else begin
			cnt_ctrl <= cnt_ctrl + 1;
		end
	end

endmodule