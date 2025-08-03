`timescale 1ns/1ps

module index_sum #(
	parameter FACTOR_WIDTH = 5,
    parameter DATA_OUT = 32
)(
	input clk,
	input rstn,
	input alert_cbfp2,

	input [FACTOR_WIDTH-1:0] sc_fac_cbfp0[DATA_OUT-1:0],
	input [FACTOR_WIDTH-1:0] sc_fac_cbfp1[DATA_OUT-1:0],

	output logic [FACTOR_WIDTH:0] final_sc_fac [DATA_OUT-1:0]
);

	logic sum_en;

	always_ff @( posedge clk or negedge rstn ) begin : enable_make
		if(!rstn) begin
			sum_en <= 0;
		end
		else begin
			sum_en <= alert_cbfp2; 
		end
	end

	integer i;

	always_comb begin : INDEX_SUM
		if(sum_en) begin
			for(i = 0; i < DATA_OUT; i = i + 1) begin
				final_sc_fac[i] = sc_fac_cbfp0[i] + sc_fac_cbfp1[i];
			end
		end
		else begin
			for(i = 0; i < DATA_OUT; i = i + 1) begin
				final_sc_fac[i] = 0;		//IDLE
			end
		end
	end
	
endmodule