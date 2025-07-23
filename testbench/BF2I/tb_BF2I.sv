// Testbench for BF2I module
`timescale 1ns / 1ps

module tb_BF2I;

    // DUT (Design Under Test) Parameters
    localparam WIDTH = 9;
    localparam DEPTH = 16;
    localparam CLK_PERIOD = 10; // 10ns for 100MHz clock

    // Testbench Signals
    logic clk;
    logic rst_n;
    logic en;
    logic signed [WIDTH-1:0] din_R1[DEPTH-1:0];
    logic signed [WIDTH-1:0] din_R2[DEPTH-1:0];
    logic signed [WIDTH-1:0] din_Q1[DEPTH-1:0];
    logic signed [WIDTH-1:0] din_Q2[DEPTH-1:0];

    logic signed [WIDTH-1:0] dout_R_add[DEPTH-1:0];
    logic signed [WIDTH-1:0] dout_R_sub[DEPTH-1:0];
    logic signed [WIDTH-1:0] dout_Q_add[DEPTH-1:0];
    logic signed [WIDTH-1:0] dout_Q_sub[DEPTH-1:0];

    integer i; // Loop variable for testbench

    // Instantiate the DUT
    BF2I #(
        .WIDTH(WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .din_R1(din_R1),
        .din_R2(din_R2),
        .din_Q1(din_Q1),
        .din_Q2(din_Q2),
        .dout_R_add(dout_R_add),
        .dout_R_sub(dout_R_sub),
        .dout_Q_add(dout_Q_add),
        .dout_Q_sub(dout_Q_sub)
    );

    // Clock Generation
    always #((CLK_PERIOD / 2)) clk = ~clk;

    // Test Sequence
    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0; // Assert reset
        en = 0;

        for (i = 0; i < DEPTH; i = i + 1) begin
            din_R1[i] = 0;
            din_R2[i] = 0;
            din_Q1[i] = 0;
            din_Q2[i] = 0;
        end

        // Apply reset for a few clock cycles
        #(CLK_PERIOD * 2);
        rst_n = 1; // Deassert reset
        $display("--------------------------------------------------");
        $display("Reset deasserted. Initializing inputs.");
        $display("--------------------------------------------------");
        
        // --- Test Case 1: Simple Positive Values ---
        #(CLK_PERIOD); // Wait for one clock cycle after reset deassertion
        en = 1; // Enable the module

        $display("--------------------------------------------------");
        $display("Test Case 1: Simple Positive Values");
        for (i = 0; i < DEPTH; i = i + 1) begin
            din_R1[i] = i + 1;           // 1, 2, ..., 16
            din_R2[i] = DEPTH - i;       // 16, 15, ..., 1
            din_Q1[i] = (i + 1) * 2;     // 2, 4, ..., 32
            din_Q2[i] = (DEPTH - i) * 3; // 48, 45, ..., 3
        end

        #(CLK_PERIOD); // Wait for calculation and output update
        $display("Time = %0t, en = %0b", $time, en);
        $display("Expected values and Actual values for Test Case 1:");
        for (i = 0; i < DEPTH; i = i + 1) begin
            $display("  Index %0d:", i);
            $display("    R1: %0d, R2: %0d", din_R1[i], din_R2[i]);
            $display("    Q1: %0d, Q2: %0d", din_Q1[i], din_Q2[i]);
            $display("    dout_R_add: Expected %0d, Actual %0d", din_R1[i] + din_R2[i], dout_R_add[i]);
            $display("    dout_R_sub: Expected %0d, Actual %0d", din_R1[i] - din_R2[i], dout_R_sub[i]);
            $display("    dout_Q_add: Expected %0d, Actual %0d", din_Q1[i] + din_Q2[i], dout_Q_add[i]);
            $display("    dout_Q_sub: Expected %0d, Actual %0d", din_Q1[i] - din_Q2[i], dout_Q_sub[i]);
            
            // Basic self-checking
            if (dout_R_add[i] != (din_R1[i] + din_R2[i])) $error("ERROR: R_add mismatch at index %0d", i);
            if (dout_R_sub[i] != (din_R1[i] - din_R2[i])) $error("ERROR: R_sub mismatch at index %0d", i);
            if (dout_Q_add[i] != (din_Q1[i] + din_Q2[i])) $error("ERROR: Q_add mismatch at index %0d", i);
            if (dout_Q_sub[i] != (din_Q1[i] - din_Q2[i])) $error("ERROR: Q_sub mismatch at index %0d", i);
        end

        // --- Test Case 2: Negative and Mixed Values ---
        #(CLK_PERIOD); 
        $display("--------------------------------------------------");
        $display("Test Case 2: Negative and Mixed Values");
        for (i = 0; i < DEPTH; i = i + 1) begin
            din_R1[i] = 10 - i;          // 10, 9, ..., -5
            din_R2[i] = -(i + 5);        // -5, -6, ..., -20
            din_Q1[i] = 20 - (i * 2);    // 20, 18, ..., -10
            din_Q2[i] = -(10 + i);       // -10, -11, ..., -25
        end

        #(CLK_PERIOD); // Wait for calculation and output update
        $display("Time = %0t, en = %0b", $time, en);
        $display("Expected values and Actual values for Test Case 2:");
        for (i = 0; i < DEPTH; i = i + 1) begin
            $display("  Index %0d:", i);
            $display("    R1: %0d, R2: %0d", din_R1[i], din_R2[i]);
            $display("    Q1: %0d, Q2: %0d", din_Q1[i], din_Q2[i]);
            $display("    dout_R_add: Expected %0d, Actual %0d", din_R1[i] + din_R2[i], dout_R_add[i]);
            $display("    dout_R_sub: Expected %0d, Actual %0d", din_R1[i] - din_R2[i], dout_R_sub[i]);
            $display("    dout_Q_add: Expected %0d, Actual %0d", din_Q1[i] + din_Q2[i], dout_Q_add[i]);
            $display("    dout_Q_sub: Expected %0d, Actual %0d", din_Q1[i] - din_Q2[i], dout_Q_sub[i]);
            
            // Basic self-checking
            if (dout_R_add[i] != (din_R1[i] + din_R2[i])) $error("ERROR: R_add mismatch at index %0d", i);
            if (dout_R_sub[i] != (din_R1[i] - din_R2[i])) $error("ERROR: R_sub mismatch at index %0d", i);
            if (dout_Q_add[i] != (din_Q1[i] + din_Q2[i])) $error("ERROR: Q_add mismatch at index %0d", i);
            if (dout_Q_sub[i] != (din_Q1[i] - din_Q2[i])) $error("ERROR: Q_sub mismatch at index %0d", i);
        end

        // --- Test Case 3: en = 0 (No operation) ---
        #(CLK_PERIOD);
        en = 0; // Disable the module
        $display("--------------------------------------------------");
        $display("Test Case 3: en = 0 (No operation)");
        // Inputs remain from previous test case, but outputs should hold previous values
        
        #(CLK_PERIOD); // Wait for one more cycle
        $display("Time = %0t, en = %0b", $time, en);
        $display("Outputs should hold previous values.");

        // --- Test Case 4: Re-enable with new inputs ---
        #(CLK_PERIOD);
        en = 1; // Re-enable
        $display("--------------------------------------------------");
        $display("Test Case 4: Re-enable with new inputs");
        for (i = 0; i < DEPTH; i = i + 1) begin
            din_R1[i] = i * 3;
            din_R2[i] = -(i * 2);
            din_Q1[i] = (i + 1) * 5;
            din_Q2[i] = (i - 10) * 4;
        end

        #(CLK_PERIOD); // Wait for calculation and output update
        $display("Time = %0t, en = %0b", $time, en);
        $display("Expected values and Actual values for Test Case 4:");
        for (i = 0; i < DEPTH; i = i + 1) begin
            $display("  Index %0d:", i);
            $display("    R1: %0d, R2: %0d", din_R1[i], din_R2[i]);
            $display("    Q1: %0d, Q2: %0d", din_Q1[i], din_Q2[i]);
            $display("    dout_R_add: Expected %0d, Actual %0d", din_R1[i] + din_R2[i], dout_R_add[i]);
            $display("    dout_R_sub: Expected %0d, Actual %0d", din_R1[i] - din_R2[i], dout_R_sub[i]);
            $display("    dout_Q_add: Expected %0d, Actual %0d", din_Q1[i] + din_Q2[i], dout_Q_add[i]);
            $display("    dout_Q_sub: Expected %0d, Actual %0d", din_Q1[i] - din_Q2[i], dout_Q_sub[i]);
            
            // Basic self-checking
            if (dout_R_add[i] != (din_R1[i] + din_R2[i])) $error("ERROR: R_add mismatch at index %0d", i);
            if (dout_R_sub[i] != (din_R1[i] - din_R2[i])) $error("ERROR: R_sub mismatch at index %0d", i);
            if (dout_Q_add[i] != (din_Q1[i] + din_Q2[i])) $error("ERROR: Q_add mismatch at index %0d", i);
            if (dout_Q_sub[i] != (din_Q1[i] - din_Q2[i])) $error("ERROR: Q_sub mismatch at index %0d", i);
        end

        // Finish simulation
        #(CLK_PERIOD * 2);
        $display("--------------------------------------------------");
        $display("Simulation Finished.");
        $display("--------------------------------------------------");
        $finish;
    end

    // Optional: Dump waves for waveform viewer
    initial begin
        $dumpfile("BF2I_tb.vcd");
        $dumpvars(0, tb_BF2I);
    end

endmodule
