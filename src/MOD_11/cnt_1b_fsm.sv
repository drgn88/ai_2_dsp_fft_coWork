`timescale 1ns/1ps

module cnt_1b_fsm (
	input clk,
	input rstn,
	input alert_mod10,

	output cnt_ctrl,
	output mux_sel
);
	
	localparam IDLE = 0;
	localparam CNT = 1;

	logic state, next_state;
	logic [1:0] cnt_reg, cnt_next;
	logic sel_reg, sel_next;

	assign cnt_ctrl = cnt_reg[0];
	assign mux_sel = sel_reg;

	always_ff @( posedge clk or negedge rstn ) begin : State_Register
		if(!rstn) begin
			state <= IDLE;
			cnt_reg <= 0;
			sel_reg <= 0;
		end
		else begin
			state <= next_state;
			cnt_reg <= cnt_next;
			sel_reg <= sel_next;
		end
	end

	always_comb begin : Next_State_Logic
		next_state = state;
		cnt_next = cnt_reg;
		sel_next = sel_reg;
		case (state)
			IDLE : begin
				if(alert_mod10) begin
					next_state = CNT;
					cnt_next = 0;
				end
			end 
			CNT :  begin
				sel_next = 0;
				cnt_next = cnt_reg + 1;
				if(alert_mod10) begin
					next_state <= CNT;
				end
				else if(cnt_reg == 3) begin
					next_state = IDLE;
				end
				if(cnt_reg == 1 || cnt_reg == 2) begin
					sel_next = 1;
				end
			end
		endcase
	end
endmodule