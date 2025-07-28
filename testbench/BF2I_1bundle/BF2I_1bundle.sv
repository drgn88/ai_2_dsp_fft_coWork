`timescale 1ns / 1ps

module BF2I_1bundle #(
    parameter WIDTH  = 9,
    parameter DEPTH  = 16,
    parameter OFFSET = 1
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
                    reg_dout_R[i+(OFFSET*0)] <= din_R[i+(OFFSET*0)] + din_R[i+(OFFSET*1)];
                    reg_dout_R[i+(OFFSET*1)] <= din_R[i+(OFFSET*0)] - din_R[i+(OFFSET*1)];
                    reg_dout_R[i+(OFFSET*2)] <= din_R[i+(OFFSET*2)] + din_R[i+(OFFSET*3)];
                    reg_dout_R[i+(OFFSET*3)] <= din_R[i+(OFFSET*2)] - din_R[i+(OFFSET*3)];
                    reg_dout_R[i+(OFFSET*4)] <= din_R[i+(OFFSET*4)] + din_R[i+(OFFSET*5)];
                    reg_dout_R[i+(OFFSET*5)] <= din_R[i+(OFFSET*4)] - din_R[i+(OFFSET*5)];
                    reg_dout_R[i+(OFFSET*6)] <= din_R[i+(OFFSET*6)] + din_R[i+(OFFSET*7)];
                    reg_dout_R[i+(OFFSET*7)] <= din_R[i+(OFFSET*6)] - din_R[i+(OFFSET*7)];
                    reg_dout_R[i+(OFFSET*8)] <= din_R[i+(OFFSET*0)] + din_R[i+(OFFSET*1)];
                    reg_dout_R[i+(OFFSET*9)] <= din_R[i+(OFFSET*0)] - din_R[i+(OFFSET*1)];
                    reg_dout_R[i+(OFFSET*10)] <= din_R[i+(OFFSET*2)] + din_R[i+(OFFSET*3)];
                    reg_dout_R[i+(OFFSET*11)] <= din_R[i+(OFFSET*2)] - din_R[i+(OFFSET*3)];
                    reg_dout_R[i+(OFFSET*12)] <= din_R[i+(OFFSET*4)] + din_R[i+(OFFSET*5)];
                    reg_dout_R[i+(OFFSET*13)] <= din_R[i+(OFFSET*4)] - din_R[i+(OFFSET*5)];
                    reg_dout_R[i+(OFFSET*14)] <= din_R[i+(OFFSET*6)] + din_R[i+(OFFSET*7)];
                    reg_dout_R[i+(OFFSET*15)] <= din_R[i+(OFFSET*6)] - din_R[i+(OFFSET*7)];


                    reg_dout_Q[i+(OFFSET*0)] <= din_Q[i+(OFFSET*0)] + din_Q[i+(OFFSET*1)];
                    reg_dout_Q[i+(OFFSET*1)] <= din_Q[i+(OFFSET*0)] - din_Q[i+(OFFSET*1)];
                    reg_dout_Q[i+(OFFSET*2)] <= din_Q[i+(OFFSET*2)] + din_Q[i+(OFFSET*3)];
                    reg_dout_Q[i+(OFFSET*3)] <= din_Q[i+(OFFSET*2)] - din_Q[i+(OFFSET*3)];
                    reg_dout_Q[i+(OFFSET*4)] <= din_Q[i+(OFFSET*4)] + din_Q[i+(OFFSET*5)];
                    reg_dout_Q[i+(OFFSET*5)] <= din_Q[i+(OFFSET*4)] - din_Q[i+(OFFSET*5)];
                    reg_dout_Q[i+(OFFSET*6)] <= din_Q[i+(OFFSET*6)] + din_Q[i+(OFFSET*7)];
                    reg_dout_Q[i+(OFFSET*7)] <= din_Q[i+(OFFSET*6)] - din_Q[i+(OFFSET*7)];
                    reg_dout_Q[i+(OFFSET*8)] <= din_Q[i+(OFFSET*8)] + din_Q[i+(OFFSET*9)];
                    reg_dout_Q[i+(OFFSET*9)] <= din_Q[i+(OFFSET*8)] - din_Q[i+(OFFSET*9)];
                    reg_dout_Q[i+(OFFSET*10)] <= din_Q[i+(OFFSET*10)] + din_Q[i+(OFFSET*11)];
                    reg_dout_Q[i+(OFFSET*11)] <= din_Q[i+(OFFSET*10)] - din_Q[i+(OFFSET*11)];
                    reg_dout_Q[i+(OFFSET*12)] <= din_Q[i+(OFFSET*12)] + din_Q[i+(OFFSET*13)];
                    reg_dout_Q[i+(OFFSET*13)] <= din_Q[i+(OFFSET*12)] - din_Q[i+(OFFSET*13)];
                    reg_dout_Q[i+(OFFSET*14)] <= din_Q[i+(OFFSET*14)] + din_Q[i+(OFFSET*15)];
                    reg_dout_Q[i+(OFFSET*15)] <= din_Q[i+(OFFSET*14)] - din_Q[i+(OFFSET*15)];
                end
            end
        end
    end

    assign dout_R = reg_dout_R;
    assign dout_Q = reg_dout_Q;

endmodule
