`timescale 1ns / 1ps

module reorder (
	input clk,
	input rstn,

	input cbfp2_pop,

	input logic signed [12:0] din_R_1st_reorder,
	input logic signed [12:0] din_Q_1st_reorder,

	input logic signed [12:0] din_R_2nd_reorder,
	input logic signed [12:0] din_Q_2nd_reorder,

	input logic signed [12:0] din_R_3rd_reorder,
	input logic signed [12:0] din_Q_3rd_reorder,

	input logic signed [12:0] din_R_4th_reorder,
	input logic signed [12:0] din_Q_4th_reorder,

	input logic signed [12:0] din_R_5th_reorder,
	input logic signed [12:0] din_Q_5th_reorder,

	input logic signed [12:0] din_R_6th_reorder,
	input logic signed [12:0] din_Q_6th_reorder,

	input logic signed [12:0] din_R_7th_reorder,
	input logic signed [12:0] din_Q_7th_reorder,

	input logic signed [12:0] din_R_8th_reorder,
	input logic signed [12:0] din_Q_8th_reorder,

	input logic signed [12:0] din_R_9th_reorder,
	input logic signed [12:0] din_Q_9th_reorder,

	input logic signed [12:0] din_R_10th_reorder,
	input logic signed [12:0] din_Q_10th_reorder,

	input logic signed [12:0] din_R_11th_reorder,
	input logic signed [12:0] din_Q_11th_reorder,

	input logic signed [12:0] din_R_12th_reorder,
	input logic signed [12:0] din_Q_12th_reorder,

	input logic signed [12:0] din_R_13th_reorder,
	input logic signed [12:0] din_Q_13th_reorder,

	input logic signed [12:0] din_R_14th_reorder,
	input logic signed [12:0] din_Q_14th_reorder,

	input logic signed [12:0] din_R_15th_reorder,
	input logic signed [12:0] din_Q_15th_reorder,

	input logic signed [12:0] din_R_16th_reorder,
	input logic signed [12:0] din_Q_16th_reorder,

	input logic signed [12:0] din_R_17th_reorder,
	input logic signed [12:0] din_Q_17th_reorder,

	input logic signed [12:0] din_R_18th_reorder,
	input logic signed [12:0] din_Q_18th_reorder,

	input logic signed [12:0] din_R_19th_reorder,
	input logic signed [12:0] din_Q_19th_reorder,

	input logic signed [12:0] din_R_20th_reorder,
	input logic signed [12:0] din_Q_20th_reorder,

	input logic signed [12:0] din_R_21st_reorder,
	input logic signed [12:0] din_Q_21st_reorder,

	input logic signed [12:0] din_R_22nd_reorder,
	input logic signed [12:0] din_Q_22nd_reorder,

	input logic signed [12:0] din_R_23rd_reorder,
	input logic signed [12:0] din_Q_23rd_reorder,

	input logic signed [12:0] din_R_24th_reorder,
	input logic signed [12:0] din_Q_24th_reorder,

	input logic signed [12:0] din_R_25th_reorder,
	input logic signed [12:0] din_Q_25th_reorder,
	
	input logic signed [12:0] din_R_26th_reorder,
	input logic signed [12:0] din_Q_26th_reorder,

	input logic signed [12:0] din_R_27th_reorder,
	input logic signed [12:0] din_Q_27th_reorder,

	input logic signed [12:0] din_R_28th_reorder,
	input logic signed [12:0] din_Q_28th_reorder,

	input logic signed [12:0] din_R_29th_reorder,
	input logic signed [12:0] din_Q_29th_reorder,

	input logic signed [12:0] din_R_30th_reorder,
	input logic signed [12:0] din_Q_30th_reorder,

	input logic signed [12:0] din_R_31st_reorder,
	input logic signed [12:0] din_Q_31st_reorder,
	
	input logic signed [12:0] din_R_32nd_reorder,
	input logic signed [12:0] din_Q_32nd_reorder,

	output logic signed [12:0] dout_R_reorder [0:511],
	output logic signed [12:0] dout_Q_reorder [0:511],

	output logic done
);
	logic w_mem_full;
	logic signed [12:0] w_i_reg_out [0:511];
	logic signed [12:0] w_q_reg_out [0:511];
	
	logic shift_reg_512;

	always_ff @( posedge clk or negedge rstn ) begin : push_shift_reg_512
		if(!rstn) begin
			shift_reg_512 <= 0;
		end
		else begin
			shift_reg_512 <= cbfp2_pop;
		end
	end

	assign done = w_mem_full;

	full_512_mem_ctrl U_MEM_FULL_CTRL (
		.clk(clk),
		.rstn(rstn),
		.cbfp2_pop(cbfp2_pop),
		.full_512(w_mem_full)
	);

	shift_reg_reorder #(
		.DATA_WIDTH(13),
		.REG_IN(32),
		.REG_OUT(512)
	) U_REG_REORDER (
		.clk(clk),
		.rstn(rstn),
		.en(shift_reg_512),
		.full(w_mem_full),
		.din_i({
		din_R_32nd_reorder, din_R_31st_reorder, din_R_30th_reorder, din_R_29th_reorder,
		din_R_28th_reorder, din_R_27th_reorder, din_R_26th_reorder, din_R_25th_reorder,
		din_R_24th_reorder, din_R_23rd_reorder, din_R_22nd_reorder, din_R_21st_reorder,
		din_R_20th_reorder, din_R_19th_reorder, din_R_18th_reorder, din_R_17th_reorder,
		din_R_16th_reorder, din_R_15th_reorder, din_R_14th_reorder, din_R_13th_reorder,
		din_R_12th_reorder, din_R_11th_reorder, din_R_10th_reorder, din_R_9th_reorder,
		din_R_8th_reorder,  din_R_7th_reorder,  din_R_6th_reorder,  din_R_5th_reorder,
		din_R_4th_reorder,  din_R_3rd_reorder,  din_R_2nd_reorder,  din_R_1st_reorder
	}),
		.din_q({
		din_Q_32nd_reorder, din_Q_31st_reorder, din_Q_30th_reorder, din_Q_29th_reorder,
		din_Q_28th_reorder, din_Q_27th_reorder, din_Q_26th_reorder, din_Q_25th_reorder,
		din_Q_24th_reorder, din_Q_23rd_reorder, din_Q_22nd_reorder, din_Q_21st_reorder,
		din_Q_20th_reorder, din_Q_19th_reorder, din_Q_18th_reorder, din_Q_17th_reorder,
		din_Q_16th_reorder, din_Q_15th_reorder, din_Q_14th_reorder, din_Q_13th_reorder,
		din_Q_12th_reorder, din_Q_11th_reorder, din_Q_10th_reorder, din_Q_9th_reorder,
		din_Q_8th_reorder,  din_Q_7th_reorder,  din_Q_6th_reorder,  din_Q_5th_reorder,
		din_Q_4th_reorder,  din_Q_3rd_reorder,  din_Q_2nd_reorder,  din_Q_1st_reorder
	}),
		.dout_i(w_i_reg_out),
		.dout_q(w_q_reg_out)
	);

	index_reorder U_IDX_REORDER (
		.clk(clk),
		.rstn(rstn),
		.en(w_mem_full),
	
		.din_i_og(w_i_reg_out),
		.din_q_og(w_q_reg_out),

		.dout_i_reord(dout_R_reorder),
		.dout_q_reord(dout_Q_reorder)
	);

endmodule


// module full_512_mem_ctrl (
//    input clk,
//    input rstn,
//    input cbfp2_pop,

//    output logic full_512
// );

//    logic [4:0] cnt;

//    always_ff @( posedge clk or negedge rstn ) begin : full_signal_make
//       if(!rstn) begin
//          cnt <= 0;
//          full_512 <= 0;
//       end
//       else if(cbfp2_pop) begin
//          cnt <= cnt + 1;
//       end
//       if(cnt == 16) begin
//          full_512 <= 1;
//          cnt <= 0;
//       end
//       else begin
//          full_512 <= 0;
//       end
//    end
   
// endmodule


module shift_reg_reorder #(
    parameter DATA_WIDTH = 13,
    parameter REG_IN = 32,
    parameter REG_OUT = 512
) (
    input clk,
    input rstn,

	input en,
	input full,

    input logic signed [DATA_WIDTH - 1:0] din_i [0:REG_IN-1],
    input logic signed [DATA_WIDTH - 1:0] din_q [0:REG_IN-1],

    output logic signed [DATA_WIDTH - 1:0] dout_i [0:REG_OUT-1],
    output logic signed [DATA_WIDTH - 1:0] dout_q [0:REG_OUT-1]
);

    integer j, k;
    
    // Internal shift register arrays
    logic [DATA_WIDTH-1:0] shift_reg_i [0:REG_OUT-1];
    logic [DATA_WIDTH-1:0] shift_reg_q [0:REG_OUT-1];

    always_ff @(posedge clk or negedge rstn) begin : shift_operate
        if (!rstn) begin
            for (j = 0; j < REG_OUT; j = j + 1) begin
                shift_reg_i[j] <= 0;
                shift_reg_q[j] <= 0;
            end
        end
        else begin
			if (en) begin
				// Shift existing data
				for (j = REG_OUT - 1; j >= REG_IN; j = j - 1) begin
					shift_reg_i[j] <= shift_reg_i[j - REG_IN];
					shift_reg_q[j] <= shift_reg_q[j - REG_IN];
				end 
				// Insert new data at the beginning
				for (k = 0; k < REG_IN; k = k + 1) begin
					shift_reg_i[k] <= din_i[k];
					shift_reg_q[k] <= din_q[k];
				end
			end
		end
	end

    // Output assignment
    genvar l;
	always_comb begin
		if (full) begin
			for (int l = 0; l < REG_OUT; l++) begin
				dout_i[l] = shift_reg_i[l];
				dout_q[l] = shift_reg_q[l];
			end
		end else begin
			for (int l = 0; l < REG_OUT; l++) begin
				dout_i[l] = 0;
				dout_q[l] = 0;
			end
		end
	end

endmodule


module index_reorder (
	input clk,
	input rstn,
	input en,
	
	input logic signed [12:0] din_i_og [0:511],
	input logic signed [12:0] din_q_og [0:511],

	output logic signed [12:0] dout_i_reord [0:511],
	output logic signed [12:0] dout_q_reord [0:511]
);
	
	logic [8:0] idx_reord [0:511];
	
	genvar i;
	generate
		for (i = 0; i < 512; i = i + 1) begin
			assign idx_reord[i] = {i[0], i[1], i[2], i[3], i[4], i[5], i[6], i[7], i[8]};
		end
	endgenerate
	
	// integer j;
	// always @(*) begin
	// 	if (en) begin
	// 		for (j = 0; j < 512; j = j + 1) begin
	// 			dout_i_reord[j] = din_i_og[idx_reord[j]];
	// 			dout_q_reord[j] = din_q_og[idx_reord[j]];
	// 		end
	// 	end else begin
	// 		for (j = 0; j < 512; j = j + 1) begin
	// 			dout_i_reord[j] = 13'sd0;
	// 			dout_q_reord[j] = 13'sd0;
	// 		end
	// 	end
	// end	

	integer j;
	always @(*) begin
		if (en) begin
			for (j = 0; j < 512; j = j + 1) begin
				dout_i_reord[511-j] = din_i_og[idx_reord[j]];
				dout_q_reord[511-j] = din_q_og[idx_reord[j]];
			end
		end else begin
			for (j = 0; j < 512; j = j + 1) begin
				dout_i_reord[j] = 13'sd0;
				dout_q_reord[j] = 13'sd0;
			end
		end
	end	

endmodule
