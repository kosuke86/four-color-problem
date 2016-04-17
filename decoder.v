//decoder.v
module decoder(op, zf, alu_op, src0, src1, dst, sel1, sel2, reg_we, pc_we, mem_we, data, pc_in);
`include"define.h"
	input[15:0] op;
	input zf;
	output[3:0] alu_op, src0, src1, dst;
	output sel1, sel2, reg_we, pc_we, mem_we;
	output [7:0] data;
	output[5:0] pc_in;


	reg[3:0] alu_op, src0, src1, dst;
	reg sel1, sel2, reg_we, pc_we, mem_we;
	reg[7:0] data;
	reg[5:0] pc_in;

	always@(op or zf)begin
		case(op[15:12])
// synopsys full_case
// synopsys parallel_case
			SUB,MUL,DIV:begin
			alu_op <= op[15:12];
			src0 <= op[11:8];
			src1 <= op[7:4];
			dst <= op[3:0];
			sel1 <= 1;
			sel2 <= 0;
			mem_we <= 0;
			pc_we <= 0;
			reg_we <= 1;
		end
			INC,DEC:begin
			alu_op <= op[15:12];
			src0 <= op[11:8];
			dst <= op[7:4];
			sel1 <= 1;
			sel2 <= 0;
			mem_we <= 0;
			pc_we <= 0;
			reg_we <= 1;
		end
			COMPARE:begin
			alu_op <= op[15:12];
			src0 <= op[11:8];
			src1 <= op[7:4];
			sel1 <= 1;
			sel2 <= 0;
			mem_we <= 0;
			pc_we <= 0;
			reg_we <= 0;
		end
			CHECK:begin
			alu_op <= op[15:12];
			src1 <= op[11:8];
			data <= op[7:0];
			sel1 <= 0;
			sel2 <= 0;
			mem_we <= 0;
			pc_we <= 0;
			reg_we <= 0;
		end
			LOAD:begin
			alu_op <= op[15:12];
			src1 <= op[11:8];
			dst <= op[7:4];
			sel1 <= 0;
			sel2 <= 1;
			mem_we <= 0;
			pc_we <= 0;
			reg_we <= 1;
		end
			STORE:begin
			alu_op <= op[15:12];
			src1 <= op[11:8];
			src0 <= op[7:4];
			sel1 <= 1;
			sel2 <= 0;
			mem_we <= 1;
			pc_we <= 0;
			reg_we <= 0;
		end
			JMP:begin
			alu_op <= op[15:12];
			pc_in <= op[11:6];
			sel1 <= 0;
			sel2 <= 0;
			mem_we <= 0;
			pc_we <= 1;
			reg_we <= 0;
		end
			JNZ:begin
			alu_op <= op[15:12];
			pc_in <= op[11:6];
			sel1 <= 0;
			sel2 <= 0;
			mem_we <= 0;
			pc_we <= zf;
			reg_we <= 0;
		end
			LI:begin
			alu_op <= op[15:12];
			data <= op[11:4];
			dst <= op[3:0];
			sel1 <= 0;
			sel2 <= 0;
			mem_we <= 0;
			pc_we <= 0;
			reg_we <= 1;
		end
			SEPARATE1:begin
			alu_op <= op[15:12];
			src1 <= op[11:8];
			dst <= op[7:4];
			sel1 <= 0;
			sel2 <= 0;
			mem_we <= 0;
			pc_we <= 0;
			reg_we <= 1;
		end
			SEPARATE2:begin
			alu_op <= op[15:12];
			src1 <= op[11:8];
			dst <= op[7:4];
			sel1 <= 0;
			sel2 <= 0;
			mem_we <= 0;
			pc_we <= 0;
			reg_we <= 1;
		end
			CHECK_COLOR:begin
			alu_op <= op[15:12];
			src0 <= op[11:8];
			src1 <= op[7:4];
			sel1 <= 1;
			sel2 <= 0;
			mem_we <= 0;
			pc_we <= 0;
			reg_we <= 0;
		end
			CHECK_MAP:begin
			alu_op <= op[15:12];
			src1 <= op[11:8];
			data <= op[7:0];
			sel1 <= 0;
			sel2 <= 0;
			mem_we <= 0;
			pc_we <= 0;
			reg_we <= 0;
		end
		endcase
	end
endmodule
