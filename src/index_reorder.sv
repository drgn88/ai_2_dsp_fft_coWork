`timescale 1ns / 1ps

module index_reorder #(
    parameter IDX_WIDTH = 9
) (
    input  [IDX_WIDTH-1:0] original_idx,
    output [IDX_WIDTH-1:0] reorder_idx
);

    genvar i;
    wire [IDX_WIDTH-1:0] temp_reorder_idx;

    generate
        for (i = 0; i < IDX_WIDTH; i = i + 1) begin
            assign temp_reorder_idx[i] = original_idx[IDX_WIDTH-1-i];
        end
        assign reorder_idx = temp_reorder_idx;
    endgenerate

endmodule
