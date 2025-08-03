`timescale 1ns/1ps

module cnt_4b_fsm (
	input clk,
	input rstn,
	input alert_mod01,
	
	output logic cnt_ctrl
);

	logic [3:0] cnt_reg, cnt_reg_next;
	//logic [1:0] cnt_2_flag;

	assign cnt_ctrl = cnt_reg[3];
	
	// always_ff @( posedge clk or negedge rstn ) begin : make_ctrl_signal
	// 	if(!rstn) begin
	// 		cnt <= 0;
	// 		cnt_2_flag <= 0;
	// 	end
	// 	else if(alert_mod01) begin
	// 		cnt <= cnt + 1;
	// 		cnt_2_flag <= 1;
	// 	end
	// 	else if(cnt_2_flag) begin
	// 		cnt <= cnt + 1;
	// 		if(cnt == 15) begin
	// 			cnt_2_flag <= cnt_2_flag + 1;
	// 		end
	// 	end
	// end

	localparam IDLE = 0;
	localparam CNT_1CYCLE = 1;
	localparam CNT_2CYCLE = 2;

	logic [1:0] state, next_state;

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
				if(alert_mod01) begin
					next_state = CNT_1CYCLE;
				end
			end 
			CNT_1CYCLE : begin
				cnt_reg_next = cnt_reg + 1;
				if(cnt_reg_next == 15) begin
					next_state = CNT_2CYCLE;
				end
			end
			CNT_2CYCLE : begin
				cnt_reg_next = cnt_reg + 1;
				if(cnt_reg_next == 15) begin
					next_state = IDLE;
				end
			end
		endcase
	end

endmodule