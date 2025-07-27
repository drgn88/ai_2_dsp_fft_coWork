`timescale 1ns / 1ps

module tb_cbfp_shift_reg;

    // DUT (Device Under Test)의 파라미터와 일치해야 합니다.
    localparam DATA_WIDTH = 9;
    localparam NUM_IN_OUT = 16;
    localparam REG_DEPTH  = 16;
    localparam CLK_PERIOD = 10; // 100MHz 클럭을 위한 10ns 주기

    // 테스트벤치 신호 선언
    logic clk;
    logic rstn;
    logic valid;
    logic pop;
    logic signed [DATA_WIDTH - 1:0] din_i[0:NUM_IN_OUT-1];
    logic signed [DATA_WIDTH - 1:0] din_q[0:NUM_IN_OUT-1];

    logic signed [DATA_WIDTH - 1:0] dout_i[0:NUM_IN_OUT-1];
    logic signed [DATA_WIDTH - 1:0] dout_q[0:NUM_IN_OUT-1];

    // DUT 내부 시프트 레지스터의 상태를 추적하기 위한 모델 (기대값 계산용)
    logic signed [DATA_WIDTH-1:0] tb_shift_reg_i[0:NUM_IN_OUT-1][0:REG_DEPTH-1];
    logic signed [DATA_WIDTH-1:0] tb_shift_reg_q[0:NUM_IN_OUT-1][0:REG_DEPTH-1];

    integer errors = 0; // 테스트 오류 카운터

    // DUT 인스턴스화
    cbfp_shift_reg #(.DATA_WIDTH(DATA_WIDTH), .NUM_IN_OUT(NUM_IN_OUT), .REG_DEPTH(REG_DEPTH)) dut (
        .clk(clk),
        .rstn(rstn),
        .valid(valid),
        .pop(pop),
        .din_i(din_i),
        .din_q(din_q),
        .dout_i(dout_i),
        .dout_q(dout_q)
    );

    // 클럭 생성
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // DUT 내부 시프트 레지스터와 동일하게 동작하는 모델
    // 이 모델의 상태를 기반으로 DUT의 출력을 예측합니다.
    always_ff @(posedge clk or negedge rstn) begin : tb_shift_model
        integer l_idx, m_idx;
        if (!rstn) begin
            // 리셋 시 모든 레지스터 0으로 초기화
            for (l_idx = 0; l_idx < NUM_IN_OUT; l_idx = l_idx + 1) begin
                for (m_idx = 0; m_idx < REG_DEPTH; m_idx = m_idx + 1) begin
                    tb_shift_reg_i[l_idx][m_idx] <= 0;
                    tb_shift_reg_q[l_idx][m_idx] <= 0;
                end
            end
        end else begin
            if (valid) begin
                // valid가 활성화되면 데이터 시프트
                for (l_idx = 0; l_idx < NUM_IN_OUT; l_idx = l_idx + 1) begin
                    for (m_idx = 0; m_idx < REG_DEPTH - 1; m_idx = m_idx + 1) begin
                        tb_shift_reg_i[l_idx][m_idx+1] <= tb_shift_reg_i[l_idx][m_idx];
                        tb_shift_reg_q[l_idx][m_idx+1] <= tb_shift_reg_q[l_idx][m_idx];
                    end
                end
                // 새로운 데이터 입력
                for (l_idx = 0; l_idx < NUM_IN_OUT; l_idx = l_idx + 1) begin
                    tb_shift_reg_i[l_idx][0] <= din_i[l_idx];
                    tb_shift_reg_q[l_idx][0] <= din_q[l_idx];
                end
            end
        end
    end

    // DUT 출력 확인 태스크
    task check_output;
        logic signed [DATA_WIDTH - 1:0] expected_dout_i[0:NUM_IN_OUT-1];
        logic signed [DATA_WIDTH - 1:0] expected_dout_q[0:NUM_IN_OUT-1];
        integer check_idx;

        // 'pop' 신호와 내부 모델 상태에 기반하여 기대 출력 계산
        if (pop) begin
            // pop이 활성화되면 시프트 레지스터의 가장 오래된 데이터를 기대값으로 설정
            for (check_idx = 0; check_idx < NUM_IN_OUT; check_idx = check_idx + 1) begin
                expected_dout_i[check_idx] = tb_shift_reg_i[check_idx][REG_DEPTH-1];
                expected_dout_q[check_idx] = tb_shift_reg_q[check_idx][REG_DEPTH-1];
            end
        end else begin
            // pop이 비활성화되면 기대값은 0 (모듈의 always_comb else 절과 일치)
            for (check_idx = 0; check_idx < NUM_IN_OUT; check_idx = check_idx + 1) begin
                expected_dout_i[check_idx] = '0;
                expected_dout_q[check_idx] = '0;
            end
        end

        // 조합 논리 출력이 안정화될 시간을 잠시 대기
        #1;

        // DUT 출력과 기대값 비교
        for (check_idx = 0; check_idx < NUM_IN_OUT; check_idx = check_idx + 1) begin
            if (dout_i[check_idx] !== expected_dout_i[check_idx] ||
                dout_q[check_idx] !== expected_dout_q[check_idx]) begin
                $error("MISMATCH at dout[%0d]: i_exp=%0d, i_act=%0d | q_exp=%0d, q_act=%0d (Time: %0t)",
                       check_idx, expected_dout_i[check_idx], dout_i[check_idx],
                       expected_dout_q[check_idx], dout_q[check_idx], $time);
                errors++;
            end
        end
        if (errors == 0) begin
            $display("MATCH at time %0t. pop=%0b, valid=%0b. dout_i[0]=%0d, dout_q[0]=%0d", $time, pop, valid, dout_i[0], dout_q[0]);
        end
    endtask


    // 테스트 시퀀스
    initial begin
        // 파형 덤프 설정 (GTKWave 등 파형 뷰어에서 확인 가능)
        $dumpfile("cbfp_shift_reg_tb.vcd");
        $dumpvars(0, tb_cbfp_shift_reg);

        // 신호 초기화
        clk = 0;
        rstn = 0;   // 리셋 인가 (active low)
        valid = 0;
        pop = 0;
        for (integer i = 0; i < NUM_IN_OUT; i = i + 1) begin
            din_i[i] = 0;
            din_q[i] = 0;
        end

        // 리셋 유지 (몇 클럭 주기 동안)
        #(CLK_PERIOD * 2);
        rstn = 1;   // 리셋 해제
        $display("--------------------------------------------------");
        $display("Reset deasserted. Starting cbfp_shift_reg test sequence.");
        $display("--------------------------------------------------");

        // Test 1: 데이터 시프트 (REG_DEPTH 만큼 클럭 사이클 돌려 시프트 레지스터 채우기)
        $display("\n--- Test 1: Shifting in initial data ---");
        for (integer k = 0; k < REG_DEPTH; k = k + 1) begin
            for (integer i = 0; i < NUM_IN_OUT; i = i + 1) begin
                // DATA_WIDTH=9이므로 -256 ~ 255 범위의 데이터
                din_i[i] = k * NUM_IN_OUT + i;
                din_q[i] = (k * NUM_IN_OUT + i) * -1;
            end
            valid = 1; // 시프트 활성화
            pop = 0;   // 아직 출력하지 않음
            @(posedge clk); // 클럭 상승 에지 대기
            check_output; // pop=0 이므로 출력은 0이어야 함
        end
        valid = 0; // 데이터 입력 중지

        // Test 2: 데이터가 완전히 시프트된 후 pop하여 출력 확인
        $display("\n--- Test 2: Popping out data after full shift ---");
        pop = 1; // pop 활성화
        @(posedge clk); // 클럭 상승 에지 대기
        check_output; // 시프트 레지스터에 가장 먼저 들어온 데이터 (k=0의 데이터)가 출력되어야 함
        pop = 0; // pop 비활성화

        // Test 3: 새로운 데이터 시프트 후 다시 pop하여 출력 확인
        $display("\n--- Test 3: Shift new data, then pop ---");
        for (integer k = 0; k < 2; k = k + 1) begin // 2개의 새로운 데이터 세트 시프트
            for (integer i = 0; i < NUM_IN_OUT; i = i + 1) begin
                din_i[i] = 100 + k * NUM_IN_OUT + i;
                din_q[i] = -(100 + k * NUM_IN_OUT + i);
            end
            valid = 1;
            pop = 0;
            @(posedge clk);
            check_output;
        end
        valid = 0;

        $display("\n--- Test 4: Check pop output after new data shifted in ---");
        pop = 1;
        @(posedge clk);
        // 이 시점에는 이전에 REG_DEPTH-2에 있던 데이터가 REG_DEPTH-1로 이동하여 출력되어야 함
        check_output;
        pop = 0;

        // Test 5: pop이 0일 때 출력이 0인지 확인
        $display("\n--- Test 5: Output should be 0 when pop is 0 ---");
        @(posedge clk); // 한 클럭 대기 (pop=0 상태 유지)
        check_output; // pop이 0이므로 출력은 0이어야 함

        // Test 6: 랜덤 데이터 입력 및 랜덤 pop/valid 활성화 테스트
        $display("\n--- Test 6: Random inputs and random pop/valid enable ---");
        for (integer test_num = 0; test_num < REG_DEPTH + 5; test_num = test_num + 1) begin
            $display("  Random Test %0d (cycle %0d):", test_num + 1, test_num);
            for (integer i = 0; i < NUM_IN_OUT; i = i + 1) begin
                // DATA_WIDTH 비트 범위 내에서 랜덤 signed 값 생성
                din_i[i] = $urandom_range(-(1<<(DATA_WIDTH-1)), (1<<(DATA_WIDTH-1))-1);
                din_q[i] = $urandom_range(-(1<<(DATA_WIDTH-1)), (1<<(DATA_WIDTH-1))-1);
            end
            valid = $urandom_range(0,1); // valid 랜덤 활성화
            pop = $urandom_range(0,1);   // pop 랜덤 활성화
            @(posedge clk);
            check_output;
        end


        // 최종 테스트 결과 요약
        $display("\n--------------------------------------------------");
        if (errors == 0) begin
            $display("TEST PASSED: All outputs matched expected values!");
        end else begin
            $display("TEST FAILED: %0d mismatches found.", errors);
        end
        $display("--------------------------------------------------");

        $finish; // 시뮬레이션 종료
    end

endmodule
