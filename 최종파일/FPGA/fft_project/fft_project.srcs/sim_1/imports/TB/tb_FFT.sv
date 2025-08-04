// `timescale 1ns / 1ps

// module tb_fpga_top;
//     // ========================
//     // Testbench signals
//     // ========================
//     logic clk;
//     logic rstn;

//     logic signed [12:0] dout_R[0:15];
//     logic signed [12:0] dout_Q[0:15];
//     logic done;

//     // ========================
//     // DUT instantiation
//     // ========================
//     fpga_top dut (
//         .clk(clk),
//         .rstn(rstn),
//         .dout_R(dout_R),
//         .dout_Q(dout_Q),
//         .done(done)
//     );

//     // ========================
//     // Clock generation
//     // ========================
//     always #5 clk = ~clk;

//     // ========================
//     // Reset and simulation flow
//     // ========================
//     initial begin
//         clk = 0;
//         rstn = 0;

//         #10;
//         rstn = 1;

//         // Simulation time (조정 가능)
//         repeat (10000) @(posedge clk);

//         $finish;
//     end

// endmodule

/////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module fpga_top_tb;

    // DUT (Device Under Test) Port Declarations
    logic clk_p;
    logic clk_n;
    logic rstn;
    logic top_done;

    // Clock Generation
    localparam CLOCK_PERIOD = 10; 

    always begin
        clk_p = 1;
        #(CLOCK_PERIOD/2) clk_p = 0;
        #(CLOCK_PERIOD/2);
    end
    assign clk_n = ~clk_p;


    // Reset Generation
    initial begin
        rstn = 1'b0; // Active-low reset
        #20;
        rstn = 1'b1; // De-assert reset
    end

    // Instantiate the DUT
    fpga_top UUT (
        .clk_p(clk_p),
        .clk_n(clk_n),
        .rstn(rstn),
        .top_done(top_done)
    );


endmodule