LEVELTOP10 = "\\data\\bestlevel.dat"
MISSIONID_OUTER = 18
MISSIONID_INNER = 19

FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟

TITLETIME = 30 * 24 * 60 * 60 * 18

TRYOUT_TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TRYOUT_TIMER_2 = 3 * 60 * 60 * FRAME2TIME; --为4小时
TIMERID_SMALL_OUTER = 33
TIMERID_TOTAL_OUTER = 34


MATCH_TIMER_1 = 10 * FRAME2TIME; --5秒公布一下战况
MATCH_TIMER_2 = 15 * 60 * FRAME2TIME; --为10分钟
TIMERID_SMALL_INNER = 35
TIMERID_TOTAL_INNER = 36


CP_ONEDAY_MAXROUND = floor(TRYOUT_TIMER_2  / (MATCH_TIMER_2 + 5 * 60 * FRAME2TIME))

FactionData = {
			{	"\\data\\shaolin_fresh.dat", "ShaoLin_Top5", "少林 "	},
			{	"\\data\\tianwang_fresh.dat", "TianWang_Top5", "天王"	},
			{	"\\data\\tangmen_fresh.dat", "TangMen_Top5", "唐门"	},
			{	"\\data\\wudu_fresh.dat", "Wudu_Top5", "五毒"	},
			{	"\\data\\emei_fresh.dat", "EMei_Top5", "峨眉"	},
			{	"\\data\\cuiyan_fresh.dat", "CuiYan_Top5", "翠烟"	},
			{	"\\data\\gaibang_fresh.dat", "GaiBang_Top5", "丐帮"	},
			{	"\\data\\tianren_fresh.dat", "TianRen_Top5", "天忍"	},
			{	"\\data\\wudang_fresh.dat", "WuDang_Top5", "武当"	},
			{	"\\data\\kunlun_fresh.dat", "KunLun_Top5", "昆仑"	}
		  }

FactionTitle = {
				"少林武林新秀",
				"天王武林新秀",
				"唐门 武林新秀",
				"五毒武林新秀",
				"峨眉 武林新秀",
				"翠烟武林新秀",
				"丐帮武林新秀",
				"天忍 武林新秀",
				"武当 武林新秀",
				"昆仑武林新秀"
				}
				
CP_MAPTAB = {
				{	396, 397, "少林"	},
				{	398, 399, "天王"	},
				{	400, 401, "唐门"	},
			 	{	402, 403, "五毒"	},
			 	{	404, 405, "峨眉"	},
			 	{	406, 407, "翠烟"	},
			 	{	408, 409, "丐帮"	},
			 	{	410, 411, "天忍"	},
			 	{	412, 413, "武当"	},
			 	{	414, 415, "昆仑"	}
			 }

CP_TASKID_REGIST = 1095		--1：报过名；9：取消了预选赛资格
CP_TASKID_POINT = 1096		--记录预选赛得分
CP_TASKID_TITLE = 1097		--9：记录已取得决赛圈资格
CP_TASKID_BID = 1098		--
CP_TASKID_ENEMY = 1099		--预赛时对手的阵营号
CP_TASKID_ROUND = 1100		--参赛的次数
CP_TASKID_WIN = 1101		--赢的次数
CP_TASKID_LOSE = 1102		--输的次数；掉线判输，但无法记录
CP_TASKID_TIE = 1103		--平局的次数
CP_TASKID_FLAG = 1104		--正常退出赛场的标记，在下一入场时刷新
CP_TASKID_BACKCONT = 1105	--对于参与投标的玩家根据投标总金额，判断能取几次
CP_TASKID_LOGOUT = 1094		--为 0 时表明正常退出，为 1 时表示非正常退出（如当机、未保存数据、服务器原因）
CP_CASH = 100000
CP_MAXROUND = 40
CP_PLNUM_LIMT = 4
CP_MAPPOS_IN = {1508,3026}
CP_MAPPOS_OUT = {1472,3243}
CP_MAPPOS_PRE = {1596,2977}

CP_AWARD_ITEM = {
					{"紫水晶", {4, 239}, 2},
					{"蓝水晶", {4, 238}, 2},
					{"绿水晶", {4, 240}, 2},
					{"晶红宝石", {4, 353}, 2},
					{"玄晶矿石4级", {6, 1, 147, 4, 0, 0}, 200},
					{"玄晶矿石5级", {6, 1, 147, 5, 0, 0}, 50},
					{"玄晶矿石6级", {6, 1, 147, 6, 0, 0}, 1},
					{"大福缘露 ", {6, 1, 124, 1, 0, 0}, 50},
					{"中福缘露 ", {6, 1, 123, 1, 0, 0}, 100},
					{"小福缘露 ", {6, 1, 122, 1, 0, 0}, 200},
					{"仙草露 ", {6, 1, 71, 1, 0, 0}, 1500},
					{"天山宝露 ", {6, 1, 72, 1, 0, 0}, 1991},
					{"大白驹丸", {6, 1, 130, 1, 0, 0}, 100},
					{"玫瑰", {6, 0, 20, 1, 0, 0}, 2000},
					{"心心相映符 ", {6, 1, 18, 1, 0, 0}, 2000},
					{"风陵渡令牌", {4, 489}, 100},
					{"烟花", {6, 0, 11, 1, 0, 0}, 1700},
				}

CP_FORBID_ITEM = {
					{	"攻速丸", {6, 1, 218, 1, 0, 0}, 511	},
					{	"跑速丸", {6, 1, 219, 1, 0, 0}, 512	},
					{	"普防丸", {6, 1, 220, 1, 0, 0}, 513	},
					{	"毒防丸", {6, 1, 221, 1, 0, 0}, 514	},
					{	"冰防丸", {6, 1, 222, 1, 0, 0}, 515	},
					{	"火防丸", {6, 1, 223, 1, 0, 0}, 516	},
					{	"雷防丸", {6, 1, 224, 1, 0, 0}, 517	},
					{	"减枪丸", {6, 1, 225, 1, 0, 0}, 518	},
					{	"减昏丸", {6, 1, 226, 1, 0, 0}, 519	},
					{	"减毒丸", {6, 1, 227, 1, 0, 0}, 520	},
					{	"减冰丸", {6, 1, 228, 1, 0, 0}, 521	},
					{	"普攻丸", {6, 1, 229, 1, 0, 0}, 522	},
					{	"毒攻丸", {6, 1, 230, 1, 0, 0}, 523	},
					{	"冰攻丸", {6, 1, 231, 1, 0, 0}, 524	},
					{	"火攻丸", {6, 1, 232, 1, 0, 0}, 525	},
					{	"雷攻丸", {6, 1, 233, 1, 0, 0}, 526	},
					{	"长命丸", {6, 1, 234, 1, 0, 0}, 527	},
					{	"长内丸", {6, 1, 235, 1, 0, 0}, 528	},
					{	"安魂丹", {6, 1, 115, 1, 0, 0}, 450	},
					{	"社蓝丹", {6, 1, 116, 1, 0, 0}, 451	},
					{	"内普丸", {6, 1, 117, 1, 0, 0}, 453	},
					{	"内毒丸", {6, 1, 118, 1, 0, 0}, 454	},
					{	"内冰丸", {6, 1, 119, 1, 0, 0}, 455	},
					{	"内火丸", {6, 1, 120, 1, 0, 0}, 456	},
					{	"内雷丸", {6, 1, 121, 1, 0, 0}, 457	},
					{	"长命丸", {6, 0, 1, 1, 0, 0}, 256	},
					{	"加跑丸", {6, 0, 2, 1, 0, 0}, 257	},
					{	"大力丸", {6, 0, 3, 1, 0, 0}, 258	},
					{	"高闪丸", {6, 0, 4, 1, 0, 0}, 259	},
					{	"高中丸", {6, 0, 5, 1, 0, 0}, 260	},
					{	"飞速丸", {6, 0, 6, 1, 0, 0}, 261	},
					{	"冰防丸", {6, 0, 7, 1, 0, 0}, 262	},
					{	"雷防丸", {6, 0, 8, 1, 0, 0}, 263	},
					{	"火防丸", {6, 0, 9, 1, 0, 0}, 264	},
					{	"毒防丸", {6, 0, 10, 1, 0, 0}, 265	},
					{	"板栗粽子 ", {6, 0, 60, 1, 0, 0}, 401	},
					{	"猪肉粽子", {6, 0, 61, 1, 0, 0}, 402	},
					{	"牛肉粽子 ", {6, 0, 62, 1, 0, 0}, 403	},
					{	"百果露 ", {6, 1, 73, 1, 0, 0}, 442	},
					{	"吉祥红包", {6, 1, 19, 1, 0, 0}, 442	},
					{"黄金宝箱",	{6,	1,	69,	1,	0,	0},	442}
				}

CP_TRAPIN = "\\settings\\maps\\championship\\linantoplace_trap.txt"
CP_TRAPOUT = ""
CP_MATCH_POS = "\\settings\\maps\\championship\\champion_gmpos.txt"
CP_TRAPIN_FILE = "\\script\\missions\\freshman_match\\trap\\trap_linantoplace.lua"
CP_TRAPOUT_FILE = "\\script\\missions\\freshman_match\\trap\\trap_placetolinan.lua"


CP_UPTO_TRYOUT = 5060120
CP_END_TRYOUT = 5061023
