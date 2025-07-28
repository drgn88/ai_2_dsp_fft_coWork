`timescale 1ns / 1ps

module BF2I_8bundle #(
    parameter WIDTH  = 9,
    parameter DEPTH  = 16,
    parameter OFFSET = 8
) (
    input clk,
    input rst_n,
    input en,
    input signed [WIDTH-1:0] din_R[DEPTH-1:0],
    input signed [WIDTH-1:0] din_Q[DEPTH-1:0],
    output logic signed [WIDTH:0] dout_R[DEPTH-1:0],
    output logic signed [WIDTH:0] dout_Q[DEPTH-1:0]
);

    logic signed [WIDTH:0] reg_dout_R[DEPTH-1:0];
    logic signed [WIDTH:0] reg_dout_Q[DEPTH-1:0];

    integer i;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                reg_dout_R[i] <= 0;
                reg_dout_Q[i] <= 0;
            end
        end else begin
            if (en) begin
                for (i = 0; i < OFFSET; i = i + 1) begin
                    reg_dout_R[i]        <= din_R[i] + din_R[i+OFFSET];
                    reg_dout_R[i+OFFSET] <= din_R[i] - din_R[i+OFFSET];
                    reg_dout_Q[i]        <= din_Q[i] + din_Q[i+OFFSET];
                    reg_dout_Q[i+OFFSET] <= din_Q[i] - din_Q[i+OFFSET];
                end
            end
        end
    end

    assign dout_R = reg_dout_R;
    assign dout_Q = reg_dout_Q;
    
endmodule
