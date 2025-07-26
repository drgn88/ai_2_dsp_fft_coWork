`timescale 1ns / 1ps // 시뮬레이션 시간 단위 설정

module tb_mul_fac8_2_fixed; // 모듈 이름 변경 (충돌 방지)

    // Parameter 정의 - mul_fac8_2 모듈의 파라미터와 일치해야 합니다.
    parameter WIDTH      = 13;                     // mul_fac8_2의 데이터 입력 폭
    parameter TWF_WIDTH  = 9;                      // 트위들 팩터 비트 폭 (mul_fac8_2 내부에서 사용)
    parameter DOUT_WIDTH = WIDTH + TWF_WIDTH + 1;  // mul_fac8_2의 출력 데이터 폭
    parameter DEPTH      = 16;                     // mul_fac8_2의 병렬 처리 깊이
    parameter ADDR_WIDTH = 9;                      // mul_fac8_2의 주소 비트 폭
    parameter OFFSET     = 64;                     // 오프셋 값 (mul_fac8_2 내부에서 사용)

    // 클럭 및 리셋 신호
    logic clk;
    logic rst_n; // 비동기 리셋 (active low)
    logic en;    // mul_fac8_2 활성화 신호

    // mul_fac8_2의 메인 주소 입력
    logic [ADDR_WIDTH-1:0] main_addr_sig;

    // mul_fac8_2의 데이터 입력 (DEPTH 크기의 배열)
    logic signed [WIDTH-1:0] din_R_add [DEPTH-1:0];
    logic signed [WIDTH-1:0] din_Q_add [DEPTH-1:0];
    logic signed [WIDTH-1:0] din_R_sub [DEPTH-1:0];
    logic signed [WIDTH-1:0] din_Q_sub [DEPTH-1:0];

    // mul_fac8_2의 데이터 출력 (DEPTH 크기의 배열)
    logic signed [DOUT_WIDTH-1:0] dout_R_add [DEPTH-1:0];
    logic signed [DOUT_WIDTH-1:0] dout_Q_add [DEPTH-1:0];
    logic signed [DOUT_WIDTH-1:0] dout_R_sub [DEPTH-1:0];
    logic signed [DOUT_WIDTH-1:0] dout_Q_sub [DEPTH-1:0];

    // mul_fac8_2 모듈 인스턴스화
    // mul_fac8_2가 이미 내부적으로 ROM을 포함하므로,
    // twiddle_fac_X_X 입력 포트는 더 이상 여기에 연결되지 않습니다.
    mul_fac8_2 #(
        .WIDTH(WIDTH),
        .TWF_WIDTH(TWF_WIDTH),
        .DOUT_WIDTH(DOUT_WIDTH),
        .DEPTH(DEPTH),
        .ADDR_WIDTH(ADDR_WIDTH),
        .OFFSET(OFFSET)
    ) u_mul_fac8_2 (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .addr(main_addr_sig), // mul_fac8_2의 주소 입력
        .din_R_add(din_R_add),
        .din_Q_add(din_Q_add),
        .din_R_sub(din_R_sub),
        .din_Q_sub(din_Q_sub),
        .dout_R_add(dout_R_add),
        .dout_Q_add(dout_Q_add),
        .dout_R_sub(dout_R_sub),
        .dout_Q_sub(dout_Q_sub)
    );

    // 클럭 생성 (100 MHz 클럭, 주기 10ns)
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 테스트 시퀀스
    initial begin
        // 초기화
        rst_n = 0; // 리셋 활성화
        en = 0;    // mul_fac8_2 비활성화
        main_addr_sig = 0; // 초기 주소

        // 모든 입력 데이터 초기화
        for (int j = 0; j < DEPTH; j++) begin
            din_R_add[j] = 0;
            din_Q_add[j] = 0;
            din_R_sub[j] = 0;
            din_Q_sub[j] = 0;
        end

        #10 rst_n = 1; // 10ns 후 리셋 해제
        #10; // 리셋 해제 후 안정화 대기

        $display("-------------------------------------------------------");
        $display("리셋 후 초기 상태:");
        for (int j = 0; j < DEPTH; j++) begin
            $display("  din_R_add[%0d]=%d, dout_R_add[%0d]=%d",
                     j, din_R_add[j], j, dout_R_add[j]);
        end
        $display("-------------------------------------------------------");

        // 테스트 케이스 1: 특정 주소에 대한 곱셈 수행
        main_addr_sig = 9'd0; // mul_fac8_2 내부 ROM에 전달될 주소 설정
        en = 1;               // mul_fac8_2 활성화

        // 모든 병렬 입력에 샘플 데이터 적용 (DEPTH=16)
        for (int j = 0; j < DEPTH; j++) begin
            din_R_add[j] = 13'd100 + j; // 실수부 입력 (예시 값)
            din_Q_add[j] = 13'd50 + j;  // 허수부 입력 (예시 값)
            din_R_sub[j] = 13'd200 - j; // 실수부 입력 (예시 값)
            din_Q_sub[j] = 13'd75 - j;  // 허수부 입력 (예시 값)
        end

        #10; // 1 클럭 사이클 대기 (mul_fac8_2는 클럭에 동기화되어 동작)

        $display("-------------------------------------------------------");
        $display("테스트 케이스 1: main_addr_sig=%0d", main_addr_sig);
        for (int j = 0; j < DEPTH; j++) begin
            $display("  DIN[%0d]: R_add=%d, Q_add=%d, R_sub=%d, Q_sub=%d", j, din_R_add[j], din_Q_add[j], din_R_sub[j], din_Q_sub[j]);
            $display("  DOUT[%0d]: R_add=%d, Q_add=%d, R_sub=%d, Q_sub=%d", j, dout_R_add[j], dout_Q_add[j], dout_R_sub[j], dout_Q_sub[j]);
        end
        $display("-------------------------------------------------------");


        // 테스트 케이스 2: 주소와 입력을 변경하여 곱셈 수행
        main_addr_sig = 9'd377; // 새로운 mul_fac8_2 내부 ROM 주소 설정
        for (int j = 0; j < DEPTH; j++) begin
            din_R_add[j] = 13'd10 + j;
            din_Q_add[j] = 13'd20 + j;
            din_R_sub[j] = 13'd30 + j;
            din_Q_sub[j] = 13'd40 + j;
        end
        #10; // 1 클럭 사이클 대기

        $display("-------------------------------------------------------");
        $display("테스트 케이스 2: main_addr_sig=%0d", main_addr_sig);
        for (int j = 0; j < DEPTH; j++) begin
            $display("  DIN[%0d]: R_add=%d, Q_add=%d, R_sub=%d, Q_sub=%d", j, din_R_add[j], din_Q_add[j], din_R_sub[j], din_Q_sub[j]);
            $display("  DOUT[%0d]: R_add=%d, Q_add=%d, R_sub=%d, Q_sub=%d", j, dout_R_add[j], dout_Q_add[j], dout_R_sub[j], dout_Q_sub[j]);
        end
        $display("-------------------------------------------------------");

        #100; // 시뮬레이션 추가 진행
        $finish; // 시뮬레이션 종료
    end

    // 선택적: waveform 디버깅을 위한 모니터링 (주석 처리됨)
    // initial begin
    //     $dumpfile("tb_mul_fac8_2_fixed.vcd"); // waveform 파일 생성
    //     $dumpvars(0, tb_mul_fac8_2_fixed);     // 모든 변수 덤프
    // end

endmodule
