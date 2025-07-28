`timescale 1ns / 1ps

module cu_cbfp1 (
    input clk,
    input rstn,
    input alert_cbfp,

    output logic mag_en,
    output logic min_en,
    output logic valid_mod2
);
    logic tmp;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            mag_en     <= 0;
            min_en     <= 0;
            valid_mod2 <= 0;
        end else begin
            mag_en     <= alert_cbfp;
            min_en     <= mag_en;
            tmp        <= min_en;
            valid_mod2 <= tmp;
        end
    end

endmodule