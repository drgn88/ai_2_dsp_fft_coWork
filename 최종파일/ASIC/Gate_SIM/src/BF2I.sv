`timescale 1ns / 1ps

module BF2I #(
    parameter WIDTH = 9,
    parameter DEPTH = 16
)(
    input clk,
    input rst_n,
    input en,
    input signed [WIDTH-1:0] din_R1[DEPTH-1:0],
    input signed [WIDTH-1:0] din_R2[DEPTH-1:0], 
    input signed [WIDTH-1:0] din_Q1[DEPTH-1:0],
    input signed [WIDTH-1:0] din_Q2[DEPTH-1:0],
    output logic signed [WIDTH:0] dout_R_add[DEPTH-1:0],
    output logic signed [WIDTH:0] dout_R_sub[DEPTH-1:0],
    output logic signed [WIDTH:0] dout_Q_add[DEPTH-1:0], 
    output logic signed [WIDTH:0] dout_Q_sub[DEPTH-1:0] 
);

// logic signed [WIDTH:0] add_R [DEPTH-1:0];
// logic signed [WIDTH:0] add_Q [DEPTH-1:0];
// logic signed [WIDTH:0] sub_R [DEPTH-1:0];
// logic signed [WIDTH:0] sub_Q [DEPTH-1:0];
integer i;

always @(posedge clk or negedge rst_n) begin
    if (~rst_n) begin
        for(i=0; i<DEPTH; i=i+1) begin
            dout_R_add[i] <= 0;
            dout_Q_add[i] <= 0;
            dout_R_sub[i] <= 0;
            dout_Q_sub[i] <= 0;
        end
    end else begin
        if(en) begin
            for(i=0; i<DEPTH; i=i+1) begin
                dout_R_add[i] <= (din_R1[i] + din_R2[i]); 
                dout_R_sub[i] <= (din_R1[i] - din_R2[i]); 
                dout_Q_add[i] <= (din_Q1[i] + din_Q2[i]); 
                dout_Q_sub[i] <= (din_Q1[i] - din_Q2[i]); 
            end
        end
        else begin
            for(i=0; i<DEPTH; i=i+1) begin
                dout_R_add[i] <= 0; 
                dout_R_sub[i] <= {WIDTH+1{1'b1}}; 
                dout_Q_add[i] <= 0; 
                dout_Q_sub[i] <= {WIDTH+1{1'b1}}; 
            end
        end
    end
end

// assign dout_R_add = add_R;
// assign dout_R_sub = sub_R;
// assign dout_Q_add = add_Q;
// assign dout_Q_sub = sub_Q;

endmodule
