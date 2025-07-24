`timescale 1ns / 1ps

module mul_fac8_1 #(
    parameter WIDTH      = 11,                     // <5.6>
    parameter TWF_WIDTH  = 10,                     // <2.8>
    parameter MUL_WIDTH  = WIDTH + TWF_WIDTH,      // <7.14>
    parameter DOUT_WIDTH = WIDTH + TWF_WIDTH - 8,  // <7.6>
    parameter DEPTH      = 16
) (
    input clk,
    input rst_n,
    input [2:0] select,
    input signed [WIDTH-1:0] din_R[DEPTH-1:0],
    input signed [WIDTH-1:0] din_Q[DEPTH-1:0],
    output logic signed [DOUT_WIDTH-1:0] dout_R[DEPTH-1:0],
    output logic signed [DOUT_WIDTH-1:0] dout_Q[DEPTH-1:0]
);

    integer i;
    logic signed [TWF_WIDTH-1:0] twf_R;
    logic signed [TWF_WIDTH-1:0] twf_Q;
    logic signed [MUL_WIDTH-1:0] mul_R[DEPTH-1:0];
    logic signed [MUL_WIDTH-1:0] mul_Q[DEPTH-1:0];

    always @(*) begin
        case (select)
            0: begin
                twf_R = 256;
                twf_Q = 0;
            end
            1: begin
                twf_R = 256;
                twf_Q = 0;
            end
            2: begin
                twf_R = 256;
                twf_Q = 0;
            end
            3: begin
                twf_R = 0;
                twf_Q = -256;
            end
            4: begin
                twf_R = 256;
                twf_Q = 0;
            end
            5: begin
                twf_R = 181;
                twf_Q = -181;
            end
            6: begin
                twf_R = 256;
                twf_Q = 0;
            end
            7: begin
                twf_R = -181;
                twf_Q = -181;
            end
            default: begin
                twf_R = 0;
                twf_Q = 0;
            end
        endcase
    end


    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                mul_R[i] <= 0;
                mul_Q[i] <= 0;
            end
        end else begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                mul_R[i]  <= din_R[i] * twf_R;
                mul_Q[i]  <= din_Q[i] * twf_Q;

                dout_R[i] <= mul_R[i] >>> 8;
                dout_Q[i] <= mul_Q[i] >>> 8;
            end
        end
    end


endmodule
