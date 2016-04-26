--Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\global\\judgeoffline_limit.lua")
Include("\\script\\lib\\pay.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\VuonCaySinhNhat\\vng_award.lua")

SCRIPT_TREE = "\\script\\vng_event\\VuonCaySinhNhat\\tree.lua"
LOG_HEAD = "VuonCaySinhNhat"
tbTaskInfo = 
	{
		nTaskID = 2754,
		nStartBit = 14,
		nBitCount = 13,
		nMaxValue = 1500,
	}
tbTreeMap = {
	20,		
	53,		
	174,
	121,
	153,
	101,
	99,
	100,
	1,		
	11,	
	37,	
	78,	
	80,
	162,
	176,
}

tbTreeName = {
	[1] = "千岁平安",
	[2] = "千岁幸福",
	[3] = "千岁兴旺",
	[4] = "千岁财禄",
	[5] = "千岁千年",
	[6] = "千岁幸运",
	[7] = "千岁月神",
	[8] = "千岁不死",
	[9] = "千岁黄金",
	[10] = "千岁白金",
}
tbTreeRate = {
	[1] = 50,
	[2] = 30,
	[3] = 13.09,
	[4] = 3,
	[5] = 2,
	[6] = 1,
	[7] = 0.5,
	[8] = 0.14,
	[9] = 0.07,
	[10] = 0.2,
}


tbTreeList = {}
tbSeed = {}
tbTree = {}
tbTeam = {}
tbMaintainState = {}
tbAwardState = {}
tbShowState = {}

function clone(obj)
	local otype = type(obj)
	if (otype == "number") then
		return obj
	elseif (otype == "string") then
		local ret = obj
		return ret
	elseif (otype == "nil") then
		return obj
	elseif (otype == "table") then
		local ret = {}
		for key, val in obj do
			ret[clone(key)] = clone(val)
		end
		return ret
	else
		return obj
	end
end

function dialog_tree()
	local npc = GetLastDialogNpc()
	local tree = tbTreeList[npc]
	if (tree) then
		tree:Dialog()
	end
end

function select_tree()
	local npc = GetLastDlgNpc()
	if (npc > 0) then
		local tree = tbTreeList[npc]
		if (tree) then
			tree:Select()
		end
	end
end

function ontime(npcidx)
	local tree = tbTreeList[npcidx]
	if (tree) then
		return tree:Upgrade()
	else
		return 0, 0
	end
end

function tbSeed:InMapList(MapList)
	local MapId, _, _ = GetWorldPos()
	for i = 1, getn(MapList) do
		if (MapId == MapList[i]) then
			return 1
		end
	end
	return 0
end

-- DEBUG
function getplantcount()
	return tbSeed:GetPlantCount()
end

function setplantcount(Count)
	tbSeed:SetPlantCount(Count)
end

function addplantcount()
	tbSeed:AddPlantCount()
end
--整个活动中已使用的树的总数
function tbSeed:GetPlantCount()
	return  tbVNG_BitTask_Lib:getBitTask(tbTaskInfo)
end

function tbSeed:AddPlantCount()
	tbVNG_BitTask_Lib:addTask(tbTaskInfo, 1)
end

---- DEBUG
--function tbSeed:SetPlantCount(Count)
--	local curr_date = tonumber(GetLocalDate("%y%m%d"))
--	TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_DATE, curr_date)
--	TaskManager:SetTask(TASKGROUP_WINTERSWEET, TASKINDEX_COUNT, Count)
--end

function tbSeed:Check()
	if (tbSeed:InMapList(tbTreeMap) == 0 or GetFightState() == 1) then
		Say("只能在城市非战斗区和农村种千岁树!")
		return 0
	end

	if (offlineCheckPermitRegion() == 0) then
		Say("不能在车夫附近以及人多的地方种树")
		return 0
	end
		local mate_name = GetName()
		if (IsCharged() == 0) then
			PlayerIndex = player
			Say(format("%s 不死充值账号", mate_name))
			return 0
		elseif (GetLevel() < 50) then
			Say(format("人物 %s 不足50级!", mate_name))
			return 0
--		elseif (tbSeed:GetPlantCount() >= 4) then
--			Say(format("今天%s 已经参加够4次了!", mate_name))
--			return 0
		elseif (tbVNG_BitTask_Lib:isMaxBitTaskValue(tbTaskInfo) == 1) then
			Talk(1, "", "种树已达上限，不能再种了")
			return 0
		end
	return 1
end

function tbSeed:RandomKind()
	local num = floor(random(1, 10000))
	local sum = 0
	local count = getn(tbTreeRate)
	for i = 1, count do
		sum = floor(sum + tbTreeRate[i]*100)
		if (num <= sum) then
			return i
		end
	end	
	return count
end

function tbSeed:Grow(Kind)
	local self_name = GetName()
	local members = {self_name}
	local tree = tbTree:New(Kind, members)
	if (not tree) then
		tbLog:PlayerActionLog(LOG_HEAD,"TrongCayThatBai")
		return 0
	end	
	tbSeed:AddPlantCount()
	if (Kind == 7 or Kind == 8 or Kind == 9 or Kind == 10) then
		local handle = OB_Create()
		local msg = format("恭喜高手 <color=yellow>%s<color> 已成功种<color=yellow>%s<color>!", GetName(), tbTreeName[Kind])
		local _, nTongID = GetTongName()
		Msg2Tong(nTongID, msg)
		ObjBuffer:PushObject(handle, msg)
		RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
		OB_Release(handle)
	end
	tbLog:PlayerActionLog(LOG_HEAD,"TrongCayThanhCong", tree.Name)
	return 1
end

function tbTeam:New(Members)
	local tb = clone(tbTeam)
	tb.MemberList = Members
	tb.Score = 0
	return tb
end

function tbTeam:FindMember(Name)
	for i = 1, getn(self.MemberList) do
		if (self.MemberList[i] == Name) then
			return 1
		end
	end
	return 0
end

function tbTeam:BroadCast(Msg)
	local player = PlayerIndex
	for i = 1, getn(self.MemberList) do
		local member = SearchPlayer(self.MemberList[i])
		if (member > 0) then
			PlayerIndex = member
			Msg2Player(Msg)
		end
	end
	PlayerIndex = player
end

function tbTree:New(Kind, Members)
	local tb = clone(tbTree)
	tb.Team = tbTeam:New(Members)
	local pos = {}
	pos[1] = SubWorld
	_, pos[2], pos[3] = GetWorldPos()
	pos[2] = pos[2] * 32
	pos[3] = pos[3] * 32
	tb.Pos = pos
	tb.Kind = Kind
	tb.Name = format("%s[%s]", tbTreeName[Kind], GetName())
	tb.Npc = AddNpc(tbMaintainInfo[1].Npc, 1, pos[1], pos[2], pos[3], 1, tb.Name)
	if (tb.Npc > 0) then
		SetNpcScript(tb.Npc, SCRIPT_TREE)
		tbLog:PlayerActionLog(LOG_HEAD, "种树成功", tb.Name, pos[1]..", "..pos[2]..", "..pos[3])	
	else
		tbLog:PlayerActionLog(LOG_HEAD, "种树失败", tb.Name)
		return nil
	end

	local state = tbMaintainState:New(tb)
	--state:NotifyTeam(tb.Team)
	tb.State = state

	tbTreeList[tb.Npc] = tb
	-- 加入定时器
	AddTimer(state.Timeout * 18, "ontime", tb.Npc)
	return tb
end

function tbTree:Dialog()
	local name = GetName()
	if (self.Team:FindMember(name) == 0) then
		Say("这不是阁下的千岁树")
	else
		self.State:Dialog()
	end
end

function tbTree:Select()
	local name = GetName()
	if (self.Team:FindMember(name) == 1) then
		self.State:Process(self, self.Team, name)
	end
end

function tbTree:Upgrade()
	local oldnpc = self.Npc	
	local state = self.State:NextState(self, self.Team)
	if (not state) then
		DelNpc(self.Npc)		
		if self.State.nDidGetAward == 1 then --已领奖
		WriteLog(format("%s\t%s\tCayBienMatDaNhanThuong\t%s\t%s",			
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			LOG_HEAD,
			self.Name,
			self.State.strName))
		else			
			WriteLog(format("%s\t%s\tCayBienMatChuaNhanThuong\t%s\t%s",			
			GetLocalDate("%Y-%m-%d %H:%M:%S"),
			LOG_HEAD,
			self.Name,
			self.State.strName))
		end
		tbTreeList[self.Npc] = nil
		return 0, 0
	else
		state:NotifyTeam(self.Team)
		self.State = state
		local newnpc = self.Npc
		if (oldnpc ~= newnpc) then
			tbTreeList[oldnpc] = nil
			tbTreeList[newnpc] = self
		end
		return state.Timeout * 18, self.Npc
	end
end

tbMaintainInfo = {
	[1] = {
		Dlg = "给千岁树施肥",
		Msg = "请给千岁树施肥",
		Err = "大侠已经给树施肥了",
		Npc = 1529,
		},
	[2] = {
		Dlg = "给千岁树浇水",
		Msg = "请给千岁树浇水",
		Err = "大侠已经给树浇水了.",
		Npc = 1530,
		},
	[3] = {
		Dlg = "给树除草 ",
		Msg = "请给树除草 ",
		Err = "大侠已经给树除草了",
		Npc = 1531,
		},
--	[4] = {
--		Dlg = "给树除虫 ",
--		Msg = "请给树除虫 ",
--		Err = "大侠给树除虫了",
--		Npc = 1532,
--		},
	[4] = {
		Dlg = "给树修叶 ",
		Msg = "请给树修叶 ",
		Err = "大侠给树修叶了",
		Npc = {[1] = 1552, [2] = 1554, [3] = 1553, [4] = 1550, [5] = 1555, [6] = 1555, [7] = 1551, [8] = 1551, [9] = 1452, [10] = 1453,},
		}
}

function tbMaintainState:New(Tree)
	local tb = clone(tbMaintainState)
	tb.Turn = 1
	tb.Step = 1
	tb.OpFlag = {}
	tb.Time = tbMaintainState:Now()
	tb.Timeout = 30
	--print(format("[%s]Tree[%d] begin to maintain",
--		GetLocalDate("%Y-%m-%d %H:%M:%S"),
--		Tree.Npc))
	return tb
end

function tbMaintainState:Dialog()
	Say("这是一棵很美的千年树",
		1,
--		format("%s/select_tree", tbMaintainInfo[self.Step].Dlg),
		"我只来玩/Cancel")
end

function tbMaintainState:NotifyTeam(Team)
--	local msg = tbMaintainInfo[self.Step].Msg
--	Team:BroadCast(msg)
end

function tbMaintainState:Now()
	return GetLocalTime()
end

function tbMaintainState:CaculateScore(Seconds)
	if (Seconds >= 46) then
		return 2
	elseif (Seconds >= 36) then
		return 4
	elseif (Seconds >= 26) then
		return 5
	elseif (Seconds >= 16) then
		return 3
	else
		return 1
	end
end

function tbMaintainState:Process(Tree, Team, Name)
--	if (PlayerFunLib:CheckItemInBag({tbProp={6,1,2348,1,-1,0}},1,"需要%d 玄天锤，大侠带的数量不够!") ~= 1) then
--		return
--	end
	
	if (Team.MemberList[self.Turn] ~= Name) then
		Say("依然还未轮到你，请再等一下")
		return
	elseif (self.OpFlag[Name] == 1) then
		Say(tbMaintainInfo[self.Step].Err)
		return
	end
	self.OpFlag[Name] = 1
	local current = tbMaintainState:Now()
	
--	PlayerFunLib:ConsumeEquiproomItem({tbProp={6,1,2348,1,-1,0},},1)
	-- LOG
	WriteLog(format("[%s %s]%s maintain Tree[%d]",
		LOG_HEAD,
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Name,
		Tree.Npc))
	-- 给队伍加分
	local add = tbMaintainState:CaculateScore(current - self.Time)
	Team.Score = Team.Score + add
	local msg = format("获得 %d 点，目前总分为 %d!", add, Team.Score)
	Team:BroadCast(msg)
	-- LOG
	WriteLog(format("[%s %s]Tree[%d] add score(%d), total(%d)",
		LOG_HEAD,
		GetLocalDate("%Y-%m-%d %H:%M:%S"),
		Tree.Npc,
		add,
		Team.Score))
end

function tbMaintainState:NextState(Tree, Team)
	if (self.Step >= 4) then
		return tbAwardState:New()
	else
		self.OpFlag = {}
		self.Time = tbMaintainState:Now()
		self.Step = self.Step + 1
		local count = getn(Team.MemberList)
		self.Turn = mod(self.Turn, count) + 1
		DelNpc(Tree.Npc)
		local nNpcID = 0
		if self.Step == 4 then
			nNpcID = tbMaintainInfo[self.Step].Npc[Tree.Kind]
		else
			nNpcID = tbMaintainInfo[self.Step].Npc
		end
		local npc = AddNpc(nNpcID, 1, Tree.Pos[1], Tree.Pos[2], Tree.Pos[3], 1, Tree.Name)
		if (npc > 0) then
			WriteLog(format("[%s %s]Tree[%d] upgrade to Tree[%d]",
				LOG_HEAD,
				GetLocalDate("%Y-%m-%d %H:%M:%S"),
				Tree.Npc,
				npc))
			SetNpcScript(npc, SCRIPT_TREE)
			Tree.Npc = npc
		end
		return self
	end
end

function tbAwardState:New()
	local tb = clone(tbAwardState)
	tb.AwardFlag = {}
	tb.Timeout = 120
	return tb
end

function tbAwardState:Dialog()
--	Say("这是一棵很美的千年树",
--		2,
--		"我想领奖/select_tree",
--		"我只来玩/Cancel")
	if CalcFreeItemCellCount() <= 0 then
		Talk(1, "", "请留下一个空位后才能领奖")
		return
	end
	select_tree()
end

function tbAwardState:Process(Tree, Team, Name)
	if (self.AwardFlag[Name] == 1) then
		Say("大侠已领奖 了")
		return
	end
	
	local tbAward = tbAwardState:GetAward(Tree.Kind)	
	if tbAward then
		self.AwardFlag[Name] = 1
		tbAwardTemplet:Give(tbAward, 1, {"VuonCaySinhNhat", "NhanPhanThuong["..tbTreeName[Tree.Kind].."]"})
	end
--	if (exp > 0) then
--		AddOwnExp(exp)
--		Team:BroadCast(format("%s 已获得经验奖励为%d!", Name, exp))
--	else
--		Say("真是遗憾，大侠没有奖励。请努力哦!")
--	end
--	self.AwardFlag[Name] = 1
end

function tbAwardState:GetAward(kind)
	return tbAwardList[kind]
end

function tbAwardState:NotifyTeam(Team)
	Team:BroadCast("<color=green>恭喜大侠已种得美丽的千岁树，请快点来领奖.<color>")
end

function tbAwardState:NextState(Tree, Team)
	local tb = tbShowState:New()
	local strName = Team.MemberList[1]
	tb.strName = strName
	if self.AwardFlag and self.AwardFlag[strName] then
		tb.nDidGetAward = self.AwardFlag[strName]
	else 
		tb.nDidGetAward = 0
	end
	return tb
end

function tbShowState:New()
	local tb = clone(tbShowState)
	tb.Timeout = 3
	return tb
end

function tbShowState:Dialog()
	Say("这是一棵很美的千年树")
end

function tbShowState:Process(Tree, Team, Name)
	-- Do nothing
end

function tbShowState:NotifyTeam(Team)
	Team:BroadCast("领奖时间结束")
end

function tbShowState:NextState(Tree, Team)
	return nil
end