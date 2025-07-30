`timescale 1ns / 1ps

module tb_index_reorder_array;

    localparam IDX_WIDTH = 9;
    localparam NUM       = 16;
    localparam CLK_PERIOD = 10;


    logic clk;
    logic rstn;
    logic en;
    logic [IDX_WIDTH-1:0] original_idx[NUM-1:0];
    logic [IDX_WIDTH-1:0] reorder_idx[NUM-1:0];


    index_reorder #(
        .IDX_WIDTH(IDX_WIDTH),
        .NUM(NUM)
    ) u_index_reorder (
        .en(en),
        .original_idx(original_idx),
        .reorder_idx(reorder_idx)
    );

    integer i;


    initial begin
        clk = 0;
        forever #(CLK_PERIOD / 2) clk = ~clk;
    end

    initial begin
        // 1. 초기화 및 리셋
        rstn = 1'b0;  // 리셋 활성화
        en   = 1'b0;  // Enable 비활성화
        for (i = 0; i < NUM; i = i + 1) begin
            original_idx[i] = 0;
        end
        #(CLK_PERIOD * 2);  // 2클럭 동안 리셋 유지

        rstn = 1'b1;  // 리셋 비활성화
        #(CLK_PERIOD);  // 리셋 해제 후 1클럭 대기

        // 2. en=0 상태에서 데이터 변화
        for (i = 0; i < NUM; i = i + 1) begin
            original_idx[i] = i;  // 입력은 변경
        end
        @(posedge clk);
        // 이 상태에서 reorder_idx는 모두 0이 될 것으로 예상됩니다.

        // 3. en=1 상태에서 데이터 변화 (비트 역순)
        en = 1'b1;  // Enable 활성화
        #(CLK_PERIOD);

        // 새로운 데이터 입력
        for (i = 0; i < NUM; i = i + 1) begin
            original_idx[i] =
                $urandom_range(0, (1 << IDX_WIDTH) - 1);  // 랜덤 값
        end
        @(posedge clk);
        // 이 상태에서 reorder_idx는 original_idx의 비트 역순 값이 될 것으로 예상됩니다.

        // 4. en=0으로 다시 변경
        en = 1'b0;  // Enable 비활성화
        #(CLK_PERIOD);
        // 이 상태에서 reorder_idx는 다시 모두 0이 될 것으로 예상됩니다.

        // 5. 추가적인 랜덤 테스트 사이클 (en=1 상태)
        repeat (3) begin
            en = 1'b1;
            for (i = 0; i < NUM; i = i + 1) begin
                original_idx[i] = $urandom_range(0, (1 << IDX_WIDTH) - 1);
            end
            @(posedge clk);
            #(CLK_PERIOD * 2);
            en = 1'b0;
            #(CLK_PERIOD);
        end

        $finish;  // 시뮬레이션 종료
    end

endmodule
