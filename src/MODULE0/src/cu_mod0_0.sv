`timescale 1ns/1ps

// module cu_mod0_0 (
// 	input clk,
// 	input rstn,
	
// 	output logic bf_en,
// 	output logic valid_fac8_0,
// 	output logic alert_mod01
// );
	
// 	logic [4:0] w_cnt_ctrl;

// 	cnt_5b U_CNT_5B(
// 	.clk(clk),
// 	.rstn(rstn),
	
// 	.cnt_ctrl(w_cnt_ctrl)
// 	);

// 	bf2i_ctrl U_BF2I_CTRL_00(
// 	.clk(clk),
// 	.rstn(rstn),
// 	.cnt_en(w_cnt_ctrl[4]),

// 	.bf_en(bf_en)
// 	);

// 	ctrl_mod0_fac8_0 #(
// 	.CNT_WIDTH(4) // 16카운트 
// 	) U_CTRL_FAC8_0(
// 	.clk(clk),
// 	.rstn(rstn),
// 	// .en(w_cnt_ctrl[4]),
// 	.en(bf_en),

// 	.valid_fac8_0(valid_fac8_0),
// 	.alert_mod01(alert_mod01)
// 	);

// 	// always_ff @( posedge clk or negedge rstn ) begin : make_bf_ctrl
// 	// 	if(!rstn) begin
// 	// 		bf_en <= 0;
// 	// 	end
// 	// 	else if(w_cnt_ctrl[4]) begin
// 	// 		bf_en <= 1;
// 	// 	end
// 	// 	else begin
// 	// 		bf_en <= 0;
// 	// 	end
// 	// end

// endmodule

module cu_mod0_0 (
	input clk,
	input rstn,
	input valid,
	
	output logic bf_en,
	output logic valid_fac8_0,
	output logic alert_mod01
);
	
	logic [4:0] w_cnt_ctrl;

	cnt_5b U_CNT_5B(
	.clk(clk),
	.rstn(rstn),
	.valid(valid),
	
	.cnt_ctrl(w_cnt_ctrl)
	);

	bf2i_ctrl U_BF2I_CTRL_00(
	.clk(clk),
	.rstn(rstn),
	.cnt_en(w_cnt_ctrl[4]),

	.bf_en(bf_en)
	);

	ctrl_mod0_fac8_0 #(
	.CNT_WIDTH(4) // 16카운트 
	) U_CTRL_FAC8_0(
	.clk(clk),
	.rstn(rstn),
	// .en(w_cnt_ctrl[4]),
	.en(bf_en),

	.valid_fac8_0(valid_fac8_0),
	.alert_mod01(alert_mod01)
	);

	// always_ff @( posedge clk or negedge rstn ) begin : make_bf_ctrl
	// 	if(!rstn) begin
	// 		bf_en <= 0;
	// 	end
	// 	else if(w_cnt_ctrl[4]) begin
	// 		bf_en <= 1;
	// 	end
	// 	else begin
	// 		bf_en <= 0;
	// 	end
	// end

endmodule