-- 试剑谷护剑使
Include("\\script\\missions\\maze\\maze.lua")
Include("\\script\\global\\station.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\global\\dlgnpc_list.lua")
Include("\\script\\missions\\maze\\head.lua")
Include("\\script\\missions\\maze\\addstatdata.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

LEVEL_MIN = 120

LIMITS = {
	MIN_TEAMSIZE = 6,
	FLAG_CHECKTIME = 1,
}

-- 车夫
NpcChefu = {
	m_Caption = "想坐车去哪？",
	m_Options = {
		"我想去凤翔",
		"我想去成都",
		"我想去大理",
		"我想去汴京",
		"我想去襄阳",
		"我想去扬州",
		"我想去临安",
		"哪都不去"
	}
}
function NpcChefu:Say(player)
	return self.m_Caption, self.m_Options
end

function NpcChefu:OnAnswer(player, sel)
	if (sel > 0 and sel < 8) then
		local mapid, x, y = GetStationPos(sel)
		if (mapid ~= nil and NewWorld(mapid, x, y) == 1) then
			player:Msg2Player("坐好了吗？我们走。 ")
		end
	end
end

-- 周君
NpcZhoujun = {
	m_Caption = "恭迎大侠，老夫是天趋护剑使.",
	m_Options = {
		"我到这是来完成玉龙英雄帖任务的",
		"我来这领取空白的玉龙名剑谱",
		"我来领取本营玉龙名剑的收集奖励",
		"我只是来玩",
	}
}

function NpcZhoujun:Say(player)
	do
		player:Say("该功能暂时关闭.")
		return
	end
	return self.m_Caption, self.m_Options
end

function NpcZhoujun:OnAnswer(player, nIndex)
	if (nIndex == 1) then
		local nTask = player:GetTask(TASK_MAZEINVITATION)
		if (nTask == 0) then
			player:Say("请原谅，你未获得该任务.")
		elseif (nTask == 1) then
			if (player:CalcFreeItemCellCount() == 0) then
				player:Say("请整理装备后再来见我.")
				return
			end
			player:Describe(
				format("%s 大侠，老夫久闻你的大名，今天相遇，真是人中龙凤。这次，玉龙山在请你来有事商量，老夫将从头到尾告诉你. <enter> 我的山庄之前听特探回报，金国正在谋划大事，他们正在谋划一场对我国的惊天大战。为了抗击他们的阴谋，玉龙山在决定选派和训练一些绝世高手潜入敌人的内宫，暗杀他们的首领。我们的庄主很喜欢收集名剑，为了防止独孤求败，所以，把名剑放在了剑冢。而且，选派了精英卫士保护. <enter> 今天要谋大事，本庄愿意打开剑冢让武林英雄集和在一起练习武功，同时也贡献本庄的神兵利器，这些宝物将送给武林新秀的英雄。但是要找到一位真正的高手。大侠这次来这里，本庄感到无比荣幸。这是本庄的信物<color=red> 玉龙令牌 <color>, 有这个极品在手上，大侠可以随时进入剑冢。希望大侠可以通过训练，获得极品装备，早晚有一天能报效祖国。.", player:GetName()),
				1,
				"知道了/Cancel")
			if (player:AddItem(6, 1, 2623, 1, 0, 0) > 0) then
				player:SetTask(TASK_MAZEINVITATION, 2)
			end
		elseif (nTask == 2) then
			player:Say("你已完成任务了，不需要再做了")		
		end
	elseif (nIndex ~= 4) then
		player:Say("该性能暂时不开 ")
	end
end

-- 柳药师
NpcLiuyaoshi = {}
function NpcLiuyaoshi:Say(player)
	player:Sale(99, 1)
end

-- 小珠珠
NpcXiaozhuzhu = {
	m_Caption = "大侠，您好。我是一位倾国倾城的玉龙山庄第一美人小珠珠，请问大侠找我有什么事吗？",
	m_Options = {
		"介绍剑冢副本",
		"剑冢报名",
		--"检查今天我可以进入剑冢的次数",
		"我只是路过",
	}
}
NpcXiaozhuzhu.tbTSK_JoinTotal = 3075
function NpcXiaozhuzhu:Say(player)
	return self.m_Caption, self.m_Options
end

function NpcXiaozhuzhu:CheckTime()
	if (LIMITS.FLAG_CHECKTIME == 0) then
		return 1
	end
	local _, _, _, _, m = MakeDateTime(5, GetCurServerTime())
	if (m > 30) then
		return 0
	else
		return 1
	end
end

function NpcXiaozhuzhu:CheckTeam(player)
	local count = player:GetTeamSize()
	if (count < LIMITS.MIN_TEAMSIZE) then
		player:Say("120级以上6-8人组队才能进去.")
		return 0
	elseif (self:CheckTime() == 0) then
		player:Say("只能在30分钟前报名.")
		return 0
	end
	local mapid, _, _ = player:GetWorldPos()
	for i = 1, count do
		local index = player:GetTeamMember(i)
		local mate = PlayerList:GetPlayer(index)
		if (not mate) then
			return 0
		elseif (mate:GetLevel() < LEVEL_MIN) then
			player:Say(format("组队成员<color=red>%s<color> 等级不够.", mate:GetName()))
			return 0
		elseif(self:VnCheckNLPass(mate) == 0) then	--检查玉龙令牌
			player:Say(format("对不起,<color=red>%s<color> 没有玉龙令牌。不够条件进入剑冢进行试炼.", mate:GetName()))
			return 0
		elseif (self:VnGetJoinTotal(mate) == 0) then --检查次数吧
			player:Say(format("<color=red>%s<color>今天进入剑冢试炼的次数已用完了.", mate:GetName()))
			return 0	
--		elseif (MazePermission:CheckPermission(mate) == 0) then
--			player:Say(format("对不起,<color=red>%s<color> 不够条件进入剑冢试炼.", mate:GetName()))
--			return 0
--		elseif (MazePermission:QueryLeftCount(mate) == 0) then
--			player:Say(format("<color=red>%s<color>今天进入剑冢试炼的次数已用完了.", mate:GetName()))
--			return 0
		else
			local m, _, _ = mate:GetWorldPos()
			if (m ~= mapid) then
				player:Say("要求所有成员都在附近才能进入参加报名.")
				return 0
			end
		end
	end
	return 1
end

function NpcXiaozhuzhu:Enter(player, maze)
	AddStatDataTeamEnterMazeCount(1)
	local count = player:GetTeamSize()
	local members = {}
	for i = 1, count do
		local index = player:GetTeamMember(i)
		local mate = PlayerList:GetPlayer(index)
		tinsert(members, mate)
	end
	for i = 1, getn(members) do
		local mate = members[i]
		self:VnSetJoinTotal(mate) --增加去剑冢的次数
		self:VnConsumeNLPass(mate) -- 收令牌
		maze:Join(mate)
		if (not maze:Enter(mate)) then
			maze:Log(format("[MAZE ERROR]player(%s) failed to enter maze(%d)", mate:GetName(), maze.m_Id))
			player:Msg2Player(format("真是对不起，组队成员(%s)暂时不能进入剑冢.", mate:GetName()))
		else
			mate:Msg2Player("你和你的队伍已进入剑冢，开始训练.")
			AddStatDataPlayerEnterMazeCount(1)
			MazePermission:ReduceLeftCount(mate)
		end
	end
end

function NpcXiaozhuzhu:OnAnswer(player, sel)
	if (sel == 1) then
		player:Describe(
			"120级以上6-8人组队，每小时的前三十分钟可以到我这里报名，报名后进入副本。进入副本后，你将会被转到剑冢的房间内，只需要完成房间内的任务，你和组队将继续参加接下来的房间，能成功进入最后房间的高手，可以见到玉龙山庄庄主和获得最后试炼资格。如果在剑冢发生事件的房间内战斗受重伤，你可以到万花池治疗，治好后可以返回组队正在进行战斗的房间。每人每次参加将有3次机会进入万花池疗伤。每次参加副本的最多时间为30分钟。祝你幸运。",
			1,
			"Bi誸 r錳/Cancel")
	elseif (sel == 2) then	
		if (player:IsCaptain() == 0) then
			player:Say("只有队长才能引导队伍进入剑冢")
			return
		elseif (self:CheckTeam(player) == 0) then
			return
		elseif (MazeList:CheckCount() == 0) then
			player:Say("打开迷宫的数量已达上限，请稍候再试.")
			return
		end
		local maze = Maze:New()
		if (not maze) then
			player:Say("你参加迷宫已够了，请稍候再试.")
			return
		end
		maze:SetCaptainName(player:GetName())
		self:Enter(player, maze)
	elseif (sel == 3) then
		local count = MazePermission:QueryLeftCount(player)
		if (count <= 0) then
			player:Say("今天你不能进入剑冢试炼了.")
		else
			player:Say(format("今天进入剑冢的累计次数为<color=red>%d<color> 次.", count))
		end
	end
end
function NpcXiaozhuzhu:VnCheckNLPass(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	if CalcItemCount(3, 6, 1, 2623, -1) < 1 then
		PlayerIndex = nOldPlayer
		return 0
	end
	PlayerIndex = nOldPlayer	
	return 1
end
function NpcXiaozhuzhu:VnConsumeNLPass(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	ConsumeItem(3, 1, 6, 1, 2623, -1)
	PlayerIndex = nOldPlayer
end
function NpcXiaozhuzhu:VnGetJoinTotal(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	print("PlayerFunLib:GetTaskDaily(self.tbTSK_JoinTotal)",PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal))
	if PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal) >= 3 then
		PlayerIndex = nOldPlayer
		return 0
	end
	PlayerIndex = nOldPlayer
	return 1
end
function NpcXiaozhuzhu:VnSetJoinTotal(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	PlayerFunLib:AddTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal, 1);
	print("PlayerFunLib:GetTaskDaily(self.tbTSK_JoinTotal)",PlayerFunLib:GetTaskDaily(NpcXiaozhuzhu.tbTSK_JoinTotal))
	PlayerIndex = nOldPlayer
end
function LoadNpc()
	DlgNpcManager:AddNpc("朱军", 1614, 949, 49344, 102720, NpcZhoujun)
	DlgNpcManager:AddNpc("唐宇", 1615, 949, 49408, 101408)
	DlgNpcManager:AddNpc("王兵", 1616, 949, 49152, 101856)
	DlgNpcManager:AddNpc("于净", 1617, 949, 49536, 100576)
	DlgNpcManager:AddNpc("张昭", 1618, 949, 49760, 100576)
	DlgNpcManager:AddNpc("董志", 1619, 949, 49760, 103488)
	DlgNpcManager:AddNpc("小珠珠", 1620, 949, 50880, 100736, NpcXiaozhuzhu)
	DlgNpcManager:AddNpc("柳药师", 1621, 949, 50496, 100608, NpcLiuyaoshi)
	DlgNpcManager:AddNpc("车夫", 238, 949, 51264, 101984, NpcChefu)
end

AutoFunctions:Add(LoadNpc)
