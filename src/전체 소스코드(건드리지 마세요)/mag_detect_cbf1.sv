module mag_detect_cbfp1 (
    input clk,
    input rstn,
    input en,

    input logic signed [24:0] mag_in_R_add[7:0],
    input logic signed [24:0] mag_in_Q_add[7:0],
    input logic signed [24:0] mag_in_R_sub[7:0],
    input logic signed [24:0] mag_in_Q_sub[7:0],

    output logic [4:0] mag_out_R_add[7:0],
    output logic [4:0] mag_out_Q_add[7:0],
    output logic [4:0] mag_out_R_sub[7:0],
    output logic [4:0] mag_out_Q_sub[7:0]
);

    logic [4:0] mag_out_R_add_reg[7:0];
    logic [4:0] mag_out_Q_add_reg[7:0];
    logic [4:0] mag_out_R_sub_reg[7:0];
    logic [4:0] mag_out_Q_sub_reg[7:0];

    integer j;

    // Pipe Register
    always_ff @(posedge clk or negedge rstn) begin : mag_out_pipe_0
        if (!rstn) begin
            for (j = 0; j < 8; j = j + 1) begin
                mag_out_R_add[j] <= 5'd0;
                mag_out_Q_add[j] <= 5'd0;
                mag_out_R_sub[j] <= 5'd0;
                mag_out_Q_sub[j] <= 5'd0;
            end
        end else if (en) begin
            for (j = 0; j < 8; j = j + 1) begin
                mag_out_R_add[j] <= mag_out_R_add_reg[j];
                mag_out_Q_add[j] <= mag_out_Q_add_reg[j];
                mag_out_R_sub[j] <= mag_out_R_sub_reg[j];
                mag_out_Q_sub[j] <= mag_out_Q_sub_reg[j];
            end
        end
    end

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : lzc_gen
            assign mag_out_R_add_reg[i] =
                ((mag_in_R_add[i][23:0]  == 24'b0) && ~mag_in_R_add[i][24]) ? 5'd24 :
                ((mag_in_R_add[i][23:1]  == 23'b0) && ~mag_in_R_add[i][24]) ? 5'd23 :
                ((mag_in_R_add[i][23:2]  == 22'b0) && ~mag_in_R_add[i][24]) ? 5'd22 :
                ((mag_in_R_add[i][23:3]  == 21'b0) && ~mag_in_R_add[i][24]) ? 5'd21 :
                ((mag_in_R_add[i][23:4]  == 20'b0) && ~mag_in_R_add[i][24]) ? 5'd20 :
                ((mag_in_R_add[i][23:5]  == 19'b0) && ~mag_in_R_add[i][24]) ? 5'd19 :
                ((mag_in_R_add[i][23:6]  == 18'b0) && ~mag_in_R_add[i][24]) ? 5'd18 :
                ((mag_in_R_add[i][23:7]  == 17'b0) && ~mag_in_R_add[i][24]) ? 5'd17 :
                ((mag_in_R_add[i][23:8]  == 16'b0) && ~mag_in_R_add[i][24]) ? 5'd16 :
                ((mag_in_R_add[i][23:9]  == 15'b0) && ~mag_in_R_add[i][24]) ? 5'd15 :
                ((mag_in_R_add[i][23:10] == 14'b0) && ~mag_in_R_add[i][24]) ? 5'd14 :
                ((mag_in_R_add[i][23:11] == 13'b0) && ~mag_in_R_add[i][24]) ? 5'd13 :
                ((mag_in_R_add[i][23:12] == 12'b0) && ~mag_in_R_add[i][24]) ? 5'd12 :
                ((mag_in_R_add[i][23:13] == 11'b0) && ~mag_in_R_add[i][24]) ? 5'd11 :
                ((mag_in_R_add[i][23:14] == 10'b0) && ~mag_in_R_add[i][24]) ? 5'd10 :
                ((mag_in_R_add[i][23:15] == 9'b0)  && ~mag_in_R_add[i][24]) ? 5'd9  :
                ((mag_in_R_add[i][23:16] == 8'b0)  && ~mag_in_R_add[i][24]) ? 5'd8  :
                ((mag_in_R_add[i][23:17] == 7'b0)  && ~mag_in_R_add[i][24]) ? 5'd7  :
                ((mag_in_R_add[i][23:18] == 6'b0)  && ~mag_in_R_add[i][24]) ? 5'd6  :
                ((mag_in_R_add[i][23:19] == 5'b0)  && ~mag_in_R_add[i][24]) ? 5'd5  :
                ((mag_in_R_add[i][23:20] == 4'b0)  && ~mag_in_R_add[i][24]) ? 5'd4  :
                ((mag_in_R_add[i][23:21] == 3'b0)  && ~mag_in_R_add[i][24]) ? 5'd3  :
                ((mag_in_R_add[i][23:22] == 2'b0)  && ~mag_in_R_add[i][24]) ? 5'd2  :
                ((mag_in_R_add[i][23:23] == 1'b0)  && ~mag_in_R_add[i][24]) ? 5'd1  :

                ((mag_in_R_add[i][23:0]  == 24'hFFFFFF) && mag_in_R_add[i][24]) ? 5'd24 :
                ((mag_in_R_add[i][23:1]  == 23'h7FFFFF) && mag_in_R_add[i][24]) ? 5'd23 :
                ((mag_in_R_add[i][23:2]  == 22'h3FFFFF) && mag_in_R_add[i][24]) ? 5'd22 :
                ((mag_in_R_add[i][23:3]  == 21'h1FFFFF) && mag_in_R_add[i][24]) ? 5'd21 :
                ((mag_in_R_add[i][23:4]  == 20'hFFFFF) && mag_in_R_add[i][24]) ? 5'd20 :
                ((mag_in_R_add[i][23:5]  == 19'h7FFFF) && mag_in_R_add[i][24]) ? 5'd19 :
                ((mag_in_R_add[i][23:6]  == 18'h3FFFF) && mag_in_R_add[i][24]) ? 5'd18 :
                ((mag_in_R_add[i][23:7]  == 17'h1FFFF) && mag_in_R_add[i][24]) ? 5'd17 :
                ((mag_in_R_add[i][23:8]  == 16'hFFFF)  && mag_in_R_add[i][24]) ? 5'd16 :
                ((mag_in_R_add[i][23:9]  == 15'h7FFF)  && mag_in_R_add[i][24]) ? 5'd15 :
                ((mag_in_R_add[i][23:10] == 14'h3FFF)  && mag_in_R_add[i][24]) ? 5'd14 :
                ((mag_in_R_add[i][23:11] == 13'h1FFF)  && mag_in_R_add[i][24]) ? 5'd13 :
                ((mag_in_R_add[i][23:12] == 12'hFFF)   && mag_in_R_add[i][24]) ? 5'd12 :
                ((mag_in_R_add[i][23:13] == 11'h7FF)   && mag_in_R_add[i][24]) ? 5'd11 :
                ((mag_in_R_add[i][23:14] == 10'h3FF)   && mag_in_R_add[i][24]) ? 5'd10 :
                ((mag_in_R_add[i][23:15] == 9'h1FF)    && mag_in_R_add[i][24]) ? 5'd9  :
                ((mag_in_R_add[i][23:16] == 8'hFF)     && mag_in_R_add[i][24]) ? 5'd8  :
                ((mag_in_R_add[i][23:17] == 7'h7F)     && mag_in_R_add[i][24]) ? 5'd7  :
                ((mag_in_R_add[i][23:18] == 6'h3F)     && mag_in_R_add[i][24]) ? 5'd6  :
                ((mag_in_R_add[i][23:19] == 5'h1F)     && mag_in_R_add[i][24]) ? 5'd5  :
                ((mag_in_R_add[i][23:20] == 4'hF)      && mag_in_R_add[i][24]) ? 5'd4  :
                ((mag_in_R_add[i][23:21] == 3'h7)      && mag_in_R_add[i][24]) ? 5'd3  :
                ((mag_in_R_add[i][23:22] == 2'h3)      && mag_in_R_add[i][24]) ? 5'd2  :
                ((mag_in_R_add[i][23:23] == 1'h1)      && mag_in_R_add[i][24]) ? 5'd1  :
                5'd0;

            assign mag_out_Q_add_reg[i] =
                ((mag_in_Q_add[i][23:0]  == 24'b0) && ~mag_in_Q_add[i][24]) ? 5'd24 :
                ((mag_in_Q_add[i][23:1]  == 23'b0) && ~mag_in_Q_add[i][24]) ? 5'd23 :
                ((mag_in_Q_add[i][23:2]  == 22'b0) && ~mag_in_Q_add[i][24]) ? 5'd22 :
                ((mag_in_Q_add[i][23:3]  == 21'b0) && ~mag_in_Q_add[i][24]) ? 5'd21 :
                ((mag_in_Q_add[i][23:4]  == 20'b0) && ~mag_in_Q_add[i][24]) ? 5'd20 :
                ((mag_in_Q_add[i][23:5]  == 19'b0) && ~mag_in_Q_add[i][24]) ? 5'd19 :
                ((mag_in_Q_add[i][23:6]  == 18'b0) && ~mag_in_Q_add[i][24]) ? 5'd18 :
                ((mag_in_Q_add[i][23:7]  == 17'b0) && ~mag_in_Q_add[i][24]) ? 5'd17 :
                ((mag_in_Q_add[i][23:8]  == 16'b0) && ~mag_in_Q_add[i][24]) ? 5'd16 :
                ((mag_in_Q_add[i][23:9]  == 15'b0) && ~mag_in_Q_add[i][24]) ? 5'd15 :
                ((mag_in_Q_add[i][23:10] == 14'b0) && ~mag_in_Q_add[i][24]) ? 5'd14 :
                ((mag_in_Q_add[i][23:11] == 13'b0) && ~mag_in_Q_add[i][24]) ? 5'd13 :
                ((mag_in_Q_add[i][23:12] == 12'b0) && ~mag_in_Q_add[i][24]) ? 5'd12 :
                ((mag_in_Q_add[i][23:13] == 11'b0) && ~mag_in_Q_add[i][24]) ? 5'd11 :
                ((mag_in_Q_add[i][23:14] == 10'b0) && ~mag_in_Q_add[i][24]) ? 5'd10 :
                ((mag_in_Q_add[i][23:15] == 9'b0)  && ~mag_in_Q_add[i][24]) ? 5'd9  :
                ((mag_in_Q_add[i][23:16] == 8'b0)  && ~mag_in_Q_add[i][24]) ? 5'd8  :
                ((mag_in_Q_add[i][23:17] == 7'b0)  && ~mag_in_Q_add[i][24]) ? 5'd7  :
                ((mag_in_Q_add[i][23:18] == 6'b0)  && ~mag_in_Q_add[i][24]) ? 5'd6  :
                ((mag_in_Q_add[i][23:19] == 5'b0)  && ~mag_in_Q_add[i][24]) ? 5'd5  :
                ((mag_in_Q_add[i][23:20] == 4'b0)  && ~mag_in_Q_add[i][24]) ? 5'd4  :
                ((mag_in_Q_add[i][23:21] == 3'b0)  && ~mag_in_Q_add[i][24]) ? 5'd3  :
                ((mag_in_Q_add[i][23:22] == 2'b0)  && ~mag_in_Q_add[i][24]) ? 5'd2  :
                ((mag_in_Q_add[i][23:23] == 1'b0)  && ~mag_in_Q_add[i][24]) ? 5'd1  :

                ((mag_in_Q_add[i][23:0]  == 24'hFFFFFF) && mag_in_Q_add[i][24]) ? 5'd24 :
                ((mag_in_Q_add[i][23:1]  == 23'h7FFFFF) && mag_in_Q_add[i][24]) ? 5'd23 :
                ((mag_in_Q_add[i][23:2]  == 22'h3FFFFF) && mag_in_Q_add[i][24]) ? 5'd22 :
                ((mag_in_Q_add[i][23:3]  == 21'h1FFFFF) && mag_in_Q_add[i][24]) ? 5'd21 :
                ((mag_in_Q_add[i][23:4]  == 20'hFFFFF)  && mag_in_Q_add[i][24]) ? 5'd20 :
                ((mag_in_Q_add[i][23:5]  == 19'h7FFFF)  && mag_in_Q_add[i][24]) ? 5'd19 :
                ((mag_in_Q_add[i][23:6]  == 18'h3FFFF)  && mag_in_Q_add[i][24]) ? 5'd18 :
                ((mag_in_Q_add[i][23:7]  == 17'h1FFFF)  && mag_in_Q_add[i][24]) ? 5'd17 :
                ((mag_in_Q_add[i][23:8]  == 16'hFFFF)   && mag_in_Q_add[i][24]) ? 5'd16 :
                ((mag_in_Q_add[i][23:9]  == 15'h7FFF)   && mag_in_Q_add[i][24]) ? 5'd15 :
                ((mag_in_Q_add[i][23:10] == 14'h3FFF)   && mag_in_Q_add[i][24]) ? 5'd14 :
                ((mag_in_Q_add[i][23:11] == 13'h1FFF)   && mag_in_Q_add[i][24]) ? 5'd13 :
                ((mag_in_Q_add[i][23:12] == 12'hFFF)    && mag_in_Q_add[i][24]) ? 5'd12 :
                ((mag_in_Q_add[i][23:13] == 11'h7FF)    && mag_in_Q_add[i][24]) ? 5'd11 :
                ((mag_in_Q_add[i][23:14] == 10'h3FF)    && mag_in_Q_add[i][24]) ? 5'd10 :
                ((mag_in_Q_add[i][23:15] == 9'h1FF)     && mag_in_Q_add[i][24]) ? 5'd9  :
                ((mag_in_Q_add[i][23:16] == 8'hFF)      && mag_in_Q_add[i][24]) ? 5'd8  :
                ((mag_in_Q_add[i][23:17] == 7'h7F)      && mag_in_Q_add[i][24]) ? 5'd7  :
                ((mag_in_Q_add[i][23:18] == 6'h3F)      && mag_in_Q_add[i][24]) ? 5'd6  :
                ((mag_in_Q_add[i][23:19] == 5'h1F)      && mag_in_Q_add[i][24]) ? 5'd5  :
                ((mag_in_Q_add[i][23:20] == 4'hF)       && mag_in_Q_add[i][24]) ? 5'd4  :
                ((mag_in_Q_add[i][23:21] == 3'h7)       && mag_in_Q_add[i][24]) ? 5'd3  :
                ((mag_in_Q_add[i][23:22] == 2'h3)       && mag_in_Q_add[i][24]) ? 5'd2  :
                ((mag_in_Q_add[i][23:23] == 1'h1)       && mag_in_Q_add[i][24]) ? 5'd1  :
                5'd0;

            assign mag_out_R_sub_reg[i] =
                ((mag_in_R_sub[i][23:0]  == 24'b0) && ~mag_in_R_sub[i][24]) ? 5'd24 :
                ((mag_in_R_sub[i][23:1]  == 23'b0) && ~mag_in_R_sub[i][24]) ? 5'd23 :
                ((mag_in_R_sub[i][23:2]  == 22'b0) && ~mag_in_R_sub[i][24]) ? 5'd22 :
                ((mag_in_R_sub[i][23:3]  == 21'b0) && ~mag_in_R_sub[i][24]) ? 5'd21 :
                ((mag_in_R_sub[i][23:4]  == 20'b0) && ~mag_in_R_sub[i][24]) ? 5'd20 :
                ((mag_in_R_sub[i][23:5]  == 19'b0) && ~mag_in_R_sub[i][24]) ? 5'd19 :
                ((mag_in_R_sub[i][23:6]  == 18'b0) && ~mag_in_R_sub[i][24]) ? 5'd18 :
                ((mag_in_R_sub[i][23:7]  == 17'b0) && ~mag_in_R_sub[i][24]) ? 5'd17 :
                ((mag_in_R_sub[i][23:8]  == 16'b0) && ~mag_in_R_sub[i][24]) ? 5'd16 :
                ((mag_in_R_sub[i][23:9]  == 15'b0) && ~mag_in_R_sub[i][24]) ? 5'd15 :
                ((mag_in_R_sub[i][23:10] == 14'b0) && ~mag_in_R_sub[i][24]) ? 5'd14 :
                ((mag_in_R_sub[i][23:11] == 13'b0) && ~mag_in_R_sub[i][24]) ? 5'd13 :
                ((mag_in_R_sub[i][23:12] == 12'b0) && ~mag_in_R_sub[i][24]) ? 5'd12 :
                ((mag_in_R_sub[i][23:13] == 11'b0) && ~mag_in_R_sub[i][24]) ? 5'd11 :
                ((mag_in_R_sub[i][23:14] == 10'b0) && ~mag_in_R_sub[i][24]) ? 5'd10 :
                ((mag_in_R_sub[i][23:15] == 9'b0)  && ~mag_in_R_sub[i][24]) ? 5'd9  :
                ((mag_in_R_sub[i][23:16] == 8'b0)  && ~mag_in_R_sub[i][24]) ? 5'd8  :
                ((mag_in_R_sub[i][23:17] == 7'b0)  && ~mag_in_R_sub[i][24]) ? 5'd7  :
                ((mag_in_R_sub[i][23:18] == 6'b0)  && ~mag_in_R_sub[i][24]) ? 5'd6  :
                ((mag_in_R_sub[i][23:19] == 5'b0)  && ~mag_in_R_sub[i][24]) ? 5'd5  :
                ((mag_in_R_sub[i][23:20] == 4'b0)  && ~mag_in_R_sub[i][24]) ? 5'd4  :
                ((mag_in_R_sub[i][23:21] == 3'b0)  && ~mag_in_R_sub[i][24]) ? 5'd3  :
                ((mag_in_R_sub[i][23:22] == 2'b0)  && ~mag_in_R_sub[i][24]) ? 5'd2  :
                ((mag_in_R_sub[i][23:23] == 1'b0)  && ~mag_in_R_sub[i][24]) ? 5'd1  :

                ((mag_in_R_sub[i][23:0]  == 24'hFFFFFF) && mag_in_R_sub[i][24]) ? 5'd24 :
                ((mag_in_R_sub[i][23:1]  == 23'h7FFFFF) && mag_in_R_sub[i][24]) ? 5'd23 :
                ((mag_in_R_sub[i][23:2]  == 22'h3FFFFF) && mag_in_R_sub[i][24]) ? 5'd22 :
                ((mag_in_R_sub[i][23:3]  == 21'h1FFFFF) && mag_in_R_sub[i][24]) ? 5'd21 :
                ((mag_in_R_sub[i][23:4]  == 20'hFFFFF)  && mag_in_R_sub[i][24]) ? 5'd20 :
                ((mag_in_R_sub[i][23:5]  == 19'h7FFFF)  && mag_in_R_sub[i][24]) ? 5'd19 :
                ((mag_in_R_sub[i][23:6]  == 18'h3FFFF)  && mag_in_R_sub[i][24]) ? 5'd18 :
                ((mag_in_R_sub[i][23:7]  == 17'h1FFFF)  && mag_in_R_sub[i][24]) ? 5'd17 :
                ((mag_in_R_sub[i][23:8]  == 16'hFFFF)   && mag_in_R_sub[i][24]) ? 5'd16 :
                ((mag_in_R_sub[i][23:9]  == 15'h7FFF)   && mag_in_R_sub[i][24]) ? 5'd15 :
                ((mag_in_R_sub[i][23:10] == 14'h3FFF)   && mag_in_R_sub[i][24]) ? 5'd14 :
                ((mag_in_R_sub[i][23:11] == 13'h1FFF)   && mag_in_R_sub[i][24]) ? 5'd13 :
                ((mag_in_R_sub[i][23:12] == 12'hFFF)    && mag_in_R_sub[i][24]) ? 5'd12 :
                ((mag_in_R_sub[i][23:13] == 11'h7FF)    && mag_in_R_sub[i][24]) ? 5'd11 :
                ((mag_in_R_sub[i][23:14] == 10'h3FF)    && mag_in_R_sub[i][24]) ? 5'd10 :
                ((mag_in_R_sub[i][23:15] == 9'h1FF)     && mag_in_R_sub[i][24]) ? 5'd9  :
                ((mag_in_R_sub[i][23:16] == 8'hFF)      && mag_in_R_sub[i][24]) ? 5'd8  :
                ((mag_in_R_sub[i][23:17] == 7'h7F)      && mag_in_R_sub[i][24]) ? 5'd7  :
                ((mag_in_R_sub[i][23:18] == 6'h3F)      && mag_in_R_sub[i][24]) ? 5'd6  :
                ((mag_in_R_sub[i][23:19] == 5'h1F)      && mag_in_R_sub[i][24]) ? 5'd5  :
                ((mag_in_R_sub[i][23:20] == 4'hF)       && mag_in_R_sub[i][24]) ? 5'd4  :
                ((mag_in_R_sub[i][23:21] == 3'h7)       && mag_in_R_sub[i][24]) ? 5'd3  :
                ((mag_in_R_sub[i][23:22] == 2'h3)       && mag_in_R_sub[i][24]) ? 5'd2  :
                ((mag_in_R_sub[i][23:23] == 1'h1)       && mag_in_R_sub[i][24]) ? 5'd1  :
                5'd0;
            assign mag_out_Q_sub_reg[i] =
                ((mag_in_Q_sub[i][23:0]  == 24'b0) && ~mag_in_Q_sub[i][24]) ? 5'd24 :
                ((mag_in_Q_sub[i][23:1]  == 23'b0) && ~mag_in_Q_sub[i][24]) ? 5'd23 :
                ((mag_in_Q_sub[i][23:2]  == 22'b0) && ~mag_in_Q_sub[i][24]) ? 5'd22 :
                ((mag_in_Q_sub[i][23:3]  == 21'b0) && ~mag_in_Q_sub[i][24]) ? 5'd21 :
                ((mag_in_Q_sub[i][23:4]  == 20'b0) && ~mag_in_Q_sub[i][24]) ? 5'd20 :
                ((mag_in_Q_sub[i][23:5]  == 19'b0) && ~mag_in_Q_sub[i][24]) ? 5'd19 :
                ((mag_in_Q_sub[i][23:6]  == 18'b0) && ~mag_in_Q_sub[i][24]) ? 5'd18 :
                ((mag_in_Q_sub[i][23:7]  == 17'b0) && ~mag_in_Q_sub[i][24]) ? 5'd17 :
                ((mag_in_Q_sub[i][23:8]  == 16'b0) && ~mag_in_Q_sub[i][24]) ? 5'd16 :
                ((mag_in_Q_sub[i][23:9]  == 15'b0) && ~mag_in_Q_sub[i][24]) ? 5'd15 :
                ((mag_in_Q_sub[i][23:10] == 14'b0) && ~mag_in_Q_sub[i][24]) ? 5'd14 :
                ((mag_in_Q_sub[i][23:11] == 13'b0) && ~mag_in_Q_sub[i][24]) ? 5'd13 :
                ((mag_in_Q_sub[i][23:12] == 12'b0) && ~mag_in_Q_sub[i][24]) ? 5'd12 :
                ((mag_in_Q_sub[i][23:13] == 11'b0) && ~mag_in_Q_sub[i][24]) ? 5'd11 :
                ((mag_in_Q_sub[i][23:14] == 10'b0) && ~mag_in_Q_sub[i][24]) ? 5'd10 :
                ((mag_in_Q_sub[i][23:15] == 9'b0)  && ~mag_in_Q_sub[i][24]) ? 5'd9  :
                ((mag_in_Q_sub[i][23:16] == 8'b0)  && ~mag_in_Q_sub[i][24]) ? 5'd8  :
                ((mag_in_Q_sub[i][23:17] == 7'b0)  && ~mag_in_Q_sub[i][24]) ? 5'd7  :
                ((mag_in_Q_sub[i][23:18] == 6'b0)  && ~mag_in_Q_sub[i][24]) ? 5'd6  :
                ((mag_in_Q_sub[i][23:19] == 5'b0)  && ~mag_in_Q_sub[i][24]) ? 5'd5  :
                ((mag_in_Q_sub[i][23:20] == 4'b0)  && ~mag_in_Q_sub[i][24]) ? 5'd4  :
                ((mag_in_Q_sub[i][23:21] == 3'b0)  && ~mag_in_Q_sub[i][24]) ? 5'd3  :
                ((mag_in_Q_sub[i][23:22] == 2'b0)  && ~mag_in_Q_sub[i][24]) ? 5'd2  :
                ((mag_in_Q_sub[i][23:23] == 1'b0)  && ~mag_in_Q_sub[i][24]) ? 5'd1  :

                ((mag_in_Q_sub[i][23:0]  == 24'hFFFFFF) && mag_in_Q_sub[i][24]) ? 5'd24 :
                ((mag_in_Q_sub[i][23:1]  == 23'h7FFFFF) && mag_in_Q_sub[i][24]) ? 5'd23 :
                ((mag_in_Q_sub[i][23:2]  == 22'h3FFFFF) && mag_in_Q_sub[i][24]) ? 5'd22 :
                ((mag_in_Q_sub[i][23:3]  == 21'h1FFFFF) && mag_in_Q_sub[i][24]) ? 5'd21 :
                ((mag_in_Q_sub[i][23:4]  == 20'hFFFFF)  && mag_in_Q_sub[i][24]) ? 5'd20 :
                ((mag_in_Q_sub[i][23:5]  == 19'h7FFFF)  && mag_in_Q_sub[i][24]) ? 5'd19 :
                ((mag_in_Q_sub[i][23:6]  == 18'h3FFFF)  && mag_in_Q_sub[i][24]) ? 5'd18 :
                ((mag_in_Q_sub[i][23:7]  == 17'h1FFFF)  && mag_in_Q_sub[i][24]) ? 5'd17 :
                ((mag_in_Q_sub[i][23:8]  == 16'hFFFF)   && mag_in_Q_sub[i][24]) ? 5'd16 :
                ((mag_in_Q_sub[i][23:9]  == 15'h7FFF)   && mag_in_Q_sub[i][24]) ? 5'd15 :
                ((mag_in_Q_sub[i][23:10] == 14'h3FFF)   && mag_in_Q_sub[i][24]) ? 5'd14 :
                ((mag_in_Q_sub[i][23:11] == 13'h1FFF)   && mag_in_Q_sub[i][24]) ? 5'd13 :
                ((mag_in_Q_sub[i][23:12] == 12'hFFF)    && mag_in_Q_sub[i][24]) ? 5'd12 :
                ((mag_in_Q_sub[i][23:13] == 11'h7FF)    && mag_in_Q_sub[i][24]) ? 5'd11 :
                ((mag_in_Q_sub[i][23:14] == 10'h3FF)    && mag_in_Q_sub[i][24]) ? 5'd10 :
                ((mag_in_Q_sub[i][23:15] == 9'h1FF)     && mag_in_Q_sub[i][24]) ? 5'd9  :
                ((mag_in_Q_sub[i][23:16] == 8'hFF)      && mag_in_Q_sub[i][24]) ? 5'd8  :
                ((mag_in_Q_sub[i][23:17] == 7'h7F)      && mag_in_Q_sub[i][24]) ? 5'd7  :
                ((mag_in_Q_sub[i][23:18] == 6'h3F)      && mag_in_Q_sub[i][24]) ? 5'd6  :
                ((mag_in_Q_sub[i][23:19] == 5'h1F)      && mag_in_Q_sub[i][24]) ? 5'd5  :
                ((mag_in_Q_sub[i][23:20] == 4'hF)       && mag_in_Q_sub[i][24]) ? 5'd4  :
                ((mag_in_Q_sub[i][23:21] == 3'h7)       && mag_in_Q_sub[i][24]) ? 5'd3  :
                ((mag_in_Q_sub[i][23:22] == 2'h3)       && mag_in_Q_sub[i][24]) ? 5'd2  :
                ((mag_in_Q_sub[i][23:23] == 1'h1)       && mag_in_Q_sub[i][24]) ? 5'd1  :
                5'd0;
        end
    endgenerate

endmodule
