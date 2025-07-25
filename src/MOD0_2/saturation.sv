`timescale 1ns / 1ps

module saturation #(
    parameter WIDTH = 14,
    parameter DOUT_WIDTH = 13,
    parameter DEPTH = 16,
    parameter SAT_MAX_VAL = 4095,
    parameter SAT_MIN_VAL = -4096
) (
    input clk,
    input rst_n,
    input en,
    input signed [WIDTH-1:0] din_R_add[DEPTH-1:0],
    input signed [WIDTH-1:0] din_R_sub[DEPTH-1:0],
    input signed [WIDTH-1:0] din_Q_add[DEPTH-1:0],
    input signed [WIDTH-1:0] din_Q_sub[DEPTH-1:0],

    output logic signed [DOUT_WIDTH-1:0] dout_R_add[DEPTH-1:0],
    output logic signed [DOUT_WIDTH-1:0] dout_R_sub[DEPTH-1:0],
    output logic signed [DOUT_WIDTH-1:0] dout_Q_add[DEPTH-1:0],
    output logic signed [DOUT_WIDTH-1:0] dout_Q_sub[DEPTH-1:0]
);

    integer i;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                dout_R_add[i] <= 0;
                dout_R_sub[i] <= 0;
                dout_Q_add[i] <= 0;
                dout_Q_sub[i] <= 0;
            end
        end else begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                // R_add_saturation
                if (din_R_add[i] > SAT_MAX_VAL) 
                    dout_R_add[i] <= SAT_MAX_VAL;
                else if (din_R_add[i] < SAT_MIN_VAL)
                    dout_R_add[i] <= SAT_MIN_VAL;
                else 
                    dout_R_add[i] <= din_R_add[i];

                // R_sub_saturation
                if (din_R_sub[i] > SAT_MAX_VAL) 
                    dout_R_sub[i] <= SAT_MAX_VAL;
                else if (din_R_sub[i] < SAT_MIN_VAL)
                    dout_R_sub[i] <= SAT_MIN_VAL;
                else 
                    dout_R_sub[i] <= din_R_sub[i];

                // Q_add_saturation
                if (din_Q_add[i] > SAT_MAX_VAL) 
                    dout_Q_add[i] <= SAT_MAX_VAL;
                else if (din_Q_add[i] < SAT_MIN_VAL)
                    dout_Q_add[i] <= SAT_MIN_VAL;
                else 
                    dout_Q_add[i] <= din_Q_add[i];

                // Q_sub_saturation
                if (din_Q_sub[i] > SAT_MAX_VAL) 
                    dout_Q_sub[i] <= SAT_MAX_VAL;
                else if (din_Q_sub[i] < SAT_MIN_VAL)
                    dout_Q_sub[i] <= SAT_MIN_VAL;
                else 
                    dout_Q_sub[i] <= din_Q_sub[i];
            end
        end
    end


endmodule
