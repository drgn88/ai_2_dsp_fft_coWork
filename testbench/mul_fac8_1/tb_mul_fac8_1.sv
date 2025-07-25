`timescale 1ns / 1ps

module tb_mul_fac8_1;

  parameter WIDTH      = 11;
  parameter TWF_WIDTH  = 10;
  parameter MUL_WIDTH  = WIDTH + TWF_WIDTH;
  parameter DOUT_WIDTH = WIDTH + TWF_WIDTH - 8;
  parameter DEPTH      = 16;

  logic clk;
  logic rst_n;
  logic [1:0] select;
  logic en;

  logic signed [WIDTH-1:0] din_R_add [DEPTH-1:0];
  logic signed [WIDTH-1:0] din_R_sub [DEPTH-1:0];
  logic signed [WIDTH-1:0] din_Q_add [DEPTH-1:0];
  logic signed [WIDTH-1:0] din_Q_sub [DEPTH-1:0];

  logic signed [DOUT_WIDTH-1:0] dout_R_add [DEPTH-1:0];
  logic signed [DOUT_WIDTH-1:0] dout_R_sub [DEPTH-1:0];
  logic signed [DOUT_WIDTH-1:0] dout_Q_add [DEPTH-1:0];
  logic signed [DOUT_WIDTH-1:0] dout_Q_sub [DEPTH-1:0];

  // DUT 연결
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
    .en(en),
    .din_R_add(din_R_add),
    .din_R_sub(din_R_sub),
    .din_Q_add(din_Q_add),
    .din_Q_sub(din_Q_sub),
    .dout_R_add(dout_R_add),
    .dout_R_sub(dout_R_sub),
    .dout_Q_add(dout_Q_add),
    .dout_Q_sub(dout_Q_sub)
  );

  // 클럭 생성
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst_n = 0;
    en = 0;
    select = 2'd0;

    // 초기화
    for (int i = 0; i < DEPTH; i++) begin
      din_R_add[i] = 11'sd1;
      din_R_sub[i] = -11'sd2;
      din_Q_add[i] = 11'sd3;
      din_Q_sub[i] = -11'sd4;
    end

    // 리셋
    #10;
    rst_n = 1;

    // 테스트 실행
    #10;
    en = 1;

    // 4가지 select case 테스트
    for (int sel = 0; sel < 4; sel++) begin
      select = sel[1:0];
      #10;
      $display("\n>>> SELECT = %0d", select);
      for (int i = 0; i < 4; i++) begin
        $display("[%0d] R_add = %0d, R_sub = %0d, Q_add = %0d, Q_sub = %0d", i, 
          dout_R_add[i], dout_R_sub[i], dout_Q_add[i], dout_Q_sub[i]);
      end
    end

    $finish;
  end

endmodule
