`timescale 1ns / 1ps

module cu_cbfp1 (
    input clk,
    input rstn,
    input alert_cbfp,

    output logic mag_en,
    output logic min_en,
    output logic valid_mod1
);
/*
    logic tmp;

    always @(posedge clk or negedge rstn) begin
        mag_en <= 0;
        min_en <= 0;
        valid_mod1 <= 0;
        
        if (!rstn) begin
            mag_en     <= 0;
            min_en     <= 0;
            valid_mod1 <= 0;
        end else if (alert_cbfp) begin
            mag_en     <= alert_cbfp;
            min_en     <= mag_en;
            tmp        <= min_en;
            valid_mod1 <= tmp;
        end
    end
*/
    logic reg_mag_en;
    logic reg_min_en;
    logic reg_valid_mod1;
    logic tmp;

    assign mag_en = reg_mag_en;   
    assign min_en = reg_min_en;
    assign valid_mod1 = reg_valid_mod1;

    always @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            reg_mag_en <= 0;
            reg_min_en <= 0;
            reg_valid_mod1 <= 0;
            tmp            <= 0;
        end
        else begin
            reg_mag_en <= alert_cbfp;
            reg_min_en <= reg_mag_en;
            tmp        <= reg_min_en;
            reg_valid_mod1 <= tmp;
        end
    end

endmodule