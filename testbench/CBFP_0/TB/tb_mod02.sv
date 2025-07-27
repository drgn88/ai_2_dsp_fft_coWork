//////////////////////////////////////////////////////////////////////////
// valid 32clk high 검증
//////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps

module tb_dut();

    // Parameters
    localparam DATA_WIDTH = 9;
    localparam NUM_IN_OUT = 16;
    localparam FILE_DEPTH = 2048; // 시뮬레이션 시간을 연장하기 위해 FILE_DEPTH를 2048로 증가
    localparam CLK_PERIOD = 10;

    // DUT signals
    reg clk;
    reg rstn;
    reg signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1];
    reg signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1];
    reg valid; // valid 신호 추가

    // mod0_0의 출력 신호 (기존 DUT 연결 유지를 위해 남겨둠)
    wire signed [DATA_WIDTH:0] dout_R_add_00 [0:NUM_IN_OUT-1];
    wire signed [DATA_WIDTH:0] dout_R_sub_00 [0:NUM_IN_OUT-1];
    wire signed [DATA_WIDTH:0] dout_Q_add_00 [0:NUM_IN_OUT-1];
    wire signed [DATA_WIDTH:0] dout_Q_sub_00 [0:NUM_IN_OUT-1];

    // mod0_1의 최종 출력 신호 (이 신호들을 파일에 저장할 것임)
    wire signed [12:0] dout_R_add01 [0:15]; // 실수부 (Add 경로)
    wire signed [12:0] dout_Q_add01 [0:15]; // 허수부 (Add 경로)
    wire signed [12:0] dout_R_sub01 [0:15]; // 실수부 (Sub 경로)
    wire signed [12:0] dout_Q_sub01 [0:15]; // 허수부 (Sub 경로)

    wire alert_mod01;
    wire alert_mod02;

    // Internal signals and variables
    integer i, j; // 루프 카운터
    integer file_i, file_q; // 입력 파일 핸들
    integer file_real_out; // 실수부 출력을 위한 파일 핸들
    integer file_imag_out; // 허수부 출력을 위한 파일 핸들

    // 입력 데이터 저장을 위한 배열
    reg signed [DATA_WIDTH - 1:0] cos_i_data [0:FILE_DEPTH-1];
    reg signed [DATA_WIDTH - 1:0] cos_q_data [0:FILE_DEPTH-1];

    // 특정 값 감지 여부를 추적하는 플래그
    reg first_minus_one_detected;
    reg first_one_two_seven_detected;

    // 각 단계에서 기록된 샘플 수를 추적하는 카운터
    integer phase1_real_count; // 1단계 실수부 (1~256 인덱스)
    integer phase1_imag_count; // 1단계 허수부 (1~256 인덱스)
    integer phase2_real_count; // 2단계 실수부 (257~512 인덱스)
    integer phase2_imag_count; // 2단계 허수부 (257~512 인덱스)


    // DUT (Device Under Test) 인스턴스화
    mod0_0 #(.DATA_WIDTH(DATA_WIDTH), .NUM_IN_OUT(NUM_IN_OUT))
    DUT_MOD00 (
        .clk(clk),
        .rstn(rstn),
        .valid(valid), // valid 신호를 DUT에 연결
        .din_i(din_i),
        .din_q(din_q),
        .dout_R_add_00(dout_R_add_00),
        .dout_R_sub_00(dout_R_sub_00),
        .dout_Q_add_00(dout_Q_add_00),
        .dout_Q_sub_00(dout_Q_sub_00),
        .alert_mod01(alert_mod01)
    );

    mod0_1 DUT_MOD01(
        .clk(clk),
        .rstn(rstn),
        .alert_mod01(alert_mod01),
        .din_R_add00(dout_R_add_00),
        .din_Q_add00(dout_Q_add_00),
        .din_R_sub00(dout_R_sub_00),
        .din_Q_sub00(dout_Q_sub_00),

        .dout_R_add01(dout_R_add01),
        .dout_Q_add01(dout_Q_add01),
        .dout_R_sub01(dout_R_sub01),
        .dout_Q_sub01(dout_Q_sub01),
        .alert_mod02(alert_mod02)
    );

    // wire bf_en02;
    // wire mux_sel02;
    // wire [8:0] addr;
    // wire mul_en;
    // wire alert_CBFP;

    // cu_mod0_2 DUT_CU02(
	// .clk(clk),
	// .rstn(rstn),
	// .alert_mod02(alert_mod02),

    // .bf_en02(bf_en02),
	// .mux_sel02(mux_sel02),
	// .addr(addr),
	// .mul_en(mul_en),
	// .alert_CBFP(alert_CBFP)
    // );

    wire signed [22:0] dout_R_add02 [0:15];
	wire signed [22:0] dout_Q_add02 [0:15];
	wire signed [22:0] dout_R_sub02 [0:15];
	wire signed [22:0] dout_Q_sub02 [0:15];
    wire alert_CBFP;

    mod0_2 DUT_MOD02(
	.clk(clk),
	.rstn(rstn),
	.alert_mod02(alert_mod02),

	//bfly01 13bit <7.6>
	.din_R_add02(dout_R_add01),
	.din_Q_add02(dout_Q_add01), 
	.din_R_sub02(dout_R_sub01),
	.din_Q_sub02(dout_Q_sub01),

	//bfly02 23bit <10.13>
	.dout_R_add02(dout_R_add02),
	.dout_Q_add02(dout_Q_add02),
	.dout_R_sub02(dout_R_sub02),
	.dout_Q_sub02(dout_Q_sub02),

	.alert_CBFP(alert_CBFP)
    );

    // 클럭 생성
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // 테스트 스티뮬러스 (Test Stimulus)
    initial begin
        // 모든 신호를 초기 상태로 설정
        rstn = 1'b0;
        valid = 1'b0; // valid 신호를 low로 초기화
        for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
            din_i[i] = 0;
            din_q[i] = 0;
        end

        // 출력 제어를 위한 플래그 및 카운터 초기화
        first_minus_one_detected = 1'b0;
        first_one_two_seven_detected = 1'b0;
        phase1_real_count = 0;
        phase1_imag_count = 0;
        phase2_real_count = 0;
        phase2_imag_count = 0;

        // 입력 파일 열기
        // 주의: cos_i_dat.txt와 cos_q_dat.txt 파일도 FILE_DEPTH만큼 충분한 데이터를 가지고 있어야 합니다.
        file_i = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_i_dat.txt", "r");
        file_q = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_q_dat.txt", "r");
        
        // 출력 파일 열기 (실수부와 허수부 각각)
        file_real_out = $fopen("bfly01_real.txt", "w");
        if (file_real_out == 0) $display("Error: Could not open bfly01_real.txt");
        file_imag_out = $fopen("bfly01_imag.txt", "w");
        if (file_imag_out == 0) $display("Error: Could not open bfly01_imag.txt");

        // 입력 데이터 파일에서 읽기
        for (i = 0; i < FILE_DEPTH; i = i + 1) begin
            if ($fscanf(file_i, "%d\n", cos_i_data[i]) == 0) begin
                $display("Error: Failed to read from cos_i_dat.txt at index %0d", i);
                // 파일 끝에 도달했거나 읽기 오류 발생 시, 나머지 배열을 0으로 채울 수 있습니다.
                for (integer k = i; k < FILE_DEPTH; k = k + 1) begin
                    cos_i_data[k] = 0;
                    cos_q_data[k] = 0;
                end
                break; // 파일 읽기 루프 종료
            end
            if ($fscanf(file_q, "%d\n", cos_q_data[i]) == 0) begin
                $display("Error: Failed to read from cos_q_dat.txt at index %0d", i);
                for (integer k = i; k < FILE_DEPTH; k = k + 1) begin
                    cos_i_data[k] = 0;
                    cos_q_data[k] = 0;
                end
                break; // 파일 읽기 루프 종료
            end
        end

        // 입력 파일 닫기
        $fclose(file_i);
        $fclose(file_q);

        // 리셋 시퀀스 적용
        #(CLK_PERIOD * 2); // rstn 신호를 충분히 길게 유지
        rstn = 1'b1; // 리셋 해제
        
        // 리셋 해제 후 DUT가 안정화될 시간을 위해 한 클럭 사이클 대기
        @(posedge clk);
        
        // valid 신호를 high로 설정하고 첫 32 클럭 사이클 동안 유지
        valid = 1'b1;
        $display("Valid asserted at time %0t", $time);

        // 메인 스티뮬러스 루프: DUT에 입력 적용
        // 첫 32 클럭 사이클 동안 valid 신호를 high로 유지하며 입력 적용
        for (i = 0; i < 32 * NUM_IN_OUT; i = i + NUM_IN_OUT) begin
            // 새로운 입력 적용
            for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                // 배열 인덱스가 범위를 벗어나지 않도록 확인
                if ((i + j) < FILE_DEPTH) begin
                    din_i[j] = cos_i_data[i+j];
                    din_q[j] = cos_q_data[i+j];
                end else begin
                    // 입력 데이터가 부족하면 0으로 채움
                    din_i[j] = 0;
                    din_q[j] = 0;
                end
            end
            @(posedge clk); // DUT가 처리할 시간을 위해 한 클럭 사이클 대기
        end

        // 32 클럭 사이클 후 valid 신호를 low로 설정
        valid = 1'b0;
        $display("Valid deasserted at time %0t", $time);

        // 남은 FILE_DEPTH만큼 계속해서 입력 데이터 인가 (valid는 low 유지)
        for (; i < FILE_DEPTH; i = i + NUM_IN_OUT) begin
            // 새로운 입력 적용
            for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                if ((i + j) < FILE_DEPTH) begin
                    din_i[j] = cos_i_data[i+j];
                    din_q[j] = cos_q_data[i+j];
                end else begin
                    din_i[j] = 0;
                    din_q[j] = 0;
                end
            end
            @(posedge clk); // DUT가 처리할 시간을 위해 한 클럭 사이클 대기
        end

        // 모든 출력이 기록되었는지 확인 (총 512개 샘플)
        // 이 부분은 always 블록에서 카운트하므로, 여기서는 시뮬레이션 종료 조건으로만 사용
        // 충분한 시간이 지나면 $stop으로 시뮬레이션 종료
        repeat (100) @(posedge clk); // 모든 출력이 기록될 충분한 시간 대기
        if ((phase1_real_count >= 256 && phase1_imag_count >= 256) &&
            (phase2_real_count >= 256 && phase2_imag_count >= 256)) begin
            $display("All 512 outputs written. Finishing simulation.");
        end else begin
            $display("Warning: Not all 512 outputs were written. Check simulation time or output conditions.");
        end

        // 시뮬레이션 종료
        $fclose(file_real_out);
        $fclose(file_imag_out);
        @(posedge clk);
        $stop;
    end

    // 출력 쓰기 로직: 클럭의 양쪽 엣지마다 실행됩니다.
    always @(posedge clk) begin
        if (rstn) begin // 리셋 상태가 아닐 때만 동작
            // 1단계: -1 감지 및 이후 쓰기 (출력 1~256)
            if (!first_minus_one_detected) begin
                for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                    if (dout_R_add01[j] == -1) begin
                        first_minus_one_detected = 1'b1;
                        $display("First -1 in dout_R_add01 detected at time %0t. Starting Phase 1 file write.", $time);
                        // 이 사이클의 출력부터 쓰기를 시작할 수 있도록 break하지 않음
                    end
                end
            end

            if (first_minus_one_detected && (phase1_real_count < 256 || phase1_imag_count < 256)) begin
                for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                    // 실수부 파일 (bfly01_real.txt)에 쓰기
                    if (phase1_real_count < 256) begin
                        if (phase1_real_count < 128) begin
                            $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase1_real_count + 1, dout_R_add01[j]);
                        end else begin // phase1_real_count >= 128 and < 256
                            $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase1_real_count + 1, dout_R_sub01[j]);
                        end
                        phase1_real_count = phase1_real_count + 1;
                    end

                    // 허수부 파일 (bfly01_imag.txt)에 쓰기
                    if (phase1_imag_count < 256) begin
                        if (phase1_imag_count < 128) begin
                            $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase1_imag_count + 1, dout_Q_add01[j]);
                        end else begin // phase1_imag_count >= 128 and < 256
                            $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase1_imag_count + 1, dout_Q_sub01[j]);
                        end
                        phase1_imag_count = phase1_imag_count + 1;
                    end
                end
            end

            // 2단계: 127 감지 및 이후 쓰기 (출력 257~512)
            // 이 단계는 1단계와 독립적으로 시작될 수 있으며, 인덱스는 별개입니다.
            if (!first_one_two_seven_detected) begin
                for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                    if (dout_R_add01[j] == 127) begin
                        first_one_two_seven_detected = 1'b1;
                        $display("First 127 in dout_R_add01 detected at time %0t. Starting Phase 2 file write.", $time);
                        // 이 사이클의 출력부터 쓰기를 시작할 수 있도록 break하지 않음
                    end
                end
            end

            if (first_one_two_seven_detected && (phase2_real_count < 256 || phase2_imag_count < 256)) begin
                for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                    // 실수부 파일 (bfly01_real.txt)에 쓰기
                    if (phase2_real_count < 256) begin
                        if (phase2_real_count < 128) begin
                            $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase2_real_count + 257, dout_R_add01[j]);
                        end else begin // phase2_real_count >= 128 and < 256
                            $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase2_real_count + 257, dout_R_sub01[j]);
                        end
                        phase2_real_count = phase2_real_count + 1;
                    end

                    // 허수부 파일 (bfly01_imag.txt)에 쓰기
                    if (phase2_imag_count < 256) begin
                        if (phase2_imag_count < 128) begin
                            $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase2_imag_count + 257, dout_Q_add01[j]);
                        end else begin // phase2_imag_count >= 128 and < 256
                            $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase2_imag_count + 257, dout_Q_sub01[j]);
                        end
                        phase2_imag_count = phase2_imag_count + 1;
                    end
                end
            end
        end
    end
endmodule