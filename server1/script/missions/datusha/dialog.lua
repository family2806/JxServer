Include("\\script\\missions\\datusha\\datusha.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("SETTING")
COST_MONEY = 100000
MAX_AWARD_COUNT = 100
DaTuShaRankAward = 
{
	[1] = 8e6,
	[2] = 7e6,
	[3] = 6e6,
	[4] = 5e6,
	[5] = 45e5,
	[6] = 4e6,
	[7] = 35e5,
	[8] = 3e6,
	[9] = 25e5,
	[10] = 15e5,
}
LastManAward = 
{
	[1]={szName="紫蟒盔图谱",tbProp={6,1,2714,1,0,0},nRate = 2.0,},
	[2]={szName="紫蟒衣图谱",tbProp={6,1,2715,1,0,0},nRate = 2.0,},
	[3]={szName="紫蟒腰带图谱",tbProp={6,1,2717,1,0,0},nRate = 2.0,},
	[4]={szName="紫蟒护腕图谱",tbProp={6,1,2718,1,0,0},nRate = 2.0,},
	[5]={szName="紫蟒佩图谱",tbProp={6,1,2720,1,0,0},nRate = 2.0,},	
	[6]={szName="紫蟒鞋图谱",tbProp={6,1,2716,1,0,0},nRate = 2.0,},	
	[7]={szName="紫蟒项链图谱",tbProp={6,1,2719,1,0,0},nRate = 2.0,},	
	[8]={szName="紫蟒上戒指图谱",tbProp={6,1,2721,1,0,0},nRate = 0.5,},	
	[9]={szName="紫蟒下戒指图谱",tbProp={6,1,2722,1,0,0},nRate = 0.5,},	
	[10]={szName="紫蟒器戒图谱",tbProp={6,1,2723,1,0,0},nRate = 0.5,},
	[11]={szName="紫蟒令",tbProp={6,1,2350,1,0,0},nCount=1,nRate=0.5},
	[12]={szName="黄金之果",tbProp={6,1,907,1,0,0},nCount=1,nRate=19, nExpiredTime = 10080},	
	[13]={nExp_tl=1,nRate = 65,nCount = 10000000,},	
}

TotalRankAward = 
{
	{
		{nExp_tl = 32e6},
		{
			{szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nRate = 5.0, nExpiredTime = 43200}
		}
	},
	{nExp_tl = 28e6},
	{nExp_tl = 24e6},
	{nExp_tl = 20e6},
	{nExp_tl = 18e6},
	{nExp_tl = 16e6},
	{nExp_tl = 14e6},
	{nExp_tl = 12e6},
	{nExp_tl = 10e6},
	{nExp_tl = 8e6},
}
function DaTuShaClass:Join()
	local pDungeon = DungeonList[896]
	if pDungeon then
		local nMapId, nX, nY = GetWorldPos()
		pDungeon.tbPlayer[GetName()] = {tbSignUpPos={nMapId, nX, nY}}
		
		pDungeon:GotoDaTuSha();
	end
end

function about(nStep)
	
	local szTitle = ""
	local tbOpt = {}	
	if nStep == 0 then
		szTitle = "<npc>活动时间是每天的12:00, 19:00, 20:00, 21:00, 所有120级以上的玩家都可以找我报名, 报名时间为10分钟, 报名要交10万两. 活动开始后可以使用自身的技能参战, 乱战时间是30分,每个人有5次复生机会, 活动结束后根据积分领奖."
		tinsert(tbOpt, {"九州谷是一个什么样的地方", about, {1}})
		tinsert(tbOpt, {"有什么奖品吗", about, {2}})
	elseif nStep == 1 then
		szTitle = "<npc>九州谷是近年来朝廷用来训练大内高手的秘密地方，谷中根据先人的叫法是分成9个区域的九州﹗比武开始后，从第3开始，每隔3分钟将有一个区域被千年冰限包裹，如果不及时破冰离开将会被冻死。在地30分钟如果还没有分出胜败，谷中的所有玩家将会被冰冻。谷中长年充满特别冷的霜雾。在寒霜中混战既被冰霜威胁同时又无穷危险."
		tinsert(tbOpt, {"对话返回上一层", about, {0}})	
	elseif nStep == 2 then
		szTitle = "<npc>每次活动要根据本次的积分来领奖；如果你是最后唯一的幸存者，也可以领取最终勇士的奖品。每天将根据白天领取的积分继续排名，前十名将有勇士奖品."
		tinsert(tbOpt, {"对话返回上一层", about, {0}})
	end
	tinsert(tbOpt, {"结束对话"})
	CreateNewSayEx(szTitle, tbOpt)	
end

function check_rank()
	
	local szMsg = format("你的总积分是<color=green>%d<color><enter>", GetPlayerTotalScores())
	
	local szName, nValue = Ladder_GetLadderInfo(LadderId, 1);
	
	if (szName == nil or szName == "" or nValue == nil) then
		return Talk(1, "", szMsg.."暂时还没有前十名的排行榜.")
	end
	
	szMsg = szMsg.."前十名的排行榜: <enter>"	
	szMsg = szMsg..format("%s%s%s<enter>", strfill_center("排名", 6, " "), strfill_center("姓名", 10, " "), strfill_center("总积分", 8, " "))
	for i=1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(LadderId, i);
		if szName and szName ~= "" and nValue > 0 then
			szMsg = szMsg..format("%s%s%s<enter>", strfill_center(tostring(i), 6, " "), strfill_center(szName, 10, " "), strfill_center(tostring(nValue), 8, " "))
		end
	end
	local tbOpt = 
	{
		{"返回", dialog_main},
		{"结束对话"},
	}
	CreateNewSayEx("<npc>"..szMsg, tbOpt)
end

function round_award()
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		return Talk(1, "", "比武时间不能领奖")
	end
	if not DaTuShaClass.Rank then
		return
	end
	local szCurName = GetName()
	if DaTuShaClass.Scores[szCurName] == nil or DaTuShaClass.Scores[szCurName] == 0 then
		return Talk(1, "", "你还没有参加九州谷试炼")
	end
	
	if DaTuShaClass.Scores[szCurName] < 0 then
		return Talk(1, "", "你已领过此奖品.")
	end
	local nCount = getn(DaTuShaClass.Rank)
	if nCount > MAX_AWARD_COUNT then
		nCount = MAX_AWARD_COUNT
	end
	local nRank = nil
	for i=1, nCount do
		local szName = DaTuShaClass.Rank[i][1]
		if (szCurName == szName) then
			nRank = i
			break
		end
	end
	if nRank then
		Msg2Player(format("这战你的排名是 %d, 这是送你的礼物请收下.", nRank))
		local nAwardCount = getn(DaTuShaRankAward)
		local nExp = DaTuShaRankAward[nRank]
		if nRank > nAwardCount then
			nExp = DaTuShaRankAward[nAwardCount]
		end
		if nExp then
			tbAwardTemplet:Give({nExp_tl = nExp}, 1, {"乱战九州谷","固定奖励"})
			DaTuShaClass.Scores[szCurName] = -1
		end
	else
		 Talk(1, "", format("你这战的排名不在 %d名单中", MAX_AWARD_COUNT))
	end	
end

function last_man_award()
	local LastMan = DaTuShaClass.LastMan
	if LastMan and LastMan.szName and LastMan.szName == GetName() and LastMan.bFlag == nil then
		if CalcFreeItemCellCount() < 1 then
			return Talk(1, "",  format("背包需要 <color=yellow>%d<color>空间.", 1))
		end
		
		tbAwardTemplet:Give(LastManAward, 1, {"乱战九州谷","最终勇士的奖品"})
		LastMan.bFlag = 1
	else
		Talk(1, "", "你没有资格领奖或者已经领过了.")
	end
end

function final_award()
	local nHour = tonumber(GetLocalDate("%H"))
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	
	if not(nHour > 21 and nHour < 24) then
		return Talk(1, "", "现在不是总排行的领奖时间.")
	end
	if GetTask(TSK_FINAL_AWARD) == nDate then
		return Talk(1, "", "你已经领过奖了.")
	end
	
	if CalcFreeItemCellCount() < 1 then
		return Talk(1, "",  format("背包要有<color=yellow>%d<color> 空间.", 1))
	end
	
	local nRank = nil
	for i=1, 10 do
		local szName, nValue = Ladder_GetLadderInfo(LadderId, i);
		if szName == GetName() and nValue > 0 then
			nRank = i
			break
		end
	end
	if nRank and TotalRankAward[nRank] then
		tbAwardTemplet:Give(TotalRankAward[nRank], 1, {"乱战九州谷","最终勇士的奖品"})
		SetTask(TSK_FINAL_AWARD, nDate)
	else
		return Talk(1, "", "你不在前十的排行榜里.")
	end
end

function give_award()
	local szTitle = "<npc>每次活动要根据本次的积分来领奖；如果你是最后唯一的幸存者，也可以领取最终勇士的奖品。每天将根据白天领取的积分继续排名，前十名将有勇士奖品."
	local tbOpt = 
	{
		
		{"我来领取每战的奖品", round_award},
		{"我来领取 [最终勇士]的奖品" ,last_man_award},
		{"我来领总积分奖励", final_award},
		{"结束对话"},
	}
	
	CreateNewSayEx(szTitle, tbOpt)
end

function join_datusha()
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		if pDungeon.nState ~= 1 then
			return
		end
	else
		return
	end
	if (ST_GetTransLifeCount() <= 0 and GetLevel() < 120) then
		return Msg2Player(format("级数要到<color=yellow>%d<color>.", 120))
	end
	--Change request July 13, 2011 - Modified by DinhHQ - 20110713
--	if Pay(COST_MONEY) ~= 1 then
--		return Talk(1, "", format("需要上交 %d两报名费", COST_MONEY))
--	end
	if PlayerFunLib:GetTaskDailyCount(2710) >= 1 then
		if (CalcItemCount(-1, 6, 1, 30117, -1) < 1 or ConsumeEquiproomItem(1, 6, 1, 30117, 1) ~= 1) then
			Talk(1, "", "你已免费参加过一次了，这次参加要有1个九州令")
			return
		else
			tbLog:PlayerActionLog("LoanChienCuuChauCoc","TruThanhCong1CuuChauLenh")
		end
	end
	PlayerFunLib:AddTaskDaily(2710, 1)
	pDungeon.tbPlayer[GetName()] = {}
	local nMapId, nX, nY = GetWorldPos()
	pDungeon.tbPlayer[GetName()].tbSignUpPos = {nMapId, nX, nY}
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "luanzhanjiuzhou")
	pDungeon:GotoDaTuSha()
	--Ghi log 技能 key - Modified By DinhHQ -20120410
	if PlayerFunLib:GetTaskDailyCount(2710) == 1 then
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhLoanChienCuuChauCocMienPhi")
	else
		tbLog:PlayerActionLog("TinhNangKey","BaoDanhLoanChienCuuChauCocThuPhi")
	end
end

function dialog_main()
	local szTitle = "<npc>为了为军队选拔人才，朝廷决定在民众中选出一些智勇双全的高手。欢迎各位报名参加."
	local tbOpt = 
	{
		{"与乱战九州谷有关", about, {0}},
		{"我想看我的总积分和前十排名", check_rank},
		{"我来领奖", give_award},
		{"我只是路过"},
	}
	local pDungeon = DungeonList[MAP_ID]
	if pDungeon then
		if pDungeon.nState == 1 then
			tinsert(tbOpt, 1, {"报名参加乱战九州谷", join_datusha, {}})
		end
	end
	
	
	CreateNewSayEx(szTitle, tbOpt)	
end

EventSys:GetType("AddNpcOption"):Reg("掌灯宫女", "乱战九州谷", dialog_main)
