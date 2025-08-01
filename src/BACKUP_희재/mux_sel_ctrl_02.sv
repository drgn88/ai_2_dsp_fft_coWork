`timescale 1ns/1ps

module mux_sel_ctrl_02 (
	input clk,
	input rstn,
	input alert_mod02,

	output logic mux_sel
);

	localparam IDLE = 0;
	localparam ADD_SEL = 1;
	localparam SUB_SEL = 2;

	logic [1:0] state, next_state;
	logic [3:0] cnt_reg, cnt_next;
	logic mux_sel_reg, mux_sel_next;

	//Output Logic
	assign mux_sel = mux_sel_reg;
	
	//State Register
	always_ff @( posedge clk or negedge rstn ) begin : State_Register
		if(!rstn) begin
			state <= IDLE;
			cnt_reg <= 0;
			mux_sel_reg <= 0;
		end
		else begin
			state <= next_state;
			cnt_reg <= cnt_next;
			mux_sel_reg <= mux_sel_next;
		end
	end

	//Next State Logic
	always_comb begin : NEXT_STATE_LOGIC
		next_state = state;
		cnt_next = cnt_reg;
		mux_sel_next = mux_sel_reg;
		case (state)
		IDLE : begin
			if(alert_mod02) begin
				next_state = ADD_SEL;
				mux_sel_next = 0;
			end
		end 
		ADD_SEL : begin
			cnt_next = cnt_reg + 1;
			if(cnt_reg == 7) begin
				next_state = SUB_SEL;
				mux_sel_next = 1;
			end
		end
		SUB_SEL : begin
			cnt_next = cnt_reg + 1;
			if(cnt_reg == 15) begin
				if(alert_mod02) begin	
					next_state = ADD_SEL;
					mux_sel_next = 0;
				end
				else begin
					next_state = IDLE;
					mux_sel_next = 0;
				end
			end
		end
		endcase
	end

endmodule