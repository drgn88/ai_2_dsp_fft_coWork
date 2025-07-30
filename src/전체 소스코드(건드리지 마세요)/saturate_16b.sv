`timescale 1ns / 1ps

module saturation #(
    parameter WIDTH = 17,
    parameter DOUT_WIDTH = 16,
    parameter SAT_MAX_VAL = 32767,
    parameter SAT_MIN_VAL = -32768
) (
    input clk,
    input rst_n,
    input en,
    input signed [WIDTH-1:0] din_R_add,
    input signed [WIDTH-1:0] din_R_sub,
    input signed [WIDTH-1:0] din_Q_add,
    input signed [WIDTH-1:0] din_Q_sub,

    output logic signed [DOUT_WIDTH-1:0] dout_R_add,
    output logic signed [DOUT_WIDTH-1:0] dout_R_sub,
    output logic signed [DOUT_WIDTH-1:0] dout_Q_add,
    output logic signed [DOUT_WIDTH-1:0] dout_Q_sub
);

    integer i;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
                dout_R_add <= 0;
                dout_R_sub <= 0;
                dout_Q_add <= 0;
                dout_Q_sub <= 0;
        end else begin
                // R_add_saturation
                if (din_R_add > SAT_MAX_VAL) 
                    dout_R_add <= SAT_MAX_VAL;
                else if (din_R_add < SAT_MIN_VAL)
                    dout_R_add <= SAT_MIN_VAL;
                else 
                    dout_R_add <= din_R_add;

                // R_sub_saturation
                if (din_R_sub > SAT_MAX_VAL) 
                    dout_R_sub <= SAT_MAX_VAL;
                else if (din_R_sub < SAT_MIN_VAL)
                    dout_R_sub <= SAT_MIN_VAL;
                else 
                    dout_R_sub <= din_R_sub;

                // Q_add_saturation
                if (din_Q_add > SAT_MAX_VAL) 
                    dout_Q_add <= SAT_MAX_VAL;
                else if (din_Q_add < SAT_MIN_VAL)
                    dout_Q_add <= SAT_MIN_VAL;
                else 
                    dout_Q_add <= din_Q_add;

                // Q_sub_saturation
                if (din_Q_sub > SAT_MAX_VAL) 
                    dout_Q_sub <= SAT_MAX_VAL;
                else if (din_Q_sub < SAT_MIN_VAL)
                    dout_Q_sub <= SAT_MIN_VAL;
                else 
                    dout_Q_sub <= din_Q_sub;
        end
    end


endmodule