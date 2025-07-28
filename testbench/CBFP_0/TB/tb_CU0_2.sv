// `timescale 1ns/1ps

// module tb_mod1_0 ( );

// 	logic clk;
// 	logic rstn;
	
// 	logic signed [8:0] din_i [0:15];
// 	logic signed [8:0] din_q [0:15];

// 	logic signed [9:0] dout_R_add_00 [0:15];
// 	logic signed [9:0] dout_R_sub_00 [0:15];
// 	logic signed [9:0] dout_Q_add_00 [0:15];
// 	logic signed [9:0] dout_Q_sub_00 [0:15];

// 	logic signed [12:0] dout_R_add_01 [0:15];
// 	logic signed [12:0] dout_R_sub_01 [0:15];
// 	logic signed [12:0] dout_Q_add_01 [0:15];
// 	logic signed [12:0] dout_Q_sub_01 [0:15];

// 	logic alert_mod01;
// 	logic alert_mod02;
	
// 	mod0_0 #(
// 	.DATA_WIDTH(9),
// 	.NUM_IN_OUT(16)
// 	) DUT_MOD00(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.din_i(din_i),
// 	.din_q(din_q),

// 	.dout_R_add_00(dout_R_add_00),
// 	.dout_R_sub_00(dout_R_sub_00),
// 	.dout_Q_add_00(dout_Q_add_00),
// 	.dout_Q_sub_00(dout_Q_sub_00),

// 	.alert_mod01(alert_mod01)
// 	);

// 	mod0_1 DUT_MOD01(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.alert_mod01(alert_mod01),

// 	.din_R_add00(dout_R_add_00),
// 	.din_Q_add00(dout_Q_add_00),
// 	.din_R_sub00(dout_R_sub_00),
// 	.din_Q_sub00(dout_Q_sub_00),

// 	.dout_R_add01(dout_R_add_01),
// 	.dout_Q_add01(dout_Q_add_01),
// 	.dout_R_sub01(dout_R_sub_01),
// 	.dout_Q_sub01(dout_Q_sub_01),

// 	.alert_mod02(alert_mod02)
// 	);

// endmodule

// `timescale 1ns/1ps

// module tb_mod1_0 ( );

//     // 파라미터 정의 (인스턴스화에 사용된 값들과 일치시킵니다)
//     localparam DATA_WIDTH = 9;   // mod0_0의 입력 데이터 폭 (8:0 = 9비트)
//     localparam NUM_IN_OUT = 16;  // 모듈의 동시 입출력 개수
//     localparam NUM_SAMPLES = 512; // 전체 샘플 개수 (출력할 데이터 수)
//     localparam CLK_PERIOD = 10;  // 클럭 주기 (10ns)

// 	logic clk;  // 클럭 신호
// 	logic rstn; // 리셋 신호 (액티브 로우)
	
// 	// DUT (Design Under Test) 공통 입력 신호 (mod0_0의 입력) - 사용자 제공 그대로
// 	logic signed [8:0] din_i [0:15]; // I 채널 입력
// 	logic signed [8:0] din_q [0:15]; // Q 채널 입력

// 	// mod0_0 모듈의 출력 신호 (mod0_1의 입력이 됨) - 사용자 제공 그대로
// 	logic signed [9:0] dout_R_add_00 [0:15];
// 	logic signed [9:0] dout_R_sub_00 [0:15];
// 	logic signed [9:0] dout_Q_add_00 [0:15];
// 	logic signed [9:0] dout_Q_sub_00 [0:15];

// 	// mod0_1 모듈의 최종 출력 신호 (bfly01 값으로 사용됨) - 사용자 제공 그대로
// 	logic signed [12:0] dout_R_add_01 [0:15];
// 	logic signed [12:0] dout_R_sub_01 [0:15];
// 	logic signed [12:0] dout_Q_add_01 [0:15];
// 	logic signed [12:0] dout_Q_sub_01 [0:15];

// 	// alert 신호 - 사용자 제공 그대로 유지
// 	logic alert_mod01;
// 	logic alert_mod02;
	
//     // 파일 핸들링 및 루프 변수
//     integer i, j, k;
//     integer real_file, imag_file, output_file;
//     integer scan_real, scan_imag;
//     integer bfly_current_idx = 1; // bfly01.txt 형식에 맞춰 인덱스 1부터 시작

//     // 입력 데이터를 저장할 배열 (총 512개 샘플)
//     reg signed [DATA_WIDTH - 1:0] cos_i_data [0:NUM_SAMPLES-1];
//     reg signed [DATA_WIDTH - 1:0] cos_q_data [0:NUM_SAMPLES-1];


// 	// mod0_0 인스턴스화 (사용자 제공 코드 그대로 유지)
// 	mod0_0 #(
// 	.DATA_WIDTH(9),
// 	.NUM_IN_OUT(16)
// 	) DUT_MOD00(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.din_i(din_i),
// 	.din_q(din_q),

// 	.dout_R_add_00(dout_R_add_00),
// 	.dout_R_sub_00(dout_R_sub_00),
// 	.dout_Q_add_00(dout_Q_add_00),
// 	.dout_Q_sub_00(dout_Q_sub_00),

// 	.alert_mod01(alert_mod01) // alert_mod01 신호 연결 유지
// 	);

// 	// mod0_1 인스턴스화 (사용자 제공 코드 그대로 유지)
// 	mod0_1 DUT_MOD01(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.alert_mod01(alert_mod01), // alert_mod01 신호 연결 유지

// 	.din_R_add00(dout_R_add_00), // mod0_0의 출력을 mod0_1의 입력으로 연결
// 	.din_Q_add00(dout_Q_add_00), // mod0_0의 출력을 mod0_1의 입력으로 연결
// 	.din_R_sub00(dout_R_sub_00), // mod0_0의 출력을 mod0_1의 입력으로 연결
// 	.din_Q_sub00(dout_Q_sub_00), // mod0_0의 출력을 mod0_1의 입력으로 연결

// 	.dout_R_add01(dout_R_add_01), // mod0_1의 최종 출력
// 	.dout_Q_add01(dout_Q_add_01), // mod0_1의 최종 출력
// 	.dout_R_sub01(dout_R_sub_01),
// 	.dout_Q_sub01(dout_Q_sub_01),

// 	.alert_mod02(alert_mod02) // alert_mod02 신호 연결 유지
// 	);

//     // 클럭 생성
//     always # (CLK_PERIOD / 2) clk = ~clk;

//     // 테스트 시퀀스
//     initial begin
//         // 0ms에서 din_i와 din_q를 0으로 초기화
//         clk = 0;
//         rstn = 0;
//         for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
//             din_i[i] = 0;
//             din_q[i] = 0;
//         end

//         // 입력 및 출력 파일 열기
//         real_file = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_i_dat.txt", "r");
//         imag_file = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_q_dat.txt", "r");
//         output_file = $fopen("bfly01_tb_output.txt", "w"); // bfly01 최종 출력 파일

//         // 파일 열기 오류 확인
//         if (!real_file || !imag_file || !output_file) begin
//             $display("ERROR: 입력 또는 출력 파일을 열 수 없습니다. 파일이 존재하거나 경로가 올바른지 확인하세요.");
//             $finish;
//         end

//         // 파형 덤프 설정 (시뮬레이션 파형 확인용)
//         $dumpfile("tb_mod0_1.vcd");
//         $dumpvars(0, tb_mod1_0); // 현재 모듈의 모든 신호 덤프

//         // cos_i_dat.txt 및 cos_q_dat.txt에서 모든 입력 데이터를 배열로 읽어오기
//         for (i = 0; i < NUM_SAMPLES; i = i + 1) begin
//             if (!$feof(real_file)) begin
//                 scan_real = $fscanf(real_file, "%d\n", cos_i_data[i]);
//             end else begin
//                 $display("경고: cos_i_dat.txt 파일의 끝에 조기 도달했습니다.");
//                 break;
//             end
//             if (!$feof(imag_file)) begin
//                 scan_imag = $fscanf(imag_file, "%d\n", cos_q_data[i]);
//             end else begin
//                 $display("경고: cos_q_dat.txt 파일의 끝에 조기 도달했습니다.");
//                 break;
//             end
//         end

//         // 입력 파일 닫기
//         $fclose(real_file);
//         $fclose(imag_file);

//         // 리셋 해제 시퀀스
//         #CLK_PERIOD; // 1 클럭 주기 대기
//         rstn = 1;    // 리셋 해제
//         #CLK_PERIOD; // 리셋 해제 후 1 클럭 주기 대기

//         // 입력 적용 및 출력 캡처 루프
//         // 총 NUM_SAMPLES/NUM_IN_OUT (512/16 = 32)번 반복하여 모든 샘플 처리
//         for (k = 0; k < (NUM_SAMPLES / NUM_IN_OUT); k = k + 1) begin
//             // 현재 반복의 NUM_IN_OUT개 데이터 포인트 적용
//             for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
//                 din_i[i] = cos_i_data[k * NUM_IN_OUT + i];
//                 din_q[i] = cos_q_data[k * NUM_IN_OUT + i];
//             end
            
//             // DUT가 처리할 수 있도록 1 클럭 주기 대기 (mod0_0 및 mod0_1이 순차적으로 처리)
//             @(posedge clk);

//             // bfly01_tb_output.txt 파일에 출력 쓰기
//             // bfly01.txt 형식과 동일하게 bfly01(인덱스)=실수+j허수 형식으로만 저장
//             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                 $fwrite(output_file, "bfly01(%d)=%d+j%d\n",
//                     bfly_current_idx,      // 현재 출력 인덱스
//                     dout_R_add_01[j],      // bfly01의 실수부
//                     dout_Q_add_01[j]       // bfly01의 허수부
//                 );
//                 bfly_current_idx = bfly_current_idx + 1; // 다음 출력을 위한 인덱스 증가
//             end
//         end
        
//         // 시뮬레이션 종료 전 몇 클럭 주기 추가 대기
//         #(CLK_PERIOD * 5); // 에러 수정: 괄호 추가
//         $display("시뮬레이션이 완료되었습니다. 출력은 bfly01_tb_output.txt 파일에 저장되었습니다.");
//         $fclose(output_file); // 출력 파일 닫기
//         $stop; // 시뮬레이션 종료
//     end

// endmodule

// `timescale 1ns/1ps

// module tb_mod1_0 ( );

//     // Parameter definitions (matching values used for instantiation)
//     localparam DATA_WIDTH = 9;   // Input data width for mod0_0 (8:0 = 9 bits)
//     localparam NUM_IN_OUT = 16;  // Number of simultaneous inputs/outputs for the module
//     localparam NUM_SAMPLES = 512; // Total number of samples to output
//     localparam CLK_PERIOD = 10;  // Clock period (10ns)

//     logic clk;  // Clock signal
//     logic rstn; // Reset signal (active low)
    
//     // DUT (Design Under Test) common input signals (inputs to mod0_0) - kept as provided by user
//     logic signed [8:0] din_i [0:15]; // I channel input
//     logic signed [8:0] din_q [0:15]; // Q channel input

//     // Output signals of mod0_0 module (become inputs to mod0_1) - kept as provided by user
//     logic signed [9:0] dout_R_add_00 [0:15];
//     logic signed [9:0] dout_R_sub_00 [0:15];
//     logic signed [9:0] dout_Q_add_00 [0:15];
//     logic signed [9:0] dout_Q_sub_00 [0:15];

//     // Final output signals of mod0_1 module (used as bfly01 values) - kept as provided by user
//     logic signed [12:0] dout_R_add_01 [0:15];
//     logic signed [12:0] dout_R_sub_01 [0:15];
//     logic signed [12:0] dout_Q_add_01 [0:15];
//     logic signed [12:0] dout_Q_sub_01 [0:15];

//     // Alert signals - kept as provided by user
//     logic alert_mod01;
//     logic alert_mod02;
    
//     // File handling and loop variables
//     integer i, j, k;
//     integer real_file, imag_file, output_file;
//     integer scan_real, scan_imag;
//     integer bfly_current_idx; // Index for bfly01 output, reset when saving starts

//     // Variables for conditional output saving
//     logic start_saving_output; // Flag to indicate when to start saving outputs
//     integer saved_output_count; // Counter for the number of outputs saved

//     // Arrays to store input data (total 512 samples)
//     reg signed [DATA_WIDTH - 1:0] cos_i_data [0:NUM_SAMPLES-1];
//     reg signed [DATA_WIDTH - 1:0] cos_q_data [0:NUM_SAMPLES-1];


//     // mod0_0 instantiation (kept as provided by user)
//     mod0_0 #(
//     .DATA_WIDTH(9),
//     .NUM_IN_OUT(16)
//     ) DUT_MOD00(
//     .clk(clk),
//     .rstn(rstn),
//     .din_i(din_i),
//     .din_q(din_q),

//     .dout_R_add_00(dout_R_add_00),
//     .dout_R_sub_00(dout_R_sub_00),
//     .dout_Q_add_00(dout_Q_add_00),
//     .dout_Q_sub_00(dout_Q_sub_00),

//     .alert_mod01(alert_mod01) // Maintain alert_mod01 signal connection
//     );

//     // mod0_1 instantiation (kept as provided by user)
//     mod0_1 DUT_MOD01(
//     .clk(clk),
//     .rstn(rstn),
//     .alert_mod01(alert_mod01), // Maintain alert_mod01 signal connection

//     .din_R_add00(dout_R_add_00), // Connect mod0_0 outputs to mod0_1 inputs
//     .din_Q_add00(dout_Q_add_00), // Connect mod0_0 outputs to mod0_1 inputs
//     .din_R_sub00(dout_R_sub_00), // Connect mod0_0 outputs to mod0_1 inputs
//     .din_Q_sub00(dout_Q_sub_00), // Connect mod0_0 outputs to mod0_1 inputs

//     .dout_R_add01(dout_R_add_01), // Final output of mod0_1
//     .dout_Q_add01(dout_Q_add_01), // Final output of mod0_1
//     .dout_R_sub01(dout_R_sub_01),
//     .dout_Q_sub01(dout_Q_sub_01),

//     .alert_mod02(alert_mod02) // Maintain alert_mod02 signal connection
//     );

//     // Clock generation
//     always # (CLK_PERIOD / 2) clk = ~clk;

//     // Test sequence
//     initial begin
//         // Initialize din_i and din_q to 0 at 0ms
//         clk = 0;
//         rstn = 0;
//         for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
//             din_i[i] = 0;
//             din_q[i] = 0;
//         end

//         // Initialize output saving flags
//         start_saving_output = 0;
//         saved_output_count = 0;
//         bfly_current_idx = 1; // Initialize, will be reset to 1 when saving actually starts

//         // Open input and output files
//         real_file = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_i_dat.txt", "r");
//         imag_file = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_q_dat.txt", "r");
//         output_file = $fopen("bfly01_tb_output.txt", "w"); // bfly01 final output file

//         // Check for file opening errors
//         if (!real_file || !imag_file || !output_file) begin
//             $display("ERROR: Could not open input or output files. Please check if files exist or paths are correct.");
//             $finish;
//         end

//         // Waveform dump setup (for simulation waveform verification)
//         $dumpfile("tb_mod0_1.vcd");
//         $dumpvars(0, tb_mod1_0); // Dump all signals of the current module

//         // Read all input data into arrays from cos_i_dat.txt and cos_q_dat.txt
//         for (i = 0; i < NUM_SAMPLES; i = i + 1) begin
//             if (!$feof(real_file)) begin
//                 scan_real = $fscanf(real_file, "%d\n", cos_i_data[i]);
//             end else begin
//                 $display("WARNING: Reached end of cos_i_dat.txt prematurely.");
//                 break;
//             end // Added missing 'end' here
//             if (!$feof(imag_file)) begin
//                 scan_imag = $fscanf(imag_file, "%d\n", cos_q_data[i]);
// 			end
//             else begin
//                 $display("WARNING: Reached end of cos_q_dat.txt prematurely.");
//                 break;
//             end // Added missing 'end' here
//         end

//         // Close input files
//         $fclose(real_file);
//         $fclose(imag_file);

//         // Reset deassertion sequence
//         #CLK_PERIOD; // Wait for 1 clock cycle
//         rstn = 1;    // Deassert reset
//         #CLK_PERIOD; // Wait for 1 clock cycle after reset deassertion

//         // Apply inputs and capture outputs loop
//         // Repeat iterations to ensure all samples are processed and outputs captured, accounting for potential pipeline delays.
//         // The loop runs for twice the number of input batches to allow sufficient time for output stabilization.
//         for (k = 0; k < (NUM_SAMPLES / NUM_IN_OUT) * 2; k = k + 1) begin 
//             // Apply NUM_IN_OUT data points for the current iteration
//             // Ensure k * NUM_IN_OUT + i does not exceed NUM_SAMPLES - 1
//             if (k * NUM_IN_OUT < NUM_SAMPLES) begin
//                 for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
//                     if ((k * NUM_IN_OUT + i) < NUM_SAMPLES) begin
//                         din_i[i] = cos_i_data[k * NUM_IN_OUT + i];
//                         din_q[i] = cos_q_data[k * NUM_IN_OUT + i];
//                     end else begin
//                         // If we run out of input data, keep inputs at 0
//                         din_i[i] = 0;
//                         din_q[i] = 0;
//                     end
//                 end
//             end else begin
//                 // No more input data, keep inputs at 0
//                 for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
//                     din_i[i] = 0;
//                     din_q[i] = 0;
//                 end
//             end
            
//             // Wait for 1 clock cycle for DUT to process (mod0_0 and mod0_1 process sequentially)
//             @(posedge clk);

//             // Conditional output saving
//             if (start_saving_output == 0) begin
//                 // Check if dout_R_add_01[0] or dout_Q_add_01[0] is not 0 and not X
//                 if ((dout_R_add_01[0] !== 13'bX && dout_R_add_01[0] !== 0) ||
//                     (dout_Q_add_01[0] !== 13'bX && dout_Q_add_01[0] !== 0)) begin
//                     start_saving_output = 1;
//                     bfly_current_idx = 1; // Reset index to 1 for the first saved output
//                     $display("INFO: Non-zero/non-X output detected. Starting to save outputs.");
//                 end
//             end
            
//             if (start_saving_output == 1 && saved_output_count < NUM_SAMPLES) begin
//                 // Write output to bfly01_tb_output.txt file
//                 // Save only in bfly01(index)=real+jimagin format, identical to bfly01.txt
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     if (saved_output_count < NUM_SAMPLES) begin
//                         $fwrite(output_file, "bfly01(%d)=%d+j%d\n",
//                             bfly_current_idx,      // Current output index
//                             dout_R_add_01[j],      // Real part of bfly01
//                             dout_Q_add_01[j]       // Imaginary part of bfly01
//                         );
//                         bfly_current_idx = bfly_current_idx + 1; // Increment index for next output
//                         saved_output_count = saved_output_count + 1; // Increment saved count
//                     end else begin
//                         break; // Stop writing if NUM_SAMPLES outputs have been saved
//                     end
//                 end
//             end
//         end
        
//         // Wait for a few more clock cycles before ending simulation
//         #(CLK_PERIOD * 5);
//         $display("Simulation completed. Output saved to bfly01_tb_output.txt file.");
//         $fclose(output_file); // Close output file
//         $stop; // End simulation
//     end
	

// endmodule

///////////////////////////////////////////////////////////////////
//마지막으로 확인한 정상 시뮬레이션
///////////////////////////////////////////////////////////////////
// `timescale 1ns / 1ps

// module tb_dut();

//     // Parameters
//     localparam DATA_WIDTH = 9;
//     localparam NUM_IN_OUT = 16;
//     localparam FILE_DEPTH = 512;
//     localparam CLK_PERIOD = 10;

//     // DUT signals
//     reg clk;
//     reg rstn;
//     reg signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1];
//     reg signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1];

//     wire signed [DATA_WIDTH:0] dout_R_add_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_R_sub_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_Q_add_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_Q_sub_00 [0:NUM_IN_OUT-1];

// 	wire signed [12:0] dout_R_add01 [0:15];
// 	wire signed [12:0] dout_Q_add01 [0:15];
// 	wire signed [12:0] dout_R_sub01 [0:15];
// 	wire signed [12:0] dout_Q_sub01 [0:15];

//     wire alert_mod01;
//     wire alert_mod02;

//     // Internal signals and variables
//     integer i, j, k;
//     integer file_i, file_q, file_out;
//     reg signed [DATA_WIDTH - 1:0] cos_i_data [0:FILE_DEPTH-1];
//     reg signed [DATA_WIDTH - 1:0] cos_q_data [0:FILE_DEPTH-1];

//     // Variable to track if non-zero output has started
//     reg first_non_zero_detected;
//     integer bfly_current_idx; // To count indices from 1 for output file

//     // Instantiate the DUT
//     mod0_0 #(.DATA_WIDTH(DATA_WIDTH), .NUM_IN_OUT(NUM_IN_OUT))
//     DUT_MOD00 (
//         .clk(clk),
//         .rstn(rstn),
//         .din_i(din_i),
//         .din_q(din_q),
//         .dout_R_add_00(dout_R_add_00),
//         .dout_R_sub_00(dout_R_sub_00),
//         .dout_Q_add_00(dout_Q_add_00),
//         .dout_Q_sub_00(dout_Q_sub_00),

//         .alert_mod01(alert_mod01)
//     );

// 	mod0_1 DUT_MOD01(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.alert_mod01(alert_mod01),

// 	.din_R_add00(dout_R_add_00),
// 	.din_Q_add00(dout_Q_add_00),
// 	.din_R_sub00(dout_R_sub_00),
// 	.din_Q_sub00(dout_Q_sub_00),

// 	.dout_R_add01(dout_R_add01),
// 	.dout_Q_add01(dout_Q_add01),
// 	.dout_R_sub01(dout_R_sub01),
// 	.dout_Q_sub01(dout_Q_sub01),

// 	.alert_mod02(alert_mod02)
// 	);

    

//     // Clock generation
//     initial begin
//         clk = 0;
//         forever #(CLK_PERIOD/2) clk = ~clk;
//     end

//     // Test stimulus
//     initial begin
//         // Initialize all signals to a known state
//         rstn = 1'b0;
//         for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
//             din_i[i] = 0;
//             din_q[i] = 0;
//         end

//         // Initialize flags for output control
//         first_non_zero_detected = 1'b0;
//         bfly_current_idx = 1; // Start counting from 1 for bfly00 index

//         // Open input files
//         file_i = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_i_dat.txt", "r");
//         file_q = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_q_dat.txt", "r");
        
//         // Open output file (will write only after first non-zero)
//         file_out = $fopen("mod0_0_output.txt", "w");
//         if (file_out == 0) $display("Error: Could not open mod0_0_output.txt");

//         // Read input data from files
//         for (i = 0; i < FILE_DEPTH; i = i + 1) begin
//             // It's good practice to check if $fscanf successfully reads values
//             if ($fscanf(file_i, "%d\n", cos_i_data[i]) == 0) begin
//                 $display("Error: Failed to read from cos_i_dat.txt at index %d", i);
//                 $finish;
//             end
//             if ($fscanf(file_q, "%d\n", cos_q_data[i]) == 0) begin
//                 $display("Error: Failed to read from cos_q_dat.txt at index %d", i);
//                 $finish;
//             end
//         end

//         // Close input files
//         $fclose(file_i);
//         $fclose(file_q);

//         // Apply reset sequence
//         #(CLK_PERIOD * 2); // rstn을 충분히 길게 유지
//         rstn = 1'b1;
        
//         // Wait one more clock cycle to ensure stable state after reset
//         @(posedge clk);
        
//         // Main stimulus loop
//         for (i = 0; i < FILE_DEPTH; i = i + NUM_IN_OUT) begin
//             // Apply new inputs
//             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                 din_i[j] = cos_i_data[i+j];
//                 din_q[j] = cos_q_data[i+j];
//             end
            
//             // Wait for one clock cycle for the DUT to process
//             @(posedge clk);

//             // Check if any dout_R_add_00 element is non-zero
//             if (!first_non_zero_detected) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     if (dout_R_add_00[j] != 0) begin
//                         first_non_zero_detected = 1'b1;
//                         $display("First non-zero output detected at time %0t. Starting file write.", $time);
//                         break; // Exit this inner loop once detected
//                     end
//                 end
//             end

//             // Write outputs to file only if non-zero output has been detected
//             if (first_non_zero_detected) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     $fwrite(file_out, "bfly00_tmp(%d)=%d+j%d, bfly00(%d)=%d+j%d\n",
//                         bfly_current_idx, // Use the new index
//                         dout_R_add_00[j], 
//                         dout_Q_add_00[j],
//                         bfly_current_idx, // Use the new index
//                         dout_R_sub_00[j],
//                         dout_Q_sub_00[j]
//                     );
//                     bfly_current_idx = bfly_current_idx + 1; // Increment for next output
//                 end
//             end
//         end

//         // Finish simulation
//         $fclose(file_out);
//         @(posedge clk);
//         $stop;
//     end
// endmodule

// `timescale 1ns / 1ps

// module tb_dut();

//     // Parameters
//     localparam DATA_WIDTH = 9;
//     localparam NUM_IN_OUT = 16;
//     localparam FILE_DEPTH = 512; // 총 512개의 출력을 저장할 예정
//     localparam CLK_PERIOD = 10;

//     // DUT signals
//     reg clk;
//     reg rstn;
//     reg signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1];
//     reg signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1];

//     // mod0_0의 출력 신호 (기존 DUT 연결 유지를 위해 남겨둠)
//     wire signed [DATA_WIDTH:0] dout_R_add_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_R_sub_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_Q_add_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_Q_sub_00 [0:NUM_IN_OUT-1];

//     // mod0_1의 최종 출력 신호 (이 신호들을 파일에 저장할 것임)
//     wire signed [12:0] dout_R_add01 [0:15]; // 실수부 (Real part)
//     wire signed [12:0] dout_Q_add01 [0:15]; // 허수부 (Imaginary part)
//     wire signed [12:0] dout_R_sub01 [0:15]; // 사용하지 않지만 DUT 연결을 위해 유지
//     wire signed [12:0] dout_Q_sub01 [0:15]; // 사용하지 않지만 DUT 연결을 위해 유지

//     wire alert_mod01;
//     wire alert_mod02;

//     // Internal signals and variables
//     integer i, j; // 루프 카운터
//     integer file_i, file_q; // 입력 파일 핸들
//     integer file_real_out; // 실수부 출력을 위한 파일 핸들
//     integer file_imag_out; // 허수부 출력을 위한 파일 핸들

//     // 입력 데이터 저장을 위한 배열
//     reg signed [DATA_WIDTH - 1:0] cos_i_data [0:FILE_DEPTH-1];
//     reg signed [DATA_WIDTH - 1:0] cos_q_data [0:FILE_DEPTH-1];

//     // dout_R_add01에서 처음으로 -1이 감지되었는지 추적하는 플래그
//     reg first_minus_one_detected;
//     // 파일에 기록된 총 출력 개수를 추적하는 카운터 (0부터 시작)
//     integer output_written_count;

//     // DUT (Device Under Test) 인스턴스화
//     mod0_0 #(.DATA_WIDTH(DATA_WIDTH), .NUM_IN_OUT(NUM_IN_OUT))
//     DUT_MOD00 (
//         .clk(clk),
//         .rstn(rstn),
//         .din_i(din_i),
//         .din_q(din_q),
//         .dout_R_add_00(dout_R_add_00),
//         .dout_R_sub_00(dout_R_sub_00),
//         .dout_Q_add_00(dout_Q_add_00),
//         .dout_Q_sub_00(dout_Q_sub_00),
//         .alert_mod01(alert_mod01)
//     );

//     mod0_1 DUT_MOD01(
//         .clk(clk),
//         .rstn(rstn),
//         .alert_mod01(alert_mod01),
//         .din_R_add00(dout_R_add_00),
//         .din_Q_add00(dout_Q_add_00),
//         .din_R_sub00(dout_R_sub_00),
//         .din_Q_sub00(dout_Q_sub_00),
//         .dout_R_add01(dout_R_add01),
//         .dout_Q_add01(dout_Q_add01),
//         .dout_R_sub01(dout_R_sub01),
//         .dout_Q_sub01(dout_Q_sub01),
//         .alert_mod02(alert_mod02)
//     );

//     // 클럭 생성
//     initial begin
//         clk = 0;
//         forever #(CLK_PERIOD/2) clk = ~clk;
//     end

//     // 테스트 스티뮬러스 (Test Stimulus)
//     initial begin
//         // 모든 신호를 초기 상태로 설정
//         rstn = 1'b0;
//         for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
//             din_i[i] = 0;
//             din_q[i] = 0;
//         end

//         // 출력 제어를 위한 플래그 및 카운터 초기화
//         first_minus_one_detected = 1'b0; // -1 감지 플래그 초기화
//         output_written_count = 0;         // 기록된 출력 개수 카운터 초기화

//         // 입력 파일 열기
//         file_i = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_i_dat.txt", "r");
//         file_q = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_q_dat.txt", "r");
        
//         // 출력 파일 열기 (실수부와 허수부 각각)
//         file_real_out = $fopen("bfly01_real.txt", "w");
//         if (file_real_out == 0) $display("Error: Could not open bfly01_real.txt");
//         file_imag_out = $fopen("bfly01_imag.txt", "w");
//         if (file_imag_out == 0) $display("Error: Could not open bfly01_imag.txt");

//         // 입력 데이터 파일에서 읽기
//         for (i = 0; i < FILE_DEPTH; i = i + 1) begin
//             if ($fscanf(file_i, "%d\n", cos_i_data[i]) == 0) begin
//                 $display("Error: Failed to read from cos_i_dat.txt at index %0d", i);
//                 $finish;
//             end
//             if ($fscanf(file_q, "%d\n", cos_q_data[i]) == 0) begin
//                 $display("Error: Failed to read from cos_q_dat.txt at index %0d", i);
//                 $finish;
//             end
//         end

//         // 입력 파일 닫기
//         $fclose(file_i);
//         $fclose(file_q);

//         // 리셋 시퀀스 적용
//         #(CLK_PERIOD * 2); // rstn 신호를 충분히 길게 유지
//         rstn = 1'b1; // 리셋 해제
        
//         // 리셋 해제 후 DUT가 안정화될 시간을 위해 한 클럭 사이클 대기
//         @(posedge clk);
        
//         // 메인 스티뮬러스 루프
//         // FILE_DEPTH만큼 데이터를 처리하며 NUM_IN_OUT 단위로 입력
//         for (i = 0; i < FILE_DEPTH; i = i + NUM_IN_OUT) begin
//             // 새로운 입력 적용
//             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                 din_i[j] = cos_i_data[i+j];
//                 din_q[j] = cos_q_data[i+j];
//             end
            
//             // DUT가 처리할 시간을 위해 한 클럭 사이클 대기
//             @(posedge clk);

//             // dout_R_add01에서 처음으로 -1이 감지되었는지 확인
//             if (!first_minus_one_detected) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     if (dout_R_add01[j] == -1) begin // -1 값 확인
//                         first_minus_one_detected = 1'b1; // 플래그 설정
//                         $display("First -1 in dout_R_add01 detected at time %0t. Starting file write.", $time);
//                         break; // 현재 내부 루프를 종료 (이미 감지했으므로 더 이상 확인할 필요 없음)
//                     end
//                 end
//             end

//             // -1이 감지되었고, 아직 512개의 출력을 모두 기록하지 않았다면 파일에 쓰기
//             if (first_minus_one_detected && output_written_count < FILE_DEPTH) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     // 총 512개의 출력을 초과하지 않도록 다시 확인
//                     if (output_written_count < FILE_DEPTH) begin
//                         // 실수부 값을 bfly01_real.txt에 저장 (1-based 인덱스 사용)
//                         $fwrite(file_real_out, "bfly01(%0d)=%0d\n",
//                             output_written_count + 1, // 1부터 시작하는 인덱스
//                             dout_R_add01[j]
//                         );
//                         // 허수부 값을 bfly01_imag.txt에 저장 (1-based 인덱스 사용)
//                         $fwrite(file_imag_out, "bfly01(%0d)=%0d\n",
//                             output_written_count + 1, // 1부터 시작하는 인덱스
//                             dout_Q_add01[j]
//                         );
//                         output_written_count = output_written_count + 1; // 기록된 출력 개수 증가
//                     end else begin
//                         // 512개의 출력이 모두 기록되었으면 현재 NUM_IN_OUT 블록 내에서 쓰기를 중지
//                         break;
//                     end
//                 end
//             end

//             // 512개의 출력이 모두 기록되었으면 시뮬레이션을 조기 종료
//             if (output_written_count >= FILE_DEPTH) begin
//                 $display("512 outputs written. Finishing simulation.");
//                 break; // 메인 스티뮬러스 루프 종료
//             end
//         end

//         // 시뮬레이션 종료 전 출력 파일 닫기
//         $fclose(file_real_out);
//         $fclose(file_imag_out);
        
//         // 마지막 클럭 엣지 대기 후 시뮬레이션 종료
//         @(posedge clk);
//         $stop;
//     end
// endmodule

////////////////////////////////////////////////////////////////////////////////////////////////////////
//250725 valid 고려안하고 짠 테스트벤치 코드
////////////////////////////////////////////////////////////////////////////////////////////////////////


// `timescale 1ns / 1ps

// module tb_dut();

//     // Parameters
//     localparam DATA_WIDTH = 9;
//     localparam NUM_IN_OUT = 16;
//     localparam FILE_DEPTH = 2048; // 시뮬레이션 시간을 연장하기 위해 FILE_DEPTH를 2048로 증가
//     localparam CLK_PERIOD = 10;

//     // DUT signals
//     reg clk;
//     reg rstn;
//     reg signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1];
//     reg signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1];

//     // mod0_0의 출력 신호 (기존 DUT 연결 유지를 위해 남겨둠)
//     wire signed [DATA_WIDTH:0] dout_R_add_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_R_sub_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_Q_add_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_Q_sub_00 [0:NUM_IN_OUT-1];

//     // mod0_1의 최종 출력 신호 (이 신호들을 파일에 저장할 것임)
//     wire signed [12:0] dout_R_add01 [0:15]; // 실수부 (Add 경로)
//     wire signed [12:0] dout_Q_add01 [0:15]; // 허수부 (Add 경로)
//     wire signed [12:0] dout_R_sub01 [0:15]; // 실수부 (Sub 경로)
//     wire signed [12:0] dout_Q_sub01 [0:15]; // 허수부 (Sub 경로)

//     wire alert_mod01;
//     wire alert_mod02;
//     reg valid;

//     // Internal signals and variables
//     integer i, j; // 루프 카운터
//     integer file_i, file_q; // 입력 파일 핸들
//     integer file_real_out; // 실수부 출력을 위한 파일 핸들
//     integer file_imag_out; // 허수부 출력을 위한 파일 핸들

//     // 입력 데이터 저장을 위한 배열
//     reg signed [DATA_WIDTH - 1:0] cos_i_data [0:FILE_DEPTH-1];
//     reg signed [DATA_WIDTH - 1:0] cos_q_data [0:FILE_DEPTH-1];

//     // 특정 값 감지 여부를 추적하는 플래그
//     reg first_minus_one_detected;
//     reg first_one_two_seven_detected;

//     // 각 단계에서 기록된 샘플 수를 추적하는 카운터
//     integer phase1_real_count; // 1단계 실수부 (1~256 인덱스)
//     integer phase1_imag_count; // 1단계 허수부 (1~256 인덱스)
//     integer phase2_real_count; // 2단계 실수부 (257~512 인덱스)
//     integer phase2_imag_count; // 2단계 허수부 (257~512 인덱스)


//     // DUT (Device Under Test) 인스턴스화
//     mod0_0 #(.DATA_WIDTH(DATA_WIDTH), .NUM_IN_OUT(NUM_IN_OUT))
//     DUT_MOD00 (
//         .clk(clk),
//         .rstn(rstn),
//         .valid(valid),
//         .din_i(din_i),
//         .din_q(din_q),
//         .dout_R_add_00(dout_R_add_00),
//         .dout_R_sub_00(dout_R_sub_00),
//         .dout_Q_add_00(dout_Q_add_00),
//         .dout_Q_sub_00(dout_Q_sub_00),
//         .alert_mod01(alert_mod01)
//     );

//     mod0_1 DUT_MOD01(
//         .clk(clk),
//         .rstn(rstn),
//         .alert_mod01(alert_mod01),
//         .din_R_add00(dout_R_add_00),
//         .din_Q_add00(dout_Q_add_00),
//         .din_R_sub00(dout_R_sub_00),
//         .din_Q_sub00(dout_Q_sub_00),
//         .dout_R_add01(dout_R_add01),
//         .dout_Q_add01(dout_Q_add01),
//         .dout_R_sub01(dout_R_sub01),
//         .dout_Q_sub01(dout_Q_sub01),
//         .alert_mod02(alert_mod02)
//     );

//     // 클럭 생성
//     initial begin
//         clk = 0;
//         forever #(CLK_PERIOD/2) clk = ~clk;
//     end

//     // 테스트 스티뮬러스 (Test Stimulus)
//     initial begin
//         // 모든 신호를 초기 상태로 설정
//         rstn = 1'b0;
//         for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
//             din_i[i] = 0;
//             din_q[i] = 0;
//         end

//         // 출력 제어를 위한 플래그 및 카운터 초기화
//         first_minus_one_detected = 1'b0;
//         first_one_two_seven_detected = 1'b0;
//         phase1_real_count = 0;
//         phase1_imag_count = 0;
//         phase2_real_count = 0;
//         phase2_imag_count = 0;

//         // 입력 파일 열기
//         // 주의: cos_i_dat.txt와 cos_q_dat.txt 파일도 FILE_DEPTH만큼 충분한 데이터를 가지고 있어야 합니다.
//         file_i = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_i_dat.txt", "r");
//         file_q = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_q_dat.txt", "r");
        
//         // 출력 파일 열기 (실수부와 허수부 각각)
//         file_real_out = $fopen("bfly01_real.txt", "w");
//         if (file_real_out == 0) $display("Error: Could not open bfly01_real.txt");
//         file_imag_out = $fopen("bfly01_imag.txt", "w");
//         if (file_imag_out == 0) $display("Error: Could not open bfly01_imag.txt");

//         // 입력 데이터 파일에서 읽기
//         for (i = 0; i < FILE_DEPTH; i = i + 1) begin
//             if ($fscanf(file_i, "%d\n", cos_i_data[i]) == 0) begin
//                 $display("Error: Failed to read from cos_i_dat.txt at index %0d", i);
//                 // 파일 끝에 도달했거나 읽기 오류 발생 시, 나머지 배열을 0으로 채울 수 있습니다.
//                 // 또는 $finish 대신 $stop을 사용하여 현재 상태를 유지하고 디버깅할 수 있습니다.
//                 for (integer k = i; k < FILE_DEPTH; k = k + 1) begin
//                     cos_i_data[k] = 0;
//                     cos_q_data[k] = 0;
//                 end
//                 break; // 파일 읽기 루프 종료
//             end
//             if ($fscanf(file_q, "%d\n", cos_q_data[i]) == 0) begin
//                 $display("Error: Failed to read from cos_q_dat.txt at index %0d", i);
//                 for (integer k = i; k < FILE_DEPTH; k = k + 1) begin
//                     cos_i_data[k] = 0;
//                     cos_q_data[k] = 0;
//                 end
//                 break; // 파일 읽기 루프 종료
//             end
//         end

//         // 입력 파일 닫기
//         $fclose(file_i);
//         $fclose(file_q);

//         // 리셋 시퀀스 적용
//         #(CLK_PERIOD * 2); // rstn 신호를 충분히 길게 유지
//         rstn = 1'b1; // 리셋 해제
        
//         // 리셋 해제 후 DUT가 안정화될 시간을 위해 한 클럭 사이클 대기
//         @(posedge clk);
        
//         // 메인 스티뮬러스 루프: DUT에 입력 적용
//         // 출력 쓰기는 always 블록에서 처리됩니다.
//         // FILE_DEPTH를 늘렸으므로, 더 많은 입력 데이터를 DUT에 제공할 수 있습니다.
//         for (i = 0; i < FILE_DEPTH; i = i + NUM_IN_OUT) begin
//             // 새로운 입력 적용
//             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                 // 배열 인덱스가 범위를 벗어나지 않도록 확인
//                 if ((i + j) < FILE_DEPTH) begin
//                     din_i[j] = cos_i_data[i+j];
//                     din_q[j] = cos_q_data[i+j];
//                 end else begin
//                     // 입력 데이터가 부족하면 0으로 채움
//                     din_i[j] = 0;
//                     din_q[j] = 0;
//                 end
//             end
            
//             // DUT가 처리할 시간을 위해 한 클럭 사이클 대기
//             @(posedge clk);

//             // 모든 출력이 기록되었는지 확인 (총 512개 샘플)
//             if ((phase1_real_count >= 256 && phase1_imag_count >= 256) &&
//                 (phase2_real_count >= 256 && phase2_imag_count >= 256)) begin
//                 $display("All 512 outputs written. Finishing simulation.");
//                 break; // 메인 스티뮬러스 루프 종료
//             end
//         end

//         // 시뮬레이션 종료
//         $fclose(file_real_out);
//         $fclose(file_imag_out);
//         @(posedge clk);
//         $stop;
//     end

//     // 출력 쓰기 로직: 클럭의 양쪽 엣지마다 실행됩니다.
//     always @(posedge clk) begin
//         if (rstn) begin // 리셋 상태가 아닐 때만 동작
//             // 1단계: -1 감지 및 이후 쓰기 (출력 1~256)
//             if (!first_minus_one_detected) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     if (dout_R_add01[j] == -1) begin
//                         first_minus_one_detected = 1'b1;
//                         $display("First -1 in dout_R_add01 detected at time %0t. Starting Phase 1 file write.", $time);
//                         // 이 사이클의 출력부터 쓰기를 시작할 수 있도록 break하지 않음
//                     end
//                 end
//             end

//             if (first_minus_one_detected && (phase1_real_count < 256 || phase1_imag_count < 256)) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     // 실수부 파일 (bfly01_real.txt)에 쓰기
//                     if (phase1_real_count < 256) begin
//                         if (phase1_real_count < 128) begin
//                             $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase1_real_count + 1, dout_R_add01[j]);
//                         end else begin // phase1_real_count >= 128 and < 256
//                             $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase1_real_count + 1, dout_R_sub01[j]);
//                         end
//                         phase1_real_count = phase1_real_count + 1;
//                     end

//                     // 허수부 파일 (bfly01_imag.txt)에 쓰기
//                     if (phase1_imag_count < 256) begin
//                         if (phase1_imag_count < 128) begin
//                             $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase1_imag_count + 1, dout_Q_add01[j]);
//                         end else begin // phase1_imag_count >= 128 and < 256
//                             $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase1_imag_count + 1, dout_Q_sub01[j]);
//                         end
//                         phase1_imag_count = phase1_imag_count + 1;
//                     end
//                 end
//             end

//             // 2단계: 127 감지 및 이후 쓰기 (출력 257~512)
//             // 이 단계는 1단계와 독립적으로 시작될 수 있으며, 인덱스는 별개입니다.
//             if (!first_one_two_seven_detected) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     if (dout_R_add01[j] == 127) begin
//                         first_one_two_seven_detected = 1'b1;
//                         $display("First 127 in dout_R_add01 detected at time %0t. Starting Phase 2 file write.", $time);
//                         // 이 사이클의 출력부터 쓰기를 시작할 수 있도록 break하지 않음
//                     end
//                 end
//             end

//             if (first_one_two_seven_detected && (phase2_real_count < 256 || phase2_imag_count < 256)) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     // 실수부 파일 (bfly01_real.txt)에 쓰기
//                     if (phase2_real_count < 256) begin
//                         if (phase2_real_count < 128) begin
//                             $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase2_real_count + 257, dout_R_add01[j]);
//                         end else begin // phase2_real_count >= 128 and < 256
//                             $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase2_real_count + 257, dout_R_sub01[j]);
//                         end
//                         phase2_real_count = phase2_real_count + 1;
//                     end

//                     // 허수부 파일 (bfly01_imag.txt)에 쓰기
//                     if (phase2_imag_count < 256) begin
//                         if (phase2_imag_count < 128) begin
//                             $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase2_imag_count + 257, dout_Q_add01[j]);
//                         end else begin // phase2_imag_count >= 128 and < 256
//                             $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase2_imag_count + 257, dout_Q_sub01[j]);
//                         end
//                         phase2_imag_count = phase2_imag_count + 1;
//                     end
//                 end
//             end
//         end
//     end
// endmodule

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

    wire bf_en02;
    wire mux_sel02;
    wire [8:0] addr;
    wire mul_en;
    wire alert_CBFP;

    cu_mod0_2 DUT_CU02(
	.clk(clk),
	.rstn(rstn),
	.alert_mod02(alert_mod02),

    .bf_en02(bf_en02),
	.mux_sel02(mux_sel02),
	.addr(addr),
	.mul_en(mul_en),
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