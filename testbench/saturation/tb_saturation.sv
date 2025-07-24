`timescale 1ns/1ps

module tb_saturation;

    parameter WIDTH = 14;
    parameter DOUT_WIDTH = 13;
    parameter DEPTH = 4; // 테스트용으로 줄였음
    parameter SAT_MAX_VAL = 4095;
    parameter SAT_MIN_VAL = -4096;

    logic clk;
    logic rst_n;
    logic en;

    logic signed [WIDTH-1:0] din_R_add[DEPTH-1:0];
    logic signed [WIDTH-1:0] din_R_sub[DEPTH-1:0];
    logic signed [WIDTH-1:0] din_Q_add[DEPTH-1:0];
    logic signed [WIDTH-1:0] din_Q_sub[DEPTH-1:0];

    logic signed [DOUT_WIDTH-1:0] dout_R_add[DEPTH-1:0];
    logic signed [DOUT_WIDTH-1:0] dout_R_sub[DEPTH-1:0];
    logic signed [DOUT_WIDTH-1:0] dout_Q_add[DEPTH-1:0];
    logic signed [DOUT_WIDTH-1:0] dout_Q_sub[DEPTH-1:0];

    // DUT 인스턴스
    saturation #(
        .WIDTH(WIDTH),
        .DOUT_WIDTH(DOUT_WIDTH),
        .DEPTH(DEPTH),
        .SAT_MAX_VAL(SAT_MAX_VAL),
        .SAT_MIN_VAL(SAT_MIN_VAL)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .din_R_add(din_R_add),
        .din_R_sub(din_R_sub),
        .din_Q_add(din_Q_add),
        .din_Q_sub(din_Q_sub),
        .dout_R_add(dout_R_add),
        .dout_R_sub(dout_R_sub),
        .dout_Q_add(dout_Q_add),
        .dout_Q_sub(dout_Q_sub)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin
        integer i;

        // 초기화
        clk = 0;
        rst_n = 0;
        en = 1;

        for (i = 0; i < DEPTH; i++) begin
            din_R_add[i] = 0;
            din_R_sub[i] = 0;
            din_Q_add[i] = 0;
            din_Q_sub[i] = 0;
        end

        // Reset
        #10;
        rst_n = 1;

        // 입력 테스트 패턴
        din_R_add[0] = 3000;
        din_R_add[1] = 5000;   // > MAX
        din_R_add[2] = -5000;  // < MIN
        din_R_add[3] = -100;

        din_R_sub[0] = 100;
        din_R_sub[1] = 7000;   // > MAX
        din_R_sub[2] = -4096;  // = MIN
        din_R_sub[3] = -7000;  // < MIN

        din_Q_add[0] = -4097;  // < MIN
        din_Q_add[1] = 4095;   // = MAX
        din_Q_add[2] = 2048;
        din_Q_add[3] = 0;

        din_Q_sub[0] = -2048;
        din_Q_sub[1] = 4096;   // > MAX
        din_Q_sub[2] = -10000; // < MIN
        din_Q_sub[3] = 100;

        // 한 사이클 대기
        #10;

        // 결과 출력
        for (i = 0; i < DEPTH; i++) begin
            $display("Index %0d: dout_R_add=%0d, dout_R_sub=%0d, dout_Q_add=%0d, dout_Q_sub=%0d",
                i, dout_R_add[i], dout_R_sub[i], dout_Q_add[i], dout_Q_sub[i]);
        end

        $finish;
    end

endmodule
