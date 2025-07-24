`timescale 1ns / 1ps

module tb_mul_fac8_0;

    // DUT (Device Under Test)와 동일한 파라미터 설정
    localparam WIDTH = 10; // 데이터 비트 폭
    localparam DEPTH = 16; // 배열의 깊이

    // 클럭 및 리셋, 인에이블 신호 선언
    logic clk;
    logic rst_n;
    logic en;

    // DUT 입력 포트와 연결될 신호 선언
    logic signed [WIDTH-1:0] din_R_add[DEPTH-1:0];
    logic signed [WIDTH-1:0] din_R_sub[DEPTH-1:0];
    logic signed [WIDTH-1:0] din_Q_add[DEPTH-1:0];
    logic signed [WIDTH-1:0] din_Q_sub[DEPTH-1:0];

    // DUT 출력 포트와 연결될 신호 선언
    logic signed [WIDTH-1:0] dout_R_add[DEPTH-1:0];
    logic signed [WIDTH-1:0] dout_R_sub[DEPTH-1:0];
    logic signed [WIDTH-1:0] dout_Q_add[DEPTH-1:0];
    logic signed [WIDTH-1:0] dout_Q_sub[DEPTH-1:0];

    // DUT 인스턴스화
    mul_fac8_0 #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
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

    // --- 클럭 생성 ---
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns 주기 (100MHz) 클럭 생성
    end

    // --- 테스트 시퀀스 ---
    initial begin
        // 시뮬레이션 초기화: 리셋 인가 및 초기 입력 설정
        rst_n = 0; // 리셋 상태
        en = 0;    // 초기 en 값
        
        // 모든 입력 배열에 임의의 초기 값 할당
        for (int i = 0; i < DEPTH; i++) begin
            din_R_add[i] = i * 5;
            din_R_sub[i] = i * 7 - 50; // 음수 값 포함
            din_Q_add[i] = i * 3 + 10;
            din_Q_sub[i] = (DEPTH - 1 - i) * 6 - 20; // 다양한 음수 값 포함
        end

        #10; // 리셋 상태를 10ns 유지
        rst_n = 1; // 리셋 해제

        $display("--------------------------------------------------------------------------------------------------------------------------------------------------------------------");
        $display("  Time  | En |       din_R_add        |       din_R_sub        |       din_Q_add        |       din_Q_sub        |       dout_R_add        |       dout_R_sub        |       dout_Q_add        |       dout_Q_sub        | Match?");
        $display("--------------------------------------------------------------------------------------------------------------------------------------------------------------------");

        // --- 테스트 케이스 1: en = 0 (Pass-through 모드) ---
        $display("\n--- Test Case 1: en = 0 (Pass-through Mode) ---");
        en = 0;
        #10; // 1 클럭 주기 대기하여 출력 업데이트

        for (int k = 0; k < DEPTH; k++) begin
            logic match_all = 1;
            $write("%6dns | %2d | %s", $time, en, format_input_array(din_R_add[k], din_R_sub[k], din_Q_add[k], din_Q_sub[k]));
            $write(" | %s", format_output_array(dout_R_add[k], dout_R_sub[k], dout_Q_add[k], dout_Q_sub[k]));
            
            // 예상 값과 실제 출력 비교
            if (dout_R_add[k] !== din_R_add[k]) match_all = 0;
            if (dout_R_sub[k] !== din_R_sub[k]) match_all = 0;
            if (dout_Q_add[k] !== din_Q_add[k]) match_all = 0;
            if (dout_Q_sub[k] !== din_Q_sub[k]) match_all = 0;

            $display(" | %s", match_all ? "PASS" : "FAIL");
        end
        $display("--------------------------------------------------------------------------------------------------------------------------------------------------------------------");

        // --- 테스트 케이스 2: en = 1 (R_sub/Q_sub 스왑 및 Q_sub 부호 변경 모드) ---
        $display("\n--- Test Case 2: en = 1 (R_sub/Q_sub Swap & Negate Mode) ---");
        en = 1;
        #10; // 1 클럭 주기 대기하여 출력 업데이트

        for (int k = 0; k < DEPTH; k++) begin
            logic match_all = 1;
            $write("%6dns | %2d | %s", $time, en, format_input_array(din_R_add[k], din_R_sub[k], din_Q_add[k], din_Q_sub[k]));
            $write(" | %s", format_output_array(dout_R_add[k], dout_R_sub[k], dout_Q_add[k], dout_Q_sub[k]));
            
            // 예상 값과 실제 출력 비교
            if (dout_R_add[k] !== din_R_add[k]) match_all = 0;
            if (dout_Q_add[k] !== din_Q_add[k]) match_all = 0;
            if (dout_R_sub[k] !== din_Q_sub[k]) match_all = 0; // 핵심 로직: dout_R_sub = din_Q_sub
            if (dout_Q_sub[k] !== -(din_R_sub[k])) match_all = 0; // 핵심 로직: dout_Q_sub = -(din_R_sub)

            $display(" | %s", match_all ? "PASS" : "FAIL");
        end
        $display("--------------------------------------------------------------------------------------------------------------------------------------------------------------------");

        #100; // 시뮬레이션 종료까지 추가 시간 제공
        $finish; // 시뮬레이션 종료
    end

    // --- 헬퍼 함수: 입력 배열 값 포맷팅 ---
    function string format_input_array(input signed [WIDTH-1:0] r_add, r_sub, q_add, q_sub);
        return $sformatf("R_add:%4d R_sub:%4d | Q_add:%4d Q_sub:%4d", r_add, r_sub, q_add, q_sub);
    endfunction

    // --- 헬퍼 함수: 출력 배열 값 포맷팅 ---
    function string format_output_array(input signed [WIDTH-1:0] r_add, r_sub, q_add, q_sub);
        return $sformatf("R_add:%4d R_sub:%4d | Q_add:%4d Q_sub:%4d", r_add, r_sub, q_add, q_sub);
    endfunction

endmodule
