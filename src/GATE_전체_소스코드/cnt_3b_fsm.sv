`timescale 1ns/1ps

module cnt_3b_fsm (
	input clk,
	input rstn,
	input alert_mod02,

	output logic cnt_ctrl
);

	localparam IDLE = 0;
	localparam CNT_1CYCLE = 1;
	localparam CNT_2CYCLE = 2;

	logic [1:0] state, next_state;
	logic [2:0] cnt_reg, cnt_reg_next;

	assign cnt_ctrl = cnt_reg[2];

	always_ff @( posedge clk or negedge rstn ) begin : state_register
		if(!rstn) begin
			state <= IDLE;
			cnt_reg <= 0;
		end
		else begin
			state <= next_state;
			cnt_reg <= cnt_reg_next;
		end
	end

	always_comb begin : next_state_logic
	next_state = state;
	cnt_reg_next = cnt_reg;
		case (state)
			IDLE : begin
				cnt_reg_next = 0;	
				if(alert_mod02) begin
					next_state = CNT_1CYCLE;
				end
			end 
			CNT_1CYCLE : begin
				cnt_reg_next = cnt_reg + 1;
				if(cnt_reg_next == 7) begin
					next_state = CNT_2CYCLE;
				end
			end
			CNT_2CYCLE : begin
				cnt_reg_next = cnt_reg + 1;
				if(cnt_reg_next == 7) begin
					next_state = IDLE;
				end
			end
		endcase
	end

	
endmodule