`timescale 1ns/1ps

module mag_ctrl_cbfp0 (
	input clk,
	input rstn,
	input alert_cbfp,

	output logic mag_en
);
	
	localparam IDLE = 0;
	localparam MAG_EN = 1;

	logic state, next_state;
	logic mag_en_reg, mag_next;
	logic [4:0] cnt_reg, cnt_next;

	//Output logic
	assign mag_en = mag_en_reg;

	always_ff @( posedge clk or negedge rstn ) begin : state_register
		if(!rstn) begin
			state <= IDLE;
			cnt_reg <= 0;
			mag_en_reg <= 0;
		end
		else begin
			state <= next_state;
			cnt_reg <= cnt_next;
			mag_en_reg <= mag_next;
		end
	end

	always_comb begin : NEXT_STATE_LOGIC
		next_state = state;
		cnt_next = cnt_reg;
		mag_next = mag_en_reg;
		case (state)
			IDLE : begin
				if(alert_cbfp) begin
					next_state = MAG_EN;
					cnt_next = 0;
					mag_next = 1;
				end
			end 
			MAG_EN : begin
				cnt_next = cnt_reg + 1;
				if(cnt_reg == 31) begin
					next_state = IDLE;
					mag_next = 0;
				end
			end
		endcase
	end

endmodule