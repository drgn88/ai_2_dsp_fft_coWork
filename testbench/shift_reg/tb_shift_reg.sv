`timescale 1ns/1ps

module tb_shift_reg;

	parameter DATA_WIDTH = 9;
	parameter NUM_IN_OUT = 3;     // 줄여서 테스트
	parameter REG_DEPTH = 5;

	logic clk;
	logic rstn;
	logic [DATA_WIDTH-1:0] din_i [0:NUM_IN_OUT-1];
	logic [DATA_WIDTH-1:0] din_q [0:NUM_IN_OUT-1];
	logic [DATA_WIDTH-1:0] dout_i [0:NUM_IN_OUT-1];
	logic [DATA_WIDTH-1:0] dout_q [0:NUM_IN_OUT-1];

	// Instantiate DUT
	shift_reg #(
		.DATA_WIDTH(DATA_WIDTH),
		.NUM_IN_OUT(NUM_IN_OUT),
		.REG_DEPTH(REG_DEPTH)
	) dut (
		.clk(clk),
		.rstn(rstn),
		.din_i(din_i),
		.din_q(din_q),
		.dout_i(dout_i),
		.dout_q(dout_q)
	);

	// Clock generation
	always #5 clk = ~clk;

	// Helper task to print outputs
	task print_outputs(input int cycle);
		$display("Cycle %0d: dout_i = %p, dout_q = %p", cycle, dout_i, dout_q);
	endtask

	initial begin
		integer cycle;
		clk = 0;
		rstn = 0;
		for (int i = 0; i < NUM_IN_OUT; i++) begin
			din_i[i] = 0;
			din_q[i] = 0;
		end

		#12;
		rstn = 1;

		// Apply different inputs each cycle
		for (cycle = 0; cycle < REG_DEPTH + 2; cycle++) begin
			for (int ch = 0; ch < NUM_IN_OUT; ch++) begin
				din_i[ch] = cycle + ch;
				din_q[ch] = (cycle + ch) << 1;
			end

			#10;
			print_outputs(cycle);
		end

		// Check delayed outputs match the expected inputs
		for (int ch = 0; ch < NUM_IN_OUT; ch++) begin
			assert(dout_i[ch] == REG_DEPTH - 1 + ch)
				else $error("Mismatch at dout_i[%0d]: expected %0d, got %0d", ch, REG_DEPTH - 1 + ch, dout_i[ch]);

			assert(dout_q[ch] == ((REG_DEPTH - 1 + ch) << 1))
				else $error("Mismatch at dout_q[%0d]: expected %0d, got %0d", ch, (REG_DEPTH - 1 + ch) << 1, dout_q[ch]);
		end

		$display("Test completed.");
		$finish;
	end

endmodule
