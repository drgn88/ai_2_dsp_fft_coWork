`timescale 1ns/1ps

module ctrl_mod1_fac8_0 (
	input clk,
	input rstn,
	input bf_en,

	output logic valid_fac8_0,
	output logic alert_mod10
);

	localparam IDLE = 0;
	localparam ALERT = 1;
	localparam EN = 2;

	logic [1:0] state, next_state;
	logic val_reg, val_next;
	logic alert_reg, alert_next;

	//Output Logic
	assign valid_fac8_0 = val_reg;
	assign alert_mod10 = alert_reg;

	//State Register
	always_ff @( posedge clk or negedge rstn ) begin : state_reg
		if(!rstn)begin
		state <= IDLE;
		val_reg <= 0;
		alert_reg <= 0;
		end
		else begin
			state <= next_state;
			val_reg <= val_next;
			alert_reg <= alert_next;
		end
	end
	
	//Next State Logic
	always_comb begin : Next_State_Logic
		next_state = state;
		val_next = val_reg;
		alert_next = alert_reg;
		case (state)
			IDLE : begin
				if(bf_en) begin
					next_state = ALERT;
					alert_next = 1;
				end
			end
			ALERT : begin
				next_state = EN;
				alert_next = 0;
				val_next = 1;
			end
			EN : begin
				next_state = IDLE;
				val_next = 0;
			end
		endcase
	end
	
endmodule


