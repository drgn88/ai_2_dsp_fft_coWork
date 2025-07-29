module min_detect_cbfp1 #(
    parameter LZC_WIDTH = 5  //msb 개수 비트폭
) (
    input clk,
    input rstn,
    input en,

    input logic [LZC_WIDTH-1:0] min_in_R_add[7:0],
    input logic [LZC_WIDTH-1:0] min_in_Q_add[7:0],
    input logic [LZC_WIDTH-1:0] min_in_R_sub[7:0],
    input logic [LZC_WIDTH-1:0] min_in_Q_sub[7:0],

    output logic [LZC_WIDTH-1:0] min_out_add,
    output logic [LZC_WIDTH-1:0] min_out_sub
);

    logic [LZC_WIDTH-1:0] min_R_add;
    logic [LZC_WIDTH-1:0] min_Q_add;
    logic [LZC_WIDTH-1:0] min_R_sub;
    logic [LZC_WIDTH-1:0] min_Q_sub;

    min_8in_cbfp1 #(
        .LZC_WIDTH(LZC_WIDTH)
    ) U_min_R_add (
        .clk(clk),
        .rstn(rstn),
        .en(en),
        .min_in(min_in_R_add),

        .min_out(min_R_add)
    );

    min_8in_cbfp1 #(
        .LZC_WIDTH(LZC_WIDTH)
    ) U_min_Q_add (
        .clk(clk),
        .rstn(rstn),
        .en(en),
        .min_in(min_in_Q_add),

        .min_out(min_Q_add)
    );

    min_8in_cbfp1 #(
        .LZC_WIDTH(LZC_WIDTH)
    ) U_min_R_sub (
        .clk(clk),
        .rstn(rstn),
        .en(en),
        .min_in(min_in_R_sub),

        .min_out(min_R_sub)
    );

    min_8in_cbfp1 #(
        .LZC_WIDTH(LZC_WIDTH)
    ) U_min_Q_sub (
        .clk(clk),
        .rstn(rstn),
        .en(en),
        .min_in(min_in_Q_sub),

        .min_out(min_Q_sub)
    );

    logic [LZC_WIDTH-1:0] min_out_add_tmp;

    min_2in #(
        .LZC_WIDTH(LZC_WIDTH)
    ) U_min_add (
        .min_in1(min_R_add),
        .min_in2(min_Q_add),

        .min_out(min_out_add_tmp)
    );

    logic [LZC_WIDTH-1:0] min_out_sub_tmp;

    min_2in #(
        .LZC_WIDTH(LZC_WIDTH)
    ) U_min_sub (
        .min_in1(min_R_sub),
        .min_in2(min_Q_sub),

        .min_out(min_out_sub_tmp)
    );

    //Pipe Register

    logic [LZC_WIDTH-1:0] min_out_add_reg;
    logic [LZC_WIDTH-1:0] min_out_sub_reg;

    always_ff @(posedge clk or negedge rstn) begin : pipe_reg
        if (!rstn) begin
            min_out_add_reg <= 0;
            min_out_sub_reg <= 0;
        end else begin
            min_out_add_reg <= min_out_add_tmp;
            min_out_sub_reg <= min_out_sub_tmp;
        end
    end

    assign min_out_add = min_out_add_reg;
    assign min_out_sub = min_out_sub_reg;

endmodule
