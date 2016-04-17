//pc.v

module pc(pc_in, clk, rst, we, pc_out);
	input[5:0] pc_in;
	input clk, rst, we;
	output[5:0] pc_out;

	reg [5:0] pc_out;


	always@(posedge clk) begin
		if (rst == 1'b1) begin
		pc_out <= 6'b000000;
		end else if(we == 1'b1) begin
		pc_out <= pc_in;
		end else begin
		pc_out <= pc_out + 6'b000001;
		end

	end

endmodule
