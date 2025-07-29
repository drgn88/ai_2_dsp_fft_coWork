module min_8in_cbfp1 #(
    parameter LZC_WIDTH  = 5	//msb 개수 비트폭
) (
	input clk,
	input rstn,
	input en,

    input  logic [LZC_WIDTH-1:0] min_in[0:7],

    output logic [LZC_WIDTH-1:0] min_out
);

	// 1nd Stage: 비교기 4개
	genvar i;

	logic [LZC_WIDTH-1:0] out_min_1st [0:3];

	generate
		for(i = 0; i < 4; i = i + 1) begin : first_stage_compare
			min_2in #(.LZC_WIDTH(5))U_1st_stage(
				.min_in1(min_in[2*i]),
				.min_in2(min_in[(2*i)+1]),

				.min_out(out_min_1st[i])
			);
		end
	endgenerate

	// 2nd Stage: 비교기 2개
	genvar j;

	logic [LZC_WIDTH-1:0] out_min_2nd [0:1];

	generate
		for(j = 0; j < 2; j = j + 1) begin : second_stage_compare
			min_2in #(.LZC_WIDTH(5))U_2nd_stage(
				.min_in1(out_min_1st[2*j]),
				.min_in2(out_min_1st[(2*j)+1]),

				.min_out(out_min_2nd[j])
			);
		end
	endgenerate

	//Pipe Register
	integer k;

	logic [LZC_WIDTH-1:0] out_min_2nd_reg [0:1];

	always_ff @( posedge clk or negedge rstn ) begin : pipe_reg
		if(!rstn) begin
			for (k = 0;  k < 2; k = k+1) begin
				out_min_2nd_reg[k] <= 0;
			end
		end
		else if(en) begin
			for (k = 0;  k < 2; k = k+1) begin
				out_min_2nd_reg[k] <= out_min_2nd[k];
			end
		end
	end


	// 3rd stage: 비교기 1개
	logic [LZC_WIDTH-1:0] out_min_3rd;

	min_2in #(.LZC_WIDTH(5))
	U_3rd_stage(
	.min_in1(out_min_2nd_reg[0]),
	.min_in2(out_min_2nd_reg[1]),

	.min_out(out_min_3rd)
	);

	assign min_out = out_min_3rd;

endmodule

