`timescale 1ns / 1ps

module mem_cbfp0 #(
    parameter DEPTH = 512,
    parameter ADDR_WIDTH = 9,
    parameter FACTOR_WIDTH = 5,
    parameter IN1_OFFSET = 64,			// 1개 scaling factor 64개 단위
    parameter DATA_OUT = 32
) (
    input logic clk,
    input logic rstn,

    input logic                  push1,			//CBFP0 PUSH
	input logic                  pop,			//CBFP2 POP

    input logic [FACTOR_WIDTH-1:0] in_data1,
    
    output logic [FACTOR_WIDTH-1:0] sc_fac_cbfp0[DATA_OUT-1:0]
);

    // 내부 메모리
    logic [FACTOR_WIDTH-1:0] mem [0:DEPTH-1];

    // 포인터
    logic [ADDR_WIDTH-1:0] w_ptr1;
    logic [ADDR_WIDTH-1:0] r_ptr;

    integer i, l;

    // always_ff @( posedge clk or negedge rstn ) begin : memory_reset
    //     if(!rstn) begin
    //         for (l = 0; l < DEPTH ; l = l + 1) begin
    //             mem[l] <= 0;
    //         end
    //     end
    // end

    always_ff @(posedge clk or negedge rstn) begin : CBFP0_64IN
        if (!rstn) begin
            w_ptr1 <= 0;
            for (l = 0; l < DEPTH ; l = l + 1) begin
                mem[l] <= 0;
            end
        end 
        else if (push1) begin
            for (i = 0; i < IN1_OFFSET; i = i + 1) begin
                mem[w_ptr1+i] <= in_data1;   
            end
            w_ptr1 <= w_ptr1 + IN1_OFFSET;
        end
    end


    integer k;

    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            r_ptr <= 0;
            for (k = 0; k < DATA_OUT; k = k + 1) begin
                sc_fac_cbfp0[k] <= 0;
            end
        end 
        else if (pop) begin
            for (k = 0; k < DATA_OUT; k = k + 1) begin
                sc_fac_cbfp0[k] <= mem[r_ptr + k];
            end
            r_ptr <= r_ptr + DATA_OUT;
        end 
    end

endmodule