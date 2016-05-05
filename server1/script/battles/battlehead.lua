		IncludeLib("FILESYS");
		IncludeLib("TITLE");
		IncludeLib("SETTING");
Include("\\script\\event\\storm\\function.lua")	--Storm
Include("\\script\\event\\great_night\\huangzhizhang\\event.lua")	--HUANGZHIZHANG
Include("\\script\\missions\\boss\\bigboss.lua")	-- big boss
Include("\\script\\battles\\lang.lua")
Include("\\script\\lib\\common.lua");
Include("\\script\\battles\\battle_rank_award.lua")



Include("\\script\\bonusvlmc\\head.lua");
Include("\\script\\misc\\vngpromotion\\ipbonus\\ipbonus_2_head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\qianqiu_yinglie\\head.lua");

Include("\\script\\battles\\doubleexp.lua")
BATTLES_JOINFEE = 10000
FRAME2TIME = 18;	--18帧游戏时间相当于1秒钟
BAOMING_TIME = 10		-- 10分钟报名时间	
FIGHTING_TIME = 60		-- 60分钟比赛时间
ANNOUNCE_TIME = 20		-- 20秒公布一下战况

TIMER_1 = ANNOUNCE_TIME * FRAME2TIME; --20秒公布一下战况
TIMER_2 = (FIGHTING_TIME + BAOMING_TIME) * 60  * FRAME2TIME; -- 交战时间为1小时
RUNGAME_TIME = BAOMING_TIME * 60 * FRAME2TIME / TIMER_1; --报名10分钟之后，自动进入战斗阶段
GO_TIME =  BAOMING_TIME * 60 * FRAME2TIME  / TIMER_1; -- 报名时间为10分钟

SONGJIN_SIGNUP_FEES = 200000  -- 报名费

JUNGONGPAI = 1773 --宋金军功牌ID 6，1，1477
EXPIRED_TIME = 24*60  --宋金军功牌过期
JUNGONGPAI_Task_ID = 1830 -- --宋金军功牌任务变量

TIME_GAME_LIMIT = 5 * 60	--玩家能够在后营停留的时间，超过时间将退出战场回到报名点

----------------------------------------------------------以下by 廖志山
TIME_EXHIBIT_BOSS = 18 * 60 * (20 + BAOMING_TIME) / (20 * 18)--比赛20分钟,即开始报名后50分钟
-------------------------------------------------
--BOSSINFO = {BOSSID, BOSSNAME, LEVEL, SERIES}
-----------------------------------------------
BOSSINFO = {
	[1] = {511, "张宗正", 95, 4},
	[2] = {513, "妙如", 95, 2},
	[3] = {523, "柳青青", 95, 1}
}
----------------------------------------------------
--BOSSEXHIBITPOSITION = {MAPID, POSX, POSY, MAPNAME}
----------------------------------------------------
BOSSEXHIBITPOSITION = {
	{	386	,	1411	,	2691	,	"界桥战场（高）"	}	,
	{	355	,	1391	,	2745	,	"营寨战场（高）"	}	,
	{	352	,	1413	,	2921	,	"森林战场（高）"	}	,
	{	380	,	1439	,	3335	,	"冲锋战场（高）"	}	,
	{	328	,	1348	,	2853	,	"平原战场（高）"	}	,
	{	331	,	1385	,	2796	,	"河滨战场（高）"	}	,
	{	346	,	1914	,	3512	,	"城镇战场（高）"	}	,
	{	349	,	1367	,	2827	,	"山谷战场（高）"	}	,
	{	383	,	1855	,	2872	,	"密林战场（高）"	}	
}
function ExhibitBoss()
	local ExhibitArray_Index = 0;
	local PosArray_Count = getn(BOSSEXHIBITPOSITION);
	for i = 1, PosArray_Count do
		if (BOSSEXHIBITPOSITION[i][1] == SubWorldIdx2ID(SubWorld)) then
			ExhibitArray_Index = i;
			break;
		end
	end;
	if (0 == ExhibitArray_Index) then	-- 如果不是高级地图则进行BOSS显示
		return	
	end;
	local BossID_Index = random(1, 3);
	npcindex = AddNpcEx(BOSSINFO[BossID_Index][1], BOSSINFO[BossID_Index][3], BOSSINFO[BossID_Index][4],
			 SubWorld, BOSSEXHIBITPOSITION[ExhibitArray_Index][2] * 32, 
			 BOSSEXHIBITPOSITION[ExhibitArray_Index][3] * 32, 1, BOSSINFO[BossID_Index][2], 1);
	SetNpcDeathScript(npcindex, "\\script\\battles\\bossdeath.lua");
	
	WriteLog(BOSSINFO[BossID_Index][1]..",".. BOSSINFO[BossID_Index][3]..",".. BOSSINFO[BossID_Index][4]..",".. SubWorldIdx2ID(SubWorld)..",".. BOSSEXHIBITPOSITION[ExhibitArray_Index][2] ..","..	 BOSSEXHIBITPOSITION[ExhibitArray_Index][3]..",".. BOSSINFO[BossID_Index][2]);
			 
	local NewsStr = "据前线探子报告 "..BOSSINFO[BossID_Index][2].." 在高级宋金战场出现!";
	AddGlobalNews(NewsStr);	
end
----------------------------------------------------------以上by 廖志山

		PL_TOTALPOINT = 1
		PL_KILLPLAYER = 2
		PL_KILLNPC = 3
		PL_BEKILLED = 4
		PL_SNAPFLAG = 5
		PL_KILLRANK1 = 6
		PL_KILLRANK2 = 7
		PL_KILLRANK3 = 8
		PL_KILLRANK4 = 9
		PL_KILLRANK5 = 10
		PL_KILLRANK6 = 11
		PL_KILLRANK7 = 12
		PL_MAXSERIESKILL = 13		--玩家整个战局的最大连斩数
		PL_SERIESKILL = 14			--玩家当前的连斩数
		PL_FINISHGOAL = 15
		PL_1VS1 = 16
		PL_GETITEM = 17
		PL_WINSIDE = 18
		PL_PRISEGRADE = 19	
		PL_AVERAGEGRADE = 20
		PL_WINGRADE = 21	
		PL_PARAM1 = 22	-- 用于记录夺旗的坐标X
		PL_PARAM2 = 23	-- 用于记录夺旗的坐标Y
		PL_PARAM3 = 24	-- 用于记录送粮
		PL_PARAM4 = 25
		PL_PARAM5 = 26
		PL_CURRANK = 27	-- =PL_PARAM6 = 27 表示玩家当前的官职，目前使用第6号参数
		
		PL_BATTLEID=41
		PL_RULEID=42
		PL_BATTLECAMP = 43
		PL_BATTLESERIES = 44 --记录玩家上一次参加战役的战役流水号
		PL_KEYNUMBER = 45
		PL_LASTDEATHTIME = 46
		PL_BATTLEPOINT = 47	--记录玩家本战役的总积分，总积分是玩家所参加的各场战局的积分总和, E(PL_TOTALPOINT1 + PL_TOTALPOINT2+ ...)
		PL_ROUND = 48
		
		GAME_KEY = 1
		GAME_BATTLEID = 2
		GAME_RULEID = 3
		GAME_MAPID = 4	
		GAME_CAMP1 = 5	-- 宋方夺旗数量（送粮数量）
		GAME_CAMP2 = 6	-- 金方夺旗数量（送粮数量）
		GAME_MAPICONID = 7
		GAME_RESTTIME = 8
		GAME_LEVEL = 9 
		GAME_MODE = 10
		GAME_CAMP1AREA= 11
		GAME_CAMP2AREA= 12
		GAME_BATTLESERIES = 13
		GAME_ROUND = 14
		
		tbRANKNAME={"<color=white>士兵<color>", "<color=0xa0ff>校尉<color>", "<color=0xff>统领<color>", "<color=yellow>副将<color>", "<color=yellow><bclr=red>大将<bclr><color>" , "<color=black>元帅<color>"}

		MS_STATE = 1
		
		MS_TRANK1_S = 30; --宋1级Npc的模板ID的MissionV ID
		MS_TRANK1_J = MS_TRANK1_S + 6; --金方1级Npc的模板ID的MissionV ID	36
		MS_RANK1LVL_S = MS_TRANK1_J + 6;--宋方1级Npc的等级 MissionV ID		42
		MS_RANK1LVL_J = MS_RANK1LVL_S + 6;--金方1级Npc的等级 MissionV ID	48
		MS_NPCCOUNT1_S = MS_RANK1LVL_J + 6;							--		54
		MS_NPCCOUNT1_J = MS_NPCCOUNT1_S + 6;						--		60
		MS_CALLNPCCOUNT_S = MS_NPCCOUNT1_J + 6 --记录宋方召唤Npc的次数	--	66
		MS_CALLNPCCOUNT_J = MS_CALLNPCCOUNT_S + 1 --记录金方召唤Npc的次数	67
		
		MS_PL2RANK1_S = 70		--当前mission，宋方中已经成为"士兵"头衔的人数
		MS_PL2RANK2_S = 71
		MS_PL2RANK3_S = 72
		MS_PL2RANK4_S = 73
		MS_PL2RANK5_S = 74
		MS_PL2RANK6_S = 75
	
		MS_PL2RANK1_J = 76		--当前mission，金方中已经成为"士兵"头衔的人数
		MS_PL2RANK2_J = 77		--校尉
		MS_PL2RANK3_J = 78		--统领
		MS_PL2RANK4_J = 79		--副将
		MS_PL2RANK5_J = 80		--大将
		MS_PL2RANK6_J = 81		--元帅
	
		MS_HUANGZHIZHANG = 90	--煌之章活动奖励倍数
		MS_WUXINGZHUCNT_S = 91 --记录宋方召唤五行柱的数量	68
		MS_WUXINGZHUCNT_J = 92 --记录金方召唤五行柱的数量	69
	
		MAX_CALLNPCCOUNT = 10;	
		MAX_CALLWUXINGZHU	= 4;
		GLB_BATTLESTATE = 30
		GLB_FORBIDBATTLE = 31;--当该值1时表示停止战役的启动
	--三个等级报名点的坐标
	S_SIGNUPTAB = {};
	
	TV_LASTDEATHTIME = 2306	
	TV_LASTDEATHMAPX = 2307
	TV_LASTDEATHMAPY = 2308
	
	function bt_CheckDeathValid()
		local nowW, nowMapX , nowMapY = GetWorldPos();
		if (nowMapX == GetTask(TV_LASTDEATHMAPX) and nowMapY == GetTask(TV_LASTDEATHMAPY)) then
			return 0
		else
			SetTask(TV_LASTDEATHMAPX, nowMapX) 
			SetTask(TV_LASTDEATHMAPY, nowMapY)
			return 1
		end
		
--		local nowTime = GetCurServerTime()
	--	if (nowTime < GetTask(TV_LASTDEATHTIME)) then
		--	SetTask(TV_LASTDEATHTIME, nowTime)
			--return 1
		--end
		
		--if (nowtime - GetTask(TV_LASTDEATHTIME) < MAX_CHECKDEATHTIME) then
			--return 0
		--else
--			SetTask(TV_LASTDEATHTIME, nowTime)
	--	end
	end
	
	function bt_CheckLifeMax()
		if (GetLife(0) < GetLife(1)) then
			Msg2Player("请将您的血量值补满，再前往大营！");
			return 0
		end
		return 1
	end
	
	BONUS_KILLPLAYER = 75
	BONUS_SNAPFLAG = 600
	BONUS_KILLNPC = 1
	BONUS_KILLRANK1 = 5
	BONUS_KILLRANK2 = 30
	BONUS_KILLRANK3 = 150
	BONUS_KILLRANK4 = 250
	BONUS_KILLRANK5 = 500
	BONUS_KILLRANK6 = 1000
	BONUS_KILLRANK7 = 500
	BONUS_MAXSERIESKILL = 150
	BONUS_GETITEM = 25
	BONUS_1VS1 = 400
	
	RA_KILL_PL_RANK = {10, 2.334, 0.934, 0.84, 0.56, 0.35}	
 	--7 玩家士兵	--7/3 玩家校尉	--14/15 玩家统领	--21/25 玩家副将	--14/25 玩家大将	--7/20 玩家元帅
 	
 	RANK_PKBONUS = {
 	{1,		6/5,	7/5,	8/5,	2	}, 
	{4/5,	1,		6/5,	7/5,	8/5	},
	{3/5,	4/5,	1,		6/5,	7/5	},
	{2/5,	3/5,	4/5,	1,		6/5	},
	{1/5,	2/5,	3/5,	4/5,	1	},
	};
	
	TAB_SERIESKILL =    --记录不同rank的玩家，在PK时，是否记录实际连斩的表，1表示记录，0表示不记录
	{
		{1,1,1,1,1},
		{1,1,1,1,1},
		{1,1,1,1,1},
		{0,1,1,1,1},
		{0,0,1,1,1},
	};
	
	BALANCE_MAMCOUNT = 5;	--宋金双方人数差调整为5人
	BALANCE_GUOZHAN_MAXCOUNT = 100; -- 国战宋金最多允许的单边人数
	TAB_RANKBONUS = {0, 1000, 3000, 6000,10000};
	RANK_SKILL = 661;
	TAB_RANKMSG = {
	"你被授命为当前战局<color=white>士兵<color>！",
	"你被授命为当前战局<color=0xa0ff>校尉<color>！生命上限增加20%",
	"你被授命为当前战局<color=0xff>统领<color>！生命上限提高30%，全抗增加5%",
	"你被授命为当前战局<color=yellow>副将<color>！生命上限提高40%，全抗增加10%",
	"你被授命为当前战局<color=yellow><bclr=red>大将<bclr><color>！生命上限提高50%，全抗增加15%",
	"你被授命为当前战局<color=yellow>元帅<color=>！"}
	
	TITLE_BONUSRANK1 = 0		--成为相应头衔所需积分值
	TITLE_BONUSRANK2 = 10000
	TITLE_BONUSRANK3 = 20000
	TITLE_BONUSRANK4 = 40000
	TITLE_BONUSRANK5 = 60000
	TITLE_BONUSRANK6 = 80000
	
	TITLE_PL2RANK1_N = 400		--相应头衔的玩家最大人数
	TITLE_PL2RANK2_N = 60
	TITLE_PL2RANK3_N = 25
	TITLE_PL2RANK4_N = 10
	TITLE_PL2RANK5_N = 5
	TITLE_PL2RANK6_N = 1

	TV_SERIESKILL_REALY = 2305  --玩家当前的实际连斩值（高级杀比较低级的玩家，计连斩，但不计真实连斩）

	
	tbGAME_SIGNMAP = {323, 324, 325} --记录各等级报名点的地图ID号 ，等级按低级向高级排布
	tbSIGNMAP_POS = {{1541, 3178} , {1570, 3085}}
	szGAME_GAMELEVEL = {"初级战场", "中级战场", "高级战场"}
	
	tbBATTLEMAP = {44, 326, 327, 328, 329, 330, 331, 344, 345, 346, 347, 348, 349, 350, 351, 352, 353, 354, 355, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 868, 869, 870,876,877,878,879,880,881,883,884,885, 898, 899, 900, 902, 903, 904,970,971};--所有战役用到的地图列表
	tbNPCPOS = {"npcpos1", "npcpos2"}
	TNPC_DOCTOR1 = 55;--军医的Npc模板ID号
	TNPC_DOCTOR2 = 49;
	TNPC_SYMBOL1 = 629;
	TNPC_SYMBOL2 = 630;
	TNPC_DEPOSIT = 625;
	
	TNPC_FLAG0 = 626;
	TNPC_FLAG1 = 628;
	TNPC_FLAG2 = 627;

	TNPC_TRANSPORT1 = 55; -- 传送员的Npc模板ID号
	TNPC_TRANSPORT2 = 49;
	
	
	tbTNPC_SOLDIER = {{631,632,633,634,635,636}, {637, 638, 639, 640, 641, 642}}
	BATTLES_WINGAME_POINT	= 1200;	--勝利方積分獎勵
	BATTLES_LOSEGAME_POINT	= 600;	--失敗方積分獎勵
	BATTLES_TIEGAME_POINT	= 900;	--平局雙方積分獎勵

--根据报名地图的id，获得所属的战役等级
function bt_map2battlelevel(mapid)
	for i = 1, getn(tbGAME_SIGNMAP) do 
		if (mapid == tbGAME_SIGNMAP[i])	then
			return i
		end
	end
	return 0
end

function bt_camp_getbonus(camp, bonus,strmsg, percent)
	local OldPlayerIndex = PlayerIndex
	idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID, idx, camp);
 		if (pidx > 0) then
   			PlayerIndex = pidx;
			local n_bonus = bt_addtotalpoint(bonus)
	   		Msg2Player(strmsg..n_bonus.."<color>点的积分奖励")
			Say("你在本场战斗中获得额外的<color=yellow>"..n_bonus.."<color>点的积分奖励", 0)
		end
 		if (idx <= 0) then 
			break
		end;
	end
	PlayerIndex = OldPlayerIndex
end;

--获得某个等级报名点的坐标
function bt_getsignpos(camp)
	if (camp <= 0 or camp > 2) then
		camp = 1
	end
	
	level = GetLevel();
	
	if (level < 80)  then
		return tbGAME_SIGNMAP[1], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
	elseif (level < 120) then
		return tbGAME_SIGNMAP[2], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
	else
		return tbGAME_SIGNMAP[3], tbSIGNMAP_POS[camp][1], tbSIGNMAP_POS[camp][2]
	end
end;
		
		
--根据trapfile的文件的坐标集合表，产生所有的trap点，并关联scriptfile的脚本		
function bt_addtrap(trapfile, scriptfile)
	local count = GetTabFileHeight(trapfile);
	scriptid = FileName2Id(scriptfile);
	
	ID = SubWorldIdx2ID(SubWorld);
	
	for i = 1, count - 1 do
		x = GetTabFileData(trapfile, i + 1, 1);
		y = GetTabFileData(trapfile, i + 1, 2);
		AddMapTrap(ID, x,y, scriptfile);
	end;
end;	

--"123,234" -> 123 , 234,将一个字符串写成的坐标数据转化成两个数字变量
function bt_str2xydata(str)
	m = strfind(str,",")
	x = tonumber(strsub(str,0,m-1))
	y = tonumber(strsub(str,m+1))
	return x,y
end

--从坐标文件中随机获得一个坐标
function bt_getadata(file)
	local totalcount = GetTabFileHeight(file) - 1;
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

--根据npcfile的文件的坐标集合表，产生所有的npc模板号为tnpcid的对话npc，并关联scriptfile的脚本		
function bt_adddiagnpc(npcfile, scriptfile, tnpcid, name)
	addcount = 0;
	local count = GetTabFileHeight(npcfile);
	
	for i = 1, count - 1 do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1, name)			
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y);
		end

		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	
function bt_add_a_diagnpc(scriptfile, tnpcid, x, y, name)
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1 , name);
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y )
		end
		
		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
		return npcidx
end

--根据npcfile的文件的坐标集合表，产生所有的npc模板号为tnpcid的战斗类型npc
function bt_addfightnpc (npcfile, tnpcid, level, camp, removewhendeath, name, boss)
	addcount = 0;
	local count = GetTabFileHeight(npcfile) - 1;
	
	l_removedeath = 1;
	l_name = "";
	l_boss = 0;
	
	if (removewhendeath ~= nil) then
		l_removedeath = removewhendeath
	end;
	
	if (name ~= nil or name ~= "" ) then
		l_name = name
	end
	
	if (boss ~= nil) then
		l_boss = boss
	end
	
	for i = 1, count  do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		npcidx = AddNpc(tnpcid, level, SubWorld, x, y, l_removedeath, l_name, l_boss);
		if (npcidx > 0) then
			SetNpcCurCamp(npcidx, camp)
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add fight npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	


--根据npcfile的文件的坐标集合表， 随机的产生以npc模板号为tnpcid的战斗类型npc
function bt_addrandfightnpc(npcfile, tnpcid, level, camp,count, deathscript, removewhendeath, name, boss)
	addcount = 0;
	
	if (count <= 0) then
		return
	end
	
	local totalcount = GetTabFileHeight(npcfile) - 1;
	if (totalcount <= 0 ) then
		return
	end
	
	l_removedeath = 1;
	l_name = "";
	l_boss = 0;
	
	if (removewhendeath ~= nil) then
		l_removedeath = removewhendeath
	end;
	
	if (name ~= nil or name ~= "" ) then
		l_name = name
	end
	
	if (boss ~= nil) then
		l_boss = boss
	end

	for i = 1, count do
		id = random(totalcount)
		x = GetTabFileData(npcfile, id + 1, 1);
		y = GetTabFileData(npcfile, id + 1, 2);
		npcidx = AddNpc(tnpcid, level, SubWorld, x, y, l_removedeath, l_name, l_boss);
		if (npcidx > 0) then
			SetNpcCurCamp(npcidx, camp)
			SetNpcDeathScript(npcidx, deathscript) 
			addcount = addcount + 1
		else
			print("battle"..BT_GetGameData(GAME_BATTLEID).."error!can not add fight npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	

function delnpcsafe(nNpcIndex)
if (nNpcIndex <= 0 )  then
	return
end

PIdx = NpcIdx2PIdx(nNpcIndex);
if (PIdx > 0) then 
	WriteLog("错误！！！DelNpc想删除某个玩家");
	return
end;

DelNpc(nNpcIndex)
end;


-------------------------------------------------------------------------
--Camp表示对话的主管是哪方的，1为宋，2为金方
--如果等于1 表示已经在本场战局中报过名了，并且属于这个阵营
--如果等于2 表示已经在本场战局中报过名了，但是不属于这个阵营
--如果等于0 表示尚未报名。

function bt_checklastbattle(Camp)

local MKey = BT_GetGameData(GAME_KEY); --当前战役的唯一Key码
local BattleId = BT_GetGameData(GAME_BATTLEID); --该战役类型的ID
local RuleId = BT_GetGameData(GAME_RULEID);

if ( MKey == BT_GetData(PL_KEYNUMBER) and BattleId == BT_GetData(PL_BATTLEID) and BT_GetData(PL_ROUND) == BT_GetGameData(GAME_ROUND) ) then
	if (Camp == BT_GetData(PL_BATTLECAMP)) then
		return 1
	else
		return 2
	end
else
	return 0
end;

end
-------------------------------------------------------------------------
function bt_setnormaltask2type()
--701已经被占用，所以更换到751
BT_SetType2Task(1, 751)
for i = 2, 50 do 
	BT_SetType2Task(i, 700 + i);
end
end
--------------------------------------------------------------------------
-- 将字符串按分割符分割，返回各分割段组成的数组
-- 例1：strsplit( "abc,bcd,efg", "," ) -> { "abc", "bcd", "efg" }
-- 例2：strsplit( ",abc,,bcd,,,efg,,", ",," ) -> { ",abc", "bcd", ",efg" }
function strsplit( strText, strSeparator )
	local arySlice = {};
	local nSliceCount = 0;
	local nStartIdx, nEndIdx;
	while( 1 ) do
		nStartIdx, nEndIdx = strfind( strText, strSeparator, 1, 1 );
		if( nStartIdx == nil ) then
			break
		end
		if( nStartIdx > 1 ) then
			nSliceCount = nSliceCount + 1;
			arySlice[nSliceCount] = strsub( strText, 1, nStartIdx - 1 );
		end
		strText = strsub( strText, nEndIdx + 1 );
	end
	if( strlen( strText ) > 0 ) then
		arySlice[nSliceCount+1] = strText;
	end
	return arySlice;
end
--------------------------------------------------------------------------------
function getNpcInfo( strNpcInfo )
	local arystrInfo = strsplit( strNpcInfo, "," );
	return tonumber( arystrInfo[1] ), tonumber( arystrInfo[2] ), tonumber( arystrInfo[3] );
end
---------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------
function sf_callnpc(usedtime, totaltime) 
	if (usedtime > totaltime) then
		return
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	for i = 2, 6 do 
		if (GetMissionV(MS_NPCCOUNT1_S + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_S + i - 1))
			nowadd = npccount - prenpccount;
			if (nowadd > 0) then
				print("call song npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S + i - 1), GetMissionV(MS_RANK1LVL_S + i - 1), 1, nowadd, tabFILE_NPCDEATH[i], 1)
				if (i == 6) then
					Msg2MSAll(MISSIONID, "宋金战报：宋方元帅已出现！");
				end
			end
		end
	end
	
	for i = 2, 6 do 
		if (GetMissionV(MS_NPCCOUNT1_J + i - 1) > 0) then
			prenpccount = floor((usedtime - 1) / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			npccount = floor(usedtime / totaltime * GetMissionV(MS_NPCCOUNT1_J + i - 1))
			nowadd = npccount - prenpccount
			if (nowadd > 0) then
				print("call jing npc count= "..nowadd.."rank="..i)
				npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[random(2)]);
				bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J + i - 1), GetMissionV(MS_RANK1LVL_J + i - 1), 2, nowadd, tabFILE_NPCDEATH[i], 1)
				if (i == 6) then
					Msg2MSAll(MISSIONID, "宋金战报：金方元帅已出现！");
				end
			end
		end
	end
end;
---------------------------------------------------------------------------------------------------------
function test_callnpc(count, time)
t = 0;

for i = 1, time do
	last = floor((i - 1) / time * count )
	now = floor(i / time * count )
	c = now - last
	t = t + c
	print(c)
end;

print("total:"..t)
end;
------------------------------------------------------------------------------------------------------------
function sf_buildfightnpcdata()
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	s_area = BT_GetGameData(GAME_CAMP1AREA);
	j_area = BT_GetGameData(GAME_CAMP2AREA);
	
	for i = 1, 6 do 
		str = BT_GetBattleParam(i);
		tnpcid, level, count = getNpcInfo(str);
		SetMissionV(MS_TRANK1_S + i - 1, tnpcid);
		SetMissionV(MS_RANK1LVL_S + i - 1, level);
		SetMissionV(MS_NPCCOUNT1_S + i - 1, count)
	end
	
	for i = 1, 6 do 
		str = BT_GetBattleParam(i + 6 );
		tnpcid, level, count = getNpcInfo(str);
		SetMissionV(MS_TRANK1_J + i - 1, tnpcid);
		SetMissionV(MS_RANK1LVL_J + i - 1, level);
		SetMissionV(MS_NPCCOUNT1_J + i - 1, count)
	end
	
	--开始时士兵一次全部出现————宋
	npcfile = GetIniFileData(mapfile, "Area_"..s_area, tbNPCPOS[2]);
	bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_S), GetMissionV(MS_RANK1LVL_S), 1, GetMissionV(MS_NPCCOUNT1_S), tabFILE_NPCDEATH[1], 0)
	
	--开始时士兵一次全部出现————金
	npcfile = GetIniFileData(mapfile, "Area_"..j_area, tbNPCPOS[2]);
	bt_addrandfightnpc(npcfile, GetMissionV(MS_TRANK1_J), GetMissionV(MS_RANK1LVL_J), 2, GetMissionV(MS_NPCCOUNT1_J), tabFILE_NPCDEATH[1], 0)

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
	return TabFile_GetRowCount(mapfile)
end;

function GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end

function bt_addtotalpoint(point)
	if (point == 0) then
		return
	end

	local nWeekDay = tonumber(GetLocalDate("%w"));
	if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then
		point = BigBoss:AddSongJinPoint(point);	
		point = TB_QIANQIU_YINGLIE0904:add_sj_point(point);
		point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
	else
		local nHour = tonumber(GetLocalDate("%H%M"))
		--DinhHQ
		--20110406: 无激活效应 x2 x3 点当账户中使用面具
		if( nHour < 2045 or nHour >= 2250)then
			point = BigBoss:AddSongJinPoint(point);	
			point = TB_QIANQIU_YINGLIE0904:add_sj_point(point);
			point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
		end
	end
	-- 调整战场英雄面具
--	local nHour = tonumber(GetLocalDate("%H"));
--	if nWeekDay ~=1 and nHour ~= 21 then
--		point = TB_QIANQIU_YINGLIE0904:add_sj_point_ex(point);
--	end
	
	--tinhpn 20100706: 武林盟主
	local nHour = tonumber(date("%H%M"))
	local nDate = tonumber(GetLocalDate("%y%m%d"))	
	if (GetTask(TSK_Get2ExpTK) == nDate) then
		if (nHour >= 2100 and nHour <= 2300) then
			if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then
				point = point*2
			end
		end
	end
	
	--tinhpn 20100804: IPBonus
	local nDay = tonumber(date("%w"))
	if nDay == 0 or nDay == 5 or nDay == 6  then
		if (GetTask(TASKID_RECIEVE_BONUS_TK) == 1) then
			point = floor(point*1.5)
		end
	end
	point = Songjin_checkdoubleexp(point)
	
	-- 积分检查
	if BT_GetData(PL_BATTLEPOINT) > 1000000 then
		
		local szName		= GetName();					-- 角色名
		local nGameLevel 	= BT_GetGameData(GAME_LEVEL);	-- 宋金等级
		local nSubWorldID 	= SubWorldIdx2ID();				-- 地图ID

		local nAddPoint		= point;						-- 本次增加的积分
		local nTotalPoint	= BT_GetData(PL_TOTALPOINT);	-- 本场积分
		local nBattlePoint	= BT_GetData(PL_BATTLEPOINT);	-- 角色积分
		local nKillPlayer	= BT_GetData(PL_KILLPLAYER);	-- 杀人数
		
		WriteLog(format("Warning[Too Much Battle Point] %s in Level_%d Battle(%d) want to add %d Ponit. Now Total Point is %d, Battle Point is %d, Kill %d Players!", 
			szName, nGameLevel, nSubWorldID, nAddPoint, nTotalPoint, nBattlePoint, nKillPlayer));
	end
	
	BT_SetData(PL_TOTALPOINT, BT_GetData(PL_TOTALPOINT) + point)
	BT_SetData(PL_BATTLEPOINT, BT_GetData(PL_BATTLEPOINT) + point)
	
	bt_JudgePLAddTitle()
	--Storm 加积分
	storm_addpoint(1, point)
	return point
end

function bt_assignrank(camp)--该功能已无效
	camptab={}
	--清除当前的官位数据
	for tt = 70 , 81 do 
		SetMissionV(tt,0)
	end
		
	idx = 0
	pidx = 0
	
	count = 1
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, camp);
 		
 		if (pidx > 0) then
	 		camptab[count] = pidx;
	 		count = count + 1
	 	end;
	 	if (idx == 0) then 
	 		break
	 	end;
	end;

	for tj = 1, getn(camptab) do 
		
		nTopData = 0
		nTopPlayer = 0;
		nTopIndex = 0
		for i = 1, getn(camptab) do 
			if (camptab[i] ~= 0) then
				PlayerIndex = camptab[i];
				if (BT_GetData(PL_BATTLEPOINT)>= nTopData) then
					nTopPlayer = PlayerIndex
					nTopData = BT_GetData(PL_BATTLEPOINT)
					nTopIndex = i
				end
			end
		end
		
		if (nTopData > 0) then
			PlayerIndex = nTopPlayer
			camptab[nTopIndex] = 0;
			if (camp == 1) then
				JudgePLAddTitle()
			else
				JudgePLAddTitle()
			end
		end
	end
end
--------------------------计算积分系数，重置积分---------------------------------------
function ResetBonus()
	CAMP1CUN = GetMSPlayerCount(MISSIONID, 1)
	CAMP2CUN = GetMSPlayerCount(MISSIONID, 2)
	AVRCUN = (CAMP1CUN + CAMP2CUN)/2
	
	if (AVRCUN == 0) then
		bonuscff1 = 1
		bonuscff2 = 1
	else
		bonuscff1 = 1-(CAMP1CUN-AVRCUN)/AVRCUN
		bonuscff2 = 1-(CAMP2CUN-AVRCUN)/AVRCUN
	end
	
	-- 国战宋金忽略双方平衡
	if BT_GetGameData(GAME_BATTLEID) == 2 then
		bonuscff1 = 1
		bonuscff2 = 1
	end
	
	--当晚如果处于煌之章活动中，奖励翻倍
	bonuscff1 = bonuscff1 * bt_getgn_awardtimes()
	bonuscff2 = bonuscff2 * bt_getgn_awardtimes()
	
	BT_SetTypeBonus(PL_KILLPLAYER, 1, floor(BONUS_KILLPLAYER*bonuscff1))
	BT_SetTypeBonus(PL_SNAPFLAG, 1, floor(BONUS_SNAPFLAG*bonuscff1))
	BT_SetTypeBonus(PL_KILLNPC, 1, floor(BONUS_KILLNPC*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK1, 1, floor(BONUS_KILLRANK1*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK2, 1, floor(BONUS_KILLRANK2*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK3, 1, floor(BONUS_KILLRANK3*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK4, 1, floor(BONUS_KILLRANK4*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK5, 1, floor(BONUS_KILLRANK5*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK6, 1, floor(BONUS_KILLRANK6*bonuscff1))
	BT_SetTypeBonus(PL_KILLRANK7, 1, floor(BONUS_KILLRANK7*bonuscff1))
	BT_SetTypeBonus(PL_MAXSERIESKILL, 1, floor(BONUS_MAXSERIESKILL*bonuscff1))
	BT_SetTypeBonus(PL_GETITEM, 1, floor(BONUS_GETITEM*bonuscff1))
	BT_SetTypeBonus(PL_1VS1, 1, floor(BONUS_1VS1*bonuscff1))

	BT_SetTypeBonus(PL_KILLPLAYER, 2, floor(BONUS_KILLPLAYER*bonuscff2))
	BT_SetTypeBonus(PL_SNAPFLAG, 2, floor(BONUS_SNAPFLAG*bonuscff2))
	BT_SetTypeBonus(PL_KILLNPC, 2, floor(BONUS_KILLNPC*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK1, 2, floor(BONUS_KILLRANK1*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK2, 2, floor(BONUS_KILLRANK2*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK3, 2, floor(BONUS_KILLRANK3*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK4, 2, floor(BONUS_KILLRANK4*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK5, 2, floor(BONUS_KILLRANK5*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK6, 2, floor(BONUS_KILLRANK6*bonuscff2))
	BT_SetTypeBonus(PL_KILLRANK7, 2, floor(BONUS_KILLRANK7*bonuscff2))
	BT_SetTypeBonus(PL_MAXSERIESKILL, 2, floor(BONUS_MAXSERIESKILL*bonuscff2))
	BT_SetTypeBonus(PL_GETITEM, 2, floor(BONUS_GETITEM*bonuscff2))
	BT_SetTypeBonus(PL_1VS1, 2, floor(BONUS_1VS1*bonuscff2))
end
------------------------------------------------------------------------------------

---------------------进入战场时赋给玩家相应头衔 BEGIN------------------------------------------
function bt_JudgePLAddTitle()
--获得当前的Rank，如果积分达到了下一级Rank的要求值则给该玩家该Rank,如果Rank值已经达到上限则不加
	local nCurRank = BT_GetData(PL_CURRANK)
	if ( nCurRank >= getn(TAB_RANKBONUS)) then
		return
	end
	if (BT_GetData(PL_TOTALPOINT) < TAB_RANKBONUS[nCurRank + 1]) then
		return	
	end
	local nRankCount = getn(TAB_RANKBONUS)
	for i = 1, getn(TAB_RANKBONUS) do 
		if (BT_GetData(PL_TOTALPOINT) >= TAB_RANKBONUS[nRankCount - i + 1] ) then
				bt_RankEffect(nRankCount - i + 1)
				return
		end
	end
end

--给于头衔
function bt_RankEffect(rank)
	if (rank == 0) then
		rank = 1
	end
	local campnum = 89
	if (GetCurCamp() == 2) then
		campnum = campnum + 5
	end
	Title_AddTitle(campnum + rank - 1, 0, 9999999)
	Title_ActiveTitle(campnum + rank - 1)
	AddSkillState(RANK_SKILL, rank - 1, 0, 999999);
	Msg2Player(TAB_RANKMSG[rank]);
	BT_SetData(PL_CURRANK, rank);
end

-------------------------进入战场时赋给玩家相应头衔 ENDING----------------------------------


function bt_autoselectmaparea(mapfile,areacount)		--随机选择场地中，双方所在的阵营地
	local s_area = 0
	local j_area = 0
	local areatmp = random(areacount);
	local wwt = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
	if (wwt == 0 or wwt == 1) then
		s_area = areatmp
		while(j_area == 0) do 
			areatmp = random(areacount)
			if (areatmp ~= s_area) then
				wwt1 = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
				if (wwt1 == 0 or wwt1 == 2) then
					j_area = areatmp
				end
			end
		end
	else
		j_area = areatmp
		while(s_area == 0) do 
			areatmp = random(areacount)
			if (areatmp ~= j_area) then
				wwt1 = tonumber(GetIniFileData(mapfile, "Area_"..areatmp, "camparea"))
				if (wwt1 == 0 or wwt1 == 1) then
					s_area = areatmp
				end
			end
		end
	end
	return s_area,j_area
end


function bt_exchangeexp(level, mark)
		if (level < 40) then
			return 0
		end
		local base_exp = (( 700 + floor(( level - 40 ) / 5 ) * 100 ) * 60 * 7 / 3000 );	-- 1个积分点的基础经验值
		local bonus = floor( mark * base_exp )
		
		-- 宋金调整 By 帛裂七弦 09/07/27
		if (level >= 120) then
			bonus = floor( bonus * 2.5 * 2 )
		end
		
		return bonus
end
-----将秒传换成分与秒，比如62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;

function bt_pop2signmap()	--不允许玩家在后营停留5分钟，在夺旗模式，和元帅模式，杀戮模式因为2分钟会将玩家丢到战场，所以不做处理
	local oldPlayerIndex = PlayerIndex
	local tbPlayer = {}
	local count = 0

	local idx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer( MISSIONID,idx, 0 );
		if( pidx > 0 ) then
		 	PlayerIndex = pidx
		 	if ( GetFightState() == 0 and ( ( GetGameTime() - BT_GetData( PL_LASTDEATHTIME ) ) >= TIME_GAME_LIMIT ) ) then
		 		count = count + 1
		 		tbPlayer[ count ] = pidx
		 	end
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 

	local game_level = BT_GetGameData(GAME_LEVEL);
	if ( count > 0 ) then
		for i = 1, count do
			PlayerIndex = tbPlayer[ i ]
		 	local l_curcamp = GetCurCamp();

			SetTaskTemp(200,0);
			SetLogoutRV(0);
			SetCreateTeam(1);
			SetDeathScript("");
			SetFightState(0)		-- 打完仗后改为非战斗状态（by Dan_Deng）
			SetPunish(1)
			ForbidChangePK(0);
			SetPKFlag(0)
			Msg2Player("你在后营停留的时间超过5分钟，被驱逐出宋金战场")
			if (l_curcamp == 1) then
				SetRevPos(tbGAME_SIGNMAP[game_level], 1)
				NewWorld(bt_getsignpos(1))
			else	
				SetRevPos(tbGAME_SIGNMAP[game_level], 2)
				NewWorld(bt_getsignpos(2))
			end;
			
			local camp = GetCamp();
			SetCurCamp(camp);
			
		end
	end

	PlayerIndex = oldPlayerIndex
end

function bt_getgn_awardtimes()
	local nWeekDay = tonumber(GetLocalDate("%w"))
	if nWeekDay == 2 or nWeekDay == 4 or nWeekDay == 6 then
		local nHour = tonumber(GetLocalDate("%H%M"))
		--DinhHQ
		--20110409: 无激活效应x4 点积累
		if( nHour >= 2045 and nHour < 2250)then
			return 4
		end
	end
	if (GetMissionV(MS_HUANGZHIZHANG) == 0 or GetMissionV(MS_HAUNGZHIZHANG) == 1) then
		return 1
	else
		return GetMissionV(MS_HUANGZHIZHANG)
	end
end

function check_pl_level(pl_level)
	if (GetLevel() >= 40 and GetLevel() < 80) then
		return 1		
	end
	if (GetLevel() >= 80 and GetLevel() < 120) then
		return 2
	end
	if (GetLevel() >= 120 ) then
		return 3
	end
end

---新加入Start
--宋金荣誉积分排行，仅高级宋金
--每场比赛结束时，即时战报排行的名次和积分，
--	存在战队统计（LEAGUERESULT）中与已有成绩排序，保留前10名
--	更新排行榜（风云排行榜10250），按名次
--在周日晚23时，将战队排序的结果（前5名）保存在排行榜（10239）中，供领奖
--同时，清除战队统计（LEAGUERESULT）中的成绩
--2545
 LG_SONGJINHONOUR = 535;
 LG_TSK_HONOURPOINT = 1;
 LG_TSK_TOTALPOINT = 2;
 LG_TSK_SECT = 3;	--门派
 LG_TSK_GENDER = 4; --性别
function bt_sortbthonour()
	--本次结果
	local tbCurPlayer = {};
	for i = 1, 10 do
		local szname, npoint, nsect, ngender = BT_GetTopTenInfo(i, PL_TOTALPOINT);
		if (szname ~= nil) then
			tbCurPlayer[ getn(tbCurPlayer)+1 ] = {szname, (11-i), npoint, nsect, ngender};
		end;
	end;
	
	if (tbCurPlayer == {}) then
		print("Battle Have No Player JoinIN!! SO , not do bt_sortbthonour!");
		return 0;
	end;
	
	bt_reportworldresult(tbCurPlayer);	--将本次排名成绩公告世界（所有服务器）
	
	local tbNewPlayer = {};
	local nlg_idx = LG_GetFirstLeague(LG_SONGJINHONOUR);
	while(nlg_idx ~= nil and nlg_idx ~= 0) do
		local szlgname = LG_GetLeagueInfo(nlg_idx);
		local nhonour = LG_GetLeagueTask(nlg_idx, LG_TSK_HONOURPOINT);
		local npoint = LG_GetLeagueTask(nlg_idx, LG_TSK_TOTALPOINT);
		local nsect = LG_GetLeagueTask(nlg_idx, LG_TSK_SECT);
		local ngender = LG_GetLeagueTask(nlg_idx, LG_TSK_GENDER);
		tbNewPlayer[ getn(tbNewPlayer)+1 ] = {szlgname, nhonour, npoint, nsect, ngender};
		nlg_idx = LG_GetNextLeague(LG_SONGJINHONOUR, nlg_idx);
	end;
	
	local nnewcount = getn(tbNewPlayer);
	for i = 1, getn(tbCurPlayer) do
		local bP = 0;
		for k = 1, nnewcount do
			if (tbCurPlayer[i][1] == tbNewPlayer[k][1]) then
				tbNewPlayer[k][2] = tbCurPlayer[i][2] + tbNewPlayer[k][2];
				tbNewPlayer[k][3] = tbCurPlayer[i][3] + tbNewPlayer[k][3];
				tbNewPlayer[k][4] = tbCurPlayer[i][4];
				tbNewPlayer[k][5] = tbCurPlayer[i][5];
				bP = 1;
				break
			end;
		end;
		if (bP == 0) then
			tbNewPlayer[getn(tbNewPlayer)+1] = tbCurPlayer[i];
		end;
	end;
	
	--插入到之前的结果
	for i = 1, getn(tbCurPlayer) do
		local nlg_idx = LG_GetLeagueObj(LG_SONGJINHONOUR, tbCurPlayer[i][1]);
		if (nlg_idx == nil or nlg_idx == 0) then	--如果没有则创建，不再次排序
			if (bt_createleague(tbCurPlayer[i][1]) == 1) then	--创建成功
				LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_HONOURPOINT, tbCurPlayer[i][2]);
				LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_TOTALPOINT, tbCurPlayer[i][3]);
				LG_ApplySetLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_SECT, tbCurPlayer[i][4]);
				LG_ApplySetLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_GENDER, tbCurPlayer[i][5]);
			end;
		else										--如果存在就累计
			LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_HONOURPOINT, tbCurPlayer[i][2]);
			LG_ApplyAppendLeagueTask(LG_SONGJINHONOUR, tbCurPlayer[i][1], LG_TSK_TOTALPOINT, tbCurPlayer[i][3]);
		end;
	end;
	
	Ladder_ClearLadder(10250);	--清排名

	if (getn(tbNewPlayer) >= 1) then
		sort(tbNewPlayer, bt_sortmaxhonour);
		for i = 1, 10 do			--重写排名
			if (tbNewPlayer[i]) then
				Ladder_NewLadder(10250, tbNewPlayer[i][1],tbNewPlayer[i][2], 0, tbNewPlayer[i][4], tbNewPlayer[i][5]);
			end;
		end;
	end;
end;



function bt_sortmaxhonour(tb1, tb2)
	if (tb1[2] ~= tb2[2]) then
		return tb1[2] > tb2[2];
	else
		return tb1[3] > tb2[3];
	end;
end;

function bt_createleague(szlgname)
	local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
	LG_SetLeagueInfo(nNewLeagueID, LG_SONGJINHONOUR, szlgname)	--设置社团信息(类型、名称)
	local ret = LG_ApplyAddLeague(nNewLeagueID, "", "") 
	LG_FreeLeagueObj(nNewLeagueID)
	return ret
end;

function bt_reportworldresult(tbPlayer)
	local ncount = getn(tbPlayer);
	if (ncount <= 0) then
		return 0;
	else
		if (ncount > 3) then
			ncount = 3;
		end;
	
		local szParam = "风云论剑高级已结束, Top"..ncount.." 包括: <enter>";
		for i = 1, ncount do
			if (tbPlayer[i][1]) then
				szParam = format("%s   排名%d <color=green>%s<color>  %d<enter>",
				szParam,i,safeshow(tbPlayer[i][1]),tbPlayer[i][3]);
			end;
		end;
		LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szParam , "", "")
	end;
end
---新加入End


--by zero 2007-7-30 返回积分平衡比例 宋，金
function bonus_rate()
	CAMP1CUN = GetMSPlayerCount(MISSIONID, 1)
	CAMP2CUN = GetMSPlayerCount(MISSIONID, 2)
	AVRCUN = (CAMP1CUN + CAMP2CUN)/2
	
	if (AVRCUN == 0) then
		bonuscff1 = 1
		bonuscff2 = 1
	else
		bonuscff1 = 1-(CAMP1CUN-AVRCUN)/AVRCUN
		bonuscff2 = 1-(CAMP2CUN-AVRCUN)/AVRCUN
	end
	return bonuscff1,bonuscff2
end

function mar_addmissionpoint(totalpoint, nCurCamp)
	if (totalpoint == 0) then
		return
	end
	local nWeekDay = tonumber(GetLocalDate("%w"));
	--tinhpn 20100706: Vo Lam Minh Chu
	local nHour = tonumber(date("%H%M"))
	local nDate = tonumber(GetLocalDate("%y%m%d"))	
	if (GetTask(TSK_Get2ExpTK) == nDate) then
		if (nHour >= 2100 and nHour <= 2300) then
			if nWeekDay ~= 2 and nWeekDay ~= 4 and nWeekDay ~= 6 then	
				totalpoint = totalpoint*2
			end
		end
	end
	
	--tinhpn 20100804: IPBonus
	local nDay = tonumber(date("%w"))
	if nDay == 0 or nDay == 5 or nDay == 6  then
		if (GetTask(TASKID_RECIEVE_BONUS_TK) == 1) then
			totalpoint = floor(totalpoint*1.5)
		end
	end
		
	
	if (not nCurCamp) then
		nCurCamp = GetCurCamp();
	elseif (nCurCamp ~=1 and nCurCamp ~= 2) then
		return
	end
	
	if (nCurCamp == 1) then
		SetMissionV(MS_TOTALPOINT_S, GetMissionV(MS_TOTALPOINT_S)+totalpoint)
	else
		SetMissionV(MS_TOTALPOINT_J, GetMissionV(MS_TOTALPOINT_J)+totalpoint)
	end
end


-- 实时显示战场的各种排名信息 by 帛裂七弦 09/07/27
function bt_announce (lsf_level, n_time)
	
	-- 每10分钟(30次*间隔20秒)公布一次信息
	if (mod(n_time, 30) ~= 0) then
		return
	end
	
	-- 仅高级战场公布信息
	if (lsf_level ~= 3) then
		return
	end
	
	local old_player = PlayerIndex;
	
	local nStrLen_Total = 31;
	local nStrLen_Sort_Title	= 5;
	local nStrLen_Name_Title	= 5;
	local nStrLen_Camp_Title	= 10;
	local nStrLen_Score_Title	= 11;
	local nStrLen_Sort_Text		= 3;
	local nStrLen_Name_Text		= 16;
	local nStrLen_Camp_Text		= 6;
	local nStrLen_Score_Text	= 6;
	
	-- 连斩排名
	tbPlayer = {};
	battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_SER);
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP 连斩", nStrLen_Total));
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("排名", nStrLen_Sort_Title)..strfill_center("姓名", nStrLen_Name_Title)..strfill_center("阵营", nStrLen_Camp_Title)..strfill_center("连斩数", nStrLen_Score_Title));
	for i = 1, 5 do
		if tbPlayer[i] and tbPlayer[i] > 0 then
			PlayerIndex = tbPlayer[i];
			local szname, npoint = GetName(), BT_GetData(PL_MAXSERIESKILL);
			local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "宋" or "金";
			if (szname and szname ~= "") then
				Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
			end
		end
	end
	
	-- PK玩家排名
	tbPlayer = {};
	battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_PK);
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP PK", nStrLen_Total));
	Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("排名", nStrLen_Sort_Title)..strfill_center("姓名", nStrLen_Name_Title)..strfill_center("阵营", nStrLen_Camp_Title)..strfill_center("PK数", nStrLen_Score_Title));
	for i = 1, 5 do 
		if tbPlayer[i] and tbPlayer[i] > 0 then
			PlayerIndex = tbPlayer[i];
			local szname, npoint = GetName(), BT_GetData(PL_KILLPLAYER);
			local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "宋" or "金";
			if (szname and szname ~= "") then
				Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
			end
		end
	end
	
	-- 屠杀NPC排名 仅元帅保卫模式
	if (MISSIONID == 16) then
		tbPlayer = {};
		battle_rank_GetSortPlayer0808(tbPlayer, 0, battle_rank_sort_NPC);
		Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("TOP NPC", nStrLen_Total));
		Msg2MSAll(MISSIONID, "<color=green>"..strfill_center("STT", nStrLen_Sort_Title)..strfill_center("姓名", nStrLen_Name_Title)..strfill_center("阵营", nStrLen_Camp_Title)..strfill_center("NPC数", nStrLen_Score_Title));
		for i = 1, 5 do 
			if tbPlayer[i] and tbPlayer[i] > 0 then
				PlayerIndex = tbPlayer[i];
				local szname, npoint = GetName(), BT_GetData(PL_KILLNPC);
				local szCamp = (BT_GetData(PL_BATTLECAMP) == 1) and "宋" or "金";
				if (szname and szname ~= "") then
					Msg2MSAll(MISSIONID, strfill_center(tostring(i), nStrLen_Sort_Text)..strfill_center(szname, nStrLen_Name_Text)..strfill_center(szCamp, nStrLen_Camp_Text)..strfill_center(tostring(npoint), nStrLen_Score_Text));
				end
			end
		end
	end
	
	
	PlayerIndex = old_player;
end
