Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")
Include("\\script\\lib\\log.lua")
--VNG_TSK_AWARD_LIMIT_TIME = 2747
--VNG_TSK_EXP_LIMIT_TIME = 2743
tbVngLimitTime = {}

-- Include to call  ITEM_SetExpiredTime - Created by TinhPN - 20110425
IncludeLib("ITEM")
-- ����ս�������
AWARD_BOX = {
	Name = "����ս���",
	ID = {6, 1, 2815, 1},
	RemoteCall = "Protocol:ReduceBox",
}

-- ��Ԫ��¶����
AWARD_DEW = {
	Name = "��Ԫ��¶",
	ID = {6, 1, 2312, 1},
	RemoteCall = "Protocol:ReduceDew",
}

AWARD_GUARD = {
	Name = "�������",
	ID = {6, 1, 2814, 1},
	RemoteCall = "Protocol:ReduceGuardAward",
}

-- ��ѯ������״̬��
QUERY_TABLE = {}

function main()
	Say("���ǹ���ս��Ϣ�ĵط���������ʲô�£�",
		6,
		"����������/GiveTiaoZhanLing",
		"���뿴��ս�������������/ViewTiaoZhanLing",
		"�����μ��߳Ǵ�ս/dlg_signup",
		"���߳Ǵ�սս��/dlg_enter",
		"����߳Ǵ�ս����/dlg_query",
		"����Ҫʲô��?/Cancel")
end

function dlg_signup()
	local state = BattleWorld.m_State
	if (state == STATE_INIT) then
		Say("�߳Ǵ�ս��û��ʼ, �����ĵȴ�.")
	elseif (state == STATE_CLOSESIGNUP) then
		Say("�߳Ǵ�ս�ı���ʱ���Ѿ�����.")
	elseif (state == STATE_PREPARING) then
		Say("�߳Ǵ�ս�Ѿ�����׼���׶Σ����ڲ��ܱ�����")
	elseif (state == STATE_STARTWAR) then
		Say("�߳Ǵ�ս�Ѿ���ʼ�����ܱ�����.")
	elseif (state == STATE_CLOSEWAR) then
		Say("�߳Ǵ�ս����")
	elseif (state == STATE_STARTSIGNUP) then
		Say("�߳Ǵ�ս���뱨���׶�,��λ�����������ﱨ���μӣ��������� <color=red>2000������<color>��<color=red>2000��ս��<color>. \nBang ռ�Ǵ�᲻��Ҫ��������ֱ�ӽ���",
			2,
			"���뱨���μ�/action_signup",
			"���ҿ���һ��/Cancel")
	end
end

function dlg_enter()
	local state = BattleWorld.m_State
	if (state ~= STATE_PREPARING and state ~= STATE_STARTWAR) then
		Say("���ڲ��ܽ���ս��, ���ͨ��.")
	else
		local srcid = SubWorldIdx2ID(SubWorld)
		local dstid = BATTLE_LIST[srcid]
		if (not dstid) then
			WriteLog("[ERROR SEVENCITY]wrong entrance map: %d", srcid)
			Say("�������?Ҫ����ȥ?")
		else
			Say("��ã��μ��߳Ǵ�ս.",
				2,
				format("����%s/#action_enter(%d)", MAP_INFO[dstid].Name, dstid),
				"��ʱ���μ�/Cancel")
		end
	end
end

function dlg_query()
	--Change request 14/06/2011 - Modified by DinhHQ
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H%M"))
	if nWeekDay ~= 5  or nHour < 2145 or nHour > 2350 then
		Talk(1, "", "����<color=red>5<color>, ��<color=red>21h45<color> �� <color=red>23h50<color> ���ǿ���ʱ��, ������Ժ����.")
		return
	end
	
	--Avoid dupe exp award - Modified by DinhHQ - 20110428
	local nTime = GetCurServerTime();
	local name = GetName()
	if tbVngLimitTime[name] then
		local nLastAwardTime = tbVngLimitTime[name]
		local nRestTime =(nTime - nLastAwardTime)
		if nRestTime < 60*2  then
			Talk(1, "", format("ÿ���콱Ҫ���<color=red>2<color> ����. ��λ����<color=red>%d<color> ���������.", (60*2 - nRestTime)))
			return
		end	
	end	
	tbVngLimitTime[name] = nTime
	
	local state = BattleWorld.m_State
	if (state == STATE_PREPARING or state == STATE_STARTWAR) then
		Say("��������ս��֮���ٿ����콱��")
	else
		-- ��ֹ�ظ��콱
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
			player:Say("����û��˵������ط�")
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
		player:Say("�߳Ǵ�ս��Ҳ��û�н���")
		return
	end
	if (info.BoxCount == 0 and info.GuardAwardCount == 0 and info.ExpAward == 0) then
		player:Say("���Ѿ�������������.")
		return
	end
	local caption = format("�㻹��<color=red>%d<color>�������, <color=red>%d<color>���������<color=red>%d<color>δ�쾭�齱�� .",
						info.BoxCount,
						info.GuardAwardCount,
						info.ExpAward)
	local options = {}
	if (info.BoxCount > 0) and (GetName() == GetTongMaster())  then
		tinsert(options, format("�����ù������/#action_awardbox(%d)", info.BoxCount))
	end
	if (info.GuardAwardCount > 0) then
		tinsert(options, format("�������������/#action_guardaward(%d)", info.GuardAwardCount))
	end
	if (info.ExpAward > 0) then
		tinsert(options, format("�����þ��齱��/#action_expaward(%d)", info.ExpAward))
	end
	tinsert(options, "�´λ��/Cancel")
	Say(caption, getn(options), options)
end

function action_expaward(exp)
	--Change request 14/06/2011 - Modified by DinhHQ
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H%M"))
	if nWeekDay ~= 5  or nHour < 2145 or nHour > 2350 then
		Talk(1, "", "����<color=red>5<color>, ��<color=red>21h45<color> �� <color=red>23h50<color> �����콱ʱ��, ������Ժ����.")
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
		Talk(1, "", "ֻ�а���������Ȩ�콱")
		return
	end	
	action_awarditem(count, AWARD_BOX, 50)
end

function action_awarddew(count)
	action_awarditem(count, AWARD_DEW)
end

function action_awarditem(count, award, max_count)
--[DinhHQ]
--20110318:Fix bug �칥��ս���	
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nHour = tonumber(GetLocalDate("%H%M"))
	if nWeekDay ~= 5  or nHour < 2145 or nHour > 2350 then
		Talk(1, "", "����<color=red>5<color>, ��<color=red>21h45<color> �յ�<color=red>23h50<color> �����콱ʱ��,������Ժ����.")
		return
	end
	if (CalcFreeItemCellCount() < 60) then
		Say("װ������Ҫ��<color=red>60<color>��λ�����콱.")
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
		-- ÿ���ܽ�����ֻ���ܵ����50�����������
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
		Say(format("����<color=red>%d<color> <color=red>%s<color>, ����ȡ.", count, award.Name))
	else
		Say(format("�Ѿ���ȡ <color=red>%d<color> <color=red>%s<color>, ������װ����ȡʣ������� <color=red>%d<color> %s.",
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
