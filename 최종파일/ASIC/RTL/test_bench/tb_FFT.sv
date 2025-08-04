// `timescale 1ns / 1ps

// module tb_dut();

//     // Parameters
//     localparam DATA_WIDTH = 9;
//     localparam NUM_IN_OUT = 16;
//     localparam FILE_DEPTH = 2048;
//     localparam CLK_PERIOD = 10;

//     // DUT signals
//     reg clk;
//     reg rstn;
//     reg signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1];
//     reg signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1];
//     reg valid;

//     // mod0_0 (dummy)
//     wire signed [DATA_WIDTH:0] dout_R_add_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_R_sub_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_Q_add_00 [0:NUM_IN_OUT-1];
//     wire signed [DATA_WIDTH:0] dout_Q_sub_00 [0:NUM_IN_OUT-1];

//     // mod0_1 FINAL OUTPUTS (dummy)
//     wire signed [12:0] dout_R_add01 [0:15];
//     wire signed [12:0] dout_Q_add01 [0:15];
//     wire signed [12:0] dout_R_sub01 [0:15];
//     wire signed [12:0] dout_Q_sub01 [0:15];
//     wire alert_mod01, alert_mod02;

//     // Internal signals and variables
//     integer i, j;
//     integer file_i, file_q;
//     integer file_real_out, file_imag_out;

//     reg signed [DATA_WIDTH - 1:0] cos_i_data [0:FILE_DEPTH-1];
//     reg signed [DATA_WIDTH - 1:0] cos_q_data [0:FILE_DEPTH-1];

//     reg first_minus_one_detected = 0;
//     reg first_one_two_seven_detected = 0;

//     integer phase1_real_count = 0;
//     integer phase1_imag_count = 0;
//     integer phase2_real_count = 0;
//     integer phase2_imag_count = 0;

//     logic signed [12:0] dout_R_reorder [0:511];
// 	logic signed [12:0] dout_Q_reorder [0:511];

// 	logic done;

//     FFT_TOP U_FFT(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.valid(valid),
// 	.din_R(din_i),
// 	.din_Q(din_q),

// 	.dout_R_reorder(dout_R_reorder),
// 	.dout_Q_reorder(dout_Q_reorder),

// 	.done(done)
//     );


//     // 클럭 생성
//     initial begin
//         clk = 0;
//         forever #(CLK_PERIOD/2) clk = ~clk;
//     end

//     // 테스트 스티뮬러스
//     initial begin
//         // 1. 신호 초기화
//         rstn = 1'b0;
//         valid = 1'b0;
//         for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
//             din_i[i] = 0;
//             din_q[i] = 0;
//         end

//         // (플래그, 카운터 초기화는 위에 default 대입)
//         first_minus_one_detected = 1'b0;
//         first_one_two_seven_detected = 1'b0;
//         phase1_real_count = 0;
//         phase1_imag_count = 0;
//         phase2_real_count = 0;
//         phase2_imag_count = 0;

//         // 입력 파일 열기
//         file_i = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_i_dat.txt", "r");
//         file_q = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_q_dat.txt", "r");
//         file_real_out = $fopen("bfly01_real.txt", "w");
//         if (file_real_out == 0) $display("Error: Could not open bfly01_real.txt");
//         file_imag_out = $fopen("bfly01_imag.txt", "w");
//         if (file_imag_out == 0) $display("Error: Could not open bfly01_imag.txt");

//         // 입력 데이터 읽기
//         for (i = 0; i < FILE_DEPTH; i = i + 1) begin
//             if ($fscanf(file_i, "%d\n", cos_i_data[i]) == 0) begin
//                 $display("Error: Failed to read from cos_i_dat.txt at index %0d", i);
//                 for (integer k = i; k < FILE_DEPTH; k = k + 1) begin
//                     cos_i_data[k] = 0;
//                     cos_q_data[k] = 0;
//                 end
//                 break;
//             end
//             if ($fscanf(file_q, "%d\n", cos_q_data[i]) == 0) begin
//                 $display("Error: Failed to read from cos_q_dat.txt at index %0d", i);
//                 for (integer k = i; k < FILE_DEPTH; k = k + 1) begin
//                     cos_i_data[k] = 0;
//                     cos_q_data[k] = 0;
//                 end
//                 break;
//             end
//         end

//         $fclose(file_i);
//         $fclose(file_q);

//         // 2. 리셋 시퀀스
//         #(CLK_PERIOD * 2);
//         rstn = 1'b1;

//         // [바뀌는 구간 시작]
//         // 3. 첫 입력 & valid: negative edge에
//         @(negedge clk);
//         valid = 1'b1;
//         $display("Valid asserted + first input at negedge clk, t=%0t", $time);
//         for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//             din_i[j] = cos_i_data[j];
//             din_q[j] = cos_q_data[j];
//         end

//         // 4. 두 번째 입력부터는 positive edge마다 
//         // (i==NUM_IN_OUT부터 32*NUM_IN_OUT까지)
//         for (i = NUM_IN_OUT; i < 32 * NUM_IN_OUT; i = i + NUM_IN_OUT) begin
//             @(posedge clk);
//             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                 if ((i + j) < FILE_DEPTH) begin
//                     din_i[j] = cos_i_data[i+j];
//                     din_q[j] = cos_q_data[i+j];
//                 end else begin
//                     din_i[j] = 0;
//                     din_q[j] = 0;
//                 end
//             end
//         end

//         // 5. 32클럭(32*NUM_IN_OUT 샘플) 후 valid 내리기 (마지막 입력 뒤)
//         @(posedge clk);
//         valid = 1'b0;
//         $display("Valid deasserted at time %0t", $time);

//         // 6. 남은 입력: valid=0 상태에서 계속 적용
//         for (; i < FILE_DEPTH; i = i + NUM_IN_OUT) begin
//             @(posedge clk);
//             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                 if ((i + j) < FILE_DEPTH) begin
//                     din_i[j] = cos_i_data[i+j];
//                     din_q[j] = cos_q_data[i+j];
//                 end else begin
//                     din_i[j] = 0;
//                     din_q[j] = 0;
//                 end
//             end
//         end

//         // 7. 시뮬레이션 정리 및 종료
//         repeat (100) @(posedge clk);
//         if ((phase1_real_count >= 256 && phase1_imag_count >= 256) &&
//             (phase2_real_count >= 256 && phase2_imag_count >= 256)) begin
//             $display("All 512 outputs written. Finishing simulation.");
//         end else begin
//             $display("Warning: Not all 512 outputs were written. Check simulation time or output conditions.");
//         end
        
//         $fclose(file_real_out);
//         $fclose(file_imag_out);
//         @(posedge clk);
//         $stop;
//     end

//     // 출력 쓰기 로직 (기존과 동일)
//     always @(posedge clk) begin
//         if (rstn) begin
//             // Phase 1
//             if (!first_minus_one_detected) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     if (dout_R_add01[j] == -1) begin
//                         first_minus_one_detected = 1'b1;
//                         $display("First -1 in dout_R_add01 detected at time %0t. Starting Phase 1 file write.", $time);
//                     end
//                 end
//             end
//             if (first_minus_one_detected && (phase1_real_count < 256 || phase1_imag_count < 256)) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     if (phase1_real_count < 256) begin
//                         if (phase1_real_count < 128)
//                             $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase1_real_count + 1, dout_R_add01[j]);
//                         else
//                             $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase1_real_count + 1, dout_R_sub01[j]);
//                         phase1_real_count = phase1_real_count + 1;
//                     end
//                     if (phase1_imag_count < 256) begin
//                         if (phase1_imag_count < 128)
//                             $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase1_imag_count + 1, dout_Q_add01[j]);
//                         else
//                             $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase1_imag_count + 1, dout_Q_sub01[j]);
//                         phase1_imag_count = phase1_imag_count + 1;
//                     end
//                 end
//             end

//             // Phase 2
//             if (!first_one_two_seven_detected) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     if (dout_R_add01[j] == 127) begin
//                         first_one_two_seven_detected = 1'b1;
//                         $display("First 127 in dout_R_add01 detected at time %0t. Starting Phase 2 file write.", $time);
//                     end
//                 end
//             end
//             if (first_one_two_seven_detected && (phase2_real_count < 256 || phase2_imag_count < 256)) begin
//                 for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                     if (phase2_real_count < 256) begin
//                         if (phase2_real_count < 128)
//                             $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase2_real_count + 257, dout_R_add01[j]);
//                         else
//                             $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase2_real_count + 257, dout_R_sub01[j]);
//                         phase2_real_count = phase2_real_count + 1;
//                     end
//                     if (phase2_imag_count < 256) begin
//                         if (phase2_imag_count < 128)
//                             $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase2_imag_count + 257, dout_Q_add01[j]);
//                         else
//                             $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase2_imag_count + 257, dout_Q_sub01[j]);
//                         phase2_imag_count = phase2_imag_count + 1;
//                     end
//                 end
//             end
//         end
//     end
// endmodule

`timescale 1ns / 1ps

module tb_dut();

    // Parameters
    localparam DATA_WIDTH = 9;
    localparam NUM_IN_OUT = 16;
    localparam FILE_DEPTH = 2048;
    localparam CLK_PERIOD = 10;

    // DUT signals
    reg clk;
    reg rstn;
    reg signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1];
    reg signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1];
    reg valid;

    // mod0_0 (dummy) - These are typically connected to the DUT's internal signals for monitoring
    // wire signed [DATA_WIDTH:0] dout_R_add_00 [0:NUM_IN_OUT-1];
    // wire signed [DATA_WIDTH:0] dout_R_sub_00 [0:NUM_IN_OUT-1];
    // wire signed [DATA_WIDTH:0] dout_Q_add_00 [0:NUM_IN_OUT-1];
    // wire signed [DATA_WIDTH:0] dout_Q_sub_00 [0:NUM_IN_OUT-1];

    // mod0_1 FINAL OUTPUTS (dummy) - These are typically connected to the DUT's internal signals for monitoring
    // wire signed [12:0] dout_R_add01 [0:15];
    // wire signed [12:0] dout_Q_add01 [0:15];
    // wire signed [12:0] dout_R_sub01 [0:15];
    // wire signed [12:0] dout_Q_sub01 [0:15];
    // wire alert_mod01, alert_mod02;

    // Internal signals and variables
    integer i, j;
    integer file_i, file_q;
    integer file_real_out, file_imag_out;

    reg signed [DATA_WIDTH - 1:0] cos_i_data [0:FILE_DEPTH-1];
    reg signed [DATA_WIDTH - 1:0] cos_q_data [0:FILE_DEPTH-1];

    reg first_minus_one_detected = 0;
    reg first_one_two_seven_detected = 0;

    integer phase1_real_count = 0;
    integer phase1_imag_count = 0;
    integer phase2_real_count = 0;
    integer phase2_imag_count = 0;

    logic signed [12:0] dout_R_reorder [0:511];
    logic signed [12:0] dout_Q_reorder [0:511];

    logic done;

    // Instantiate the Device Under Test (DUT)
    // Assuming FFT_TOP is the module you are testing.
    FFT_TOP U_FFT(
    .clk(clk),
    .rstn(rstn),
    .valid(valid),
    .din_R(din_i),
    .din_Q(din_q),

    .dout_R_reorder(dout_R_reorder),
    .dout_Q_reorder(dout_Q_reorder),

    .done(done)
    );


    // Clock generation: Creates a clock with a 50% duty cycle
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Test stimulus generation
    initial begin
        // 1. Initialize signals to their default (inactive) states
        rstn = 1'b0; // Assert reset initially
        valid = 1'b0; // Deassert valid
        for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
            din_i[i] = 0; // Initialize input data to zero
            din_q[i] = 0;
        end

        // Initialize flags and counters
        first_minus_one_detected = 1'b0;
        first_one_two_seven_detected = 1'b0;
        phase1_real_count = 0;
        phase1_imag_count = 0;
        phase2_real_count = 0;
        phase2_imag_count = 0;

        // Open input data files
        file_i = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_i_dat.txt", "r");
        file_q = $fopen("/home/aedu46/DSP_DIR/FFT_design/TB/MOD0_1/TB/cos_q_dat.txt", "r");
        // file_i = $fopen("/home/aedu46/DSP_DIR/FFT_design/FINAL_FIX/TB/ran_i_dat_stu.txt", "r");
        // file_q = $fopen("/home/aedu46/DSP_DIR/FFT_design/FINAL_FIX/TB/ran_q_dat_stu.txt", "r");
        
        // Open output data files for writing
        file_real_out = $fopen("bfly01_real.txt", "w");
        if (file_real_out == 0) $display("Error: Could not open bfly01_real.txt");
        file_imag_out = $fopen("bfly01_imag.txt", "w");
        if (file_imag_out == 0) $display("Error: Could not open bfly01_imag.txt");

        // Read input data from files into memory arrays
        for (i = 0; i < FILE_DEPTH; i = i + 1) begin
            if ($fscanf(file_i, "%d\n", cos_i_data[i]) == 0) begin
                $display("Error: Failed to read from cos_i_dat.txt at index %0d", i);
                // Fill remaining data with zeros if read fails
                for (integer k = i; k < FILE_DEPTH; k = k + 1) begin
                    cos_i_data[k] = 0;
                    cos_q_data[k] = 0;
                end
                break;
            end
            if ($fscanf(file_q, "%d\n", cos_q_data[i]) == 0) begin
                $display("Error: Failed to read from cos_q_dat.txt at index %0d", i);
                // Fill remaining data with zeros if read fails
                for (integer k = i; k < FILE_DEPTH; k = k + 1) begin
                    cos_i_data[k] = 0;
                    cos_q_data[k] = 0;
                end
                break;
            end
        end

        // Close input files
        $fclose(file_i);
        $fclose(file_q);

        // 2. Apply reset sequence
        #(CLK_PERIOD * 2); // Hold reset for 2 clock periods
        rstn = 1'b1; // Release reset

        // [Modified Section Start]
        // 3. Apply the first input bundle and assert 'valid' on the negative edge
        @(negedge clk);
        valid = 1'b1; // Assert valid signal
        $display("Valid asserted + first input at negedge clk, t=%0t", $time);
        for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
            din_i[j] = cos_i_data[j]; // Apply first set of inputs
            din_q[j] = cos_q_data[j];
        end

        // 4. Apply subsequent inputs on every negative edge of the clock
        // This loop applies inputs for 32 * NUM_IN_OUT samples (512 samples for NUM_IN_OUT=16)
        for (i = NUM_IN_OUT; i < 32 * NUM_IN_OUT; i = i + NUM_IN_OUT) begin
            @(negedge clk); // Wait for the next negative edge
            for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                if ((i + j) < FILE_DEPTH) begin
                    din_i[j] = cos_i_data[i+j]; // Apply next set of inputs
                    din_q[j] = cos_q_data[i+j];
                end else begin
                    // If file depth is exceeded, apply zeros
                    din_i[j] = 0;
                    din_q[j] = 0;
                end
            end
        end

        // 5. Deassert 'valid' after 32 clock cycles (after the last input bundle for the main processing)
        // This occurs on the positive edge following the last negative-edge input application.
        @(posedge clk);
        valid = 1'b0; // Deassert valid signal
        $display("Valid deasserted at time %0t", $time);

        // 6. Continue applying remaining inputs (which will be zeros if FILE_DEPTH <= 32*NUM_IN_OUT)
        // This ensures the simulation continues to provide inputs even if valid is low,
        // which might be necessary for pipeline flushing or specific DUT behavior.
        for (; i < FILE_DEPTH; i = i + NUM_IN_OUT) begin
            @(negedge clk); // Continue on negative edge
            for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                if ((i + j) < FILE_DEPTH) begin
                    din_i[j] = cos_i_data[i+j];
                    din_q[j] = cos_q_data[i+j];
                end else begin
                    din_i[j] = 0;
                    din_q[j] = 0;
                end
            end
        end
        // [Modified Section End]

        // 7. Finalize simulation
        repeat (100) @(posedge clk); // Wait for additional clock cycles for DUT to finish processing
        
        // Check if all expected outputs were written
        if ((phase1_real_count >= 256 && phase1_imag_count >= 256) &&
            (phase2_real_count >= 256 && phase2_imag_count >= 256)) begin
            $display("All 512 outputs written. Finishing simulation.");
        end else begin
            $display("Warning: Not all 512 outputs were written. Check simulation time or output conditions.");
        end
        
        // Close output files
        $fclose(file_real_out);
        $fclose(file_imag_out);
        
        @(posedge clk); // Wait one more clock cycle
        $stop; // End simulation
    end

    // // Output writing logic (remains on posedge clk, as outputs are typically registered)
    // always @(posedge clk) begin
    //     if (rstn) begin
    //         // Phase 1 output capture
    //         if (!first_minus_one_detected) begin
    //             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
    //                 // Detect the first occurrence of -1 in dout_R_add01 to start Phase 1 writing
    //                 // (This assumes -1 is a specific trigger value for your design's output)
    //                 if (dout_R_add01[j] == -1) begin
    //                     first_minus_one_detected = 1'b1;
    //                     $display("First -1 in dout_R_add01 detected at time %0t. Starting Phase 1 file write.", $time);
    //                 end
    //             end
    //         end
    //         // Write Phase 1 data if trigger detected and counts are not full
    //         if (first_minus_one_detected && (phase1_real_count < 256 || phase1_imag_count < 256)) begin
    //             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
    //                 if (phase1_real_count < 256) begin
    //                     // Write real part, differentiating based on count for add/sub outputs
    //                     if (phase1_real_count < 128)
    //                         $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase1_real_count + 1, dout_R_add01[j]);
    //                     else
    //                         $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase1_real_count + 1, dout_R_sub01[j]);
    //                     phase1_real_count = phase1_real_count + 1;
    //                 end
    //                 if (phase1_imag_count < 256) begin
    //                     // Write imaginary part, differentiating based on count for add/sub outputs
    //                     if (phase1_imag_count < 128)
    //                         $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase1_imag_count + 1, dout_Q_add01[j]);
    //                     else
    //                         $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase1_imag_count + 1, dout_Q_sub01[j]);
    //                     phase1_imag_count = phase1_imag_count + 1;
    //                 end
    //             end
    //         end

    //         // Phase 2 output capture
    //         if (!first_one_two_seven_detected) begin
    //             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
    //                 // Detect the first occurrence of 127 in dout_R_add01 to start Phase 2 writing
    //                 // (This assumes 127 is another specific trigger value)
    //                 if (dout_R_add01[j] == 127) begin
    //                     first_one_two_seven_detected = 1'b1;
    //                     $display("First 127 in dout_R_add01 detected at time %0t. Starting Phase 2 file write.", $time);
    //                 end
    //             end
    //         end
    //         // Write Phase 2 data if trigger detected and counts are not full
    //         if (first_one_two_seven_detected && (phase2_real_count < 256 || phase2_imag_count < 256)) begin
    //             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
    //                 if (phase2_real_count < 256) begin
    //                     // Write real part, offsetting index and differentiating based on count
    //                     if (phase2_real_count < 128)
    //                         $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase2_real_count + 257, dout_R_add01[j]);
    //                     else
    //                         $fwrite(file_real_out, "bfly01(%0d)=%0d\n", phase2_real_count + 257, dout_R_sub01[j]);
    //                     phase2_real_count = phase2_real_count + 1;
    //                 end
    //                 if (phase2_imag_count < 256) begin
    //                     // Write imaginary part, offsetting index and differentiating based on count
    //                     if (phase2_imag_count < 128)
    //                         $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase2_imag_count + 257, dout_Q_add01[j]);
    //                     else
    //                         $fwrite(file_imag_out, "bfly01(%0d)=%0d\n", phase2_imag_count + 257, dout_Q_sub01[j]);
    //                     phase2_imag_count = phase2_imag_count + 1;
    //                 end
    //             end
    //         end
    //     end
    // end
endmodule
