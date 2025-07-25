`timescale 1ns / 1ps

module mul_fac8_1 #(
    parameter WIDTH      = 11,                     // <5.6>
    parameter TWF_WIDTH  = 10,                     // <2.8>
    parameter MUL_WIDTH  = WIDTH + TWF_WIDTH,      // <7.14>
    parameter DOUT_WIDTH = WIDTH + TWF_WIDTH - 8,  // <7.6>
    parameter DEPTH      = 16
) (
    input clk,
    input rst_n,
    input [1:0] select,
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
    logic signed [TWF_WIDTH-1:0] twf_R_1;
    logic signed [TWF_WIDTH-1:0] twf_R_2; 
    logic signed [TWF_WIDTH-1:0] twf_Q_1;      
    logic signed [TWF_WIDTH-1:0] twf_Q_2;
    
    logic signed [MUL_WIDTH-1:0] mul_R_add[DEPTH-1:0];
    logic signed [MUL_WIDTH-1:0] mul_R_sub[DEPTH-1:0];
    logic signed [MUL_WIDTH-1:0] mul_Q_add[DEPTH-1:0];
    logic signed [MUL_WIDTH-1:0] mul_Q_sub[DEPTH-1:0];

    always @(*) begin
        case (select)
            0: begin
                twf_R_1 = 256;
                twf_R_2 = 256;
                twf_Q_1 = 0;
                twf_Q_2 = 0;
            end
            1: begin
                twf_R_1 = 256;
                twf_R_2 = 0;
                twf_Q_1 = 0;
                twf_Q_2 = -256;
            end
            2: begin
                twf_R_1 = 256;
                twf_R_2 = 256;
                twf_Q_1 = 0;
                twf_Q_2 = 0;
            end
            3: begin
                twf_R_1 = 181;
                twf_R_2 = -181;
                twf_Q_1 = -181;
                twf_Q_2 = -181;
            end
            default: begin
                twf_R_1 = 0;
                twf_R_2 = 0;
                twf_Q_1 = 0;
                twf_Q_2 = 0;
            end
        endcase
    end


    always @(posedge clk or negedge rst_n) begin
        if (~rst_n) begin
            for (i = 0; i < DEPTH; i = i + 1) begin
                mul_R_add[i] <= 0;
                mul_R_sub[i] <= 0;
                mul_Q_add[i] <= 0;
                mul_Q_sub[i] <= 0;
            end
        end else begin
            if (en) begin
                for (i = 0; i < DEPTH; i = i + 1) begin
                    mul_R_add[i]  <= din_R_add[i] * twf_R_1;
                    mul_R_sub[i]  <= din_R_sub[i] * twf_R_2;
                    mul_Q_add[i]  <= din_Q_add[i] * twf_Q_1;
                    mul_Q_sub[i]  <= din_Q_sub[i] * twf_Q_2;

                    dout_R_add[i] <= mul_R_add[i] >>> 8;
                    dout_R_sub[i] <= mul_R_sub[i] >>> 8;
                    dout_Q_add[i] <= mul_Q_add[i] >>> 8;
                    dout_Q_sub[i] <= mul_Q_sub[i] >>> 8;
                end
            end
        end

    end

endmodule
