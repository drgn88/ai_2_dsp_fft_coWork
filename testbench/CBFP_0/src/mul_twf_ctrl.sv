`timescale 1ns/1ps

module mul_twf_ctrl #(
	parameter  OFFSET = 128,
	parameter  GROUP_SIZE = 4,
	parameter ADDRESS_WIDTH = 9,
	parameter DATA_NUM = 16
)(
	input clk,
	input rstn,
	input bf_en,

	output logic [ADDRESS_WIDTH-1:0] addr,
	output logic mul_en,
	output logic alert_CBFP
);
	
	localparam IDLE = 0;
	localparam OUT_CTRL_SIGNAL = 1;

	logic state, next_state;
	logic [$clog2(GROUP_SIZE) - 1:0] cnt_reg, cnt_next;
	logic [ADDRESS_WIDTH-1:0] addr_reg, addr_next;

	logic mul_en_reg, mul_en_next;
	logic alert_reg, alert_next;

	logic [8:0] n_step_reg, n_step_next;

	//Output logic
	assign addr = addr_reg;
	assign mul_en = mul_en_reg;
	assign alert_CBFP = alert_reg;

	always_ff @( posedge clk or negedge rstn ) begin : state_register
		if(!rstn) begin
			state <= IDLE;
			cnt_reg <= 0;
			addr_reg <= 0;
			mul_en_reg <= 0;
			alert_reg <= 0;
			n_step_reg <= 0;
		end		
		else begin
			state <= next_state;
			cnt_reg <= cnt_next;
			addr_reg <= addr_next;
			mul_en_reg <= mul_en_next;
			alert_reg <= alert_next;
			n_step_reg <= n_step_next;
		end
	end

	always_comb begin : next_state_logic
		next_state = state;
		cnt_next = cnt_reg;
		addr_next = addr_reg;
		mul_en_next = mul_en_reg;
		alert_next = alert_reg;
		n_step_next = n_step_reg;
		case (state)
			IDLE : begin
				if(bf_en) begin
					next_state = OUT_CTRL_SIGNAL;
					alert_next = 1;
					mul_en_next = 1;
				end
			end 
			OUT_CTRL_SIGNAL : begin
				alert_next = 0;
				addr_next = addr_reg + DATA_NUM;
				cnt_next = cnt_reg + 1;
				if(cnt_reg == (GROUP_SIZE - 1)) begin
					next_state = IDLE;
					addr_next = n_step_reg + OFFSET;
					n_step_next = n_step_reg + OFFSET;
					mul_en_next = 0;
				end
			end
		endcase
	end
	

endmodule