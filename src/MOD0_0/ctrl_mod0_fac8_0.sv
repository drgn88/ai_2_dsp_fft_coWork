`timescale 1ns/1ps

module ctrl_mod0_fac8_0 #(
	parameter  CNT_WIDTH = 4 // 16카운트 
)(
	input clk,
	input rstn,
	input en,

	output logic valid_fac8_0,
	output logic alert_mod01
);

	logic [CNT_WIDTH-1:0] cnt;
	logic cnt_flag;

	// always_ff @( posedge clk or negedge rstn ) begin : fac8_0_ctrl
	// 	if(!rstn) begin
	// 		valid_fac8_0 <= 0;
	// 		cnt <= 0;
	// 		cnt_flag <= 0;
	// 	end
	// 	else begin
	// 		if(en && !(cnt_flag)) begin
	// 			cnt_flag <= 1;
	// 			valid_fac8_0 <=0;
	// 			cnt <= 0;
	// 		end
	// 		else if (cnt_flag) begin
	// 			if (cnt == 511) begin
	// 				cnt_flag <= 0;
	// 				valid_fac8_0 <= 0;
	// 				cnt <= 0;
	// 				// cnt <= cnt+1;
	// 				// valid_fac8_0 <= 1;
	// 			end
	// 			else if(cnt == 384)begin
	// 				cnt <= cnt + 1;
	// 				valid_fac8_0 <= 1;
	// 			end
	// 			else begin
	// 				cnt <= cnt + 1;
	// 			end
	// 		end
	// 	end
	// end
	
	always_ff @( posedge clk or negedge rstn ) begin : fac8_0_ctrl
		if(!rstn) begin
			valid_fac8_0 <= 0;
			cnt <= 0;
			cnt_flag <= 0;
			alert_mod01 <= 0;
		end
		else begin
			if(en && !(cnt_flag)) begin
				cnt_flag <= 1;
				valid_fac8_0 <=0;
				cnt <= 0;
				alert_mod01 <= 1;
			end
			else if (cnt_flag) begin
				alert_mod01 <= 0;
				if(cnt == 15) begin
					valid_fac8_0 <= 0;
					cnt_flag <= 0;
					cnt <= 0;
				end
				else if(cnt == 7) begin
					valid_fac8_0 <= 1;
					cnt <= cnt + 1;
				end
				else begin
					cnt <= cnt + 1;
				end
			end
		end
	end
	
endmodule


