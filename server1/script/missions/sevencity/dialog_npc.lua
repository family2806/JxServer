Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")
Include("\\script\\lib\\log.lua")
--VNG_TSK_AWARD_LIMIT_TIME = 2747
--VNG_TSK_EXP_LIMIT_TIME = 2743
tbVngLimitTime = {}

-- Include to call  ITEM_SetExpiredTime - Created by TinhPN - 20110425
IncludeLib("ITEM")
-- 攻城战礼包奖励
AWARD_BOX = {
	Name = "攻城战礼包",
	ID = {6, 1, 2815, 1},
	RemoteCall = "Protocol:ReduceBox",
}

-- 混元灵露奖励
AWARD_DEW = {
	Name = "混元灵露",
	ID = {6, 1, 2312, 1},
	RemoteCall = "Protocol:ReduceDew",
}

AWARD_GUARD = {
	Name = "卫主礼包",
	ID = {6, 1, 2814, 1},
	RemoteCall = "Protocol:ReduceGuardAward",
}

-- 查询奖励的状态表
QUERY_TABLE = {}

function main()
	Say("这是攻城战休息的地方，你来有什么事？",
		6,
		"我来交令牌/GiveTiaoZhanLing",
		"我想看挑战赛公布版的人数/ViewTiaoZhanLing",
		"报名参加七城大战/dlg_signup",
		"进七城大战战场/dlg_enter",
		"获得七城大战奖励/dlg_query",
		"不需要什么了?/Cancel")
end

function dlg_signup()
	local state = BattleWorld.m_State
	if (state == STATE_INIT) then
		Say("七城大战还没开始, 请耐心等待.")
	elseif (state == STATE_CLOSESIGNUP) then
		Say("七城大战的报名时间已经结束.")
	elseif (state == STATE_PREPARING) then
		Say("七城大战已经进入准备阶段，现在不能报名了")
	elseif (state == STATE_STARTWAR) then
		Say("七城大战已经开始，不能报名了.")
	elseif (state == STATE_CLOSEWAR) then
		Say("七城大战结束")
	elseif (state == STATE_STARTSIGNUP) then
		Say("七城大战进入报名阶段,诸位帮主代表整帮报名参加，报名费用 <color=red>2000万银两<color>和<color=red>2000挑战令<color>. \nBang 占城大会不需要报名就能直接进入",
			2,
			"我想报名参加/action_signup",
			"让我考虑一下/Cancel")
	end
end

function dlg_enter()
	local state = BattleWorld.m_State
	if (state ~= STATE_PREPARING and state ~= STATE_STARTWAR) then
		Say("现在不能进入战场, 请等通报.")
	else
		local srcid = SubWorldIdx2ID(SubWorld)
		local dstid = BATTLE_LIST[srcid]
		if (not dstid) then
			WriteLog("[ERROR SEVENCITY]wrong entrance map: %d", srcid)
			Say("你从哪来?要到哪去?")
		else
			Say("你好，参加七城大战.",
				2,
				format("进入%s/#action_enter(%d)", MAP_INFO[dstid].Name, dstid),
				"暂时不参加/Cancel")
		end
	end
end

function dlg_query()
	--Change request 14/06/2011 - Modified by DinhHQ
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H%M"))
	if nWeekDay ~= 5  or nHour < 2145 or nHour > 2350 then
		Talk(1, "", "星期<color=red>5<color>, 从<color=red>21h45<color> 到 <color=red>23h50<color> 才是开场时间, 请大侠稍后回来.")
		return
	end
	
	--Avoid dupe exp award - Modified by DinhHQ - 20110428
	local nTime = GetCurServerTime();
	local name = GetName()
	if tbVngLimitTime[name] then
		local nLastAwardTime = tbVngLimitTime[name]
		local nRestTime =(nTime - nLastAwardTime)
		if nRestTime < 60*2  then
			Talk(1, "", format("每次领奖要相隔<color=red>2<color> 分钟. 这位大侠<color=red>%d<color> 秒后再重试.", (60*2 - nRestTime)))
			return
		end	
	end	
	tbVngLimitTime[name] = nTime
	
	local state = BattleWorld.m_State
	if (state == STATE_PREPARING or state == STATE_STARTWAR) then
		Say("请先重视战事之后再考虑领奖励")
	else
		-- 防止重复领奖
		if (QUERY_TABLE[name] ~= nil) then
			return
		end
		QUERY_TABLE[name] = PlayerIndex
		local buff = ObjBuffer:New()
		buff:Push(name)
		RemoteExecute(
			REMOTE_SCRIPT,
			"Protocol:QueryAward",
			buff.m_Handle,
			"process_award")
		buff:Destroy()
	end
end

function action_signup()
	local player = Player:New(PlayerIndex)
	local err = {}
	if (BattleWorld:Signup(player, err) == 0) then
		player:Say(err.Msg)
	end
	tbLog:PlayerActionLog("TinhNangKey","BaoDanhThatThanhDaiChien")
end

function action_enter(mapid)
	local player = Player:New(PlayerIndex)
	local err = {}
	if (BattleWorld:CheckPermission(mapid, player, err) == 0) then
		player:Say(err.Msg)
	else
		local field = BattleWorld:FindField(mapid)
		if (not field) then
			player:Say("从来没听说过这个地方")
			BattleWorld:Log(format("[ERROR SEVENCITY]field(%d) not found", mapid))
		elseif (field:Login(player) == 0) then
			BattleWorld:Log(format("[ERROR SEVENCITY]failed to login field(%d)", mapid))
		end
	end
end

function process_award(param, result)
	local buff = ObjBuffer:New(result)
	local name = buff:Pop()
	local info = buff:Pop()
	buff:Destroy()
	local nPlayerIndex = QUERY_TABLE[name]
	QUERY_TABLE[name] = nil
	if (nPlayerIndex ~= PlayerIndex) then
		return
	end
	local index = SearchPlayer(name)
	if (index <= 0) then
		return
	end
	local player = Player:New(index)
	if (not info or GetName() ~= name) then
		player:Say("七城大战你也还没有奖励")
		return
	end
	if (info.BoxCount == 0 and info.GuardAwardCount == 0 and info.ExpAward == 0) then
		player:Say("你已经获得这个奖励了.")
		return
	end
	local caption = format("你还有<color=red>%d<color>攻城礼包, <color=red>%d<color>卫主礼包和<color=red>%d<color>未领经验奖励 .",
						info.BoxCount,
						info.GuardAwardCount,
						info.ExpAward)
	local options = {}
	if (info.BoxCount > 0) and (GetName() == GetTongMaster())  then
		tinsert(options, format("我想获得攻城礼包/#action_awardbox(%d)", info.BoxCount))
	end
	if (info.GuardAwardCount > 0) then
		tinsert(options, format("我想获得卫主礼包/#action_guardaward(%d)", info.GuardAwardCount))
	end
	if (info.ExpAward > 0) then
		tinsert(options, format("我想获得经验奖励/#action_expaward(%d)", info.ExpAward))
	end
	tinsert(options, "下次获得/Cancel")
	Say(caption, getn(options), options)
end

function action_expaward(exp)
	--Change request 14/06/2011 - Modified by DinhHQ
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H%M"))
	if nWeekDay ~= 5  or nHour < 2145 or nHour > 2350 then
		Talk(1, "", "星期<color=red>5<color>, 从<color=red>21h45<color> 到 <color=red>23h50<color> 才是领奖时间, 请大侠稍后归来.")
		return
	end
	StackExp(exp)
	local buff = ObjBuffer:New()
	buff:Push(GetName())
	RemoteExecute(REMOTE_SCRIPT, "Protocol:ClearExpAward", buff.m_Handle)
	buff:Destroy()
	tbLog:PlayerActionLog("SEVENCITY", "PhanThuongExp", exp)
end

function action_guardaward(count)
	action_awarditem(count, AWARD_GUARD)
end

function action_awardbox(count)
	if GetName() ~= GetTongMaster() then
		Talk(1, "", "只有帮主才能有权领奖")
		return
	end	
	action_awarditem(count, AWARD_BOX, 50)
end

function action_awarddew(count)
	action_awarditem(count, AWARD_DEW)
end

function action_awarditem(count, award, max_count)
--[DinhHQ]
--20110318:Fix bug 领攻城战礼包	
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H%M"))
	if nWeekDay ~= 5  or nHour < 2145 or nHour > 2350 then
		Talk(1, "", "星期<color=red>5<color>, 从<color=red>21h45<color> 到<color=red>23h50<color> 才是领奖时间,请大侠稍后归来.")
		return
	end
	if (CalcFreeItemCellCount() < 60) then
		Say("装备至少要有<color=red>60<color>空位才能领奖.")
		return
	end
	local actual_count = 0
	for i = 1, count do
		-- add expired time to city and guard award item - Created by TinhPN - 20110421
		--if (AddItemIntoEquipmentBox(award.ID[1], award.ID[2], award.ID[3], award.ID[4], 0, 0) > 0) then
		local nItemIndex = AddItemIntoEquipmentBox(award.ID[1], award.ID[2], award.ID[3], award.ID[4], 0, 0)
		if (nItemIndex > 0) then
			-- add expired time to city and guard award item - Created by TinhPN - 20110421
			if (award.ID[3] == 2815 or award.ID[3] == 2814) then
				ITEM_SetExpiredTime(nItemIndex, 43200)
				SyncItem(nItemIndex)
			end	
			
			actual_count = actual_count + 1
		else
			break
		end
		-- 每次受奖帮主只能受到最多50【攻城礼包】
		if (max_count ~= nil and actual_count >= max_count) then
			break
		end
	end
	local buff = ObjBuffer:New()
	buff:Push(GetName())
	buff:Push(actual_count)
	RemoteExecute(REMOTE_SCRIPT, award.RemoteCall, buff.m_Handle)
	buff:Destroy()
	if (actual_count == count) then
		Say(format("这是<color=red>%d<color> <color=red>%s<color>, 请领取.", count, award.Name))
	else
		Say(format("已经领取 <color=red>%d<color> <color=red>%s<color>, 请整理装备领取剩余的数量 <color=red>%d<color> %s.",
			actual_count,
			award.Name,
			count - actual_count,
			award.Name))
	end
	--WriteLog(format("[SEVENCITY]%s take award: %s(%d)", GetName(), "Ten Bang: "..strTongName, "ID Bang: "..nTongID,award.Name, actual_count))
	tbLog:PlayerActionLog("SEVENCITY", "PhanThuongItem", award.Name, actual_count)
end

function add_dew(name, count)
	add_award("Protocol:AddDew", name, count)
end

function add_box(name, count)
	add_award("Protocol:AddBox", name, count)
end

function add_award(call, name, count)
	local buff = ObjBuffer:New()
	buff:Push(name)
	buff:Push(count)
	RemoteExecute(REMOTE_SCRIPT, call, buff.m_Handle)
	buff:Destroy()
end
