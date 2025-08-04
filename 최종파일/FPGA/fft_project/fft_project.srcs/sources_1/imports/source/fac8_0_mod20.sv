`timescale 1ns/1ps

module fac8_0_mod20 (
	// input signed [12:0] bf_in_R_add [1:0],
	input signed [12:0] bf_in_R_sub [1:0],

	// input signed [12:0] bf_in_Q_add [1:0],
	input signed [12:0] bf_in_Q_sub [1:0],

	// output logic signed [12:0] reverse_R_add [1:0],
	output logic signed [12:0] reverse_R_sub [1:0],

	// output logic signed [12:0] reverse_Q_add [1:0],
	output logic signed [12:0] reverse_Q_sub [1:0]
);
	
	genvar i;
	
	generate
		for(i=0; i < 2; i = i + 1) begin : Invert_REAL_IMAG
			// Change Real & Imaginary(sub)
			assign reverse_R_sub[i] = bf_in_Q_sub[i];
			assign reverse_Q_sub[i] = -(bf_in_R_sub[i]);
		end
	endgenerate

endmodule