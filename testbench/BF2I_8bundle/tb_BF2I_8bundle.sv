`timescale 1ns / 1ps

module BF2I_8bundle_tb;

    // DUT (Device Under Test)의 파라미터와 동일하게 선언
    parameter WIDTH  = 9;
    parameter DEPTH  = 16;
    parameter OFFSET = 8;

    // 테스트벤치 신호 선언
    logic clk;
    logic rst_n;
    logic en;
    logic signed [WIDTH-1:0] din_R[DEPTH-1:0];
    logic signed [WIDTH-1:0] din_Q[DEPTH-1:0];
    logic signed [WIDTH:0] dout_R[DEPTH-1:0];
    logic signed [WIDTH:0] dout_Q[DEPTH-1:0];

    // 클럭 생성
    localparam CLK_PERIOD = 10ns;
    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    // DUT 인스턴스화
    BF2I_8bundle #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH),
        .OFFSET(OFFSET)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .din_R(din_R),
        .din_Q(din_Q),
        .dout_R(dout_R),
        .dout_Q(dout_Q)
    );

    // 테스트 시퀀스
    initial begin
        // 초기화
        rst_n = 0;
        en = 0;
        for (int i = 0; i < DEPTH; i++) begin
            din_R[i] = 0;
            din_Q[i] = 0;
        end

        $display("------------------------------------------------------------------");
        $display("                 BF2I_8bundle Testbench Started                   ");
        $display("------------------------------------------------------------------");

        @(posedge clk);
        #1ps; // 클럭 엣지 이후 약간의 지연
        rst_n = 1; // 리셋 해제

        $display("Time: %0t ns | Reset Released", $time);

        // Scenario 1: en = 0 (No operation, outputs should be 0)
        $display("\n--- Scenario 1: en = 0 ---");
        en = 0;
        for (int i = 0; i < DEPTH; i++) begin
            din_R[i] = i + 1; // 임의의 값 설정
            din_Q[i] = -(i + 1); // 임의의 값 설정
        end
        @(posedge clk);
        #1ps;
        $display("Time: %0t ns | en = %0d. Expected dout_R/Q = 0.", $time, en);
        for (int i = 0; i < DEPTH; i++) begin
            $display("  din_R[%0d]=%0d, din_Q[%0d]=%0d | dout_R[%0d]=%0d, dout_Q[%0d]=%0d",
                     i, din_R[i], i, din_Q[i], i, dout_R[i], i, dout_Q[i]);
        end

        // Scenario 2: en = 1, Basic addition and subtraction
        $display("\n--- Scenario 2: en = 1, Basic operations ---");
        en = 1;
        // Test set 1
        for (int i = 0; i < OFFSET; i++) begin
            din_R[i]          = 10 + i;
            din_R[i+OFFSET]   = 5 + i;
            din_Q[i]          = 20 + i;
            din_Q[i+OFFSET]   = 10 + i;
        end
        @(posedge clk);
        #1ps;
        $display("Time: %0t ns | en = %0d", $time, en);
        for (int i = 0; i < OFFSET; i++) begin
            $display("  din_R[%0d]=%0d, din_R[%0d]=%0d | dout_R[%0d]=%0d (Exp: %0d), dout_R[%0d]=%0d (Exp: %0d)",
                     i, din_R[i], i+OFFSET, din_R[i+OFFSET],
                     i, dout_R[i], (din_R[i] + din_R[i+OFFSET]),
                     i+OFFSET, dout_R[i+OFFSET], (din_R[i] - din_R[i+OFFSET]));
            $display("  din_Q[%0d]=%0d, din_Q[%0d]=%0d | dout_Q[%0d]=%0d (Exp: %0d), dout_Q[%0d]=%0d (Exp: %0d)",
                     i, din_Q[i], i+OFFSET, din_Q[i+OFFSET],
                     i, dout_Q[i], (din_Q[i] + din_Q[i+OFFSET]),
                     i+OFFSET, dout_Q[i+OFFSET], (din_Q[i] - din_Q[i+OFFSET]));
        end

        // Test set 2: Edge cases for signed numbers (min/max values)
        $display("\n--- Scenario 3: en = 1, Signed edge cases ---");
        // For WIDTH = 9, range is -256 to 255
        // Max Positive: 255
        // Min Negative: -256
        din_R[0] = 255;      din_R[0+OFFSET] = 255;       // Sum: 510
        din_R[1] = -256;     din_R[1+OFFSET] = -256;      // Sum: -512
        din_R[2] = 255;      din_R[2+OFFSET] = -256;      // Sub: 511
        din_R[3] = -256;     din_R[3+OFFSET] = 255;       // Sub: -511
        // Other values for remaining OFFSET-1 elements
        for (int i = 4; i < OFFSET; i++) begin
            din_R[i]          = 10*i;
            din_R[i+OFFSET]   = -(5*i);
        end
        // Initialize Q inputs
        for (int i = 0; i < DEPTH; i++) begin
            din_Q[i] = i;
        end

        @(posedge clk);
        #1ps;
        $display("Time: %0t ns | en = %0d", $time, en);
        for (int i = 0; i < OFFSET; i++) begin
            $display("  din_R[%0d]=%0d, din_R[%0d]=%0d | dout_R[%0d]=%0d (Exp: %0d), dout_R[%0d]=%0d (Exp: %0d)",
                     i, din_R[i], i+OFFSET, din_R[i+OFFSET],
                     i, dout_R[i], (din_R[i] + din_R[i+OFFSET]),
                     i+OFFSET, dout_R[i+OFFSET], (din_R[i] - din_R[i+OFFSET]));
            $display("  din_Q[%0d]=%0d, din_Q[%0d]=%0d | dout_Q[%0d]=%0d (Exp: %0d), dout_Q[%0d]=%0d (Exp: %0d)",
                     i, din_Q[i], i+OFFSET, din_Q[i+OFFSET],
                     i, dout_Q[i], (din_Q[i] + din_Q[i+OFFSET]),
                     i+OFFSET, dout_Q[i+OFFSET], (din_Q[i] - din_Q[i+OFFSET]));
        end

        // End simulation
        @(posedge clk);
        $display("\n------------------------------------------------------------------");
        $display("                 BF2I_8bundle Testbench Finished                  ");
        $display("------------------------------------------------------------------");
        $finish;
    end

endmodule
