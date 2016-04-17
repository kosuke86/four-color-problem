//imem.v
module imem(pc, op);
`include"define.h"
	input[5:0] pc;
	output[15:0] op;
	reg [15:0] op;

	always @(pc)begin
		case(pc)
//synopsys full_case
//synopsys parallel_case


//$B?'$rEI$k(B
		0: op <= {LI, 8'b0000_0000, banchi};//banchi set
		1: op <= {LI, 8'b0000_0001, color};//color set
		2: op <= {LI, 8'b0000_1000, teisuu};//$BDj?t(B8 set
		3: op <= {LI, 8'b0000_0001, ichi};//$B7+$j>e$2$k$?$a$N(B1 set
		4: op <= {STORE, banchi, color, 4'b0000};//banchi$B$K(Bcolor$B#1$rF~$l$k(B
		5: op <= {INC, banchi, banchi, 4'b0000};//banchi++1
		6: op <= {COMPARE, banchi, teisuu, 4'b0000};//8$BL$K~$+Hf3S(B
		7: op <= {JNZ, 6'b000100, 6'b0000};//8$BL$K~$J$i(Bop=4$B$KLa$k!#(B

//$BCO?^$N<hF@(B
		8:op <= {LI, 8'b0001_0000, ten_six};//seg[16]$B$rMQ0U(B($BCO?^>pJs<hF@(B)
		9:op <= {LOAD, ten_six, map, 4'b0000};//seg[16]$B$r(Breg[map]$B$KEO$9(B

//$B$b$i$C$?CO?^>pJs$r$rJ,$1$k(B
		10:op <= {SEPARATE1, map, up, 4'b0000};//ten-six$B$N>e#47e$r(Breg[up]$B$K3JG<(B
		11:op <= {SEPARATE2, map, down, 4'b0000};//ten-six$B$N2<#47e$r(Breg[down]$B$K3JG<(B
		12:op <= {LOAD, up, up_color, 4'b0000};//$B>e#47e$N?'(Bregis[up-color]$B$K3JG<$9$k(B
		13:op <= {LOAD, down, down_color, 4'b0000};//$B2<#47e$N?'$r(Bregis[down-color]$B$K3JG<$9$k(B
		14:op <= {CHECK_COLOR, up_color, down_color, 4'b0000};//regis[up-color]$B$H(Bregis[down-color]$B$HHf3S$9$k(B
		15:op <= {JNZ, 6'b010110, 6'b000000};//$B?'$,F1$8$@$C$?$i?'$rJQ$($k$?$a$K(Bop=22$B$K%8%c%s%W(B
		16:op <= {JMP, 6'b010001, 6'b000000};//$B?'$,0c$&$H@.8y$J$N$G?7$7$$CO?^$r$H$k$?$a$K(Bop=17$B$K%8%c%s%W(B

//map$B$N99?7(B
		17:op <= {INC, ten_six, ten_six, 4'b0000};//ten_six$B$r99?7$7$F!"<!$NCO?^>pJs$r<h$C$F$/$k!#(B
		18:op <= {LOAD, ten_six, map, 4'b0000};//$B<!$NCO?^>pJs$r(Bmap$B$KM?$($k(B
		19:op <= {CHECK_MAP, map, 8'b0000_0000};//map$B$NCM$,(BTILDE$B$,%A%'%C%/$9$k(B
		20:op <= {JNZ, 6'b100001, 6'b000000};//TILDE$B$@$H=*$o$j$J$N$G(Bop=33$B$K%8%c%s%W(B
		21:op <= {JMP, 6'b001010, 6'b000000};//TILDE$B$8$c$J$$$HCO?^$NJ,2r:n6H$N$?$a(Bop=10$B$K%8%c%s%W(B

//$BAmEv$?$j(B
		22:op <= {LI, 8'b0000_0000, banchi};//banchi$B$r(B0$B$K$9$k(B($BA4ItEI$C$?;~$K(B7$B$K$J$C$F$k$N$G=i4|2=$9$k(B)
		23:op <= {LOAD, banchi, color, 4'b0000};//color$B$N>pJs$r(Bregis[banchi]$B$K3JG<!#(B
		24:op <= {INC, color, color, 4'b0000};//$B?'$rJQ$($k!*(B
		25:op <= {STORE, banchi, color, 4'b0000};//$BCM$r=q$-9~$`(B
		26:op <= {CHECK, color, 8'b0000_0101};//color$B$,#5$+%A%'%C%/(B
		27:op <= {JNZ, 6'b011101, 6'b000000};//color$B$,(B5$B$@$H(Bop=29$B$K%8%c%s%W(B
		28:op <= {JMP, 6'b001000, 6'b000000};//color$B$,(B5$B$8$c$J$$$H?'$rJQ$($?$N$G%A%'%C%/$9$k$?$a$K(Bop=8$B$K%8%c%s%W(B
		29:op <= {STORE, banchi, ichi, 4'b0000};//color5$B$r(B1$B$K$9$k!#7+$j>e$,$j$N$?$a(B
		30:op <= {INC, banchi, banchi, 4'b0000};//banch$B$rJQ$($k!*<!$N8)$r8+$k!#(B
		31:op <= {LOAD, banchi, color, 4'b0000};//$B?7$7$$(Bbanchi$B$N?'$r<h$C$F$/$k!*(B
		32:op <= {JMP, 6'b011000, 6'b000000};//op=24$B$K%8%c%s%W$9$k!*(B

//finish
		33:op <= {JMP, 6'b100010, 6'b000000};//$B=*N;(B
		endcase
	end
endmodule
