module mag_detect (
	input clk,
	input rstn,
	input en,
    input logic signed [22:0] mag_in[0:15],

    output logic [4:0] mag_out[0:15]
);

	logic [4:0] mag_out_reg [0:15];

	integer j;

	//Pipe Register
	always_ff @( posedge clk or negedge rstn ) begin : mag_out_pipe_0
		if(!rstn) begin
			for(j = 0; j < 16; j = j + 1) begin
				mag_out[j] <= 0;
			end		
		end
		else if(en) begin
			for(j = 0; j < 16; j = j + 1) begin
				mag_out[j] <= mag_out_reg[j];
			end		
		end
	end
	
    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin : lzc_gen
            //assign mag_out[i] = 
			assign mag_out_reg[i] = 
				((mag_in[i][21:0]  == 22'b0000000000000000000000) && ~mag_in[i][22]) ? 5'd22 :
				((mag_in[i][21:1]  == 21'b000000000000000000000) && ~mag_in[i][22]) ? 5'd21 :
				((mag_in[i][21:2]  == 20'b00000000000000000000) && ~mag_in[i][22]) ? 5'd20 :
				((mag_in[i][21:3]  == 19'b0000000000000000000) && ~mag_in[i][22]) ? 5'd19 :
				((mag_in[i][21:4]  == 18'b000000000000000000) && ~mag_in[i][22]) ? 5'd18 :
				((mag_in[i][21:5]  == 17'b00000000000000000) && ~mag_in[i][22]) ? 5'd17 :
				((mag_in[i][21:6]  == 16'b0000000000000000) && ~mag_in[i][22]) ? 5'd16 :
				((mag_in[i][21:7]  == 15'b000000000000000) && ~mag_in[i][22]) ? 5'd15 :
				((mag_in[i][21:8]  == 14'b00000000000000) && ~mag_in[i][22]) ? 5'd14 :
				((mag_in[i][21:9]  == 13'b0000000000000) && ~mag_in[i][22]) ? 5'd13 :
				((mag_in[i][21:10] == 12'b000000000000) && ~mag_in[i][22]) ? 5'd12 :
				((mag_in[i][21:11] == 11'b00000000000) && ~mag_in[i][22]) ? 5'd11 :
				((mag_in[i][21:12] == 10'b0000000000) && ~mag_in[i][22]) ? 5'd10 :
				((mag_in[i][21:13] == 9'b000000000) && ~mag_in[i][22]) ? 5'd9 :
				((mag_in[i][21:14] == 8'b00000000) && ~mag_in[i][22]) ? 5'd8 :
				((mag_in[i][21:15] == 7'b0000000) && ~mag_in[i][22]) ? 5'd7 :
				((mag_in[i][21:16] == 6'b000000) && ~mag_in[i][22]) ? 5'd6 :
				((mag_in[i][21:17] == 5'b00000) && ~mag_in[i][22]) ? 5'd5 :
				((mag_in[i][21:18] == 4'b0000) && ~mag_in[i][22]) ? 5'd4 :
				((mag_in[i][21:19] == 3'b000) && ~mag_in[i][22]) ? 5'd3 :
				((mag_in[i][21:20] == 2'b00) && ~mag_in[i][22]) ? 5'd2 :
				((mag_in[i][21:21] == 1'b0) && ~mag_in[i][22]) ? 5'd1 :
				
				((mag_in[i][21:0]  == 22'b1111111111111111111111) && mag_in[i][22]) ? 5'd22 :
				((mag_in[i][21:1]  == 21'b111111111111111111111) && mag_in[i][22]) ? 5'd21 :
				((mag_in[i][21:2]  == 20'b11111111111111111111) && mag_in[i][22]) ? 5'd20 :
				((mag_in[i][21:3]  == 19'b1111111111111111111) && mag_in[i][22]) ? 5'd19 :
				((mag_in[i][21:4]  == 18'b111111111111111111) && mag_in[i][22]) ? 5'd18 :
				((mag_in[i][21:5]  == 17'b11111111111111111) && mag_in[i][22]) ? 5'd17 :
				((mag_in[i][21:6]  == 16'b1111111111111111) && mag_in[i][22]) ? 5'd16 :
				((mag_in[i][21:7]  == 15'b111111111111111) && mag_in[i][22]) ? 5'd15 :
				((mag_in[i][21:8]  == 14'b11111111111111) && mag_in[i][22]) ? 5'd14 :
				((mag_in[i][21:9]  == 13'b1111111111111) && mag_in[i][22]) ? 5'd13 :
				((mag_in[i][21:10] == 12'b111111111111) && mag_in[i][22]) ? 5'd12 :
				((mag_in[i][21:11] == 11'b11111111111) && mag_in[i][22]) ? 5'd11 :
				((mag_in[i][21:12] == 10'b1111111111) && mag_in[i][22]) ? 5'd10 :
				((mag_in[i][21:13] == 9'b111111111) && mag_in[i][22]) ? 5'd9 :
				((mag_in[i][21:14] == 8'b11111111) && mag_in[i][22]) ? 5'd8 :
				((mag_in[i][21:15] == 7'b1111111) && mag_in[i][22]) ? 5'd7 :
				((mag_in[i][21:16] == 6'b111111) && mag_in[i][22]) ? 5'd6 :
				((mag_in[i][21:17] == 5'b11111) && mag_in[i][22]) ? 5'd5 :
				((mag_in[i][21:18] == 4'b1111) && mag_in[i][22]) ? 5'd4 :
				((mag_in[i][21:19] == 3'b111) && mag_in[i][22]) ? 5'd3 :
				((mag_in[i][21:20] == 2'b11) && mag_in[i][22]) ? 5'd2 :
				((mag_in[i][21:21] == 1'b1) && mag_in[i][22]) ? 5'd1 :
				5'd0;
        end

    endgenerate

endmodule