`timescale 1ns/1ps

module min_2in #(parameter LZC_WIDTH  = 5)(
	input [LZC_WIDTH-1:0] min_in1,
	input [LZC_WIDTH-1:0] min_in2,

	output logic [LZC_WIDTH-1:0] min_out
);
	
	assign min_out = (min_in1 >= min_in2) ? min_in2 : min_in1;

endmodule