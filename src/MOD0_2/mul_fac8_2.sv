`timescale 1ns / 1ps

module mul_fac8_2 #(
    parameter WIDTH      = 13,                     // <7.6>
    parameter TWF_WIDTH  = 9,                      // <2.7>
    parameter DOUT_WIDTH = WIDTH + TWF_WIDTH + 1,  // <10.13>
    parameter DEPTH      = 16,
    parameter ADDR_WIDTH = 9,
    parameter OFFSET     = 64
) (
    input clk,
    input rst_n,
    input en,
    input [ADDR_WIDTH-1:0] addr,
    input signed [WIDTH-1:0] din_R_add[DEPTH-1:0],
    input signed [WIDTH-1:0] din_Q_add[DEPTH-1:0],
    input signed [WIDTH-1:0] din_R_sub[DEPTH-1:0],
    input signed [WIDTH-1:0] din_Q_sub[DEPTH-1:0],

    output logic signed [DOUT_WIDTH-1:0] dout_R_add[DEPTH-1:0],
    output logic signed [DOUT_WIDTH-1:0] dout_Q_add[DEPTH-1:0],
    output logic signed [DOUT_WIDTH-1:0] dout_R_sub[DEPTH-1:0],
    output logic signed [DOUT_WIDTH-1:0] dout_Q_sub[DEPTH-1:0]
);

    logic signed [TWF_WIDTH-1:0] twiddle_fac_R_add[DEPTH-1:0];
    logic signed [TWF_WIDTH-1:0] twiddle_fac_Q_add[DEPTH-1:0];
    logic signed [TWF_WIDTH-1:0] twiddle_fac_R_sub[DEPTH-1:0];
    logic signed [TWF_WIDTH-1:0] twiddle_fac_Q_sub[DEPTH-1:0];

    integer i;

    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                dout_R_add[i] <= 0;
                dout_Q_add[i] <= 0;
                dout_R_sub[i] <= 0;
                dout_Q_sub[i] <= 0;
            end
        end else begin
            if (en) begin
                for (i = 0; i < DEPTH; i = i + 1) begin
                    dout_R_add[i] <= (din_R_add[i] * twiddle_fac_R_add[i] - (din_Q_add[i] * twiddle_fac_Q_add[i]));
                    dout_Q_add[i] <= (din_Q_add[i] * twiddle_fac_R_add[i] + (din_R_add[i] * twiddle_fac_Q_add[i]));
                    dout_R_sub[i] <= (din_R_sub[i] * twiddle_fac_R_sub[i] - (din_Q_sub[i] * twiddle_fac_Q_sub[i]));
                    dout_Q_sub[i] <= (din_Q_sub[i] * twiddle_fac_R_sub[i] + (din_R_sub[i] * twiddle_fac_Q_sub[i]));
                end
            end
        end
    end

    genvar j;
    generate
        for (j = 0; j < DEPTH; j = j + 1) begin : twf_gen
            rom_twf_gen #(
                .ROM_DEPTH(512),
                .TWF_WIDTH(9),
                .ADDR_WIDTH(9),
                .OFFSET(64)
            ) U_TWF_GEN (
                // .clk(clk),
                //.addr(addr + j),
                .addr(addr + (DEPTH - 1 - j)),
                .en(en),
                .twiddle_fac_R_add(twiddle_fac_R_add[j]),
                .twiddle_fac_Q_add(twiddle_fac_Q_add[j]),
                .twiddle_fac_R_sub(twiddle_fac_R_sub[j]),
                .twiddle_fac_Q_sub(twiddle_fac_Q_sub[j])
            );
        end
    endgenerate

endmodule
