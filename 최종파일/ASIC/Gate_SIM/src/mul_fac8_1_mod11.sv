`timescale 1ns / 1ps

module mul_fac8_1_mod11 #(
    parameter WIDTH      = 13,                     // <5.6>
    parameter TWF_WIDTH  = 10,                     // <2.8>
    parameter MUL_WIDTH  = 23,      // <7.14>
    parameter DOUT_WIDTH = 15,  // <7.6>
    parameter DEPTH      = 8
) (
    input clk,
    input rst_n,
    input select,
    input en,
    input signed [WIDTH-1:0] din_R_add_1[DEPTH-1:0],
	input signed [WIDTH-1:0] din_R_add_2[DEPTH-1:0],
    input signed [WIDTH-1:0] din_R_sub_1[DEPTH-1:0],
	input signed [WIDTH-1:0] din_R_sub_2[DEPTH-1:0],

    input signed [WIDTH-1:0] din_Q_add_1[DEPTH-1:0],
	input signed [WIDTH-1:0] din_Q_add_2[DEPTH-1:0],
    input signed [WIDTH-1:0] din_Q_sub_1[DEPTH-1:0],
	input signed [WIDTH-1:0] din_Q_sub_2[DEPTH-1:0],

    output logic signed [DOUT_WIDTH-1:0] dout_R_add_1[DEPTH-1:0],
	output logic signed [DOUT_WIDTH-1:0] dout_R_add_2[DEPTH-1:0],
    output logic signed [DOUT_WIDTH-1:0] dout_R_sub_1[DEPTH-1:0],
	output logic signed [DOUT_WIDTH-1:0] dout_R_sub_2[DEPTH-1:0],

    output logic signed [DOUT_WIDTH-1:0] dout_Q_add_1[DEPTH-1:0],
	output logic signed [DOUT_WIDTH-1:0] dout_Q_add_2[DEPTH-1:0],
    output logic signed [DOUT_WIDTH-1:0] dout_Q_sub_1[DEPTH-1:0],
    output logic signed [DOUT_WIDTH-1:0] dout_Q_sub_2[DEPTH-1:0]
);

    // integer i;
    // logic signed [TWF_WIDTH-1:0] twf_R_add_1;
	// logic signed [TWF_WIDTH-1:0] twf_R_add_2;
    // logic signed [TWF_WIDTH-1:0] twf_R_sub_1; 
    // logic signed [TWF_WIDTH-1:0] twf_R_sub_2; 

    // logic signed [TWF_WIDTH-1:0] twf_Q_add_1;      
    // logic signed [TWF_WIDTH-1:0] twf_Q_add_2;      
    // logic signed [TWF_WIDTH-1:0] twf_Q_sub_1;
    // logic signed [TWF_WIDTH-1:0] twf_Q_sub_2;
    
    // logic signed [MUL_WIDTH-1:0] mul_R_add_1[DEPTH-1:0];
	// logic signed [MUL_WIDTH-1:0] mul_R_add_2[DEPTH-1:0];
    // logic signed [MUL_WIDTH-1:0] mul_R_sub_1[DEPTH-1:0];
    // logic signed [MUL_WIDTH-1:0] mul_R_sub_2[DEPTH-1:0];

    // logic signed [MUL_WIDTH-1:0] mul_Q_add_1[DEPTH-1:0];
    // logic signed [MUL_WIDTH-1:0] mul_Q_add_2[DEPTH-1:0];
    // logic signed [MUL_WIDTH-1:0] mul_Q_sub_1[DEPTH-1:0];
    // logic signed [MUL_WIDTH-1:0] mul_Q_sub_2[DEPTH-1:0];

    // always @(*) begin
    //     case (select)
    //         0: begin
    //             twf_R_add_1 = 256;	// Factor 1개당 8값씩 곱해줌
	// 			twf_R_add_2 = 256;
    //             twf_R_sub_1 = 256;
	// 			twf_R_sub_2 = 256;

	// 			twf_Q_add_1 = 0;
	// 			twf_Q_add_2 = 0;
    //             twf_Q_sub_1 = 0;
	// 			twf_Q_sub_2 = -256;
    //         end
    //         1: begin
    //             twf_R_add_1 = 256;	// Factor 1개당 8값씩 곱해줌
	// 			twf_R_add_2 = 181;
    //             twf_R_sub_1 = 256;
	// 			twf_R_sub_2 = -181;

	// 			twf_Q_add_1 = 0;
	// 			twf_Q_add_2 = -181;
    //             twf_Q_sub_1 = 0;
	// 			twf_Q_sub_2 = -181;
    //         end
    //     endcase
    // end


    // always @(posedge clk or negedge rst_n) begin
    //     if (~rst_n) begin
    //         for (i = 0; i < DEPTH; i = i + 1) begin
    //             mul_R_add[i] <= 0;
    //             mul_R_sub[i] <= 0;
    //             mul_Q_add[i] <= 0;
    //             mul_Q_sub[i] <= 0;
    //         end
    //     end else begin
    //         if (en) begin
    //             for (i = 0; i < DEPTH; i = i + 1) begin
    //                 mul_R_add[i]  <= ((din_R_add[i] * twf_R_add) - (din_Q_add[i] * twf_Q_add));
    //                 mul_R_sub[i]  <= ((din_R_sub[i] * twf_R_sub) - (din_Q_sub[i] * twf_Q_sub));
    //                 mul_Q_add[i]  <= ((din_Q_add[i] * twf_R_add) + (din_R_add[i] * twf_Q_add));
    //                 mul_Q_sub[i]  <= ((din_Q_sub[i] * twf_R_sub) + (din_R_sub[i] * twf_Q_sub));;
    //             end
    //         end
    //     end

    // end

    // genvar j;

    // generate
    //     for (j=0; j < DEPTH; j = j+1) begin : assign_shift_reg_out
    //     // +128: 2^7해서 반올림해줌
	// 		assign dout_R_add[j] = ((mul_R_add[j] + 128) >>> 8);
    //         assign dout_R_sub[j] = ((mul_R_sub[j] + 128) >>> 8);
    //         assign dout_Q_add[j] = ((mul_Q_add[j] + 128) >>> 8);
    //         assign dout_Q_sub[j] = ((mul_Q_sub[j] + 128) >>> 8);
	// 	end
    // endgenerate

	integer i;

    // Twiddle factors determined by `select`
    logic signed [TWF_WIDTH-1:0] twf_R_add_1;
    logic signed [TWF_WIDTH-1:0] twf_R_add_2;
    logic signed [TWF_WIDTH-1:0] twf_R_sub_1; 
    logic signed [TWF_WIDTH-1:0] twf_R_sub_2; 
    logic signed [TWF_WIDTH-1:0] twf_Q_add_1; 
    logic signed [TWF_WIDTH-1:0] twf_Q_add_2;
    logic signed [TWF_WIDTH-1:0] twf_Q_sub_1;
    logic signed [TWF_WIDTH-1:0] twf_Q_sub_2;
    
    // Intermediate multiplication results (pipelined registers)
    logic signed [MUL_WIDTH-1:0] mul_R_add_1[0:DEPTH-1];
    logic signed [MUL_WIDTH-1:0] mul_R_add_2[0:DEPTH-1];
    logic signed [MUL_WIDTH-1:0] mul_R_sub_1[0:DEPTH-1];
    logic signed [MUL_WIDTH-1:0] mul_R_sub_2[0:DEPTH-1];
    
    logic signed [MUL_WIDTH-1:0] mul_Q_add_1[0:DEPTH-1];
    logic signed [MUL_WIDTH-1:0] mul_Q_add_2[0:DEPTH-1];
    logic signed [MUL_WIDTH-1:0] mul_Q_sub_1[0:DEPTH-1];
    logic signed [MUL_WIDTH-1:0] mul_Q_sub_2[0:DEPTH-1];

    // Combinational block for assigning twiddle factors based on `select`
    always @(*) begin
        case (select)
            0: begin
                twf_R_add_1 = 10'd256; 
                twf_R_add_2 = 10'd256;
                twf_R_sub_1 = 10'd256;
                twf_R_sub_2 = 10'd0;

                twf_Q_add_1 = 10'd0;
                twf_Q_add_2 = 10'd0;
                twf_Q_sub_1 = 10'd0;
                twf_Q_sub_2 = -10'd256;
            end
            1: begin
                twf_R_add_1 = 10'd256;
                twf_R_add_2 = 10'd181;
                twf_R_sub_1 = 10'd256;
                twf_R_sub_2 = -10'd181;

                twf_Q_add_1 = 10'd0;
                twf_Q_add_2 = -10'd181;
                twf_Q_sub_1 = 10'd0;
                twf_Q_sub_2 = -10'd181;
            end
        endcase
    end

    // Sequential block for multiplication and pipelining
    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                mul_R_add_1[i] <= 0;
                mul_Q_add_1[i] <= 0;
                mul_R_add_2[i] <= 0;
                mul_Q_add_2[i] <= 0;
                mul_R_sub_1[i] <= 0;
                mul_Q_sub_1[i] <= 0;
                mul_R_sub_2[i] <= 0;
                mul_Q_sub_2[i] <= 0;
            end
        end else if (en) begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                // Multiplication for "add" paths
                mul_R_add_1[i] <= (din_R_add_1[i] * twf_R_add_1) - (din_Q_add_1[i] * twf_Q_add_1);
                mul_Q_add_1[i] <= (din_Q_add_1[i] * twf_R_add_1) + (din_R_add_1[i] * twf_Q_add_1);

                mul_R_add_2[i] <= (din_R_add_2[i] * twf_R_add_2) - (din_Q_add_2[i] * twf_Q_add_2);
                mul_Q_add_2[i] <= (din_Q_add_2[i] * twf_R_add_2) + (din_R_add_2[i] * twf_Q_add_2);

                // Multiplication for "sub" paths
                mul_R_sub_1[i] <= (din_R_sub_1[i] * twf_R_sub_1) - (din_Q_sub_1[i] * twf_Q_sub_1);
                mul_Q_sub_1[i] <= (din_Q_sub_1[i] * twf_R_sub_1) + (din_R_sub_1[i] * twf_Q_sub_1);

                mul_R_sub_2[i] <= (din_R_sub_2[i] * twf_R_sub_2) - (din_Q_sub_2[i] * twf_Q_sub_2);
                mul_Q_sub_2[i] <= (din_Q_sub_2[i] * twf_R_sub_2) + (din_R_sub_2[i] * twf_Q_sub_2);
            end
        end
        else begin
           for (i = 0; i < DEPTH; i = i + 1) begin
                // Multiplication for "add" paths
                mul_R_add_1[i] <= 0;
                mul_Q_add_1[i] <= 0;

                mul_R_add_2[i] <= 0;
                mul_Q_add_2[i] <= 0;

                // Multiplication for "sub" paths
                mul_R_sub_1[i] <= {MUL_WIDTH{1'b1}};
                mul_Q_sub_1[i] <= {MUL_WIDTH{1'b1}};

                mul_R_sub_2[i] <= {MUL_WIDTH{1'b1}};
                mul_Q_sub_2[i] <= {MUL_WIDTH{1'b1}};
            end 
        end
    end

    // Combinational block for rounding and shifting
    // `generate` 블록은 반복적인 인스턴스화에 주로 사용되므로
    // 이와 같은 단순한 할당문에는 for-loop를 직접 사용하거나,
    // 이처럼 개별적으로 작성하는 것이 더 명확하고 효율적입니다.

	genvar j;

	generate
		for (j = 0; j < DEPTH; j = j + 1) begin : assign_shift_reg_out
        assign dout_R_add_1[j] = ((mul_R_add_1[j] + 128) >>> 8);
        assign dout_Q_add_1[j] = ((mul_Q_add_1[j] + 128) >>> 8);

        assign dout_R_add_2[j] = ((mul_R_add_2[j] + 128) >>> 8);
        assign dout_Q_add_2[j] = ((mul_Q_add_2[j] + 128) >>> 8);

        assign dout_R_sub_1[j] = ((mul_R_sub_1[j] + 128) >>> 8);
        assign dout_Q_sub_1[j] = ((mul_Q_sub_1[j] + 128) >>> 8);

        assign dout_R_sub_2[j] = ((mul_R_sub_2[j] + 128) >>> 8);
        assign dout_Q_sub_2[j] = ((mul_Q_sub_2[j] + 128) >>> 8);
    end	
	endgenerate

endmodule