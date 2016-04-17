//top_test.v

module top_test;
	`include "define.h"
	reg[3:0] in;
	reg clk, rst;
	//wire[7:0] char;
	//wire[3:0] c_mask, n_mask;
	//wire[6:0] num;
	//top top(in, clk, char, c_mask, num, n_mask);
	top top(in, clk, rst);
	//always #5 clk = ~clk;
	always #1 clk = ~clk;
	initial begin
	//$shm_open("top_test");
	//$shm_probe("AC");
	
	$dumpfile("top_test.vcd");
	$dumpvars(0, top);
	$dumplimit(100000000);
	//$monitor($stime,,"in:%d clk:%d char:%d c_mask:%d num:%d n_mask:%d", in, clk, char, c_mask, num, n_mask);
	clk = 1;
	rst = 1;
	#20
	rst = 0;
	#5000000
	$finish;
end
endmodule
