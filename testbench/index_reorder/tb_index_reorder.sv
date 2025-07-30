`timescale 1ns / 1ps

module tb_index_reorder;

    localparam IDX_WIDTH = 9;

    reg  [IDX_WIDTH-1:0] original_idx;
    wire [IDX_WIDTH-1:0] reorder_idx;

    index_reorder #(
        .IDX_WIDTH(IDX_WIDTH)
    ) u_index_reorder (
        .original_idx(original_idx),
        .reorder_idx(reorder_idx)
    );

    initial begin
        $display("--- Index Reorder Testbench Start ---");
        $display("IDX_WIDTH = %0d", IDX_WIDTH);
        $display("-------------------------------------");
        $display("Time | Original_Idx (Dec) | Original_Idx (Bin) | Reorder_Idx (Dec) | Reorder_Idx (Bin)");
        $display("------------------------------------------------------------------------------------");

        // 테스트 케이스 1: 최소값 (0)
        original_idx = 0;
        #10;
        $display("%0t | %0d                 | %9b            | %0d               | %9b",
                 $time, original_idx, original_idx, reorder_idx, reorder_idx);

        // 테스트 케이스 2: 최대값 (511)
        original_idx = (1 << IDX_WIDTH) - 1; // 2^IDX_WIDTH - 1
        #10;
        $display("%0t | %0d                 | %9b            | %0d               | %9b",
                 $time, original_idx, original_idx, reorder_idx, reorder_idx);

        // 테스트 케이스 3: 특정 값 (예: 1)
        original_idx = 1; // 이진수 000000001
        #10;
        $display("%0t | %0d                 | %9b            | %0d               | %9b",
                 $time, original_idx, original_idx, reorder_idx, reorder_idx);

        // 테스트 케이스 4: 특정 값 (예: 256)
        original_idx = 256; // 이진수 100000000
        #10;
        $display("%0t | %0d                 | %9b            | %0d               | %9b",
                 $time, original_idx, original_idx, reorder_idx, reorder_idx);

        // 테스트 케이스 5: 임의의 중간 값 (예: 90)
        original_idx = 90; // 이진수 001011010
        #10;
        $display("%0t | %0d                 | %9b            | %0d               | %9b",
                 $time, original_idx, original_idx, reorder_idx, reorder_idx);

        // 테스트 케이스 6: 임의의 중간 값 (예: 172 - 위 90의 비트 역순)
        original_idx = 172; // 이진수 010110100
        #10;
        $display("%0t | %0d                 | %9b            | %0d               | %9b",
                 $time, original_idx, original_idx, reorder_idx, reorder_idx);
        
        // 추가적인 테스트 케이스 (선택 사항)
        for (integer k = 0; k < 10; k = k + 1) begin
            original_idx = $urandom_range(0, (1 << IDX_WIDTH) - 1); // 랜덤 값
            #10;
            $display("%0t | %0d                 | %9b            | %0d               | %9b",
                     $time, original_idx, original_idx, reorder_idx, reorder_idx);
        end


        $display("-------------------------------------");
        $display("--- Index Reorder Testbench End ---");
        $finish; // 시뮬레이션 종료
    end

endmodule
