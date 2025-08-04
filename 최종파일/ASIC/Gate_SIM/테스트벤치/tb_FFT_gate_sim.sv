`timescale 1ns / 1ps

module tb_FFT_TOP_gate();

// Parameters
localparam DATA_WIDTH   = 9;
localparam NUM_IN_OUT   = 16;
localparam FILE_DEPTH   = 2048;
localparam CLK_PERIOD   = 10;

// Clock & reset
reg clk;
reg rstn;

// FFT input, output signals
reg signed [DATA_WIDTH-1:0] din_i [0:NUM_IN_OUT-1];
reg signed [DATA_WIDTH-1:0] din_q [0:NUM_IN_OUT-1];

reg  [143:0] din_R;   // Packed input for gate-level FFT_TOP
reg  [143:0] din_Q;
reg         valid;

wire [6655:0] dout_R_reorder;  // Packed output from FFT_TOP
wire [6655:0] dout_Q_reorder;
wire          done;

wire [351:0] dout_R_add02;
wire [351:0] dout_Q_add02;
wire [351:0] dout_R_sub02;
wire [351:0] dout_Q_sub02;

wire alert_CBFP;
//////////////////////////////////////////////////////////////////////////
                    //MODULE 0_2
//////////////////////////////////////////////////////////////////////////
// wire [159:0] dout_R_add00;  // Packed output from FFT_TOP
// wire [159:0] dout_R_sub00;
// wire [159:0] dout_Q_add00;  // Packed output from FFT_TOP
// wire [159:0] dout_Q_sub00;

// wire [207:0] dout_R_add01;  // Packed output from FFT_TOP
// wire [207:0] dout_R_sub01;
// wire [207:0] dout_Q_add01;  // Packed output from FFT_TOP
// wire [207:0] dout_Q_sub01;

// //cu0_2
// wire bf_en02, mux_sel02, mul_en, alert_CBFP;
// wire [8:0] addr;

// wire alert_mod00;
// wire alert_mod01;

// //SHIFT_REG_SUB128
// wire [207:0] dout_R_sr01;
// wire [207:0] dout_Q_sr01;

// //MUX_OUT
// wire [207:0] dout_R_mux01;
// wire [207:0] dout_Q_mux01;

// //SR64 OUT
// wire [207:0] dout_R_sout01;
// wire [207:0] dout_Q_sout01;

// //bfly02 out
// wire   [223:0] bfly02_R_add;
// wire   [223:0] bfly02_R_sub;
// wire   [223:0] bfly02_Q_add;
// wire   [221:0] bfly02_Q_sub;

// // Simulation In & Output
// logic signed [12:0] bfly02_R1_in [0:15];
// logic signed [12:0] bfly02_R2_in [0:15];
// logic signed [12:0] bfly02_Q1_in [0:15];
// logic signed [12:0] bfly02_Q2_in [0:15];


// logic signed [13:0] bfly02_R_add_arr [0:15];
// logic signed [13:0] bfly02_R_sub_arr [0:15];

// logic signed [13:0] bfly02_Q_add_arr [0:15];
// logic signed [13:0] bfly02_Q_sub_arr [0:15];

// genvar q, o;

// generate
//     for (o = 0; o < 16; o = o + 1) begin : UNPK_MODIN
//         assign bfly02_R1_in[o] = dout_R_sout01[o*13 +: 13];
//         assign bfly02_R2_in[o] = dout_R_mux01[o*13 +: 13];
//         assign bfly02_Q1_in[o] = dout_Q_sout01[o*13 +: 13];
//         assign bfly02_Q2_in[o] = dout_Q_mux01[o*13 +: 13];
//     end
// endgenerate

// // generate
// //     for (o = 0; o < 16; o = o + 1) begin : UNPK_MODIN
// //         assign bfly02_R1_in[o] = dout_R_sout01[o*13 +: 13];
// //         assign bfly02_R2_in[o] = dout_R_mux01[o*13 +: 13];
// //         assign bfly02_Q1_in[o] = dout_Q_sout01[o*13 +: 13];
// //         assign bfly02_Q2_in[o] = dout_Q_mux01[o*13 +: 13];
// //     end
// // endgenerate

// generate
//     for (q = 0; q < 16; q = q + 1) begin : UNPK_MODOUT
//         assign bfly02_R_add_arr[q] = bfly02_R_add[q*14 +: 14];
//         assign bfly02_R_sub_arr[q] = bfly02_R_sub[q*14 +: 14];
//         assign bfly02_Q_add_arr[q] = bfly02_Q_add[q*14 +: 14];
//         assign bfly02_Q_sub_arr[q] = bfly02_Q_sub[q*14 +: 14];
//     end
// endgenerate


// Output array for easier handling
logic signed [12:0] dout_R_reorder_arr [0:511];
logic signed [12:0] dout_Q_reorder_arr [0:511];

// Input data File buffer
reg signed [DATA_WIDTH-1:0] cos_i_data [0:FILE_DEPTH-1];
reg signed [DATA_WIDTH-1:0] cos_q_data [0:FILE_DEPTH-1];

// For output recording
integer i, j;
integer file_i, file_q;
integer file_real_out, file_imag_out;

integer out_idx = 0;

// Packing combinational logic
integer k;
always @* begin
    din_R = '0;
    din_Q = '0;
    for (k = 0; k < NUM_IN_OUT; k = k + 1) begin
        din_R[k*DATA_WIDTH +: DATA_WIDTH] = din_i[k];
        din_Q[k*DATA_WIDTH +: DATA_WIDTH] = din_q[k];
    end
end

// Output unpacking to arrays
genvar g;
generate
    for (g = 0; g < 512; g = g + 1) begin : UNPK
        assign dout_R_reorder_arr[g] = dout_R_reorder[g*13 +: 13];
        assign dout_Q_reorder_arr[g] = dout_Q_reorder[g*13 +: 13];
    end
endgenerate

// module0 DUT( .clk(clk), .rstn(rstn), .valid(valid), .din_R(din_R), .din_Q(din_Q), .dout_R_add02(dout_R_add02), .dout_R_sub02(dout_R_sub02),
//         .dout_Q_add02(dout_Q_add02), .dout_Q_sub02(dout_Q_sub02), .alert_CBFP(alert_CBFP) );

// module0 DUT( .clk(clk), .rstn(rstn), .valid(valid), .din_R(din_R), .din_Q(din_Q), .dout_R_add02(dout_R_add02), .dout_Q_add02(dout_Q_add02), 
// .dout_R_sub02(dout_R_sub02), .dout_Q_sub02(dout_Q_sub02), .alert_CBFP(alert_CBFP) );

//DUT instantiation (gate-level FFT_TOP)
FFT_TOP U_FFT (
    .clk              (clk),
    .rstn             (rstn),
    .valid            (valid),
    .din_R            (din_R),
    .din_Q            (din_Q),
    .dout_R_reorder   (dout_R_reorder),
    .dout_Q_reorder   (dout_Q_reorder),
    .done             (done)
);

// FFT_TOP U_FFT (
//     .clk              (clk),
//     .rstn             (rstn),
//     .valid            (valid),
//     .din_i            (din_R),
//     .din_q            (din_Q),
//     .do_re   (dout_R_reorder),
//     .do_im   (dout_Q_reorder),
//     .do_en             (done)
// );

// mod0_0_DATA_WIDTH9_NUM_IN_OUT16 DUT00( .clk(clk), .rstn(rstn), .valid(valid), .din_i(din_R), .din_q(din_Q), 
//     .dout_R_add_00(dout_R_add00), .dout_R_sub_00(dout_R_sub00), .dout_Q_add_00(dout_Q_add00), .dout_Q_sub_00(dout_Q_sub00), 
//     .alert_mod01(alert_mod00) );

// mod0_1 DUT01( .clk(clk), .rstn(rstn), .alert_mod01(alert_mod00), .din_R_add00(dout_R_add00), .din_Q_add00(dout_Q_add00), .din_R_sub00(dout_R_sub00), 
// .din_Q_sub00(dout_Q_sub00), .dout_R_add01(dout_R_add01), .dout_Q_add01(dout_Q_add01), .dout_R_sub01(dout_R_sub01), .dout_Q_sub01(dout_Q_sub01), 
// .alert_mod02(alert_mod01) );

// //  mod0_2 DUT02( .clk(clk), .rstn(rstn), .alert_mod02(alert_mod01), .din_R_add02(dout_R_add01), .din_Q_add02(dout_Q_add01), .din_R_sub02(dout_R_sub01), 
// //         .din_Q_sub02(dout_Q_sub01), .dout_R_add02(dout_R_add02), .dout_Q_add02(dout_Q_add02), .dout_R_sub02(dout_R_sub02), .dout_Q_sub02(dout_Q_sub02), 
// //         .alert_CBFP(alert_mod02) );

// cu_mod0_2 DUT_CU02( .clk(clk), .rstn(rstn), .alert_mod02(alert_mod01), .bf_en02(bf_en02), .mux_sel02(mux_sel02), .addr(addr), .mul_en(mul_en), 
//         .alert_CBFP(alert_CBFP) );

// shift_reg_DATA_WIDTH13_NUM_IN_OUT16_REG_DEPTH8 SUB02_MEM_128 ( .clk(clk), 
// .rstn(rstn), .din_i(dout_R_sub01), .din_q(dout_Q_sub01), .dout_i(
// dout_R_sr01), .dout_q(dout_Q_sr01) );

// mux_32_to_16_DATA_WIDTH13 MUX02 ( .mux_sel(mux_sel02), .din_R_add00(
//         dout_R_add01), .din_Q_add00(dout_Q_add01), .din_R_sub00(dout_R_sr01), 
//         .din_Q_sub00(dout_Q_sr01), .din_R_01(dout_R_mux01), .din_Q_01(
//         dout_Q_mux01) );

// shift_reg_DATA_WIDTH13_NUM_IN_OUT16_REG_DEPTH4 SHFIT02_64 ( .clk(clk), 
//         .rstn(rstn), .din_i(dout_R_mux01), .din_q(dout_Q_mux01), .dout_i(
//         dout_R_sout01), .dout_q(dout_Q_sout01) );

// BF2I_WIDTH13_DEPTH16 U_BF2I_02 ( .clk(clk), .rst_n(rstn), .en(bf_en02), 
//         .din_R1(dout_R_sout01), .din_R2(dout_R_mux01), .din_Q1(dout_Q_sout01), .din_Q2(
//         dout_Q_mux01), .dout_R_add(bfly02_R_add), .dout_R_sub(bfly02_R_sub), 
//         .dout_Q_add(bfly02_Q_add), .dout_Q_sub(bfly02_Q_sub) );

// Clock generation
initial begin
    clk = 0;
    forever #(CLK_PERIOD/2) clk = ~clk;
end

// Main test process
initial begin
    // Signal init
    rstn = 0;
    valid = 0;
    for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
        din_i[i] = 0; din_q[i] = 0;
    end

    // Input 파일 읽기
    // 아래 파일명은 환경에 맞춰 수정하세요
    file_i = $fopen("/home/aedu46/DSP_DIR/FFT_design/FINAL_FIX/TB/cos_i_dat.txt", "r");
    file_q = $fopen("/home/aedu46/DSP_DIR/FFT_design/FINAL_FIX/TB/cos_q_dat.txt", "r");

    for (i = 0; i < FILE_DEPTH; i = i + 1) begin
        if ($fscanf(file_i, "%d\n", cos_i_data[i]) == 0) cos_i_data[i] = 0;
        if ($fscanf(file_q, "%d\n", cos_q_data[i]) == 0) cos_q_data[i] = 0;
    end
    $fclose(file_i); $fclose(file_q);

    // Output 파일 오픈
    file_real_out = $fopen("bfly01_real.txt", "w");
    file_imag_out = $fopen("bfly01_imag.txt", "w");

    // Reset seq
    #(CLK_PERIOD*2);
    rstn = 1'b1;

    // 입력 apply
    @(negedge clk);
    valid = 1'b1;
    for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
        din_i[j] = cos_i_data[j];
        din_q[j] = cos_q_data[j];
    end

    // 나머지 입력
    for (i = NUM_IN_OUT; i < 32*NUM_IN_OUT; i = i + NUM_IN_OUT) begin
        @(negedge clk);
        for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
            if ((i+j) < FILE_DEPTH) begin
                din_i[j] = cos_i_data[i+j];
                din_q[j] = cos_q_data[i+j];
            end
            else begin
                din_i[j] = 0;
                din_q[j] = 0;
            end
        end
    end

    // valid deassert
    @(posedge clk);
    valid = 1'b0;

    // 파이프라인 flush용 남은 입력: (원하는 만큼 반복, 생략 가능)
    for (; i < FILE_DEPTH; i = i + NUM_IN_OUT) begin
        @(negedge clk);
        for (j = 0; j < NUM_IN_OUT; j = j + 1) begin
            if ((i+j) < FILE_DEPTH) begin
                din_i[j] = cos_i_data[i+j];
                din_q[j] = cos_q_data[i+j];
            end
            else begin
                din_i[j] = 0;
                din_q[j] = 0;
            end
        end
    end

    // 결과 기록을 위해 충분히 기다리기
    repeat (100) @(posedge clk);

    // 파일 마감
    $fclose(file_real_out);
    $fclose(file_imag_out);
    $stop;
end

// 출력 기록: done 신호를 쓸 수도 있고, 아래는 예시(모든 출력 512개 순차 저장)
always @(posedge clk) begin
    if (rstn) begin
        if (out_idx < 512) begin
            $fwrite(file_real_out, "outR[%0d]=%0d\n", out_idx, dout_R_reorder_arr[out_idx]);
            $fwrite(file_imag_out, "outQ[%0d]=%0d\n", out_idx, dout_Q_reorder_arr[out_idx]);
            out_idx = out_idx + 1;
        end
    end
end

endmodule
