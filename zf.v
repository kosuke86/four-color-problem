//zf.v
module zf(zf_in, clk, lastzf);
	input zf_in, clk;
	output lastzf;
	reg lastzf;

	always@(posedge clk)
		lastzf <= zf_in;

endmodule
