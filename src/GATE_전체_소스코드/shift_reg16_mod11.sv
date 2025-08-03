`timescale 1ns/1ps

module shift_reg16_mod11 #(
    parameter DATA_WIDTH = 9,
    parameter NUM_IN_OUT = 16
) (
    input clk,
    input rstn,
    input logic signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1],
    input logic signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1],

    output logic signed [DATA_WIDTH - 1:0] dout_i [0:NUM_IN_OUT-1],
    output logic signed [DATA_WIDTH - 1:0] dout_q [0:NUM_IN_OUT-1]
);
    // REG_DEPTH를 1로 고정하므로 별도의 시프트 레지스터 배열은 필요 없습니다.
    // dout_i와 dout_q가 곧 레지스터 역할을 수행합니다.
    
    integer i;

    always_ff @( posedge clk or negedge rstn ) begin
        if (!rstn) begin
            for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
                dout_i[i] <= 0;
                dout_q[i] <= 0;
            end
        end
        else begin
            for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
                dout_i[i] <= din_i[i];
                dout_q[i] <= din_q[i];
            end
        end
    end
endmodule