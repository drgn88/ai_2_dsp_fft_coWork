`timescale 1ns / 1ps

module BF2I_4bundle_tb;

    // DUT (Device Under Test)의 파라미터와 동일하게 선언
    parameter WIDTH  = 9;
    parameter DEPTH  = 16;
    parameter OFFSET = 4; // 변경된 OFFSET 값

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
    BF2I_4bundle #(
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
        $display("                 BF2I_4bundle Testbench Started                   ");
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
            $display("  dout_R[%0d]=%0d, dout_Q[%0d]=%0d", i, dout_R[i], i, dout_Q[i]);
        end

        // Scenario 2: en = 1, Basic addition and subtraction
        $display("\n--- Scenario 2: en = 1, Basic operations ---");
        en = 1;

        // Test set 1: Simple ascending values for inputs
        for (int i = 0; i < DEPTH; i++) begin
            din_R[i] = (i + 1) * 2; // R inputs
            din_Q[i] = (i + 1) * 3; // Q inputs
        end

        @(posedge clk);
        #1ps;
        $display("Time: %0t ns | en = %0d", $time, en);
        $display("--- Input and Output Verification for Scenario 2 ---");
        // Loop through each group of OFFSET
        for (int i = 0; i < OFFSET; i++) begin // i from 0 to 3
            // Group 0: indices 0 and 1 (0*OFFSET, 1*OFFSET)
            $display("  [Block 0, i=%0d] din_R[%0d]=%0d, din_R[%0d]=%0d -> dout_R[%0d]=%0d (Exp: %0d), dout_R[%0d]=%0d (Exp: %0d)",
                     i, i + (OFFSET*0), din_R[i+(OFFSET*0)], i + (OFFSET*1), din_R[i+(OFFSET*1)],
                     i + (OFFSET*0), dout_R[i+(OFFSET*0)], (din_R[i+(OFFSET*0)] + din_R[i+(OFFSET*1)]),
                     i + (OFFSET*1), dout_R[i+(OFFSET*1)], (din_R[i+(OFFSET*0)] - din_R[i+(OFFSET*1)]));
            $display("  [Block 0, i=%0d] din_Q[%0d]=%0d, din_Q[%0d]=%0d -> dout_Q[%0d]=%0d (Exp: %0d), dout_Q[%0d]=%0d (Exp: %0d)",
                     i, i + (OFFSET*0), din_Q[i+(OFFSET*0)], i + (OFFSET*1), din_Q[i+(OFFSET*1)],
                     i + (OFFSET*0), dout_Q[i+(OFFSET*0)], (din_Q[i+(OFFSET*0)] + din_Q[i+(OFFSET*1)]),
                     i + (OFFSET*1), dout_Q[i+(OFFSET*1)], (din_Q[i+(OFFSET*0)] - din_Q[i+(OFFSET*1)]));

            // Group 1: indices 2 and 3 (2*OFFSET, 3*OFFSET)
            $display("  [Block 1, i=%0d] din_R[%0d]=%0d, din_R[%0d]=%0d -> dout_R[%0d]=%0d (Exp: %0d), dout_R[%0d]=%0d (Exp: %0d)",
                     i, i + (OFFSET*2), din_R[i+(OFFSET*2)], i + (OFFSET*3), din_R[i+(OFFSET*3)],
                     i + (OFFSET*2), dout_R[i+(OFFSET*2)], (din_R[i+(OFFSET*2)] + din_R[i+(OFFSET*3)]),
                     i + (OFFSET*3), dout_R[i+(OFFSET*3)], (din_R[i+(OFFSET*2)] - din_R[i+(OFFSET*3)]));
            $display("  [Block 1, i=%0d] din_Q[%0d]=%0d, din_Q[%0d]=%0d -> dout_Q[%0d]=%0d (Exp: %0d), dout_Q[%0d]=%0d (Exp: %0d)",
                     i, i + (OFFSET*2), din_Q[i+(OFFSET*2)], i + (OFFSET*3), din_Q[i+(OFFSET*3)],
                     i + (OFFSET*2), dout_Q[i+(OFFSET*2)], (din_Q[i+(OFFSET*2)] + din_Q[i+(OFFSET*3)]),
                     i + (OFFSET*3), dout_Q[i+(OFFSET*3)], (din_Q[i+(OFFSET*2)] - din_Q[i+(OFFSET*3)]));
            $display("---");
        end


        // Scenario 3: en = 1, Signed edge cases (min/max values)
        $display("\n--- Scenario 3: en = 1, Signed edge cases ---");
        // For WIDTH = 9, range is -256 to 255. Outputs are WIDTH+1=10 bits, range -512 to 511.

        // Test set 2: Edge cases for R
        din_R[0] = 255;       din_R[0+OFFSET] = 255;      // Sum: 510, Sub: 0
        din_R[1] = -256;      din_R[1+OFFSET] = -256;     // Sum: -512, Sub: 0
        din_R[2] = 255;       din_R[2+OFFSET] = -256;     // Sum: -1, Sub: 511
        din_R[3] = -256;      din_R[3+OFFSET] = 255;      // Sum: -1, Sub: -511

        // Test set 2: Edge cases for Q
        din_Q[0] = 100;       din_Q[0+OFFSET] = 50;       // Sum: 150, Sub: 50
        din_Q[1] = -100;      din_Q[1+OFFSET] = 50;       // Sum: -50, Sub: -150
        din_Q[2] = 0;         din_Q[2+OFFSET] = 0;        // Sum: 0, Sub: 0
        din_Q[3] = 1;         din_Q[3+OFFSET] = -1;       // Sum: 0, Sub: 2

        // Remaining elements for blocks 2 and 3
        for (int i = OFFSET*2; i < DEPTH; i++) begin
            din_R[i] = i * 5;
            din_Q[i] = -(i * 5);
        end


        @(posedge clk);
        #1ps;
        $display("Time: %0t ns | en = %0d", $time, en);
        $display("--- Input and Output Verification for Scenario 3 ---");
        for (int i = 0; i < OFFSET; i++) begin // i from 0 to 3
            $display("  [Block 0, i=%0d] din_R[%0d]=%0d, din_R[%0d]=%0d -> dout_R[%0d]=%0d (Exp: %0d), dout_R[%0d]=%0d (Exp: %0d)",
                     i, i + (OFFSET*0), din_R[i+(OFFSET*0)], i + (OFFSET*1), din_R[i+(OFFSET*1)],
                     i + (OFFSET*0), dout_R[i+(OFFSET*0)], (din_R[i+(OFFSET*0)] + din_R[i+(OFFSET*1)]),
                     i + (OFFSET*1), dout_R[i+(OFFSET*1)], (din_R[i+(OFFSET*0)] - din_R[i+(OFFSET*1)]));
            $display("  [Block 0, i=%0d] din_Q[%0d]=%0d, din_Q[%0d]=%0d -> dout_Q[%0d]=%0d (Exp: %0d), dout_Q[%0d]=%0d (Exp: %0d)",
                     i, i + (OFFSET*0), din_Q[i+(OFFSET*0)], i + (OFFSET*1), din_Q[i+(OFFSET*1)],
                     i + (OFFSET*0), dout_Q[i+(OFFSET*0)], (din_Q[i+(OFFSET*0)] + din_Q[i+(OFFSET*1)]),
                     i + (OFFSET*1), dout_Q[i+(OFFSET*1)], (din_Q[i+(OFFSET*0)] - din_Q[i+(OFFSET*1)]));

            $display("  [Block 1, i=%0d] din_R[%0d]=%0d, din_R[%0d]=%0d -> dout_R[%0d]=%0d (Exp: %0d), dout_R[%0d]=%0d (Exp: %0d)",
                     i, i + (OFFSET*2), din_R[i+(OFFSET*2)], i + (OFFSET*3), din_R[i+(OFFSET*3)],
                     i + (OFFSET*2), dout_R[i+(OFFSET*2)], (din_R[i+(OFFSET*2)] + din_R[i+(OFFSET*3)]),
                     i + (OFFSET*3), dout_R[i+(OFFSET*3)], (din_R[i+(OFFSET*2)] - din_R[i+(OFFSET*3)]));
            $display("  [Block 1, i=%0d] din_Q[%0d]=%0d, din_Q[%0d]=%0d -> dout_Q[%0d]=%0d (Exp: %0d), dout_Q[%0d]=%0d (Exp: %0d)",
                     i, i + (OFFSET*2), din_Q[i+(OFFSET*2)], i + (OFFSET*3), din_Q[i+(OFFSET*3)],
                     i + (OFFSET*2), dout_Q[i+(OFFSET*2)], (din_Q[i+(OFFSET*2)] + din_Q[i+(OFFSET*3)]),
                     i + (OFFSET*3), dout_Q[i+(OFFSET*3)], (din_Q[i+(OFFSET*2)] - din_Q[i+(OFFSET*3)]));
            $display("---");
        end

        // End simulation
        @(posedge clk);
        $display("\n------------------------------------------------------------------");
        $display("                 BF2I_4bundle Testbench Finished                  ");
        $display("------------------------------------------------------------------");
        $finish;
    end

endmodule
