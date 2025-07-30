`timescale 1ns / 1ps

module index_reorder #(
    parameter IDX_WIDTH = 9,
    parameter NUM = 512
) (
    input en,
    input [IDX_WIDTH-1:0] original_idx[NUM-1:0],
    output logic [IDX_WIDTH-1:0] reorder_idx[NUM-1:0]
);

    genvar i, j;
    wire [IDX_WIDTH-1:0] temp_reorder_idx[NUM-1:0];

    generate
        for (i = 0; i < NUM; i = i + 1) begin
            for (j = 0; j < IDX_WIDTH; j = j + 1) begin
                assign temp_reorder_idx[i][j] = original_idx[i][IDX_WIDTH-1-j];
            end
        end
    endgenerate

    integer k;
    always @(*) begin
        if (en) begin
            for (k = 0; k < NUM; k = k + 1)
            reorder_idx[k] = temp_reorder_idx[k];
        end else begin
            for (k = 0; k < NUM; k = k + 1) reorder_idx[k] = 0;
        end
    end
endmodule
