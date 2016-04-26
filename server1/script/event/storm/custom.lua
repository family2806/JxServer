--====活动自定义部分,一般以GameID作为Table下标====--

STORM_GAMEID_MAX	= 4	--可能存在的GameID最大值

TB_STORM_POINT = {}	--积分表

TB_STORM_POINT[1] = {	--宋金积分表
	{	--固定夺旗模式
		{60, 16000},
		{50, 10000},
		{40, 5500},
		{30, 4000},
		{20, 2000},
		{10, 500},
		{0, 0}
	}, {--随机夺旗模式
		{60, 15000},
		{50, 10000},
		{40, 4500},
		{30, 3000},
		{20, 1500},
		{10, 300},
		{0, 0}
	}, {--元帅模式
		{60, 14500},
		{50, 10000},
		{40, 4500},
		{30, 2000},
		{20, 500},
		{10, 200},
		{0, 0}
	}, {--杀戮模式
		{60, 14000},
		{50, 9000},
		{40, 4000},
		{30, 1500},
		{20, 300},
		{10, 50},
		{0, 0}
	}
}

TB_STORM_POINT[2] = {	--杀手试炼积分表
	{60, 1350},
	{59, 1200},
	{50, 950},
	{40, 700},
	{30, 400},
	{20, 200},
	{10, 0},
}

TB_STORM_POINT[3] = {	--信使任务积分表
	{60, 500},
	{50, 400},
	{40, 300},
	{30, 200},
	{20, 100},
	{10, 30},
	{0, 0}
}

TB_STORM_POINT[4] = {	--野叟任务链积分表
	{60, 30000000},
	{55, 18000000},
	{50, 12000000},
	{40, 6000000},
	{30, 3000000},
	{20, 500000},
	{10, 300000},
	{0, 0}
}

--各种活动的文字描述
TB_STORM_DESCRIBE = {"宋金战场", "杀手", "信使任务", "野叟任务链"}

--各种活动当日可以进行的次数
TB_STORM_TRYTIMES = {1, 2, 1, 1}

--开始挑战后的对话
TB_STORM_DIALOG = {
	"  挑战之后, 你此次得到的宋金积分可以兑换成风暴积分.你现在的宋金积分是 <color=yellow>%d<color>",
	"不追问杀手任务",
	"信使任务还未开始",
	"  挑战之后, 系统将会根据1个小时内完成任务的数量和困难度兑换成今天的风暴积分."
}

--帮助Npc的文字
TB_STORM_HELP = {
	"  宋金战场开始的第10, 20, 30分钟, 通过各阶段的风暴挑战你将会得到<color=red> 参加领奖<color>___风暴积分, 总共 <color=yellow>40<color> 分. 得到<color=red>宋金积分<color>也可以兑换宋金积分(最高<color=yellow>60<color>点) .%s<enter>",
	"  参加杀手任务可以得到<color=red>参与奖励<color>___风暴积分<color=yellow>40<color> 点. 成功冲碍<color=red>时间前<color>, 可以兑换风暴积分(最高 <color=yellow>60<color> 点) . 每天两阵杀手，布阵<color=red>最好成绩<color> 记入风暴积分. 高级杀手每天每人最高只能领取<color=yellow>100<color> 风暴积分, 初级杀手最高领取<color=yellow>90<color> 点.",
	"信使任务",
	"  风暴挑战开始立即领取<color=red>参与奖励<color>___风暴积分<color=yellow>40<color> 点. 同时根据你在<color=red>1小时<color> (在线时间, 离线时间依旧加经验) , 完成任务<color=red>数量和难度<color>, 可以得到相应的风暴积分(最高 <color=yellow>60<color> 点) . 在野叟任务链中，每人每天最高得到风暴积分是<color=yellow>100<color>点.<enter>"
}

--====Task Value====--
STORM_TASKID_BASE	= 1661-1	--TaskID起始值
--各个活动的可用Task变量空间，暂定每个活动需要7个Task变量
TB_STORM_TASKID = {
	{STORM_TASKID_BASE + 21, STORM_TASKID_BASE + 22, STORM_TASKID_BASE + 23, STORM_TASKID_BASE + 24, STORM_TASKID_BASE + 25, STORM_TASKID_BASE + 26, STORM_TASKID_BASE + 45},
	{STORM_TASKID_BASE + 27, STORM_TASKID_BASE + 28, STORM_TASKID_BASE + 29, STORM_TASKID_BASE + 30, STORM_TASKID_BASE + 31, STORM_TASKID_BASE + 32, STORM_TASKID_BASE + 46},
	nil,	--信使任务暂停	{STORM_TASKID_BASE + 33, STORM_TASKID_BASE + 34, STORM_TASKID_BASE + 35, STORM_TASKID_BASE + 36, STORM_TASKID_BASE + 37, STORM_TASKID_BASE + 38},
	{STORM_TASKID_BASE + 39, STORM_TASKID_BASE + 40, STORM_TASKID_BASE + 41, STORM_TASKID_BASE + 42, STORM_TASKID_BASE + 43, STORM_TASKID_BASE + 44, STORM_TASKID_BASE + 47}
}

--====时间/场次判断函数====--
--根据不同gameid，返回相应的nowtime
function storm_gettime(gameid)
	if (gameid == 1) then
		return BT_GetGameData(GAME_KEY)
	elseif (gameid == 2) then
		return GetTask(STORM_TASKID_GAMEID_SS)
	elseif (gameid == 3) then
		return GetGameTime()
	elseif (gameid == 4) then
		return 1
	else
		print("error gameid!")
		return nil
	end
end

--比较 nowtime 与 starttime ，判断是否还在游戏时间内
--返回1表示还可以记录积分，返回nil表示已经超时
function storm_gametime(gameid, starttime, nowtime)
	if (gameid == 1) then
		return starttime == nowtime	--同一场宋金大战
	elseif (gameid == 2) then
		return starttime == nowtime	--同一场杀手试炼
	elseif (gameid == 3) then
		return nowtime > starttime - 3600	--倒计时没有超过1小时
	elseif (gameid == 4) then
		--return nowtime < starttime + 3600	--系统时间没有超过1小时
		return TM_GetRestCount(STORM_TIMERID_YS) ~= nil	--计时器还存在
	else
		print("error gameid!")
		return nil
	end
end

--====奖励部分====--
--奖品格式：{{奖品类型，具体物品，数量}，{奖品类型，具体物品，数量}，......}
--	奖品类型：	1、AddItem；2、AddGoldItem；3、非物品；4、随机物品
--	具体物品：	因奖品类型的不同而有不同意义和格式
--		AddItem：		含6个参数的数组，表示AddItem(x1,x2,x3,x4,x5,x6)的6个参数
--		AddGoldItem：	含2个参数的数组，表示AddGoldItem(x1,x2)的2个参数
--		非物品：		1、AddOwnExp
--		随机物品：		格式同奖品格式，几率平均
--	数量：	如果是AddOwnExp，则表示是经验值

--日风暴积分奖励
TB_STORM_AWARD_DAY = {
	--需要积分	奖励名称	奖品
	{300,	"1 颗10级玄晶 + 3000w 经验",	{{1,{6,1,147,10,0,0},1},{3,1,30000000}}},
	{270,	"1 神秘矿石 + 1200w 经验",	{{1,{6,1,398,0,0,0},1},	{3,1,12000000}}},
	{240,	"1 颗6级玄晶 + 800w 经验",		{{1,{6,1,147,6,0,0},1},	{3,1,8000000}}},
	{210,	"1个神秘红包 + 500w 经验",	{{1,{6,1,402,0,0,0},1},	{3,1,5000000}}},
	{180,	"1 颗5级玄晶 + 300w 经验",		{{1,{6,1,147,5,0,0},1},	{3,1,3000000}}},
	{150,	"3 仙草露 + 150 经验",		{{1,{6,1,71,0,0,0},3},	{3,1,1500000}}},
	{120,	"2 仙草露 + 100w 经验",		{{1,{6,1,71,0,0,0},2},	{3,1,1000000}}},
	{80,	"1 仙草露 + 50w 经验 ",		{{1,{6,1,71,0,0,0},1},	{3,1,500000}}}
}

--临时数组：一套安邦
tmp_ab = {
	{2,{0,164},1},
	{2,{0,165},1},
	{2,{0,166},1},
	{2,{0,167},1}
}
--周风暴排名奖励
TB_STORM_AWARD_WEEK = {
	--需要排名（负数）	奖励名称	奖品
	{-1,	"一套安邦", 	tmp_ab},
	{-10,	"得到一套安邦", {{4,tmp_ab,1}}}
}

--临时数组：技能+1大黄金
tmp_jydhj = {
	{2,{0,4},1},	{2,{0,9},1},	{2,{0,15},1},	{2,{0,19},1},	{2,{0,24},1},
	{2,{0,30},1},	{2,{0,35},1},	{2,{0,38},1},	{2,{0,43},1},	{2,{0,50},1},
	{2,{0,55},1},	{2,{0,59},1},	{2,{0,63},1},	{2,{0,68},1},	{2,{0,74},1},
	{2,{0,80},1},	{2,{0,84},1},	{2,{0,88},1},	{2,{0,95},1},	{2,{0,100},1},
	{2,{0,105},1},	{2,{0,109},1},	{2,{0,113},1},	{2,{0,120},1},	{2,{0,125},1},
	{2,{0,130},1},	{2,{0,135},1},	{2,{0,138},1}
}
--临时数组：大黄金
tmp_dhj = {
	{2,{0,2},1},	{2,{0,6},1},	{2,{0,11},1},	{2,{0,16},1},	{2,{0,21},1},
	{2,{0,26},1},	{2,{0,31},1},	{2,{0,39},1},	{2,{0,42},1},	{2,{0,46},1},
	{2,{0,51},1},	{2,{0,60},1},	{2,{0,61},1},	{2,{0,67},1},	{2,{0,71},1},
	{2,{0,76},1},	{2,{0,81},1},	{2,{0,87},1},	{2,{0,92},1},	{2,{0,96},1},
	{2,{0,101},1},	{2,{0,106},1},	{2,{0,115},1},	{2,{0,119},1},	{2,{0,121},1},
	{2,{0,126},1},	{2,{0,132},1},	{2,{0,136},1}
}
--月风暴排名奖励
TB_STORM_AWARD_MONTH = {
	--需要排名（负数）	奖励名称	奖品
	{-1,	"得到一对大马虎",		{{2,{0,197},1},	{2,{0,202},1}}},
	{-1,	"随机技能 + 1 黄金",	{{4,tmp_jydhj,1}}},
	{-10,	"随机一个黄金",		{{4,tmp_dhj,1}}}
}

--奖励总表
TB_STORM_AWARD = {
	--1文字描述	2奖励方式	3是否领取过的TaskID		4积分TaskID/排名LadderID	5奖励表
	{"H玬 nay",	0,		STORM_TASKID_DAY_AWARD,		STORM_TASKID_DAY_POINT,		TB_STORM_AWARD_DAY},
	{"Tu莕 trc",	1,		STORM_TASKID_WEEK_AWARD,	2,							TB_STORM_AWARD_WEEK},
	{"Th竛g trc",	1,		STORM_TASKID_MONTH_AWARD,	3,							TB_STORM_AWARD_MONTH},
	{"h玬 qua",	0,		STORM_TASKID_DAY_LASTAWARD,	STORM_TASKID_DAY_LASTPOINT,	TB_STORM_AWARD_DAY}
	--奖励方式：	0、按积分；1、按排名
	--排名LadderID：暂时用2、3分别代表上周、上个月排名
}

