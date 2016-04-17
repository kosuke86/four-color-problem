//top.v

//module top(in, clk, char, c_mask, num, n_mask);
module top(in, clk, rst);
	`include "define.h"
	input[3:0] in;
	input clk, rst;
//	output[7:0] char;
//	output[3:0] c_mask, n_mask;
//	output[6:0] num;
//	wire[3:0] dst, src0, src1, alu_op, c_mask, n_mask, pulsein;
	wire[3:0] dst, src0, src1, alu_op;
	wire[5:0] pc_in, pc;
//	wire[6:0] num;
//	wire[7:0] data1, data2, data_in, alu_in, alu_out, reg_out, char, mem_data;
	wire[7:0] data1, data2, data_in, alu_in, alu_out, reg_out, mem_data;
	wire[15:0] op;
//	wire pc_we, lastzf, reg_we, mem_we, zf, sel1, sel2, decrst, porrst,
	wire pc_we, lastzf, reg_we, mem_we, zf, sel1, sel2;
//	selrstin, rst;
	pc pc1(.pc_in(pc_in), .we(pc_we), .clk(clk), .rst(rst), .pc_out(pc));
	imem imem(.pc(pc), .op(op));
	decoder decoder(.op(op), .zf(lastzf), .pc_we(pc_we), .pc_in(pc_in), .dst(dst), .reg_we(reg_we), .src0(src0), .src1(src1), .data(data1), .sel1(sel1), .sel2(sel2), .alu_op(alu_op), .mem_we(mem_we));
	alu alu(.op(alu_op), .in0(data_in), .in1(alu_in), .out(alu_out), .zf(zf));
	register register(.src0(src0), .src1(src1), .dst(dst), .data(data2), .we(reg_we), .clk(clk), .rst(rst), .data0(reg_out), .data1(alu_in));
	zf zf1(.zf_in(zf), .clk(clk), .lastzf(lastzf));
	selector selector1(.sel(sel1), .in0(data1), .in1(reg_out), .out(data_in));
	selector selector2(.sel(sel2), .in0(alu_out), .in1(mem_data), .out(data2));
	memory memory(.we(mem_we), .addr(alu_in), .di(alu_out), .do(mem_data), .clk(clk), .rst(rst));
//	memory_top memory_top(mem_we, alu_in, pulsein, alu_out, mem_data, c_mask, n_mask, char, num, clk,rst);
//	pulse pulseA(~in[0], pulsein[0], clk);
//	pulse pulseB(~in[1], pulsein[1], clk);
//	pulse pulseC(~in[2], pulsein[2], clk);
//	pulse pulseD(~in[3], pulsein[3], clk);
//	por por (in, porrst, selrstin, clk);
//	selector2 #(1) selrst( porrst , decrst , selrstin , rst);
endmodule
