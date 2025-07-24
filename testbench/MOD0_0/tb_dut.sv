// `timescale 1ns / 1ps

// module tb_dut;

//     // Parameters from mod0_0.sv
//     parameter DATA_WIDTH = 9;
//     parameter NUM_IN_OUT = 16;
//     parameter NUM_SAMPLES = 512;

//     // Clock and Reset signals
//     logic clk;
//     logic rstn;

//     // DUT input signals
//     logic signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1];
//     logic signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1];

//     // DUT output signals
//     logic signed [DATA_WIDTH:0] dout_R_add_00 [0:NUM_IN_OUT-1];
//     logic signed [DATA_WIDTH:0] dout_R_sub_00 [0:NUM_IN_OUT-1];
//     logic signed [DATA_WIDTH:0] dout_Q_add_00 [0:NUM_IN_OUT-1];
//     logic signed [DATA_WIDTH:0] dout_Q_sub_00 [0:NUM_IN_OUT-1];

//     // Files and integers for data processing
//     integer i;
//     integer j;
//     integer k;
//     integer real_file, imag_file, output_file;
//     integer scan_real, scan_imag;
//     integer read_count = 0;

//     // Instantiate the Unit Under Test (DUT)
//     mod0_0 #(
//         .DATA_WIDTH(DATA_WIDTH),
//         .NUM_IN_OUT(NUM_IN_OUT)
//     ) UUT (
//         .clk(clk),
//         .rstn(rstn),
//         .din_i(din_i),
//         .din_q(din_q),
//         .dout_R_add_00(dout_R_add_00),
//         .dout_R_sub_00(dout_R_sub_00),
//         .dout_Q_add_00(dout_Q_add_00),
//         .dout_Q_sub_00(dout_Q_sub_00)
//     );

//     // Clock generation
//     always #5 clk = ~clk;

//     // Test sequence
//     initial begin
//         // Initialize signals to 0 at time 0s
//         clk = 0;
//         rstn = 0;
//         for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
//             din_i[i] = 0;
//             din_q[i] = 0;
//         end
        
//         // Open files
//         real_file = $fopen("cos_i_dat.txt", "r");
//         imag_file = $fopen("cos_q_dat.txt", "r");
//         output_file = $fopen("bfly00_tb_output.txt", "w");
        
//         if (!real_file || !imag_file || !output_file) begin
//             $display("ERROR: Could not open input/output files.");
//             $finish;
//         end
        
//         // Setup waveform dumping
//         $dumpfile("tb_dut.vcd");
//         $dumpvars(0, tb_dut);

//         // De-assert reset
//         #10;
//         rstn = 1;
//         #10;
        
//         // Wait for a clock cycle
//         @(posedge clk);

//         // Apply inputs and capture outputs
//         for (k = 0; k < (NUM_SAMPLES / NUM_IN_OUT); k = k + 1) begin
//             // Read NUM_IN_OUT data points from files
//             for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
//                 if (!$feof(real_file)) begin
//                     scan_real = $fscanf(real_file, "%d\n", din_i[i]);
//                 end
//                 if (!$feof(imag_file)) begin
//                     scan_imag = $fscanf(imag_file, "%d\n", din_q[i]);
//                 end
//             end
            
//             // Wait for a clock cycle to process input
//             @(posedge clk);
            
//             // Write output to file in a user-friendly format
//             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                 $fwrite(output_file, "bfly00[%d] = %d + j%d\n", read_count+j+1, dout_R_add_00[j], dout_Q_add_00[j]);
//                 $fwrite(output_file, "bfly00_sub[%d] = %d + j%d\n", read_count+j+1, dout_R_sub_00[j], dout_Q_sub_00[j]);
//             end

//             read_count = read_count + NUM_IN_OUT;
            
//         end
        
//         // Wait for a few more cycles before finishing
//         #100;
        
//         $display("Simulation finished. Output saved to bfly00_tb_output.txt");
//         $fclose(real_file);
//         $fclose(imag_file);
//         $fclose(output_file);
//         $finish;
//     end
// endmodule

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
//     uut (
//         .clk(clk),
//         .rstn(rstn),
//         .din_i(din_i),
//         .din_q(din_q),
//         .dout_R_add_00(dout_R_add_00),
//         .dout_R_sub_00(dout_R_sub_00),
//         .dout_Q_add_00(dout_Q_add_00),
//         .dout_Q_sub_00(dout_Q_sub_00)
//     );

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
//         file_i = $fopen("cos_i_dat.txt", "r");
//         file_q = $fopen("cos_q_dat.txt", "r");
        
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

//     // Internal signals and variables
//     integer i, j, k;
//     integer file_i, file_q, file_out;
//     reg signed [DATA_WIDTH - 1:0] cos_i_data [0:FILE_DEPTH-1];
//     reg signed [DATA_WIDTH - 1:0] cos_q_data [0:FILE_DEPTH-1];

//     // Instantiate the DUT
//     mod0_0 #(.DATA_WIDTH(DATA_WIDTH), .NUM_IN_OUT(NUM_IN_OUT))
//     uut (
//         .clk(clk),
//         .rstn(rstn),
//         .din_i(din_i),
//         .din_q(din_q),
//         .dout_R_add_00(dout_R_add_00),
//         .dout_R_sub_00(dout_R_sub_00),
//         .dout_Q_add_00(dout_Q_add_00),
//         .dout_Q_sub_00(dout_Q_sub_00)
//     );

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

//         // Open input and output files
//         file_i = $fopen("cos_i_dat.txt", "r");
//         file_q = $fopen("cos_q_dat.txt", "r");
//         file_out = $fopen("mod0_0_output.txt", "w");
        
//         // Read input data from files
//         for (i = 0; i < FILE_DEPTH; i = i + 1) begin
//             $fscanf(file_i, "%d\n", cos_i_data[i]);
//             $fscanf(file_q, "%d\n", cos_q_data[i]);
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

//             // Write outputs to file
//             for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
//                 $fwrite(file_out, "bfly00_tmp(%d)=%d+j%d, bfly00(%d)=%d+j%d\n",
//                     i+j+1, 
//                     dout_R_add_00[j], 
//                     dout_Q_add_00[j],
//                     i+j+1,
//                     dout_R_sub_00[j],
//                     dout_Q_sub_00[j]
//                 );
//             end
//         end

//         // Finish simulation
//         $fclose(file_out);
//         @(posedge clk);
//         $finish;
//     end
// endmodule

`timescale 1ns / 1ps

module tb_dut();

    // Parameters
    localparam DATA_WIDTH = 9;
    localparam NUM_IN_OUT = 16;
    localparam FILE_DEPTH = 512;
    localparam CLK_PERIOD = 10;

    // DUT signals
    reg clk;
    reg rstn;
    reg signed [DATA_WIDTH - 1:0] din_i [0:NUM_IN_OUT-1];
    reg signed [DATA_WIDTH - 1:0] din_q [0:NUM_IN_OUT-1];

    wire signed [DATA_WIDTH:0] dout_R_add_00 [0:NUM_IN_OUT-1];
    wire signed [DATA_WIDTH:0] dout_R_sub_00 [0:NUM_IN_OUT-1];
    wire signed [DATA_WIDTH:0] dout_Q_add_00 [0:NUM_IN_OUT-1];
    wire signed [DATA_WIDTH:0] dout_Q_sub_00 [0:NUM_IN_OUT-1];

    // Internal signals and variables
    integer i, j, k;
    integer file_i, file_q, file_out;
    reg signed [DATA_WIDTH - 1:0] cos_i_data [0:FILE_DEPTH-1];
    reg signed [DATA_WIDTH - 1:0] cos_q_data [0:FILE_DEPTH-1];

    // Variable to track if non-zero output has started
    reg first_non_zero_detected;
    integer bfly_current_idx; // To count indices from 1 for output file

    // Instantiate the DUT
    mod0_0 #(.DATA_WIDTH(DATA_WIDTH), .NUM_IN_OUT(NUM_IN_OUT))
    uut (
        .clk(clk),
        .rstn(rstn),
        .din_i(din_i),
        .din_q(din_q),
        .dout_R_add_00(dout_R_add_00),
        .dout_R_sub_00(dout_R_sub_00),
        .dout_Q_add_00(dout_Q_add_00),
        .dout_Q_sub_00(dout_Q_sub_00)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #(CLK_PERIOD/2) clk = ~clk;
    end

    // Test stimulus
    initial begin
        // Initialize all signals to a known state
        rstn = 1'b0;
        for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
            din_i[i] = 0;
            din_q[i] = 0;
        end

        // Initialize flags for output control
        first_non_zero_detected = 1'b0;
        bfly_current_idx = 1; // Start counting from 1 for bfly00 index

        // Open input files
        file_i = $fopen("cos_i_dat.txt", "r");
        file_q = $fopen("cos_q_dat.txt", "r");
        
        // Open output file (will write only after first non-zero)
        file_out = $fopen("mod0_0_output.txt", "w");
        if (file_out == 0) $display("Error: Could not open mod0_0_output.txt");

        // Read input data from files
        for (i = 0; i < FILE_DEPTH; i = i + 1) begin
            // It's good practice to check if $fscanf successfully reads values
            if ($fscanf(file_i, "%d\n", cos_i_data[i]) == 0) begin
                $display("Error: Failed to read from cos_i_dat.txt at index %d", i);
                $finish;
            end
            if ($fscanf(file_q, "%d\n", cos_q_data[i]) == 0) begin
                $display("Error: Failed to read from cos_q_dat.txt at index %d", i);
                $finish;
            end
        end

        // Close input files
        $fclose(file_i);
        $fclose(file_q);

        // Apply reset sequence
        #(CLK_PERIOD * 2); // rstn을 충분히 길게 유지
        rstn = 1'b1;
        
        // Wait one more clock cycle to ensure stable state after reset
        @(posedge clk);
        
        // Main stimulus loop
        for (i = 0; i < FILE_DEPTH; i = i + NUM_IN_OUT) begin
            // Apply new inputs
            for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                din_i[j] = cos_i_data[i+j];
                din_q[j] = cos_q_data[i+j];
            end
            
            // Wait for one clock cycle for the DUT to process
            @(posedge clk);

            // Check if any dout_R_add_00 element is non-zero
            if (!first_non_zero_detected) begin
                for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                    if (dout_R_add_00[j] != 0) begin
                        first_non_zero_detected = 1'b1;
                        $display("First non-zero output detected at time %0t. Starting file write.", $time);
                        break; // Exit this inner loop once detected
                    end
                end
            end

            // Write outputs to file only if non-zero output has been detected
            if (first_non_zero_detected) begin
                for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
                    $fwrite(file_out, "bfly00_tmp(%d)=%d+j%d, bfly00(%d)=%d+j%d\n",
                        bfly_current_idx, // Use the new index
                        dout_R_add_00[j], 
                        dout_Q_add_00[j],
                        bfly_current_idx, // Use the new index
                        dout_R_sub_00[j],
                        dout_Q_sub_00[j]
                    );
                    bfly_current_idx = bfly_current_idx + 1; // Increment for next output
                end
            end
        end

        // Finish simulation
        $fclose(file_out);
        @(posedge clk);
        $stop;
    end
endmodule