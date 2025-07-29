`timescale 1ns / 1ps

module cbfp1 #(
    parameter INPUT_WIDTH = 25,
    parameter OUTPUT_WIDTH = 12,
    parameter BLOCK_SIZE = 8,
    parameter LZC_WIDTH = 5
) (
    input clk,
    input rstn,
    input alert_cbfp,

    input signed [INPUT_WIDTH-1:0] din_R_add_CBFP[0:BLOCK_SIZE-1],
    input signed [INPUT_WIDTH-1:0] din_Q_add_CBFP[0:BLOCK_SIZE-1],
    input signed [INPUT_WIDTH-1:0] din_R_sub_CBFP[0:BLOCK_SIZE-1],
    input signed [INPUT_WIDTH-1:0] din_Q_sub_CBFP[0:BLOCK_SIZE-1],

    output logic signed [OUTPUT_WIDTH-1:0] dout_R_add_CBFP[0:BLOCK_SIZE-1],
    output logic signed [OUTPUT_WIDTH-1:0] dout_Q_add_CBFP[0:BLOCK_SIZE-1],
    output logic signed [OUTPUT_WIDTH-1:0] dout_R_sub_CBFP[0:BLOCK_SIZE-1],
    output logic signed [OUTPUT_WIDTH-1:0] dout_Q_sub_CBFP[0:BLOCK_SIZE-1],
    output logic valid_mod1
);

    //Control Unit
    logic w_mag_en;
    logic w_min_en;
    logic w_valid_mod1;

    cu_cbfp1 U_CBFP1 (
        .clk(clk),
        .rstn(rstn),
        .alert_cbfp(alert_cbfp),

        .mag_en(w_mag_en),
        .min_en(w_min_en),
        .valid_mod1(w_valid_mod1)
    );

    assign valid_mod1 = w_valid_mod1;

    // Store Reg
    logic signed [INPUT_WIDTH-1:0] reg_R_add[0:BLOCK_SIZE-1];
    logic signed [INPUT_WIDTH-1:0] reg_Q_add[0:BLOCK_SIZE-1];

    shift_reg #(
        .DATA_WIDTH(INPUT_WIDTH),
        .NUM_IN_OUT(BLOCK_SIZE),
        .REG_DEPTH (3)
    ) U_STR_REG_ADD_3CLK (
        .clk  (clk),
        .rstn (rstn),
        .din_i(din_R_add_CBFP),
        .din_q(din_Q_add_CBFP),

        .dout_i(reg_R_add),
        .dout_q(reg_Q_add)
    );

    logic signed [INPUT_WIDTH-1:0] reg_R_sub[0:BLOCK_SIZE-1];
    logic signed [INPUT_WIDTH-1:0] reg_Q_sub[0:BLOCK_SIZE-1];

    shift_reg #(
        .DATA_WIDTH(INPUT_WIDTH),
        .NUM_IN_OUT(BLOCK_SIZE),
        .REG_DEPTH (3)
    ) U_STR_REG_SUB_3CLK (
        .clk  (clk),
        .rstn (rstn),
        .din_i(din_R_sub_CBFP),
        .din_q(din_Q_sub_CBFP),

        .dout_i(reg_R_sub),
        .dout_q(reg_Q_sub)
    );

    //MAG DETECT
    logic signed [LZC_WIDTH-1:0] mag_R_add[0:BLOCK_SIZE-1];
    logic signed [LZC_WIDTH-1:0] mag_Q_add[0:BLOCK_SIZE-1];
    logic signed [LZC_WIDTH-1:0] mag_R_sub[0:BLOCK_SIZE-1];
    logic signed [LZC_WIDTH-1:0] mag_Q_sub[0:BLOCK_SIZE-1];

    mag_detect_cbfp1 U_MAG (
        .clk(clk),
        .rstn(rstn),
        .en(w_mag_en),
        .mag_in_R_add(din_R_add_CBFP),
        .mag_in_Q_add(din_Q_add_CBFP),
        .mag_in_R_sub(din_R_sub_CBFP),
        .mag_in_Q_sub(din_Q_sub_CBFP),

        .mag_out_R_add(mag_R_add),
        .mag_out_Q_add(mag_Q_add),
        .mag_out_R_sub(mag_R_sub),
        .mag_out_Q_sub(mag_Q_sub)
    );

    //MIN DETECT

    logic [LZC_WIDTH-1:0] min_add;
    logic [LZC_WIDTH-1:0] min_sub;

    min_detect_cbfp1 #(
        .LZC_WIDTH(5)
    ) U_MIN (
        .clk (clk),
        .rstn(rstn),
        .en  (w_min_en),

        .min_in_R_add(mag_R_add),
        .min_in_Q_add(mag_Q_add),
        .min_in_R_sub(mag_R_sub),
        .min_in_Q_sub(mag_Q_sub),

        .min_out_add(min_add),
        .min_out_sub(min_sub)
    );

    //BIT SHIFT
    top_bit_shift #(
        .INPUT_WIDTH (25),
        .OUTPUT_WIDTH(12),
        .BLOCK_SIZE  (8),
        .SHIFT_WIDTH (5),
        .SHIFT_TARGET(13)
    ) U_BIT_SHIFT (
        .clk (clk),
        .rstn(rstn),

        .en(),
        .shift_value_add(min_add),
        .shift_value_sub(min_sub),

        .input_data_R_add(reg_R_add),
        .input_data_Q_add(reg_Q_add),
        .input_data_R_sub(reg_R_sub),
        .input_data_Q_sub(reg_Q_sub),

        .output_data_R_add(dout_R_add_CBFP),
        .output_data_Q_add(dout_Q_add_CBFP),
        .output_data_R_sub(dout_R_sub_CBFP),
        .output_data_Q_sub(dout_Q_sub_CBFP)
    );

endmodule
