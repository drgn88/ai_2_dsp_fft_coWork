`timescale 1ns / 1ps

module bit_shift_cbfp1 #(
    parameter INPUT_WIDTH = 25,
    parameter OUTPUT_WIDTH = 12,
    parameter SHIFT_WIDTH = 5,
    parameter SHIFT_TARGET =13
)(
    input logic signed [INPUT_WIDTH-1:0] data_in,
    input logic [SHIFT_WIDTH-1:0] shift_value,
    
    output logic signed [OUTPUT_WIDTH-1:0] data_out
);

    assign data_out = (shift_value < SHIFT_TARGET) ? (data_in >>> (SHIFT_TARGET - shift_value)) : ((data_in <<< shift_value) >>> SHIFT_TARGET);

endmodule
