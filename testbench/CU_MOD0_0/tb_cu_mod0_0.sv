`timescale 1ns/1ps

module tb_cu_mod0_0 (
	
);
	
	logic clk;
	logic rstn;

	logic [4:0] cnt_ctrl;
	logic valid_fac8_0;

	cu_mod0_0 DUT(
	.clk(clk),
	.rstn(rstn),
	
	. cnt_ctrl(cnt_ctrl),
	.valid_fac8_0(valid_fac8_0)
	);

	initial begin
		clk = 1'b0;
		forever begin
			#5 clk = ~clk;
		end
	end

	initial begin
		rstn = 1'b0;

		#10;

		rstn = 1'b1;

		#10000;

		$finish;
	end

endmodule