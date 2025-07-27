`timescale 1ns/1ps

module min_fin_ctrl_cbfp0 (
	input clk,
	input rstn,
	input min_4s_en,

	output logic min_fin_en
);

	localparam IDLE = 0;
	localparam WAIT = 1;

	logic state, next_state;
	logic [1:0] cnt_reg, cnt_next;
	logic [3:0] tick_cnt_reg, tick_cnt_next;
	logic min_fin_reg, min_fin_next;

	//Output Logic
	assign min_fin_en = min_fin_reg;

	//State Register
	always_ff @( posedge clk or negedge rstn ) begin : state_register
		if(!rstn) begin
			state <= IDLE;
			cnt_reg <= 0;
			min_fin_reg <= 0;
			tick_cnt_reg <= 0;
		end
		else begin
			state <= next_state;
			cnt_reg <= cnt_next;
			min_fin_reg <= min_fin_next;
			tick_cnt_reg <= tick_cnt_next;
		end
	end

	//Next State Logic
	always_comb begin : Next_state_logic
		next_state = state;
		cnt_next = cnt_reg;
		min_fin_next = min_fin_reg;
		tick_cnt_next = tick_cnt_reg;
		case (state)
			IDLE : begin
				if(min_4s_en) begin
					next_state = WAIT;
					cnt_next = 0;
				end
			end 
			WAIT : begin
				cnt_next = cnt_reg + 1;
				min_fin_next = 0;
				if(cnt_reg == 3) begin
					if(tick_cnt_reg == 8) begin
						next_state = IDLE;
						tick_cnt_next = 0;
					end
					else begin
						min_fin_next = 1;
						tick_cnt_next = tick_cnt_reg + 1;
					end
				end
			end
		endcase
	end
	
endmodule