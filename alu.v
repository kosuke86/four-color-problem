//alu.v
module alu(op, in0, in1, out, zf);
`include "define.h"
	input[3:0] op;
	input[7:0] in0, in1;
	output[7:0] out;
	output zf;

	reg[7:0] out;
	reg zf;
	always@(op or in0 or in1) begin
		case(op)
// synopsys full_case
// synopsys parallel_case

			SUB:out <= in0-in1;
			MUL:out <= in0*in0;
			DIV:out <= in0/in1;
			INC:out <= in0 + 1;
			DEC:out <= in0 - 1;
			COMPARE:if(in0 > in1)
					zf <= 0;
				else if(in0 < in1)
					zf <= 1;
				else if (in0 == in1)//ループのフラグで使う
					zf <= 0;
			CHECK:if(in0 == in1)
					zf <= 1;
				else if (in0 != in1)
					zf <= 0;
			CHECK_COLOR:if(in0 == in1)
					zf <= 1;
			CHECK_MAP:if(in0 == in1)
					zf <= 1;
			STORE:out <= in0;
			LI:out <= in0;
			SEPARATE1:out <= {4'b0000,in1[7:4]};
			SEPARATE2:out <= {4'b0000,in1[3:0]};
			default:out <= 0;
		endcase
	end
endmodule
