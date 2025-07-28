module min_detect_16in #(
    parameter LZC_WIDTH  = 5	//msb 개수 비트폭
    //parameter NUM_DETECT = 16	// 데이터 스트림 --> 어차피 항상 16개씩 받으니 따로 parameter안씀
) (
	input clk,
	input rstn,
	input en,
    input logic [LZC_WIDTH-1:0] min_in[0:15],

    output logic [LZC_WIDTH-1:0] min_out
);

    // logic [LZC_WIDTH-1:0] min_val;
    // integer i;

    // always @(*) begin
    //     min_val = min_in[0];
    //     for (i = 1; i < NUM_DETECT; i = i + 1) begin
    //         if (min_in[i] < min_val) begin
    //             min_val = min_in[i];
    //         end
    //     end
    // end

    // assign min_out = min_val;

	// lst Stage: 비교기 8개

	genvar i;

	logic [4:0] out_min_1st [0:7];

	generate
		for(i = 0; i < 8; i = i + 1) begin : first_stage_compare
			min_2in #(.LZC_WIDTH(5))U_1st_stage(
				.min_in1(min_in[2*i]),
				.min_in2(min_in[(2*i)+1]),

				.min_out(out_min_1st[i])
			);
		end
	endgenerate

	// 2nd Stage: 비교기 4개

	genvar j;

	logic [4:0] out_min_2nd [0:3];

	generate
		for(j = 0; j < 4; j = j + 1) begin : second_stage_compare
			min_2in #(.LZC_WIDTH(5))U_2nd_stage(
				.min_in1(out_min_1st[2*j]),
				.min_in2(out_min_1st[(2*j)+1]),

				.min_out(out_min_2nd[j])
			);
		end
	endgenerate

	//Pipe Register
	integer k;

	logic [4:0] out_min_2nd_reg [0:3];

	always_ff @( posedge clk or negedge rstn ) begin : pipe_reg
		if(!rstn) begin
			for (k = 0;  k < 4; k = k+1) begin
				out_min_2nd_reg[k] <= 0;
			end
		end
		else if(en) begin
			for (k = 0;  k < 4; k = k+1) begin
				out_min_2nd_reg[k] <= out_min_2nd[k];
			end
		end
	end

	// 3rd stage: 비교기 2개

	logic [4:0] out_min_3rd [0:1];

	min_2in #(.LZC_WIDTH(5))
	U_3rd_stage_0(
	.min_in1(out_min_2nd_reg[0]),
	.min_in2(out_min_2nd_reg[1]),

	.min_out(out_min_3rd[0])
	);

	min_2in #(.LZC_WIDTH(5))
	U_3rd_stage_1(
	.min_in1(out_min_2nd_reg[2]),
	.min_in2(out_min_2nd_reg[3]),

	.min_out(out_min_3rd[1])
	);

	//4th stage: 비교기 1개
	logic [4:0] out_min_4th;

	min_2in #(.LZC_WIDTH(5))
	U_4th_stage(
	.min_in1(out_min_3rd[0]),
	.min_in2(out_min_3rd[1]),

	.min_out(out_min_4th)
	);

	assign min_out = out_min_4th;

endmodule

