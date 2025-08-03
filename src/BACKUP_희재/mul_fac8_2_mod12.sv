`timescale 1ns/1ps

module mul_fac8_2_mod12 (
	input clk,
	input rstn,
	input en,
	input [8:0] addr,

	input signed [15:0] din_R_add [7:0],
	input signed [15:0] din_R_sub [7:0],
	input signed [15:0] din_Q_add [7:0],
	input signed [15:0] din_Q_sub [7:0],

	output logic signed [24:0] dout_R_add[7:0],
    output logic signed [24:0] dout_Q_add[7:0],
    output logic signed [24:0] dout_R_sub[7:0],
    output logic signed [24:0] dout_Q_sub[7:0]
);

	logic signed [8:0] twiddle_fac_R_add [7:0];
    logic signed [8:0] twiddle_fac_Q_add [7:0];
    logic signed [8:0] twiddle_fac_R_sub [7:0];
    logic signed [8:0] twiddle_fac_Q_sub [7:0];

	integer i;

	always @(posedge clk or negedge rstn) begin
        if (~rstn) begin
            for (i = 0; i < 8; i = i + 1) begin
                dout_R_add[i] <= 0;
                dout_Q_add[i] <= 0;
                dout_R_sub[i] <= 0;
                dout_Q_sub[i] <= 0;
            end
        end else begin
            if (en) begin
                for (i = 0; i < 8; i = i + 1) begin
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
        for (j = 0; j < 8; j = j + 1) begin : twf_gen
            twf_rom_mod12 #(
				.ROM_DEPTH(512),
				.TWF_WIDTH(9),
				.ADDR_WIDTH(9),
				.OFFSET(8)
			) TWF_ROM_MOD12(
				.addr(9'(addr + (8 - 1 - j))),
				.twiddle_fac_R_add(twiddle_fac_R_add[j]),
				.twiddle_fac_Q_add(twiddle_fac_Q_add[j]),
				.twiddle_fac_R_sub(twiddle_fac_R_sub[j]),
				.twiddle_fac_Q_sub(twiddle_fac_Q_sub[j])
			);
        end
    endgenerate
	
endmodule