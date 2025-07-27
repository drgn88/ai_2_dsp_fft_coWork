`timescale 1ns / 1ps

module top_bit_shift #(
    parameter INPUT_WIDTH = 23,
    parameter OUTPUT_WIDTH = 11,
    parameter BLOCK_SIZE = 16,
    parameter SHIFT_WIDTH = 5,
    parameter SHIFT_TARGET =12
)(
    input logic clk,
    input logic rstn,

    input logic en,
    input logic [SHIFT_WIDTH-1:0] shift_value,

    input logic signed [INPUT_WIDTH-1:0] input_data_re [0:BLOCK_SIZE-1],
    input logic signed [INPUT_WIDTH-1:0] input_data_im [0:BLOCK_SIZE-1],

    output logic signed [OUTPUT_WIDTH-1:0] output_data_re [0:BLOCK_SIZE-1],
    output logic signed [OUTPUT_WIDTH-1:0] output_data_im [0:BLOCK_SIZE-1]    
);

    genvar i;
    genvar j;

    generate
        for (i = 0; i < BLOCK_SIZE; i = i + 1) begin
            bit_shift #(.INPUT_WIDTH(23),
                        .OUTPUT_WIDTH(11),
                        .SHIFT_WIDTH(5),
                        .SHIFT_TARGET(12)) dut_re(
                .data_in(input_data_re[i]),
                .shift_value(shift_value),
                .data_out(output_data_re[i])
            );

        end
        for (j = 0; j < BLOCK_SIZE; j = j + 1) begin
            bit_shift #(.INPUT_WIDTH(23),
                        .OUTPUT_WIDTH(11),
                        .SHIFT_WIDTH(5),
                        .SHIFT_TARGET(12)) dut_im(
                .data_in(input_data_im[j]),
                .shift_value(shift_value),
                .data_out(output_data_im[j])
            );
        end
    endgenerate

endmodule
