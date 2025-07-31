`timescale 1ns/1ps

module addr_gen (
	input clk,
	input rstn,
	input en,

	output logic [8:0] addr
);

	logic initial_flag;

	always_ff @( posedge clk or negedge rstn ) begin : addr_register
		if(!rstn) begin
			addr <= 0;
			initial_flag <= 0;
		end
		else if(en)begin
			if(!initial_flag) begin
				initial_flag <= 1;
				addr <= 0;
			end
			else begin
				addr <= addr + 9'd32;
			end
		end
		else if(addr == 9'd480) begin
			addr <= 0;
			initial_flag <= 0;
		end
	end
	
endmodule