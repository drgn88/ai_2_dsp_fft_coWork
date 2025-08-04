// `timescale 1ns/1ps

// module full_512_mem_ctrl (
// 	input clk,
// 	input rstn,
// 	input cbfp2_pop,

// 	output logic full_512
// );

// 	logic [4:0] cnt;

// 	always_ff @( posedge clk or negedge rstn ) begin : full_signal_make
// 		if(!rstn) begin
// 			cnt <= 0;
// 			full_512 <= 0;
// 		end
// 		else if(cbfp2_pop) begin
// 			cnt <= cnt + 1;
// 		end
// 		if(cnt == 16) begin
// 			full_512 <= 1;
// 			cnt <= 0;
// 		end
// 		else begin
// 			full_512 <= 0;
// 		end
// 	end
	
// endmodule

`timescale 1ns/1ps

module full_512_mem_ctrl (
	input clk,
	input rstn,
	input cbfp2_pop,

	output logic full_512
);

	logic [4:0] cnt;

	always_ff @( posedge clk or negedge rstn ) begin : full_signal_make
		if(!rstn) begin
			cnt <= 0;
			full_512 <= 0;
		end
		else if(cbfp2_pop) begin
			cnt <= cnt + 1;
		end
		else if(cnt == 16) begin
			full_512 <= 1;
			cnt <= 0;
		end
		else begin
			full_512 <= 0;
		end
	end
	
endmodule