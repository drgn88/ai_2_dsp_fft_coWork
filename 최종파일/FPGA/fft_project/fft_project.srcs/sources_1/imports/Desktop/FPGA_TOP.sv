`timescale 1ns / 1ps

module fpga_top (
    input clk_p,
    input clk_n,
    input rstn,

    // output logic signed [12:0] dout_R[0:15],
    // output logic signed [12:0] dout_Q[0:15],
    output logic top_done
);

    logic signed [8:0] w_data_R[15:0];
    logic signed [8:0] w_data_Q[15:0];

    logic signed [12:0] w_dout_R[511:0];
    logic signed [12:0] w_dout_Q[511:0];

    logic signed [12:0] w_vio_R[15:0];
    logic signed [12:0] w_vio_Q[15:0];

    logic w_valid;
    logic w_done;
    logic w_vio_done;
    logic clk;

    clk_wiz_0 U_CLK_WIZARD (
        // Clock out ports
        .clk(clk),
        // Status and control signals
        .resetn(rstn),
        // Clock in ports
        .clk_in1_p(clk_p),
        .clk_in1_n(clk_n)
    );

    cos_in_gen U_COS_IN_GEN (
        .clk (clk),
        .rstn(rstn),

        .dout_R(w_data_R),
        .dout_Q(w_data_Q),
        .valid (w_valid)
    );

    FFT_TOP U_FFT_TOP (
        .clk  (clk),
        .rstn (rstn),
        .valid(w_valid),
        .din_R(w_data_R),
        .din_Q(w_data_Q),

        .dout_R_reorder(w_dout_R),
        .dout_Q_reorder(w_dout_Q),
        .done(w_done)
    );

    reg_out U_REG_OUT (
        .clk(clk),
        .rstn(rstn),
        .en(w_done),
        .din_R(w_dout_R),
        .din_Q(w_dout_Q),

        .dout_R(w_vio_R),
        .dout_Q(w_vio_Q),
        .done(w_vio_done)
    );

    vio_1 U_VIO (

        .clk(clk),
        .probe_in0(w_vio_done),
        
        .probe_in1(w_vio_R[0]),
        .probe_in2(w_vio_R[1]),
        .probe_in3(w_vio_R[2]),
        .probe_in4(w_vio_R[3]),
        .probe_in5(w_vio_R[4]),
        .probe_in6(w_vio_R[5]),
        .probe_in7(w_vio_R[6]),
        .probe_in8(w_vio_R[7]),
        .probe_in9(w_vio_R[8]),
        .probe_in10(w_vio_R[9]),
        .probe_in11(w_vio_R[10]),
        .probe_in12(w_vio_R[11]),
        .probe_in13(w_vio_R[12]),
        .probe_in14(w_vio_R[13]),
        .probe_in15(w_vio_R[14]),
        .probe_in16(w_vio_R[15]),
        .probe_in17(w_vio_Q[0]),
        .probe_in18(w_vio_Q[1]),
        .probe_in19(w_vio_Q[2]),
        .probe_in20(w_vio_Q[3]),
        .probe_in21(w_vio_Q[4]),
        .probe_in22(w_vio_Q[5]),
        .probe_in23(w_vio_Q[6]),
        .probe_in24(w_vio_Q[7]),
        .probe_in25(w_vio_Q[8]),
        .probe_in26(w_vio_Q[9]),
        .probe_in27(w_vio_Q[10]),
        .probe_in28(w_vio_Q[11]),
        .probe_in29(w_vio_Q[12]),
        .probe_in30(w_vio_Q[13]),
        .probe_in31(w_vio_Q[14]),
        .probe_in32(w_vio_Q[15]),

        .probe_out0(top_done)
    );

endmodule




module reg_out (
    input clk,
    input rstn,
    input en,
    input logic signed [12:0] din_R[0:511],
    input logic signed [12:0] din_Q[0:511],

    output logic signed [12:0] dout_R[0:15],
    output logic signed [12:0] dout_Q[0:15],
    output logic done
);

    logic signed [12:0] reg_data_R[0:31][0:15];
    logic signed [12:0] reg_data_Q[0:31][0:15];

    integer i, j;

    // always @(posedge clk or negedge rstn) begin
    //     if (!rstn) begin
    //         for (i = 0; i < 32; i = i + 1)
    //             for (j = 0; j < 16; j = j + 1) begin
    //                 reg_data_R[i][j] <= 0;
    //                 reg_data_Q[i][j] <= 0;
    //             end
    //     end else if (en) begin
    //         for (i = 0; i < 32; i = i + 1)
    //             for (j = 0; j < 16; j = j + 1) begin
    //                 reg_data_R[i][j] <= din_R[16*i + j];
    //                 reg_data_Q[i][j] <= din_Q[16*i + j];
    //             end
    //     end
    // end

    always_comb begin : reg_data
        if (!rstn) begin
            for (i = 0; i < 32; i = i + 1)
                for (j = 0; j < 16; j = j + 1) begin
                    reg_data_R[i][j] = 0;
                    reg_data_Q[i][j] = 0;
                end
        end else if (en) begin
            for (i = 0; i < 32; i = i + 1)
                for (j = 0; j < 16; j = j + 1) begin
                    reg_data_R[i][j] = din_R[16*i + j];
                    reg_data_Q[i][j] = din_Q[16*i + j];
                end
        end
    end

    logic [5:0] k;
    integer l;

    always_ff @(posedge clk or negedge rstn) begin
        if (!rstn) begin
            k <= 0;
            done <= 0;
            for (l = 0; l < 16; l++) begin
                    dout_R[l] <= 0;
                    dout_Q[l] <= 0;
            end
        end else begin
            if (en) begin
                k <= 0; 
                done <= 0;
            end else if (k < 32) begin
                for (l = 0; l < 16; l++) begin
                    dout_R[l] <= reg_data_R[k][l];
                    dout_Q[l] <= reg_data_Q[k][l];
                end
                done <= 1;
                k <= k + 1;
            end else begin
                done <= 0;
                for (l = 0; l < 16; l++) begin
                    dout_R[l] <= 0;
                    dout_Q[l] <= 0;
                end
            end
        end
    end

endmodule
