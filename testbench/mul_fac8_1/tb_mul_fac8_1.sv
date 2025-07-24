`timescale 1ns/1ps

module tb_mul_fac8_1;

    parameter WIDTH = 11;
    parameter TWF_WIDTH = 10;
    parameter MUL_WIDTH = WIDTH + TWF_WIDTH;
    parameter DOUT_WIDTH = WIDTH + TWF_WIDTH - 8;
    parameter DEPTH = 16;

    logic clk;
    logic rst_n;
    logic [2:0] select;
    logic signed [WIDTH-1:0] din_R[DEPTH-1:0];
    logic signed [WIDTH-1:0] din_Q[DEPTH-1:0];
    logic signed [DOUT_WIDTH-1:0] dout_R[DEPTH-1:0];
    logic signed [DOUT_WIDTH-1:0] dout_Q[DEPTH-1:0];

    // DUT instantiation
    mul_fac8_1 #(
        .WIDTH(WIDTH),
        .TWF_WIDTH(TWF_WIDTH),
        .MUL_WIDTH(MUL_WIDTH),
        .DOUT_WIDTH(DOUT_WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .select(select),
        .din_R(din_R),
        .din_Q(din_Q),
        .dout_R(dout_R),
        .dout_Q(dout_Q)
    );

    // Clock generation
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $display("Start test...");
        rst_n = 0;
        select = 3'd3; // ex: twf_R=0, twf_Q=-256 일 때
        for (int i = 0; i < DEPTH; i++) begin
            din_R[i] = i;
            din_Q[i] = i;
        end

        #12;
        rst_n = 1;

        #20;

        // 출력 결과 확인
        for (int i = 0; i < DEPTH; i++) begin
            $display("i=%0d, din_R=%0d, din_Q=%0d -> dout_R=%0d, dout_Q=%0d",
                     i, din_R[i], din_Q[i], dout_R[i], dout_Q[i]);
        end

        #20;
        $finish;
    end

endmodule
