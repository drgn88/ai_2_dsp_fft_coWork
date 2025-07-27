`timescale 1ns/1ps

module bit_shift_ctrl (
	input clk,
	input rstn,
	input min_fin_en,

	output logic bit_shift_en,	//32clk동안 high -> 이거 그대로 MOD1 valid로 나감
	output logic valid_mod1
);
	
	localparam IDLE = 0;
	localparam EN = 1;

	logic state, next_state;
	logic [4:0] cnt_reg, cnt_next;
	logic val_reg, val_next;

	assign bit_shift_en = val_reg;
	assign valid_mod1 = val_reg;
	
	always_ff @( posedge clk or negedge rstn ) begin : state_reg
		if(!rstn)begin
			state <= IDLE;
			cnt_reg <= 0;
			val_reg <= 0;
		end
		else begin
			state <= next_state;
			cnt_reg <= cnt_next;
			val_reg <= val_next;
		end
	end

	always_comb begin : next_state_logic
		next_state = state;
		cnt_next = cnt_reg;
		val_next = val_reg;
		case (state)
			IDLE : begin
				if(min_fin_en) begin
					next_state = EN;
					cnt_next = 0;
					val_next = 1;
				end
			end 
			EN : begin
				cnt_next = cnt_reg + 1;
				if(cnt_reg == 31) begin
					next_state = IDLE;
					val_next = 0;
				end
			end
		endcase
	end

endmodule