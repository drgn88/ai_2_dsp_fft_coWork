`timescale 1ns / 1ps

module tb_cbfp1;

    // =========================================
    // Parameters
    // =========================================
    parameter INPUT_WIDTH  = 25;
    parameter OUTPUT_WIDTH = 12;
    parameter BLOCK_SIZE   = 8;
    parameter LZC_WIDTH    = 5;
    parameter CLK_PERIOD   = 10;

    // =========================================
    // DUT Interface Signals
    // =========================================
    logic clk, rstn;
    logic alert_cbfp;

    logic signed [INPUT_WIDTH-1:0] din_R_add_CBFP [0:BLOCK_SIZE-1];
    logic signed [INPUT_WIDTH-1:0] din_Q_add_CBFP [0:BLOCK_SIZE-1];
    logic signed [INPUT_WIDTH-1:0] din_R_sub_CBFP [0:BLOCK_SIZE-1];
    logic signed [INPUT_WIDTH-1:0] din_Q_sub_CBFP [0:BLOCK_SIZE-1];

    logic signed [OUTPUT_WIDTH-1:0] dout_R_add_CBFP [0:BLOCK_SIZE-1];
    logic signed [OUTPUT_WIDTH-1:0] dout_Q_add_CBFP [0:BLOCK_SIZE-1];
    logic signed [OUTPUT_WIDTH-1:0] dout_R_sub_CBFP [0:BLOCK_SIZE-1];
    logic signed [OUTPUT_WIDTH-1:0] dout_Q_sub_CBFP [0:BLOCK_SIZE-1];
    logic valid_mod1;

    // =========================================
    // DUT Instance
    // =========================================
    cbfp1 #(
        .INPUT_WIDTH(INPUT_WIDTH),
        .OUTPUT_WIDTH(OUTPUT_WIDTH),
        .BLOCK_SIZE(BLOCK_SIZE),
        .LZC_WIDTH(LZC_WIDTH)
    ) dut (
        .clk(clk),
        .rstn(rstn),
        .alert_cbfp(alert_cbfp),
        .din_R_add_CBFP(din_R_add_CBFP),
        .din_Q_add_CBFP(din_Q_add_CBFP),
        .din_R_sub_CBFP(din_R_sub_CBFP),
        .din_Q_sub_CBFP(din_Q_sub_CBFP),
        .dout_R_add_CBFP(dout_R_add_CBFP),
        .dout_Q_add_CBFP(dout_Q_add_CBFP),
        .dout_R_sub_CBFP(dout_R_sub_CBFP),
        .dout_Q_sub_CBFP(dout_Q_sub_CBFP),
        .valid_mod1(valid_mod1)
    );

    // =========================================
    // Clock Generation
    // =========================================
    always #(CLK_PERIOD / 2) clk = ~clk;

    // =========================================
    // Simulation Control
    // =========================================
    integer f_add_re, f_add_im, f_sub_re, f_sub_im;
    integer outfile_re, outfile_im;
    integer val;
    integer i, cycle, wait_cycle;

    // 버퍼 사용: 1클럭 딜레이 뒤 alert_cbfp
    logic signed [INPUT_WIDTH-1:0] buf_R_add [0:BLOCK_SIZE-1];
    logic signed [INPUT_WIDTH-1:0] buf_Q_add [0:BLOCK_SIZE-1];
    logic signed [INPUT_WIDTH-1:0] buf_R_sub [0:BLOCK_SIZE-1];
    logic signed [INPUT_WIDTH-1:0] buf_Q_sub [0:BLOCK_SIZE-1];

    initial begin
        clk = 0;
        rstn = 0;
        alert_cbfp = 0;

        // Input files
        f_add_re = $fopen("add_real_cbfp.txt", "r");
        f_add_im = $fopen("add_imag_cbfp.txt", "r");
        f_sub_re = $fopen("sub_real_cbfp.txt", "r");
        f_sub_im = $fopen("sub_imag_cbfp.txt", "r");

        if (!f_add_re || !f_add_im || !f_sub_re || !f_sub_im) begin
            $display("❌ ERROR: Cannot open one or more input files");
            $finish;
        end

        // Output files
        outfile_re = $fopen("output_re.txt", "w");
        outfile_im = $fopen("output_im.txt", "w");

        // Reset
        #15;
        rstn = 1;

        // Main loop: 256 samples / 8 = 32 blocks
        for (cycle = 0; cycle < 256 / BLOCK_SIZE; cycle++) begin
            // === Step 1: Read input into buffer
            for (i = 0; i < BLOCK_SIZE; i++) begin
                if ($fscanf(f_add_re, "%d\n", val) != 1) val = 0;
                buf_R_add[i] = val;

                if ($fscanf(f_add_im, "%d\n", val) != 1) val = 0;
                buf_Q_add[i] = val;

                if ($fscanf(f_sub_re, "%d\n", val) != 1) val = 0;
                buf_R_sub[i] = val;

                if ($fscanf(f_sub_im, "%d\n", val) != 1) val = 0;
                buf_Q_sub[i] = val;
            end

            // === Step 2: Apply input at clk edge
            @(posedge clk); #0;
            for (i = 0; i < BLOCK_SIZE; i++) begin
                din_R_add_CBFP[i] = buf_R_add[i];
                din_Q_add_CBFP[i] = buf_Q_add[i];
                din_R_sub_CBFP[i] = buf_R_sub[i];
                din_Q_sub_CBFP[i] = buf_Q_sub[i];
            end

            // === Step 3: Raise alert_cbfp 1 cycle later
            @(posedge clk); #0;
            alert_cbfp = 1;

            @(posedge clk); #0;
            alert_cbfp = 0;

            // === Step 4: Wait for valid_mod1
            wait_cycle = 0;
            repeat (50) begin
                @(posedge clk); #0;
                if (valid_mod1) begin
                    $display("[%0t] ✅ valid_mod1 HIGH → Writing output", $time);
                    for (i = 0; i < BLOCK_SIZE; i++) begin
                        $fdisplay(outfile_re, "%0d", dout_R_add_CBFP[i]);
                        $fdisplay(outfile_im, "%0d", dout_Q_add_CBFP[i]);
                    end
                    break;
                end
                wait_cycle++;
            end

            if (!valid_mod1)
                $display("[%0t] ⚠ Warning: valid_mod1 LOW, skipping output", $time);
        end

        $fclose(f_add_re);
        $fclose(f_add_im);
        $fclose(f_sub_re);
        $fclose(f_sub_im);
        $fclose(outfile_re);
        $fclose(outfile_im);

        $display("✅ Simulation Done.");
        $finish;
    end

endmodule
