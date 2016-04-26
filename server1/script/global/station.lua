Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_city\\head.lua");
Include("\\script\\missions\\clearskill\\clearhole.lua");
Include("\\script\\task\\tollgate\\messenger\\wagoner.lua");  --特殊信使地图

Include("\\script\\task\\newtask\\map_index.lua"); -- 用于获取任务链地图的信息
Include("\\script\\task\\tollgate\\messenger\\wagoner.lua") --用于连接特殊信使任务的脚本
Include("\\script\\global\\judgeoffline_special.lua")	--用于无名谷——托管服务器地图

Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\event\\zhongqiu_jieri\\200909\\rongshu\\head.lua")

Include("\\script\\event\\great_night\\great_night_head.lua")	--双龙洞黄金之核
--襲 ch豱h reset 5h ch琲 - Modified by DinhHQ - 20110630
Include("\\script\\vng_feature\\challengeoftime\\npcNhiepThiTran.lua")
szStationOp = 
	{
		"路经的地方/WayPointFun", 		-- 1
		"路经的城市/StationFun",		-- 2
		"返回的地点/TownPortalFun", 	-- 3
		"去华山竞技场/go_HSBattle", 	-- 4
		"去攻城战场/GoCityWar",			-- 5
		"去攻城训练战场/GoDemoWar",		-- 6
		"去洗髓岛/GotoClearSkillMap",	-- 7
		"去野叟任务所在地/tl_moveToTaskMap",			-- 8
		"去特殊信使任务所在地点/messenger_wagoner",      -- 9
		--"去无名谷/GotoAnonymVale"			--10
	};

function return_1()
	return 1
end

function return_0()
	return 0
end

-- 对应上个数组的条件判断
aryCondition = {

	[1] = {checkState = return_1},     -- 路经的地方
	[2] = {checkState = return_1},     -- 路经的城市
	[3] = {checkState = return_1},     -- 返回的地点
	[4] = {checkState = return_1},     -- 去华山竞技场
	[5] = {checkState = function()                      -- 去攻城战场
				return (WhichWarBegin()~= 0 and 1) or 0;
		   end;
		  },
	[6] = {checkState = function()                      -- 去攻城训练战场
				return (GetGlbValue(2)==1 and 1) or 0;
		   end;
		  },
	[7] = {checkState = return_1},     -- 去洗髓岛
	[8] = {checkState = function()                      -- 去野叟任务所在地
				return (GetTask(1021)==4 and 1) or 0;
		   end;
		  },
	[9] = {checkState = function()                      -- 去特殊信使任务所在地点
				return (GetTask(1204)~= 0 and 1) or 0;
		   end;
		  },
	--[10] = {checkState = return_1},    -- 进入无名谷
	[10] = {checkState = return_1},     -- 路经的地方
	[11] = {checkState = return_1},
	[12] = {checkState = return_1},
}

szStationOp_Cancel = "不用了/StationOnCancel";

function go_HSBattle()
	Msg2Player("坐好了！咱们走啰！华山竞技场。")
	NewWorld(2,2605,3592)
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
end

function WayPointFun()			-- 加返回要800两银子（洞口）　　　（BY： Dan_Deng 2004-04-30）
	p1 = GetWayPoint(1);
	p2 = GetWayPoint(2);
	p3 = GetWayPoint(3);
	HaveBin={};
	i = 1;
	if (p1 ~= 0)  then
		name = GetWayPointName(p1);
		name = name .."/SelWayPoint";
		HaveBin[i]= name;
		i = i + 1;
	end;
	if (p2 ~= 0)  then
		name = GetWayPointName(p2);
		name = name .."/SelWayPoint";
		HaveBin[i]= name;
		i = i + 1;
	end;
	if (p3 ~= 0)  then
		name = GetWayPointName(p3);
		name = name .."/SelWayPoint";
		HaveBin[i]= name;
		i = i + 1;
	end;
	HaveBin[i] = "哪里都不想去了/OnCancel";
	if (i == 1) then 
		Say("对不起，我只能把您送到您曾经去过的地方，您现如今哪儿都还没去过呢！",0);
	else
		Say("请选择：", i, HaveBin);
	end;
end;

function WharfFun()
Count = GetWharfCount(CurWharf);
Num = Count;

WharfB = {};
nValidCount = 1;

for i = 1, Num do
WharfId = GetWharf(CurWharf, i);
if (WharfId ~= 0) then
	nPrice = GetWharfPrice(CurWharf, WharfId);
	WharfB[nValidCount] = GetWharfName(WharfId) .. "[" .. nPrice .. "两]" .. "/SelWharf";
	nValidCount = nValidCount + 1;
end;
end;

WharfB[nValidCount] = "不坐/OnCancel";

if (nValidCount == 1) then 
Say("对不起，您现如今哪儿都没去呢！", 0);
else
Say("船夫：你想去什么地方呀：", nValidCount, WharfB);
end;

end;

function SelWharf(nSel)

nWharfId = GetWharf( CurWharf, nSel + 1);
nPrice = 0;
if (nWharfId ~= 0) then 
	nPrice = GetWharfPrice(CurWharf, nWharfId);
else
	return
end;

if (PrePay(nPrice) == 1 or GetCamp() == 6 ) then
Msg2Player("坐好了！咱们走啰！"..GetWharfName(nWharfId))
nW , nX, nY = GetWharfPos(nWharfId);
nResult = NewWorld(nW, nX , nY );
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
if (nResult == 2) then
Msg2Player("服务器转换中...")
end
if (nResult == 0) then
Msg2Player("传入点有错误")
end
else
Say("不好意思，没钱可坐不了车", 0);
end;
end;


function StationFun()
	for j = 1, 16 do
		AddStation(j)
	end
	Count = GetStationCount();
	Num = Count;
	if (Count > 10) then
		Num = 10
	end
	StationB = {}
	nValidCount = 1

	for i = 1, Num do
		StationId = GetStation(i, CurStation)
		if (StationId ~= 0) then
			nPrice = GetPrice2Station(CurStation, StationId)
	StationB[nValidCount] = GetStationName(StationId) .. "[" .. nPrice .. "两]" .. "/SelStation";
			nValidCount = nValidCount + 1
		end
	end
StationB[nValidCount] = "哪里都不想去了/OnCancel";

	if (nValidCount == 1) then 
Say("对不起，我只能把您送到您曾经去过的地方，您现如今哪儿都还没去过呢！", 0);
	else
Say("请选择想去的地方：", nValidCount, StationB);
	end
end

function SelStation(nSel)
	Count = GetStationCount()
	nStation = GetStation(nSel + 1, CurStation)
	nPrice = GetPrice2Station(CurStation, nStation)
	if (PrePay(nPrice) == 1 or GetCamp() == 6) then
		nW, nX, nY = GetStationPos(nStation);
		nResult = NewWorld(nW, nX , nY );
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
Msg2Player("坐好了！咱们走啰！"..GetStationName(nStation))
		if (nResult == 2) then
			--Msg2Player("服务器转换中...")
		end
		if (nResult == 0) then
Msg2Player("传入点有错误")
		end
	--襲 ch豱h reset 5h ch琲 - Modified by DinhHQ - 20110630
	local nSongJinCount = PlayerFunLib:GetTaskDailyCount(1926)
	if nSongJinCount >= 1 or tbCOT_Party:GetDailyTaskCount() >= 1 then
		SetTireTime(0)
	end

	else
Say("不好意思，没钱可坐不了车，您还是走去吧！", 0);
	end
end

function TownPortalFun()			-- 返回要2000两银子（原地点）　　（BY: Dan_Deng 2004-04-30）
--	if (PrePay(2000) == 1 or GetCamp() == 6) then
		ReturnFromPortal()
--	else
--		Say("不好意思，没钱可坐不了车，您还是走去吧！", 0)
--	end
end;

function SelWayPoint(nSel)			-- 返回要1000两银子（洞口）　　　（BY：Dan_Deng 2004-04-30）
--	if (PrePay(1000) == 1 or GetCamp() == 6) then
		nWayPoint = GetWayPoint(nSel + 1);
		if (nWayPoint ~= 0) then
			nW, nX, nY = GetWayPointPos(nWayPoint)
			nFightState = GetTerminiFState(nWayPoint)
			nResult = NewWorld(nW, nX, nY)
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
			SetFightState(nFightState)
--			Msg2Player("Goto"..GetWayPointName(nWayPoint)..nW..nX..nY);
			if (nResult == 2) then
--				Msg2Player("服务器转换中...")
			end
			if (nResult == 0) then
--				Msg2Player("传入点有错误.")
			end
		end;
--	else									-- 不够钱就拒绝
--		Say("不好意思，没钱可坐不了车，您还是走去吧！", 0);
--	end;
end

--城战是否开始了
function WhichWarBegin()
	for i = 1,7 do
		if (HaveBeginWar(i) ~= 0) then
			return i;
		end;
	end;
	return 0;
end;

function CancelGoCityWar()
	Say("攻城战场乃是非之地、刀剑无情，若不是来参战,义士还请以生命为重，请回吧！", 0);
end;

function GoCityWar()
	CityID = WhichWarBegin();
	if (CityID >= 1 and CityID <= 7) then
		Tong1, Tong2 = GetCityWarBothSides(CityID);
		str = format("现在 %s 攻城战正在进行，攻城方<%s>，守城方<%s>，请问您要加入哪一方参战？", GetCityAreaName(CityID), Tong1, Tong2);
		Say(str , 3, "攻方/GoCityWarAttack", "守方/GoCityWarDefend", "都不是/CancelGoCityWar");
	end;
end;

--去攻城战守方入口
function GoCityWarDefend()
	CityID = WhichWarBegin();
	if (CityID == 0 ) then 
		return
	end;

	TongName, result = GetTong()
	Tong1, Tong2 = GetCityWarBothSides(CityID);
	if (Tong2 ~= TongName and GetItemCountEx(CardTab[CityID * 2]) < 1) then 
		if (GetTask(TV_CITYID) ~= CityID or GetTask(TV_VALUE) ~= 1 or GetTask(TV_TASKID) ~= MISSIONID) then
			Say("义士身份不符，请恕在下不敢冒险相送,义士还是请回吧!", 0);
			return
		end;
	end;
	
	if (random(0,1) == 1) then
		NewWorld(222, 1614, 3172);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
	else
		NewWorld(222, 1629, 3193);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
	end;
end;

--去攻城战攻方入口
function GoCityWarAttack()
	CityID = WhichWarBegin();
	if (CityID == 0) then 
		return
	end;

	TongName, result = GetTong()
	Tong1, Tong2 = GetCityWarBothSides(CityID);
	if (Tong1 ~= TongName and GetItemCountEx(CardTab[CityID * 2 - 1]) < 1) then
		if (GetTask(TV_CITYID) ~= CityID or GetTask(TV_VALUE) ~= 2 or GetTask(TV_TASKID) ~= MISSIONID) then
			Say("义士身份不符，请恕在下不敢冒险相送,义士还是请回吧!", 0);
			return
		end
	end
	
	if (random(0,1) == 1) then
		NewWorld(223, 1614, 3172);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
	else
		NewWorld(223, 1629, 3193);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
	end;

end;

function GoDemoWar()
	Say("现在攻城修练战开始了，你要参加吗？", 3,"我参加守方！/GotoDefend", "我参加攻方/GotoAttack", "没准备好，下次吧/OnCancel") 
end;

function GotoDefend()
if (random(0,1) == 1) then
	NewWorld(222, 1614, 3172);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
else
	NewWorld(222, 1629, 3193);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
end;
end;

function GotoAttack()
	if (random(0,1) == 1) then
		NewWorld(223, 1614, 3172);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
	else
		NewWorld(223, 1629, 3193);
	SetProtectTime(18*3) --三秒保护时间
	AddSkillState(963, 1, 0, 18*3) 		
	end;
end;

-- 去洗点地图
function GotoClearSkillMap()
	-- 暂时屏蔽去洗点地图的功能
	-- Say("车夫：免费去洗髓岛的机会只有一次。你最好还是先熟悉一下这次的技能调整，迟一点再去吧。", 1, "知道了/gotocsm_no")

	nSubWorldID = SubWorldIdx2ID();
	nCityIndex = CSP_GetCityIndexByCityMap(nSubWorldID);
	if (nCityIndex == -1) then
		return -1;
	end
	
	CSP_EnterClearMap(nCityIndex);	
end;

function gotocsm_no()
end;

function OnCancel()
end;

function goto_shijiangu()
	NewWorld(949, floor(51264 / 32), floor(102368 / 32))
end

function _GoELangGu()
	Msg2Player("恶狼谷到了!")
	local tbTargetMapList = {[11] = 950, [1] = 951, [37] = 952, 
										[176] = 953, [162] = 954, [78] = 955, [80] = 956,}
	local nMapId = GetWorldPos()
	if tbTargetMapList[nMapId] then
 		NewWorld(tbTargetMapList[nMapId], 1592, 3195)
 	end
end

CITY_OPTIONS =
{
	{"路经的地方", 				WayPointFun}, 			-- 1
	{"路经的城市",				StationFun},			-- 2
	{"返回的地点",				TownPortalFun}, 		-- 3
	{"去华山竞技场",			go_HSBattle}, 			-- 4
	{"去攻城战场",				GoCityWar},				-- 5
	{"去攻城训练战场",			GoDemoWar},				-- 6
	{"去洗髓岛",				GotoClearSkillMap},		-- 7
	{"去野叟任务所在地",		tl_moveToTaskMap},		-- 8
	{"去特殊任务信使所在地",	messenger_wagoner},     -- 9
	--{"去无名谷",				GotoAnonymVale"			--10
	--{"去新两水洞",		OnGoToNewLiangShuiDong},-- 10
	--{"去试剑谷",				goto_shijiangu},		-- 11
	--{"去恶狼谷",				_GoELangGu},
}

-- 城市车夫通用脚本
-- 注意：攻城战未使用此函数的脚本 [script\missions\citywar_city\zhongzhuan_map\chefu.lua]
function CityStationCommon(szMsg)	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end

	local tbDailog = DailogClass:new(szNpcName)
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
	tbDailog.szTitleMsg = szMsg

	--弹出对话框
	for i = 1, getn(CITY_OPTIONS) do
		local tb = CITY_OPTIONS[i]
		-- 调用 aryCondition 内的 checkState 过程，检查此对话选项是否符合条件
		if aryCondition[i].checkState() == 1 then
			tbDailog:AddOptEntry(tb[1], tb[2])
		end
	end
	tbDailog:Show()
end;

-- 新手村车夫通用脚本 (注意：南岳镇不是新手村，不调此函数)
function NewcomerStationCommon(szMsg)
--	check_update()					-- 技能更新、门派加标识（2004-05-31）
	if (GetLevel() >= 5) then
		if (WhichWarBegin() ~= 0) then
			Say(szMsg, 5, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp[5], szStationOp_Cancel)
		elseif (GetGlbValue(2) == 1) then -- 攻城训练战场
			Say(szMsg, 5, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp[6], szStationOp_Cancel)
		else
			if (GetTask(1021) == 4) then -- 如果接受了野叟任务中寻找地图志的任务
				Say(szMsg, 5, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp[8], szStationOp_Cancel)
			else
				Say(szMsg, 4, szStationOp[1], szStationOp[2], szStationOp[3], szStationOp_Cancel)
			end
		end;
	else		
		Talk(1,"","车夫：外边可乱得很，象你这般弱不禁风，出了村闹出人命我可担不起。")
	end
end;

function  StationOnCancel()
   Talk(1,"","车夫：有了钱再来坐车吧。")
end;

----------------------------------------------

CP_MAPPOS_IN = {1508,3026}
CP_MAPTAB = {
				{396, 397, "少林"},
				{398, 399, "天王"},
				{400, 401, "唐门"},
			 	{402, 403, "五毒"},
			 	{404, 405, "峨嵋"},
			 	{406, 407, "翠烟"},
			 	{408, 409, "丐帮"},
			 	{410, 411, "天忍"},
			 	{412, 413, "武当"},
			 	{414, 415, "昆仑"}
			 }

function transtoplace()
	Say("武林新秀赛会场将进行门派新秀赛，你想要进入么？", 2, "我要进入新秀赛会场/transtoplace_sure", "等一会吧/OnCancel")
end

function transtoplace_sure()

	if (GetLastFactionNumber() == -1) then
		Say("武林盟主有令：武林门派新秀赛只限于十大门派参赛。你在武林中无门无派，实在不能放行，还是等你加入十大门派后，再来参赛吧！", 0)
		return
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
		Msg2Player("你进入了武林新秀赛会场")
	end
end

-- 用于处理一堆选项的对话函数 Say(""...);
-- Edited by peres
function SelectSay(strSay)

local strMsg,strSel = "","";
local strNum = getn(strSay);

	if strNum < 2 then
		return
	end;
	
	if strNum > 2 then
		for i=2,strNum - 1 do
			strSel = strSel..format("%q", strSay[i])..",";
		end;
		strSel = strSel..format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..","..(strNum - 1)..","..strSel..");";
	elseif strNum == 2 then
		strSel = format("%q", strSay[strNum]);
		strMsg = "Say("..format("%q", strSay[1])..",1"..","..strSel..");";
	end
	dostring(strMsg)
end


