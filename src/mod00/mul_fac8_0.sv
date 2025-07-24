`timescale 1ns / 1ps

module mul_fac8_0 #(
    parameter WIDTH = 10,
    parameter DEPTH = 16
)(
    input clk,
    input rst_n,
    input en,
    input signed [WIDTH-1:0] din_R_add[DEPTH-1:0],
    input signed [WIDTH-1:0] din_R_sub[DEPTH-1:0],
    input signed [WIDTH-1:0] din_Q_add[DEPTH-1:0],
    input signed [WIDTH-1:0] din_Q_sub[DEPTH-1:0],

    output logic signed [WIDTH-1:0] dout_R_add[DEPTH-1:0],
    output logic signed [WIDTH-1:0] dout_R_sub[DEPTH-1:0],
    output logic signed [WIDTH-1:0] dout_Q_add[DEPTH-1:0],
    output logic signed [WIDTH-1:0] dout_Q_sub[DEPTH-1:0]
);

integer i;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        for(i=0; i<DEPTH; i=i+1) begin
            dout_R_add[i] <= 0;
            dout_R_sub[i] <= 0;
            dout_Q_add[i] <= 0;
            dout_Q_sub[i] <= 0;
        end
    end else begin
        if (en) begin
            for(i=0; i<DEPTH; i=i+1) begin
                // Change Real & Imaginary(sub)
                dout_R_sub[i] <= din_Q_sub[i];
                dout_Q_sub[i] <= -(din_R_sub[i]);

                dout_R_add[i] <= din_R_add[i];
                dout_Q_add[i] <= din_Q_add[i];
            end
        end
        else begin
            for(i=0; i<DEPTH; i=i+1) begin
                dout_R_add[i] <= din_R_add[i];
                dout_R_sub[i] <= din_R_sub[i];
                dout_Q_add[i] <= din_Q_add[i];
                dout_Q_sub[i] <= din_Q_sub[i];
            end
        end
    end
end 

endmodule
