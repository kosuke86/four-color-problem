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


//色を塗る
		0: op <= {LI, 8'b0000_0000, banchi};//banchi set
		1: op <= {LI, 8'b0000_0001, color};//color set
		2: op <= {LI, 8'b0000_1000, teisuu};//定数8 set
		3: op <= {LI, 8'b0000_0001, ichi};//繰り上げるための1 set
		4: op <= {STORE, banchi, color, 4'b0000};//banchiにcolor１を入れる
		5: op <= {INC, banchi, banchi, 4'b0000};//banchi++1
		6: op <= {COMPARE, banchi, teisuu, 4'b0000};//8未満か比較
		7: op <= {JNZ, 6'b000100, 6'b0000};//8未満ならop=4に戻る。

//地図の取得
		8:op <= {LI, 8'b0001_0000, ten_six};//seg[16]を用意(地図情報取得)
		9:op <= {LOAD, ten_six, map, 4'b0000};//seg[16]をreg[map]に渡す

//もらった地図情報をを分ける
		10:op <= {SEPARATE1, map, up, 4'b0000};//ten-sixの上４桁をreg[up]に格納
		11:op <= {SEPARATE2, map, down, 4'b0000};//ten-sixの下４桁をreg[down]に格納
		12:op <= {LOAD, up, up_color, 4'b0000};//上４桁の色regis[up-color]に格納する
		13:op <= {LOAD, down, down_color, 4'b0000};//下４桁の色をregis[down-color]に格納する
		14:op <= {CHECK_COLOR, up_color, down_color, 4'b0000};//regis[up-color]とregis[down-color]と比較する
		15:op <= {JNZ, 6'b010110, 6'b000000};//色が同じだったら色を変えるためにop=22にジャンプ
		16:op <= {JMP, 6'b010001, 6'b000000};//色が違うと成功なので新しい地図をとるためにop=17にジャンプ

//mapの更新
		17:op <= {INC, ten_six, ten_six, 4'b0000};//ten_sixを更新して、次の地図情報を取ってくる。
		18:op <= {LOAD, ten_six, map, 4'b0000};//次の地図情報をmapに与える
		19:op <= {CHECK_MAP, map, 8'b0000_0000};//mapの値がTILDEがチェックする
		20:op <= {JNZ, 6'b100001, 6'b000000};//TILDEだと終わりなのでop=33にジャンプ
		21:op <= {JMP, 6'b001010, 6'b000000};//TILDEじゃないと地図の分解作業のためop=10にジャンプ

//総当たり
		22:op <= {LI, 8'b0000_0000, banchi};//banchiを0にする(全部塗った時に7になってるので初期化する)
		23:op <= {LOAD, banchi, color, 4'b0000};//colorの情報をregis[banchi]に格納。
		24:op <= {INC, color, color, 4'b0000};//色を変える！
		25:op <= {STORE, banchi, color, 4'b0000};//値を書き込む
		26:op <= {CHECK, color, 8'b0000_0101};//colorが５かチェック
		27:op <= {JNZ, 6'b011101, 6'b000000};//colorが5だとop=29にジャンプ
		28:op <= {JMP, 6'b001000, 6'b000000};//colorが5じゃないと色を変えたのでチェックするためにop=8にジャンプ
		29:op <= {STORE, banchi, ichi, 4'b0000};//color5を1にする。繰り上がりのため
		30:op <= {INC, banchi, banchi, 4'b0000};//banchを変える！次の県を見る。
		31:op <= {LOAD, banchi, color, 4'b0000};//新しいbanchiの色を取ってくる！
		32:op <= {JMP, 6'b011000, 6'b000000};//op=24にジャンプする！

//finish
		33:op <= {JMP, 6'b100010, 6'b000000};//終了
		endcase
	end
endmodule
