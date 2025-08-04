`timescale 1ns/1ps

module ctrl_mod1_fac8_1 (
	input clk,
	input rstn,
	input en,

	output logic en_fac8_1,
	output logic mul_val_sel,
	output logic alert_mod11
);
	
	localparam IDLE = 0;
	localparam MUL_1234 = 1;
	localparam MUL_5678 = 2;


	logic [1:0] state, next_state;
	logic [1:0] cnt_reg, cnt_reg_next;
	logic sel_reg, sel_next;
	//logic en_mul_reg, en_mul_next;
	logic alert_reg, alert_next;

	// Output logic
	assign en_fac8_1 = alert_reg;
	assign mul_val_sel = sel_reg;
	assign alert_mod11 = alert_reg;

	always_ff @( posedge clk or negedge rstn ) begin : state_register
		if(!rstn) begin
			state <=  IDLE;
			cnt_reg <= 0;
			sel_reg <= 0;
			//en_mul_reg <= 0;
			alert_reg <= 0;
		end
		else begin
			state <= next_state;
			cnt_reg <= cnt_reg_next;
			sel_reg <= sel_next;
			//en_mul_reg <= en_mul_next;
			alert_reg <= alert_next;
		end 
	end

	always_comb begin : next_state_logic
		next_state = state;
		cnt_reg_next = cnt_reg;
		sel_next = sel_reg;
		//en_mul_next = en_mul_reg;
		alert_next = alert_reg;

		case (state)
			IDLE: begin
				alert_next = 0;
				if(en) begin
				alert_next = 1;
				sel_next = 0;
				next_state = MUL_1234;
				cnt_reg_next = 0;
			end
			end
			MUL_1234 : begin
				cnt_reg_next = cnt_reg;
				alert_next = 0;
				if(en) begin
				alert_next = 1;
				sel_next = 1;
				next_state = MUL_5678;
				end
				else if(cnt_reg == 2) begin
				sel_next = 0;
				next_state = IDLE;
				end
			end
			MUL_5678 : begin
				alert_next = 0;
				if(en) begin
				alert_next = 1;
				sel_next = 0;
				next_state = MUL_1234;
			end
			end
		endcase
	end
	
	
endmodule