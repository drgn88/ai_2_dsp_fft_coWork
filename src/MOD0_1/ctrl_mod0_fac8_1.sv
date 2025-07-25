`timescale 1ns/1ps

module ctrl_mod0_fac8_1(
	input clk,
	input rstn,
	input en,

	output logic en_fac8_1,
	output logic [1:0] mul_val_sel,
	output logic alert_mod02
);

	localparam IDLE = 0;
	localparam MUL_13 = 1;
	localparam MUL_24 = 2;
	localparam WAIT = 3;
	localparam MUL_57 = 4;
	localparam MUL_68 = 5;

	logic [2:0] state, next_state;
	logic [1:0] cnt_reg, cnt_reg_next;
	logic [1:0] sel_reg, sel_next;
	logic en_mul_reg, en_mul_next;
	logic alert_reg, alert_next;

	// Output logic
	assign en_fac8_1 = en_mul_reg;
	assign mul_val_sel = sel_reg;
	assign alert_mod02 = alert_reg;

	always_ff @( posedge clk or negedge rstn ) begin : state_register
		if(!rstn) begin
			state <=  IDLE;
			cnt_reg <= 0;
			sel_reg <= 0;
			en_mul_reg <= 0;
			alert_reg <= 0;
		end
		else begin
			state <= next_state;
			cnt_reg <= cnt_reg_next;
			sel_reg <= sel_next;
			en_mul_reg <= en_mul_next;
			alert_reg <= alert_next;
		end 
	end

	always_comb begin : next_state_logic
		next_state = state;
		cnt_reg_next = cnt_reg;
		sel_next = sel_reg;
		en_mul_next = en_mul_reg;
		alert_next = alert_reg;

		case (state)
			IDLE : begin
				alert_next = 0;
				if(en) begin
					next_state = MUL_13;
					en_mul_next = 1;
					sel_next = 0;
				end
			end 
			MUL_13 : begin
				cnt_reg_next = cnt_reg + 1;
				if(cnt_reg == 3) begin
					next_state = MUL_24;
					sel_next = 1;
				end
			end
			MUL_24 : begin
				cnt_reg_next = cnt_reg + 1;
				if(cnt_reg == 3) begin
					next_state = WAIT;
					en_mul_next = 0;
				end
			end
			WAIT : begin
				if(en) begin
					next_state = MUL_57;
					en_mul_next = 1;
					sel_next = 2;
				end
			end
			MUL_57 : begin
				cnt_reg_next = cnt_reg + 1;
				if(cnt_reg == 3) begin
					next_state = MUL_68;
					sel_next = 3;
				end
			end
			MUL_68 : begin
				cnt_reg_next = cnt_reg + 1;
				if(cnt_reg == 3) begin
					next_state = IDLE;
					en_mul_next = 0;
					alert_next = 1;
				end
			end
		endcase
	end
	
	
endmodule


