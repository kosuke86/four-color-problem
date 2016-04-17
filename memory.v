module memory(we, addr, di, do, clk, rst);
	`include "memory.h"

	input clk, rst, we;
	input [7:0] addr;
	input [7:0] di;
	output [7:0] do;

	reg [7:0] seg[127:0];
	integer i;


	always @(posedge clk) begin
		if(rst) begin
			seg[0] <= TILDE;
			seg[1] <= TILDE;
			seg[2] <= TILDE;
			seg[3] <= TILDE;
			seg[4] <= TILDE;
			seg[5] <= TILDE;
			seg[6] <= TILDE;
			seg[7] <= TILDE;

			seg[8] <= TILDE;
			seg[9] <= TILDE;
			seg[10] <= TILDE;
			seg[11] <= TILDE;
			seg[12] <= TILDE;
			seg[13] <= TILDE;
			seg[14] <= TILDE;
			seg[15] <= TILDE;

			seg[16] <= 8'b0000_0011;//0-3
			seg[17] <= 8'b0001_0010;//1-2
			seg[18] <= 8'b0001_0100;//1-4
			seg[19] <= 8'b0010_0011;//2-3
			seg[20] <= 8'b0010_0100;//2-4
			seg[21] <= 8'b0010_0110;//2-6
			seg[22] <= 8'b0010_0111;//2-7
			seg[23] <= 8'b0011_0111;//3-7

			seg[24] <= 8'b0100_0101;//4-5
			seg[25] <= 8'b0100_0110;//4-6
			seg[26] <= 8'b0101_0110;//5-6
			seg[27] <= 8'b0101_0111;//5-7
			seg[28] <= 8'b0110_0111;//6-7
			seg[29] <= TILDE;
			seg[30] <= TILDE;
			seg[31] <= TILDE;

			seg[32] <= TILDE;
			seg[33] <= TILDE;
			seg[34] <= TILDE;
			seg[35] <= TILDE;
			seg[36] <= TILDE;
			seg[37] <= TILDE;
			seg[38] <= TILDE;
			seg[39] <= TILDE;

			seg[40] <= TILDE;
			seg[41] <= TILDE;
			seg[42] <= TILDE;
			seg[43] <= TILDE;
			seg[44] <= TILDE;
			seg[45] <= TILDE;
			seg[46] <= TILDE;
			seg[47] <= TILDE;

			seg[48] <= TILDE;
			seg[49] <= TILDE;
			seg[50] <= TILDE;
			seg[51] <= TILDE;
			seg[52] <= TILDE;
			seg[53] <= TILDE;
			seg[54] <= TILDE;
			seg[55] <= TILDE;

			seg[56] <= TILDE;
			seg[57] <= TILDE;
			seg[58] <= TILDE;
			seg[59] <= TILDE;
			seg[60] <= TILDE;
			seg[61] <= TILDE;
			seg[62] <= TILDE;
			seg[63] <= TILDE;

			seg[64] <= TILDE;
			seg[65] <= TILDE;
			seg[66] <= TILDE;
			seg[67] <= TILDE;
			seg[68] <= TILDE;
			seg[69] <= TILDE;
			seg[70] <= TILDE;
			seg[71] <= TILDE;

			seg[72] <= TILDE;
			seg[73] <= TILDE;
			seg[74] <= TILDE;
			seg[75] <= TILDE;
			seg[76] <= TILDE;
			seg[77] <= TILDE;
			seg[78] <= TILDE;
			seg[79] <= TILDE;

			seg[80] <= TILDE;
			seg[81] <= TILDE;
			seg[82] <= TILDE;
			seg[83] <= TILDE;
			seg[84] <= TILDE;
			seg[85] <= TILDE;
			seg[86] <= TILDE;
			seg[87] <= TILDE;

			seg[88] <= TILDE;
			seg[89] <= TILDE;
			seg[90] <= TILDE;
			seg[91] <= TILDE;
			seg[92] <= TILDE;
			seg[93] <= TILDE;
			seg[94] <= TILDE;
			seg[95] <= TILDE;

			seg[96] <= TILDE;
			seg[97] <= TILDE;
			seg[98] <= TILDE;
			seg[99] <= TILDE;
			seg[100] <=TILDE;
			seg[101] <=TILDE;
			seg[102] <=TILDE;
			seg[103] <=TILDE;

			seg[104] <=TILDE;
			seg[105] <=TILDE;
			seg[106] <=TILDE;
			seg[107] <=TILDE;
			seg[108] <=TILDE;
			seg[109] <=TILDE;
			seg[110] <=TILDE;
			seg[111] <=TILDE;

			seg[112] <=TILDE;
			seg[113] <=TILDE;
			seg[114] <=TILDE;
			seg[115] <=TILDE;
			seg[116] <=TILDE;
			seg[117] <=TILDE;
			seg[118] <=TILDE;
			seg[119] <=TILDE;

			seg[120] <=TILDE;
			seg[121] <=TILDE;
			seg[122] <=TILDE;
			seg[123] <=TILDE;
			seg[124] <=TILDE;
			seg[125] <=TILDE;
			seg[126] <=TILDE;
			seg[127] <=TILDE;

		end else begin
//			if(en)begin
				if(we)begin
					seg[addr] <= di;
					//do <= di;
				end/* else begin
					do <= seg[addr];
				end*/
//			end
		end
	end

	assign do = seg[addr];
	wire [7:0] seg0, seg1, seg2, seg3, seg4, seg5, seg6, seg7, seg8, seg9, seg10;
	wire [7:0] seg11, seg12, seg13, seg14, seg15, seg16, seg17, seg18, seg19, seg20;
	wire [7:0] seg21, seg22, seg23, seg24, seg25, seg26, seg27;
	assign seg0 = seg[0];
	assign seg1 = seg[1];
	assign seg2 = seg[2];
	assign seg3 = seg[3];
	assign seg4 = seg[4];
	assign seg5 = seg[5];
	assign seg6 = seg[6];
	assign seg7 = seg[7];
	assign seg8 = seg[8];
	assign seg9 = seg[9];
	assign seg10 = seg[10];
	assign seg11 = seg[11];
	assign seg12 = seg[12];
	assign seg13 = seg[13];
	assign seg14 = seg[14];
	assign seg15 = seg[15];
	assign seg16 = seg[16];
	assign seg17 = seg[17];
	assign seg18 = seg[18];
	assign seg19 = seg[19];
	assign seg20 = seg[20];
	assign seg21 = seg[21];
	assign seg22 = seg[22];
	assign seg23 = seg[23];
	assign seg24 = seg[24];
	assign seg25 = seg[25];
	assign seg26 = seg[26];
	assign seg27 = seg[27];

/*
	always @(di or en or we or addr)begin
		for(i=0;i<128;i=i+1)check[i] <= seg[i];
	end
*/

endmodule
