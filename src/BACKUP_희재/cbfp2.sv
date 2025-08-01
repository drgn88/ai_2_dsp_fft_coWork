`timescale 1ns / 1ps

module cbfp2 (
   input clk,
   input rstn,

   input logic push_idx1,
   input logic push_idx2,
   input logic pop,
   input logic [4:0] push_data_idx1,

   input logic [4:0] push_data_idx2_1,
   input logic [4:0] push_data_idx2_2,
   input logic [4:0] push_data_idx2_3,
   input logic [4:0] push_data_idx2_4,

   input logic signed [15:0] din_R_1st_cbfp2,
   input logic signed [15:0] din_Q_1st_cbfp2,

   input logic signed [15:0] din_R_2nd_cbfp2,
   input logic signed [15:0] din_Q_2nd_cbfp2,

   input logic signed [15:0] din_R_3rd_cbfp2,
   input logic signed [15:0] din_Q_3rd_cbfp2,

   input logic signed [15:0] din_R_4th_cbfp2,
   input logic signed [15:0] din_Q_4th_cbfp2,

   input logic signed [15:0] din_R_5th_cbfp2,
   input logic signed [15:0] din_Q_5th_cbfp2,

   input logic signed [15:0] din_R_6th_cbfp2,
   input logic signed [15:0] din_Q_6th_cbfp2,

   input logic signed [15:0] din_R_7th_cbfp2,
   input logic signed [15:0] din_Q_7th_cbfp2,

   input logic signed [15:0] din_R_8th_cbfp2,
   input logic signed [15:0] din_Q_8th_cbfp2,

   input logic signed [15:0] din_R_9th_cbfp2,
   input logic signed [15:0] din_Q_9th_cbfp2,

   input logic signed [15:0] din_R_10th_cbfp2,
   input logic signed [15:0] din_Q_10th_cbfp2,

   input logic signed [15:0] din_R_11th_cbfp2,
   input logic signed [15:0] din_Q_11th_cbfp2,

   input logic signed [15:0] din_R_12th_cbfp2,
   input logic signed [15:0] din_Q_12th_cbfp2,

   input logic signed [15:0] din_R_13th_cbfp2,
   input logic signed [15:0] din_Q_13th_cbfp2,

   input logic signed [15:0] din_R_14th_cbfp2,
   input logic signed [15:0] din_Q_14th_cbfp2,

   input logic signed [15:0] din_R_15th_cbfp2,
   input logic signed [15:0] din_Q_15th_cbfp2,

   input logic signed [15:0] din_R_16th_cbfp2,
   input logic signed [15:0] din_Q_16th_cbfp2,

   input logic signed [15:0] din_R_17th_cbfp2,
   input logic signed [15:0] din_Q_17th_cbfp2,

   input logic signed [15:0] din_R_18th_cbfp2,
   input logic signed [15:0] din_Q_18th_cbfp2,

   input logic signed [15:0] din_R_19th_cbfp2,
   input logic signed [15:0] din_Q_19th_cbfp2,

   input logic signed [15:0] din_R_20th_cbfp2,
   input logic signed [15:0] din_Q_20th_cbfp2,

   input logic signed [15:0] din_R_21st_cbfp2,
   input logic signed [15:0] din_Q_21st_cbfp2,

   input logic signed [15:0] din_R_22nd_cbfp2,
   input logic signed [15:0] din_Q_22nd_cbfp2,

   input logic signed [15:0] din_R_23rd_cbfp2,
   input logic signed [15:0] din_Q_23rd_cbfp2,

   input logic signed [15:0] din_R_24th_cbfp2,
   input logic signed [15:0] din_Q_24th_cbfp2,

   input logic signed [15:0] din_R_25th_cbfp2,
   input logic signed [15:0] din_Q_25th_cbfp2,

   input logic signed [15:0] din_R_26th_cbfp2,
   input logic signed [15:0] din_Q_26th_cbfp2,

   input logic signed [15:0] din_R_27th_cbfp2,
   input logic signed [15:0] din_Q_27th_cbfp2,

   input logic signed [15:0] din_R_28th_cbfp2,
   input logic signed [15:0] din_Q_28th_cbfp2,

   input logic signed [15:0] din_R_29th_cbfp2,
   input logic signed [15:0] din_Q_29th_cbfp2,

   input logic signed [15:0] din_R_30th_cbfp2,
   input logic signed [15:0] din_Q_30th_cbfp2,

   input logic signed [15:0] din_R_31st_cbfp2,
   input logic signed [15:0] din_Q_31st_cbfp2,

   input logic signed [15:0] din_R_32nd_cbfp2,
   input logic signed [15:0] din_Q_32nd_cbfp2,

   // Output signals for all 64 channels
   output logic signed [12:0] dout_R_1st_cbfp2,
   output logic signed [12:0] dout_Q_1st_cbfp2,

   output logic signed [12:0] dout_R_2nd_cbfp2,
   output logic signed [12:0] dout_Q_2nd_cbfp2,

   output logic signed [12:0] dout_R_3rd_cbfp2,
   output logic signed [12:0] dout_Q_3rd_cbfp2,

   output logic signed [12:0] dout_R_4th_cbfp2,
   output logic signed [12:0] dout_Q_4th_cbfp2,

   output logic signed [12:0] dout_R_5th_cbfp2,
   output logic signed [12:0] dout_Q_5th_cbfp2,

   output logic signed [12:0] dout_R_6th_cbfp2,
   output logic signed [12:0] dout_Q_6th_cbfp2,

   output logic signed [12:0] dout_R_7th_cbfp2,
   output logic signed [12:0] dout_Q_7th_cbfp2,

   output logic signed [12:0] dout_R_8th_cbfp2,
   output logic signed [12:0] dout_Q_8th_cbfp2,

   output logic signed [12:0] dout_R_9th_cbfp2,
   output logic signed [12:0] dout_Q_9th_cbfp2,

   output logic signed [12:0] dout_R_10th_cbfp2,
   output logic signed [12:0] dout_Q_10th_cbfp2,

   output logic signed [12:0] dout_R_11th_cbfp2,
   output logic signed [12:0] dout_Q_11th_cbfp2,

   output logic signed [12:0] dout_R_12th_cbfp2,
   output logic signed [12:0] dout_Q_12th_cbfp2,

   output logic signed [12:0] dout_R_13th_cbfp2,
   output logic signed [12:0] dout_Q_13th_cbfp2,

   output logic signed [12:0] dout_R_14th_cbfp2,
   output logic signed [12:0] dout_Q_14th_cbfp2,

   output logic signed [12:0] dout_R_15th_cbfp2,
   output logic signed [12:0] dout_Q_15th_cbfp2,

   output logic signed [12:0] dout_R_16th_cbfp2,
   output logic signed [12:0] dout_Q_16th_cbfp2,

   output logic signed [12:0] dout_R_17th_cbfp2,
   output logic signed [12:0] dout_Q_17th_cbfp2,

   output logic signed [12:0] dout_R_18th_cbfp2,
   output logic signed [12:0] dout_Q_18th_cbfp2,

   output logic signed [12:0] dout_R_19th_cbfp2,
   output logic signed [12:0] dout_Q_19th_cbfp2,

   output logic signed [12:0] dout_R_20th_cbfp2,
   output logic signed [12:0] dout_Q_20th_cbfp2,

   output logic signed [12:0] dout_R_21st_cbfp2,
   output logic signed [12:0] dout_Q_21st_cbfp2,

   output logic signed [12:0] dout_R_22nd_cbfp2,
   output logic signed [12:0] dout_Q_22nd_cbfp2,

   output logic signed [12:0] dout_R_23rd_cbfp2,
   output logic signed [12:0] dout_Q_23rd_cbfp2,

   output logic signed [12:0] dout_R_24th_cbfp2,
   output logic signed [12:0] dout_Q_24th_cbfp2,

   output logic signed [12:0] dout_R_25th_cbfp2,
   output logic signed [12:0] dout_Q_25th_cbfp2,

   output logic signed [12:0] dout_R_26th_cbfp2,
   output logic signed [12:0] dout_Q_26th_cbfp2,

   output logic signed [12:0] dout_R_27th_cbfp2,
   output logic signed [12:0] dout_Q_27th_cbfp2,

   output logic signed [12:0] dout_R_28th_cbfp2,
   output logic signed [12:0] dout_Q_28th_cbfp2,

   output logic signed [12:0] dout_R_29th_cbfp2,
   output logic signed [12:0] dout_Q_29th_cbfp2,

   output logic signed [12:0] dout_R_30th_cbfp2,
   output logic signed [12:0] dout_Q_30th_cbfp2,

   output logic signed [12:0] dout_R_31st_cbfp2,
   output logic signed [12:0] dout_Q_31st_cbfp2,

   output logic signed [12:0] dout_R_32nd_cbfp2,
   output logic signed [12:0] dout_Q_32nd_cbfp2
);

   /////////////////////////////////////////////////////////////////////////
   ////                            INDEX_MEM WITH INDEX_SUM                   ////
   /////////////////////////////////////////////////////////////////////////

   logic [5:0] w_mem_out [31:0];
   logic [4:0] w_sc_fac_cbfp0[31:0];
   logic [4:0] w_sc_fac_cbfp1[31:0];

   mem_cbfp0 #(
    .DEPTH(512),
    .ADDR_WIDTH(9),
    .FACTOR_WIDTH(5),
    .IN1_OFFSET(64),			// 1개 scaling factor 64개 단위
    .DATA_OUT(32)
	) MEM_CBFP0(
    .clk(clk),
    .rstn(rstn),

    .push1(push_idx1),			//CBFP0 PUSH
	.pop(pop),			//CBFP2 POP

    .in_data1(push_data_idx1),
    
    .sc_fac_cbfp0(w_sc_fac_cbfp0)
	);

   mem_cbfp1 #(
    .DEPTH(512),
    .ADDR_WIDTH(9),
    .FACTOR_WIDTH(5),
    .IN2_OFFSET(8),			// 1개 scaling factor 64개 단위
    .DATA_OUT(32)
	) MEM_CBFP1(
    .clk(clk),
    .rstn(rstn),

    .push2(push_idx2),			//CBFP1 PUSH
	.pop(pop),			//CBFP2 POP

    .in_data2_0(push_data_idx2_1),
    .in_data2_1(push_data_idx2_2),
    .in_data2_2(push_data_idx2_3),
    .in_data2_3(push_data_idx2_4),
    
    .sc_fac_cbfp1(w_sc_fac_cbfp1)
	);

	index_sum #(
	.FACTOR_WIDTH(5),
    .DATA_OUT(32)
	) U_IDX_SUM (
	.clk(clk),
	.rstn(rstn),
	.alert_cbfp2(pop),

	.sc_fac_cbfp0(w_sc_fac_cbfp0),
	.sc_fac_cbfp1(w_sc_fac_cbfp1),

	.final_sc_fac(w_mem_out)
	);

   /////////////////////////////////////////////////////////////////////////
   ////                            BIT_SHIFT_R (32개)                   ////
   /////////////////////////////////////////////////////////////////////////

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_1st (
       .data_in(din_R_1st_cbfp2),
       .shift_value(w_mem_out[0]),
       .data_out(dout_R_1st_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_2nd (
       .data_in(din_R_2nd_cbfp2),
       .shift_value(w_mem_out[1]),
       .data_out(dout_R_2nd_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_3rd (
       .data_in(din_R_3rd_cbfp2),
       .shift_value(w_mem_out[2]),
       .data_out(dout_R_3rd_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_4th (
       .data_in(din_R_4th_cbfp2),
       .shift_value(w_mem_out[3]),
       .data_out(dout_R_4th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_5th (
       .data_in(din_R_5th_cbfp2),
       .shift_value(w_mem_out[4]),
       .data_out(dout_R_5th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_6th (
       .data_in(din_R_6th_cbfp2),
       .shift_value(w_mem_out[5]),
       .data_out(dout_R_6th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_7th (
       .data_in(din_R_7th_cbfp2),
       .shift_value(w_mem_out[6]),
       .data_out(dout_R_7th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_8th (
       .data_in(din_R_8th_cbfp2),
       .shift_value(w_mem_out[7]),
       .data_out(dout_R_8th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_9th (
       .data_in(din_R_9th_cbfp2),
       .shift_value(w_mem_out[8]),
       .data_out(dout_R_9th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_10th (
       .data_in(din_R_10th_cbfp2),
       .shift_value(w_mem_out[9]),
       .data_out(dout_R_10th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_11th (
       .data_in(din_R_11th_cbfp2),
       .shift_value(w_mem_out[10]),
       .data_out(dout_R_11th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_12th (
       .data_in(din_R_12th_cbfp2),
       .shift_value(w_mem_out[11]),
       .data_out(dout_R_12th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_13th (
       .data_in(din_R_13th_cbfp2),
       .shift_value(w_mem_out[12]),
       .data_out(dout_R_13th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_14th (
       .data_in(din_R_14th_cbfp2),
       .shift_value(w_mem_out[13]),
       .data_out(dout_R_14th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_15th (
       .data_in(din_R_15th_cbfp2),
       .shift_value(w_mem_out[14]),
       .data_out(dout_R_15th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_16th (
       .data_in(din_R_16th_cbfp2),
       .shift_value(w_mem_out[15]),
       .data_out(dout_R_16th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_17th (
       .data_in(din_R_17th_cbfp2),
       .shift_value(w_mem_out[16]),
       .data_out(dout_R_17th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_18th (
       .data_in(din_R_18th_cbfp2),
       .shift_value(w_mem_out[17]),
       .data_out(dout_R_18th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_19th (
       .data_in(din_R_19th_cbfp2),
       .shift_value(w_mem_out[18]),
       .data_out(dout_R_19th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_20th (
       .data_in(din_R_20th_cbfp2),
       .shift_value(w_mem_out[19]),
       .data_out(dout_R_20th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_21st (
       .data_in(din_R_21st_cbfp2),
       .shift_value(w_mem_out[20]),
       .data_out(dout_R_21st_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_22nd (
       .data_in(din_R_22nd_cbfp2),
       .shift_value(w_mem_out[21]),
       .data_out(dout_R_22nd_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_23rd (
       .data_in(din_R_23rd_cbfp2),
       .shift_value(w_mem_out[22]),
       .data_out(dout_R_23rd_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_24th (
       .data_in(din_R_24th_cbfp2),
       .shift_value(w_mem_out[23]),
       .data_out(dout_R_24th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_25th (
       .data_in(din_R_25th_cbfp2),
       .shift_value(w_mem_out[24]),
       .data_out(dout_R_25th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_26th (
       .data_in(din_R_26th_cbfp2),
       .shift_value(w_mem_out[25]),
       .data_out(dout_R_26th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_27th (
       .data_in(din_R_27th_cbfp2),
       .shift_value(w_mem_out[26]),
       .data_out(dout_R_27th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_28th (
       .data_in(din_R_28th_cbfp2),
       .shift_value(w_mem_out[27]),
       .data_out(dout_R_28th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_29th (
       .data_in(din_R_29th_cbfp2),
       .shift_value(w_mem_out[28]),
       .data_out(dout_R_29th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_30th (
       .data_in(din_R_30th_cbfp2),
       .shift_value(w_mem_out[29]),
       .data_out(dout_R_30th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_31st (
       .data_in(din_R_31st_cbfp2),
       .shift_value(w_mem_out[30]),
       .data_out(dout_R_31st_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_R_32nd (
       .data_in(din_R_32nd_cbfp2),
       .shift_value(w_mem_out[31]),
       .data_out(dout_R_32nd_cbfp2)
   );

   /////////////////////////////////////////////////////////////////////////
   ////                            BIT_SHIFT_Q (32개)                   ////
   /////////////////////////////////////////////////////////////////////////

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_1st (
       .data_in(din_Q_1st_cbfp2),
       .shift_value(w_mem_out[0]),
       .data_out(dout_Q_1st_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_2nd (
       .data_in(din_Q_2nd_cbfp2),
       .shift_value(w_mem_out[1]),
       .data_out(dout_Q_2nd_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_3rd (
       .data_in(din_Q_3rd_cbfp2),
       .shift_value(w_mem_out[2]),
       .data_out(dout_Q_3rd_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_4th (
       .data_in(din_Q_4th_cbfp2),
       .shift_value(w_mem_out[3]),
       .data_out(dout_Q_4th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_5th (
       .data_in(din_Q_5th_cbfp2),
       .shift_value(w_mem_out[4]),
       .data_out(dout_Q_5th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_6th (
       .data_in(din_Q_6th_cbfp2),
       .shift_value(w_mem_out[5]),
       .data_out(dout_Q_6th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_7th (
       .data_in(din_Q_7th_cbfp2),
       .shift_value(w_mem_out[6]),
       .data_out(dout_Q_7th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_8th (
       .data_in(din_Q_8th_cbfp2),
       .shift_value(w_mem_out[7]),
       .data_out(dout_Q_8th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_9th (
       .data_in(din_Q_9th_cbfp2),
       .shift_value(w_mem_out[8]),
       .data_out(dout_Q_9th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_10th (
       .data_in(din_Q_10th_cbfp2),
       .shift_value(w_mem_out[9]),
       .data_out(dout_Q_10th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_11th (
       .data_in(din_Q_11th_cbfp2),
       .shift_value(w_mem_out[10]),
       .data_out(dout_Q_11th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_12th (
       .data_in(din_Q_12th_cbfp2),
       .shift_value(w_mem_out[11]),
       .data_out(dout_Q_12th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_13th (
       .data_in(din_Q_13th_cbfp2),
       .shift_value(w_mem_out[12]),
       .data_out(dout_Q_13th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_14th (
       .data_in(din_Q_14th_cbfp2),
       .shift_value(w_mem_out[13]),
       .data_out(dout_Q_14th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_15th (
       .data_in(din_Q_15th_cbfp2),
       .shift_value(w_mem_out[14]),
       .data_out(dout_Q_15th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_16th (
       .data_in(din_Q_16th_cbfp2),
       .shift_value(w_mem_out[15]),
       .data_out(dout_Q_16th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_17th (
       .data_in(din_Q_17th_cbfp2),
       .shift_value(w_mem_out[16]),
       .data_out(dout_Q_17th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_18th (
       .data_in(din_Q_18th_cbfp2),
       .shift_value(w_mem_out[17]),
       .data_out(dout_Q_18th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_19th (
       .data_in(din_Q_19th_cbfp2),
       .shift_value(w_mem_out[18]),
       .data_out(dout_Q_19th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_20th (
       .data_in(din_Q_20th_cbfp2),
       .shift_value(w_mem_out[19]),
       .data_out(dout_Q_20th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_21st (
       .data_in(din_Q_21st_cbfp2),
       .shift_value(w_mem_out[20]),
       .data_out(dout_Q_21st_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_22nd (
       .data_in(din_Q_22nd_cbfp2),
       .shift_value(w_mem_out[21]),
       .data_out(dout_Q_22nd_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_23rd (
       .data_in(din_Q_23rd_cbfp2),
       .shift_value(w_mem_out[22]),
       .data_out(dout_Q_23rd_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_24th (
       .data_in(din_Q_24th_cbfp2),
       .shift_value(w_mem_out[23]),
       .data_out(dout_Q_24th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_25th (
       .data_in(din_Q_25th_cbfp2),
       .shift_value(w_mem_out[24]),
       .data_out(dout_Q_25th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_26th (
       .data_in(din_Q_26th_cbfp2),
       .shift_value(w_mem_out[25]),
       .data_out(dout_Q_26th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_27th (
       .data_in(din_Q_27th_cbfp2),
       .shift_value(w_mem_out[26]),
       .data_out(dout_Q_27th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_28th (
       .data_in(din_Q_28th_cbfp2),
       .shift_value(w_mem_out[27]),
       .data_out(dout_Q_28th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_29th (
       .data_in(din_Q_29th_cbfp2),
       .shift_value(w_mem_out[28]),
       .data_out(dout_Q_29th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_30th (
       .data_in(din_Q_30th_cbfp2),
       .shift_value(w_mem_out[29]),
       .data_out(dout_Q_30th_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_31st (
       .data_in(din_Q_31st_cbfp2),
       .shift_value(w_mem_out[30]),
       .data_out(dout_Q_31st_cbfp2)
   );

   bit_shift_cbfp2 #(
      .INPUT_WIDTH(16),
      .OUTPUT_WIDTH(13),
      .SHIFT_WIDTH(6)
   ) U_BIT_SFT_Q_32nd (
       .data_in(din_Q_32nd_cbfp2),
       .shift_value(w_mem_out[31]),
       .data_out(dout_Q_32nd_cbfp2)
   );

endmodule


module bit_shift_cbfp2 #(
    parameter INPUT_WIDTH = 16,
    parameter OUTPUT_WIDTH = 13,
   parameter SHIFT_WIDTH = 6
)(
    input logic signed [INPUT_WIDTH-1:0] data_in,
    input logic [SHIFT_WIDTH-1:0] shift_value,
    
    output logic signed [OUTPUT_WIDTH-1:0] data_out
);

    assign data_out = (shift_value >= 23) ? 13'sd0 :
      (shift_value > 9) ? (data_in >>> (shift_value - 9)) : (data_in <<< (9 - shift_value));

endmodule
