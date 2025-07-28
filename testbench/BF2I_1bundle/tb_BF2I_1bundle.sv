`timescale 1ns / 1ps

module BF2I_1bundle_tb;

    // DUT (Device Under Test)의 파라미터와 동일하게 선언
    parameter WIDTH  = 9;
    parameter DEPTH  = 16;
    parameter OFFSET = 1; // 모듈과 동일한 OFFSET 값

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

    // DUT 인스턴스화 (모듈 이름 변경)
    BF2I_1bundle #(
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

    // FSDB 파형 덤프 설정 (버디/VCS DVE에서 확인용)
    initial begin
        // 시뮬레이션 디렉토리에 wave.fsdb 파일 생성
        $fsdbDumpfile("wave.fsdb");
        // 현재 모듈 (테스트벤치) 및 DUT의 모든 신호를 덤프
        $fsdbDumpvars(0, BF2I_1bundle_tb);
    end

    // 테스트 시퀀스
    initial begin
        // 초기화
        rst_n = 0;
        en = 0;
        for (int i = 0; i < DEPTH; i++) begin
            din_R[i] = 0;
            din_Q[i] = 0;
        end

        // 리셋 활성화 상태 유지
        repeat (2) @(posedge clk);
        #1ps; // 클럭 엣지 이후 약간의 지연
        rst_n = 1; // 리셋 해제

        // Scenario 1: en = 0 (연산 비활성화)
        en = 0;
        for (int i = 0; i < DEPTH; i++) begin
            din_R[i] = 10 + i; // 임의의 값 설정
            din_Q[i] = 20 + i; // 임의의 값 설정
        end
        @(posedge clk);
        #1ps;
        // Scenario 2: en = 1, 기본 연산
        en = 1;
        // din_R과 din_Q에 체계적인 값 할당
        for (int i = 0; i < DEPTH; i++) begin
            din_R[i] = i * 3; // R 입력
            din_Q[i] = (DEPTH - 1 - i) * 2; // Q 입력 (반대 방향으로 값 증가)
        end
        @(posedge clk);
        #1ps;

        // Scenario 3: en = 1, Signed 숫자 경계값 테스트
        // WIDTH = 9 이므로 범위는 -256 ~ 255.
        // 출력은 WIDTH+1 = 10 이므로 범위는 -512 ~ 511.
        en = 1;
        // R 입력에 경계값 설정
       din_R[0] = 255;       din_R[1] = 255;       // dout_R[0]: 510, dout_R[1]: 0
        din_R[2] = -256;      din_R[3] = -256;      // dout_R[2]: -512, dout_R[3]: 0
        din_R[4] = 255;       din_R[5] = -256;      // dout_R[4]: -1, dout_R[5]: 511
        din_R[6] = -256;      din_R[7] = 255;       // dout_R[6]: -1, dout_R[7]: -511

        // 나머지 R 입력에 임의의 값 설정
        for (int i = 8; i < DEPTH; i++) begin
            din_R[i] = i * 7;
        end

        // Q 입력에 임의의 값 설정
        for (int i = 0; i < DEPTH; i++) begin
            din_Q[i] = (i % 2 == 0) ? (i * 10) : -(i * 10);
        end

        @(posedge clk);
        #1ps;
        // 시뮬레이션 종료
        $finish;
    end

endmodule
