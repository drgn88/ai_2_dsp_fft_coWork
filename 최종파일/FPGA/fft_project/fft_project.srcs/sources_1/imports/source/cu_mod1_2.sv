`timescale 1ns/1ps

module cu_mod1_2 (
	input clk,
	input rstn,
	input alert_mod11,

	output logic bf_en,
	output logic mul_en,
	output logic [8:0] addr,
	output logic alert_mod12
);

	always_ff @( posedge clk or negedge rstn ) begin : ctrl_signal_make
		if(!rstn) begin
			bf_en <= 0;
			mul_en <= 0;
			alert_mod12 <= 0;
		end
		else begin
			bf_en <= alert_mod11;
			mul_en <= bf_en;
			alert_mod12 <= bf_en;
		end
	end

	addr_gen U_ADDR_GEN(
	.clk(clk),
	.rstn(rstn),
	.en(bf_en),

	.addr(addr)
	);
	
endmodule