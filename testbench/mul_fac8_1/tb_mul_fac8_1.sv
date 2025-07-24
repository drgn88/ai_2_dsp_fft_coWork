`timescale 1ns / 1ps

module tb_mul_fac8_1;

    parameter WIDTH      = 11;
    parameter TWF_WIDTH  = 10;
    parameter MUL_WIDTH  = WIDTH + TWF_WIDTH;
    parameter DOUT_WIDTH = WIDTH + TWF_WIDTH - 8;
    parameter DEPTH      = 16;

    // Inputs
    reg clk;
    reg rst_n;
    reg [2:0] select;
    reg signed [WIDTH-1:0] din_R_add   [0:DEPTH-1];
    reg signed [WIDTH-1:0] din_R_sub   [0:DEPTH-1];
    reg signed [WIDTH-1:0] din_Q_add   [0:DEPTH-1];
    reg signed [WIDTH-1:0] din_Q_sub   [0:DEPTH-1];

    // Outputs
    wire signed [DOUT_WIDTH-1:0] dout_R_add [0:DEPTH-1];
    wire signed [DOUT_WIDTH-1:0] dout_R_sub [0:DEPTH-1];
    wire signed [DOUT_WIDTH-1:0] dout_Q_add [0:DEPTH-1];
    wire signed [DOUT_WIDTH-1:0] dout_Q_sub [0:DEPTH-1];

    // Instantiate the DUT
    mul_fac8_1 #(
        .WIDTH(WIDTH),
        .TWF_WIDTH(TWF_WIDTH),
        .MUL_WIDTH(MUL_WIDTH),
        .DOUT_WIDTH(DOUT_WIDTH),
        .DEPTH(DEPTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .select(select),
        .din_R_add(din_R_add),
        .din_R_sub(din_R_sub),
        .din_Q_add(din_Q_add),
        .din_Q_sub(din_Q_sub),
        .dout_R_add(dout_R_add),
        .dout_R_sub(dout_R_sub),
        .dout_Q_add(dout_Q_add),
        .dout_Q_sub(dout_Q_sub)
    );

    // Clock generation
    always #5 clk = ~clk;

    integer i;

    initial begin
        // VCD 덤프
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_mul_fac8_1);

        // 초기화
        clk = 0;
        rst_n = 0;
        select = 3'b000;

        for (i = 0; i < DEPTH; i = i + 1) begin
            din_R_add[i] = 0;
            din_R_sub[i] = 0;
            din_Q_add[i] = 0;
            din_Q_sub[i] = 0;
        end

        #20 rst_n = 1;

        // 입력 값 설정
        for (i = 0; i < DEPTH; i = i + 1) begin
            din_R_add[i] = 11'sd10;
            din_R_sub[i] = -11'sd5;
            din_Q_add[i] = 11'sd8;
            din_Q_sub[i] = -11'sd4;
        end

        // 트위들 인자 선택
        select = 3'd5; // twf_R = 181, twf_Q = -181

        #50;

        // 출력 확인
        for (i = 0; i < DEPTH; i = i + 1) begin
            $display("[%0t ns] dout_R_add[%0d] = %d, dout_Q_add[%0d] = %d",
                $time, i, dout_R_add[i], i, dout_Q_add[i]);
        end

        #10 $finish;
    end

endmodule
