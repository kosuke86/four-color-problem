//register.v
module register(src0, src1, dst, data, clk, rst, we, data0, data1);

	input[3:0] src0, src1, dst;
	input[7:0] data;
	input clk, rst, we;
	output[7:0] data0, data1;

	reg[7:0] regis[15:0];
	//register$B$NCf$K(B8bit$BF~$k(Bregis$B$,(B16$B8D$"$k!#(B
	integer i;

	always@ (posedge clk)begin
		if (rst == 1)begin
			for (i =0; i<15; i = i+1)begin
			regis[i] <= 0;
			end
		end else if(we == 1'b1) begin
			regis[dst] <= data;
		end else begin
			regis[dst] <=regis[dst];
		end
	end

	assign data0 = regis[src0];
	assign data1 = regis[src1];
endmodule
