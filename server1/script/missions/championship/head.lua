IncludeLib("FILESYS")
IncludeLib("RELAYLADDER")
IncludeLib("TITLE")
IncludeLib("ITEM")

BID_DATA = "\\data\\tongbid.dat"
LEVELTOP10 = "\\data\\bestlevel.dat"
LEADER_MEMBER = "\\data\\leadmember.dat"
BID_LEADER = "\\data\\bidleader.dat"

TITLETIME = 30 * 24 * 60 * 60 * 18
FRAME2TIME = 18
TRYOUT_TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
TRYOUT_TIMER_2 = 4 * 60 * 60 * FRAME2TIME; --为4小时

MATCH_TIMER_1 = 10 * FRAME2TIME; --5秒公布一下战况
MATCH_TIMER_2 = 10 * 60 * FRAME2TIME; --为10分钟

CP_ONEDAY_MAXROUND = floor(TRYOUT_TIMER_2  / (MATCH_TIMER_2 + 5 * 60 * FRAME2TIME))

Faction = {
			{"\\data\\shaolin_top5.dat", "ShaoLin_Top5", "少林"},
			{"\\data\\tianwang_top5.dat", "TianWang_Top5", "天王"},
			{"\\data\\tangmen_top5.dat", "TangMen_Top5", "唐门"},
			{"\\data\\wudu_top5.dat", "Wudu_Top5", "五毒"},
			{"\\data\\emei_top5.dat", "EMei_Top5", "峨眉"},
			{"\\data\\cuiyan_top5.dat", "CuiYan_Top5", "翠烟"},
			{"\\data\\gaibang_top5.dat", "GaiBang_Top5", "丐帮"},
			{"\\data\\tianren_top5.dat", "TianRen_Top5", "天忍"},
			{"\\data\\wudang_top5.dat", "WuDang_Top5", "武当"},
			{"\\data\\kunlun_top5.dat", "KunLun_Top5", "昆仑"}
		  }
FactionTitle = {
				"武林大会少林高手",
				"武林大会天王高手",
				"武林大会唐门高手",
				"武林大会五毒高手",
				"武林大会峨眉高手",
				"武林大会翠烟高手",
				"武林大会丐帮高手",
				"武林大会天忍高手",
				"武林大会武当高手",
				"武林大会昆仑高手",
				}
CP_TASKID_REGIST = 1083		--1：报过名；9：取消了预选赛资格
CP_TASKID_POINT = 1084		--记录预选赛得分
CP_TASKID_TITLE = 1085		--9：记录已取得决赛圈资格
CP_TASKID_BID = 1086		--
CP_TASKID_ENEMY = 1087		--预赛时对手的阵营号
CP_TASKID_ROUND = 1088		--参赛的次数
CP_TASKID_WIN = 1089		--赢的次数
CP_TASKID_LOSE = 1090		--输的次数；掉线判输，但无法记录
CP_TASKID_TIE = 1091		--平局的次数
CP_TASKID_FLAG = 1092		--正常退出赛场的标记，在下一入场时刷新
CP_TASKID_BACKCONT = 1093	--对于参与投标的玩家根据投标总金额，判断能取几次
CP_TASKID_LOGOUT = 1094		--为 0 时表明正常退出，为 1 时表示非正常退出（如当机、未保存数据、服务器原因）
CP_CASH = 100000
CP_MAXROUND = 30
CP_PLNUM_LIMT = 10
CP_PLNUM_LIMT_ESPECIAL = 4	--五毒、唐门、昆仑人数限制 至少4人
CP_MAPPOS_IN = {1508,3026}
CP_MAPPOS_OUT = {1472,3243}
CP_MAPPOS_PRE = {1596,2977}
CP_MAPTAB = {
				{396, 397, "少林"},
				{398, 399, "天王"},
				{400, 401, "唐门"},
			 	{402, 403, "五毒"},
			 	{404, 405, "峨眉"},
			 	{406, 407, "翠烟"},
			 	{408, 409, "丐帮"},
			 	{410, 411, "天忍"},
			 	{412, 413, "武当"},
			 	{414, 415, "昆仑"}
			 }
			 
CP_AWARD_ITEM = {
					{"紫水晶", {4, 239}, 10},
					{"蓝水晶", {4, 238}, 10},
					{"绿水晶", {4, 240}, 10},
					{"猩红宝石", {4, 353}, 10},
					{"4级玄晶矿石", {6, 1, 147, 4, 0, 0}, 5},
					{"5级玄晶矿石", {6, 1, 147, 5, 0, 0}, 100},
					{"6级玄晶矿石", {6, 1, 147, 6, 0, 0}, 300},
					{"大福缘露", {6, 1, 124, 1, 0, 0}, 100},
					{"中福缘露", {6, 1, 123, 1, 0, 0}, 200},
					{"小福缘露", {6, 1, 122, 1, 0, 0}, 400},
					{"仙草露", {6, 1, 71, 1, 0, 0}, 1000},
					{"天山宝露", {6, 1, 72, 1, 0, 0}, 1125},
					{"大白驹丸", {6, 1, 130, 1, 0, 0}, 200},
					{"玫瑰花", {6, 0, 20, 1, 0, 0}, 1700},
					{"心心相印符", {6, 1, 18, 1, 0, 0}, 1700},
					{"风陵渡令牌", {4, 489}, 300},
					{"爆竹", {6, 0, 11, 1, 0, 0}, 1700},
				}

CP_FORBID_ITEM = {
					{	"攻速丸", {6, 1, 218, 1, 0, 0}, 511	},
					{	"跑速丸", {6, 1, 219, 1, 0, 0}, 512	},
					{	"普防丸", {6, 1, 220, 1, 0, 0}, 513	},
					{	"毒防丸", {6, 1, 221, 1, 0, 0}, 514	},
					{	"冰防丸", {6, 1, 222, 1, 0, 0}, 515	},
					{	"火防丸", {6, 1, 223, 1, 0, 0}, 516	},
					{	"雷防丸", {6, 1, 224, 1, 0, 0}, 517	},
					{	"减伤丸", {6, 1, 225, 1, 0, 0}, 518	},
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
					{	"嫣红丹", {6, 1, 115, 1, 0, 0}, 450	},
					{	"赦蓝丹", {6, 1, 116, 1, 0, 0}, 451	},
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
					{	"雷防丸", {6, 0, 10, 1, 0, 0}, 265	},
					{	"栗子粽子", {6, 0, 60, 1, 0, 0}, 401	},
					{	"火腿月饼", {6, 0, 61, 1, 0, 0}, 402	},
					{	"干巴月饼", {6, 0, 62, 1, 0, 0}, 403	},
					{	"百果露", {6, 1, 73, 1, 0, 0}, 442	},
					{	"吉祥红包", {6, 1, 19, 1, 0, 0}, 442	},
					{"黄金宝箱",	{6,	1,	69,	1,	0,	0},	442}
				}

CP_TRAPIN = "\\settings\\maps\\championship\\linantoplace_trap.txt"
CP_TRAPOUT = ""
CP_MATCH_POS = "\\settings\\maps\\championship\\champion_gmpos.txt"
CP_TRAPIN_FILE = "\\script\\missions\\championship\\trap\\trap_linantoplace.lua"
CP_TRAPOUT_FILE = "\\script\\missions\\championship\\trap\\trap_placetolinan.lua"
CP_BEGIN_BID_DATE = 5051200
CP_END_BID_DATE = 5051412
CP_UPTO_TRYOUT = 5051620
CP_END_TRYOUT = 5052224

CP_HELP_TRYOUT = {
					"<color=yellow>武林大会预选赛武林新秀<color>, 选出 <color=yellow>前5<color> 在每个区域中参加‘全服武林大会’的十大门派预选选手. 预选赛从16/5到22/5. 每天20:00到24:00开服; 报名时间5分钟; 比赛时间10分钟.",
					"预选赛开始之后，90级以下的玩家可以在武林大会斗场中报名。参加比赛的新玩家要交10万两报名费。每个玩家报名之后最多可以参加比赛"..CP_MAXROUND.." 场. 如果你对人物的成绩不满意，可以取消此人物的比赛资格,但是被取消比赛资格的人物不能再继续报名比赛.",
					"预选赛根据系统中的积分选出前5名.玩家比赛时"..CP_MAXROUND.."赛场上，胜一场得3分，和1场得1分，负1场不得分。到5月23日, 系统将会选出各门派积分最高的5个玩家参加‘全区武林大会’'",
					"参加过程中每个参加报名的玩家都可以领取一定的奖励。每参加一局将得到一定的奖励，除此之外，玩家还可以得到如下物品：爆竹，玄晶矿石，福缘露，水晶) "
				}
				
CP_HELP_BID = {
				"<color=yellow>争此区域队伍的总领队<color>, 一定是要帮主才可以到我这里参加全服领队的争夺. 竞拍价每次最少是100万两，每次以100万两为单位增加。竞拍时间是从2005年5月12日12点开始到5月14日结束.",
				"帮助参加竞拍看出价最高的人（不公布具体价格） 和知道自己的出价。到5月14日12点，出价最高的帮主成为此区域的总领队，同时得到总领队的名号可以判决比赛.竞争失败要到我这里再领竞价费.每次最多领50万两，保证玩家钱一直足够",
				"总领队可以分发29块武林决斗令牌给其他在武林新秀联赛官员处的玩家.已在终结区内有资格的玩家就不能再领资格了。"
				}

CP_HELP_FINAL = "<color=yellow>武林大会<color>, 由各个区域的90个人组成1队参加全区域武林大会。其中，10个人是区域里的十大高手；50人是十大门派的前5大高手总领队;其余30人中将选出1人做总领队。总领队有资格决定在剩下的29人中谁有资格参加最终的比赛。"

function transtoplace()
Say("武林新秀联赛大会预选赛圆满结束。现在可以到武林新秀联赛官员处看比赛结果并领取相应的称号。敬请期待武林大会的开始.", 0)
do return end
	if (GetLevel() < 90) then
		Say("你要到90级以上才可以进入武林大会赛场，请继续练级!", 0)
		return
	end
	if (GetLastFactionNumber() == -1) then
		Say("武林盟主有令: 只有10大门派的人才可以参加武林大会，无门派人士不能参加。加入10大门派之后才可以参加比赛!", 0)
		return
	elseif(nt_gettask(CP_TASKID_REGIST) ~= CP_UPTO_TRYOUT) then
		Msg2Player("你还没有报名！到武林新秀联赛官员处报名参加比赛!")
		NewWorld(176, 1444, 3256)
	else
		if(GetLastFactionNumber() == 0) then
			NewWorld(CP_MAPTAB[1][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--少林
		elseif (GetLastFactionNumber() == 1) then
			NewWorld(CP_MAPTAB[2][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--天王
		elseif (GetLastFactionNumber() == 2) then
			NewWorld(CP_MAPTAB[3][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--唐门
		elseif (GetLastFactionNumber() == 3) then
			NewWorld(CP_MAPTAB[4][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--五毒
		elseif (GetLastFactionNumber() == 4) then
			NewWorld(CP_MAPTAB[5][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--峨嵋
		elseif (GetLastFactionNumber() == 5) then
			NewWorld(CP_MAPTAB[6][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--翠烟
		elseif (GetLastFactionNumber() == 6) then
			NewWorld(CP_MAPTAB[7][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--丐帮
		elseif (GetLastFactionNumber() == 7) then
			NewWorld(CP_MAPTAB[8][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--天忍
		elseif (GetLastFactionNumber() == 8) then
			NewWorld(CP_MAPTAB[9][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--武当
		elseif (GetLastFactionNumber() == 9) then
			NewWorld(CP_MAPTAB[10][1], CP_MAPPOS_IN[1], CP_MAPPOS_IN[2])--昆仑
		end
		Talk(1, "", "你已进入武林大会赛场，请到观战场 (189, 188) , (191, 190) , (185, 187) 请参加这局比赛!")
	end
end

function checkmap(flag)
	local mapid = SubWorldIdx2ID(SubWorld)
	local ladder = 0
	if (mapid == 397 or mapid == 396) then
		mapname = "少林"
		ladder = 10120
	elseif (mapid == 399 or mapid == 398) then
		mapname = "天王"
		ladder = 10121
	elseif (mapid == 401 or mapid == 400) then
		mapname = "唐门"
		ladder = 10122
	elseif (mapid == 403 or mapid == 402) then
		mapname = "五毒"
		ladder = 10123
	elseif (mapid == 405 or mapid == 404) then
		mapname = "峨眉"
		ladder = 10124
	elseif (mapid == 407 or mapid == 406) then
		mapname = "翠烟"
		ladder = 10125
	elseif (mapid == 409 or mapid == 408) then
		mapname = "丐帮"
		ladder = 10126
	elseif (mapid == 411 or mapid == 410) then
		mapname = "天忍"
		ladder = 10127
	elseif (mapid == 413 or mapid == 412) then
		mapname = "武当"
		ladder = 10128
	elseif (mapid == 415 or mapid == 414) then
		mapname = "昆仑"
		ladder = 10129
	end
	if (flag == 1) then
		return mapname
	elseif(flag == 2) then
		return ladder
	end
end

function help_bid()
	Talk(1, "help_bid_2", CP_HELP_BID[1])
end

function help_bid_2()
	Talk(2, "", CP_HELP_BID[2], CP_HELP_BID[3])
end
function help_tryout()
	Talk(2, "help_tryout_2", CP_HELP_TRYOUT[1], CP_HELP_TRYOUT[2])
end;

function help_tryout_2()
	Talk(2, "", CP_HELP_TRYOUT[3], CP_HELP_TRYOUT[4])
end

function help_final()
	Talk(1, "", CP_HELP_FINAL)
end

function help_championship()
	Say("你想加入帮助哪边?", 4, "竞争区域总领队/help_bid", "武林新秀联赛大会预选赛/help_tryout", "武林大会/help_final", "我知道了!/OnCancel")
end

function validateDate(startt,endt)
	local now = tonumber(date("%y%m%d%H"))
	if(now >= startt and now < endt) then
		return 1
	end
	return nil
end

function AddAword(level, fac, result)
	local awardpro = {}
	if (level >120) then
		level = 120
	end
	aword = (700 + floor((level * 4 - 350) / 5) * 100) * 60 * fac
	AddOwnExp(aword)
	if( result == 0 )then
		return
	end
	for i = 1, getn(CP_AWARD_ITEM) do
		awardpro[i] = CP_AWARD_ITEM[i][3]
	end
	numth = randByProbability(awardpro)
	if (getn(CP_AWARD_ITEM[numth][2]) == 6 ) then
		AddItem(CP_AWARD_ITEM[numth][2][1], CP_AWARD_ITEM[numth][2][2], CP_AWARD_ITEM[numth][2][3], CP_AWARD_ITEM[numth][2][4], CP_AWARD_ITEM[numth][2][5], CP_AWARD_ITEM[numth][2][6])
	else
		AddEventItem(CP_AWARD_ITEM[numth][2][2])
	end
	Msg2Player("你得到1个"..CP_AWARD_ITEM[numth][1])
end

function randByProbability(aryProbability)
	local nRandNum;
	local nSum = 0;
	local nArgCount = getn( aryProbability );
	for i = 1, nArgCount do
		nSum = nSum + aryProbability[i];
	end
	nRandNum = mod( random( nSum ) + random( 1009 ), nSum ) + 1;
	for i = nArgCount, 1, -1 do
		nSum = nSum - aryProbability[i];
		if( nRandNum > nSum ) then
			return i;
		end
	end
end

-- 设置任务状态
function nt_settask(nTaskID, nTaskValue)
	SetTask(nTaskID, nTaskValue)
	SyncTaskValue(nTaskID) -- 同步到客户端
end

-- 获取任务状态
function nt_gettask(nTaskID)
	return GetTask(nTaskID)
end


------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end

function GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile) - 1
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row + 1, col))
	end
end
------------------------------------------------------------------------------------
-- 打开一个文件
function biwu_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
	end
end

--获得文件中的szSection的key的值
function biwu_getdata(filename, szsect, szkey)
	return IniFile_GetData(filename, szsect, szkey)
end

--设置文件中的szSection的key值为szValue
function biwu_setdata(filename, szsect, szkey, szvalue)
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function biwu_save(filename)
	IniFile_Save(filename, filename)
end

------------------------------------------------------------------------------------
function Sort_Point(array)
	local orgindex = PlayerIndex
	local point_1 = 0
	local point_2 = 0
	local wincount_1 = 0
	local wincount_2 = 0
	local winrate_1 = 0
	local winrate_2 = 0
	for i = 1, getn(array) do
		for j = getn(array), 2, -1 do
			PlayerIndex = array[j]
			point_1 = nt_gettask(CP_TASKID_ROUND)
			wincount_1 = nt_gettask(CP_TASKID_WIN)
			if (point_1 == 0 or wincount_1 == 0) then
				winrate_1 = 0
			else
				winrate_1 = wincount_1/point_1
			end
			
			PlayerIndex = array[j - 1]
			point_2 = nt_gettask(CP_TASKID_ROUND)
			wincount_2 = nt_gettask(CP_TASKID_WIN)
			if (point_2 == 0 or wincount_2 == 0) then
				winrate_2 = 0
			else
				winrate_2 = wincount_2/point_2
			end
			
			if (winrate_1 > winrate_2) then
				a = array[j]
				array[j] = array[j - 1]
				array[j - 1] = a
			end
		end
	end
	PlayerIndex = orgindex
	return array
end

function OnCancel()
end
