`timescale 1ns/1ps

module min_4s_ctrl_cbfp0 (
	input clk,
	input rstn,
	input mag_en,

	output logic min_4s_en
);

	localparam IDLE = 0;
	localparam MIN_4S_EN = 1;

	logic state, next_state;
	logic min_4s_reg, min_4s_next;
	logic [4:0] cnt_reg, cnt_next;

	//Output logic
	assign min_4s_en = min_4s_reg;

	always_ff @( posedge clk or negedge rstn ) begin : state_register
		if(!rstn) begin
			state <= IDLE;
			cnt_reg <= 0;
			min_4s_reg <= 0;
		end
		else begin
			state <= next_state;
			cnt_reg <= cnt_next;
			min_4s_reg <= min_4s_next;
		end
	end

	always_comb begin : NEXT_STATE_LOGIC
		next_state = state;
		cnt_next = cnt_reg;
		min_4s_next = min_4s_reg;
		case (state)
			IDLE : begin
				if(mag_en) begin
					next_state = MIN_4S_EN;
					cnt_next = 0;
					min_4s_next = 1;	
				end
			end 
			MIN_4S_EN : begin
				cnt_next = cnt_reg + 1;
				if(cnt_reg == 31) begin
					next_state = IDLE;
					min_4s_next = 0;
				end
			end
		endcase
	end
	
endmodule