`timescale 1ns / 1ps

module mem_cbfp1 #(
    parameter DEPTH = 512,
    parameter ADDR_WIDTH = 9,
    parameter FACTOR_WIDTH = 5,
    parameter IN2_OFFSET = 8,			//4개 scaling factor 8개 단위
    parameter DATA_OUT = 32
) (
    input logic clk,
    input logic rstn,

    input logic                  push2,			//CBFP1 PUSH
	input logic                  pop,			//CBFP2 POP

    input logic [FACTOR_WIDTH-1:0] in_data2_0,
    input logic [FACTOR_WIDTH-1:0] in_data2_1,
    input logic [FACTOR_WIDTH-1:0] in_data2_2,
    input logic [FACTOR_WIDTH-1:0] in_data2_3,
    
    output logic [FACTOR_WIDTH-1:0] sc_fac_cbfp1[DATA_OUT-1:0]
);

    // 내부 메모리
    logic [FACTOR_WIDTH-1:0] mem [0:DEPTH-1];

    // 포인터
    logic [ADDR_WIDTH-1:0] w_ptr2;
    logic [ADDR_WIDTH-1:0] r_ptr;

    integer j, l;

    // always_ff @( posedge clk or negedge rstn ) begin : memory_reset
    //     if(!rstn) begin
    //         for (l = 0; l < DEPTH ; l = l + 1) begin
    //             mem[l] <= 0;
    //         end
    //     end
    // end

	always_ff @(posedge clk or negedge rstn) begin : CBFP1_4BUNDLE_32IN
        if (!rstn) begin
            w_ptr2 <= 0;
            for (l = 0; l < DEPTH ; l = l + 1) begin
                mem[l] <= 0;
            end
        end 
        else if (push2) begin
            for (j = 0; j < IN2_OFFSET; j = j + 1) begin
				mem[w_ptr2 + IN2_OFFSET*0 +j] <= in_data2_0;
				mem[w_ptr2 + IN2_OFFSET*1 +j] <= in_data2_1;
				mem[w_ptr2 + IN2_OFFSET*2 +j] <= in_data2_2;
				mem[w_ptr2 + IN2_OFFSET*3 +j] <= in_data2_3;
        	end
        w_ptr2 <= w_ptr2 + 32;
        end
    end



    integer k;

    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            r_ptr <= 0;
            for (k = 0; k < DATA_OUT; k = k + 1) begin
                sc_fac_cbfp1[k] <= 0;
            end
        end 
        else if (pop) begin
            for (k = 0; k < DATA_OUT; k = k + 1) begin
                sc_fac_cbfp1[k] <= mem[r_ptr + k];
            end
            r_ptr <= r_ptr + DATA_OUT;
        end 
    end

endmodule

/*
    // Read: 16개씩 출력
    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            r_ptr <= 0;
            valid <= 0;
            out_data <= 0;
        end 
        else if (pop) begin
            out_data <= mem[r_ptr];
            r_ptr <= r_ptr + 1;
            valid <= 1;
        end else begin
            valid <= 0;
        end
    end
*/
