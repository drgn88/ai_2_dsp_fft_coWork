`timescale 1ns / 1ps

module cbfp_shift_reg #(
    parameter DATA_WIDTH = 9,
    parameter NUM_IN_OUT = 16,
    parameter REG_DEPTH  = 16
) (
    input clk,
    input rstn,
    input valid,
    input pop,
    input logic signed [DATA_WIDTH - 1:0] din_i[0:NUM_IN_OUT-1],
    input logic signed [DATA_WIDTH - 1:0] din_q[0:NUM_IN_OUT-1],

    output logic signed [DATA_WIDTH - 1:0] dout_i[0:NUM_IN_OUT-1],
    output logic signed [DATA_WIDTH - 1:0] dout_q[0:NUM_IN_OUT-1]
);

    integer i, j;

    logic [DATA_WIDTH-1:0] shift_reg_i[0:NUM_IN_OUT-1][0:REG_DEPTH-1];
    logic [DATA_WIDTH-1:0] shift_reg_q[0:NUM_IN_OUT-1][0:REG_DEPTH-1];

    always_ff @(posedge clk or negedge rstn) begin : shift_operate
        if (!rstn) begin
            for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
                for (j = 0; j < REG_DEPTH; j = j + 1) begin
                    shift_reg_i[i][j] <= 0;
                    shift_reg_q[i][j] <= 0;
                end
            end
            
            // for(k = 0; k < NUM_IN_OUT; k = k+1 )begin
			// 	dout_i[k] <= 0;
			// 	dout_q[k] <= 0;
			// end
        end else begin
            for (i = 0; i < NUM_IN_OUT; i = i + 1) begin
                logic [DATA_WIDTH-1:0] next_sr_i[0:REG_DEPTH-1];
                logic [DATA_WIDTH-1:0] next_sr_q[0:REG_DEPTH-1];

                for (j = 0; j < REG_DEPTH; j = j + 1) begin
                    next_sr_i[j] = shift_reg_i[i][j];
                    next_sr_q[j] = shift_reg_q[i][j];
                end

                if (valid && !pop) begin
                    for (j = REG_DEPTH - 1; j > 0; j = j - 1) begin
                        next_sr_i[j] = shift_reg_i[i][j-1];
                        next_sr_q[j] = shift_reg_q[i][j-1];
                    end
                    next_sr_i[0] = din_i[i];
                    next_sr_q[0] = din_q[i];
                end else if (!valid && pop) begin
                    for (j = 0; j < REG_DEPTH - 1; j = j + 1) begin
                        next_sr_i[j] = shift_reg_i[i][j+1];
                        next_sr_q[j] = shift_reg_q[i][j+1];
                    end
                    if (REG_DEPTH > 0) begin
                        next_sr_i[REG_DEPTH-1] = 0;
                        next_sr_q[REG_DEPTH-1] = 0;
                    end
                end else if (valid && pop) begin
                    for (j = REG_DEPTH - 1; j > 0; j = j - 1) begin
                        next_sr_i[j] = shift_reg_i[i][j-1];
                        next_sr_q[j] = shift_reg_q[i][j-1];
                    end
                    next_sr_i[0] = din_i[i];
                    next_sr_q[0] = din_q[i];
                end

                for (j = 0; j < REG_DEPTH; j = j + 1) begin
                    shift_reg_i[i][j] <= next_sr_i[j];
                    shift_reg_q[i][j] <= next_sr_q[j];
                end
            end
            // 		for (l=0; l < NUM_IN_OUT; l = l+1) begin
            // 			dout_i[l] <= shift_reg_i[l][REG_DEPTH-1];
            // 			dout_q[l] <= shift_reg_q[l][REG_DEPTH-1];
            // 		end	
        end
    end

    // genvar l;

    // generate
    // 	for (l=0; l < NUM_IN_OUT; l = l+1) begin : assign_shift_reg_out
    // 		assign dout_i[l] = shift_reg_i[l][REG_DEPTH-1];
    // 		assign dout_q[l] = shift_reg_q[l][REG_DEPTH-1];
    // 	end
    // endgenerate

    integer l;

    always_comb begin : assign_shift_reg_out
        for (l = 0; l < NUM_IN_OUT; l = l + 1) begin
            if (pop) begin
                dout_i[l] = shift_reg_i[l][REG_DEPTH-1];
                dout_q[l] = shift_reg_q[l][REG_DEPTH-1];
            end else begin
                dout_i[l] = 0;
                dout_q[l] = 0;
            end
        end
    end

endmodule
