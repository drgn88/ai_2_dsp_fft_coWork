`timescale 1ns / 1ps

module tb_cos_in_gen;

    // DUT I/O
    logic clk;
    logic rstn;

    logic signed [8:0] dout_R[15:0];
    logic signed [8:0] dout_Q[15:0];
    logic valid;

    // Instantiate DUT
    cos_in_gen uut (
        .clk(clk),
        .rstn(rstn),
        .dout_R(dout_R),
        .dout_Q(dout_Q),
        .valid(valid)
    );

    // Clock generation
    always #5 clk = ~clk;

    // Test sequence
    initial begin
        clk = 0;
        rstn = 0;
        #10;
        rstn = 1;

        // Run simulation for some cycles
        repeat (600) @(posedge clk);  // 충분한 주소 출력을 기다림

        $finish;
    end

endmodule
