Include("\\script\\lib\\player.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\global\\login_head.lua")
Include("\\script\\trip\\define.lua")

MAXOFFLINETIME_EVERYDAY = 18		-- ÿ���������ʱ�䣨Сʱ��

CHOICE_LIST = {}

LIMIT_LIST = {
	MAX_ADVTIME = 1440,
}

AWARDTYPE_FREE 				= 1
AWARDTYPE_SIHAIXIAOYAO 		= 2
AWARDTYPE_WUZHOULINGKONG	= 3
AWARDTYPE_JIUTIANYUNYOU		= 4

PILL_LIST = {
	[AWARDTYPE_SIHAIXIAOYAO] = {
		Name = "�ĺ���ң��",
		Time = 60,	-- ���ĵ�����ʱ�䣨���ӣ�
		ID = {6, 1, 2378, 1},
		CallBack = "apply_usesihaixiaoyao",
		},
	[AWARDTYPE_WUZHOULINGKONG] = {
		Name = "������յ�",
		Time = 60,	-- ���ĵ�����ʱ�䣨���ӣ�
		ID = {6, 1, 2397, 1},
		CallBack = "apply_usewuzhoulingkong",
		},
	[AWARDTYPE_JIUTIANYUNYOU] = {
		Name = "�������ε�",
		Time = 60,	-- ���ĵ�����ʱ�䣨���ӣ�
		ID = {6, 1, 2379, 1},
		CallBack = "apply_usejiutianyunyou",
		}
}

AWARDEXP_LIST = {
	[AWARDTYPE_FREE				] = {15000,	30000,	40000,	40000,	60000,	72000,	86400,	103680},
	[AWARDTYPE_SIHAIXIAOYAO		] = {37500,	75000,	100000,	100000,	150000,	180000,	216000,	259200},
	[AWARDTYPE_WUZHOULINGKONG	] = {50000,	100000,	133333,	133333,	200000,	240000,	288000,	345600},
	[AWARDTYPE_JIUTIANYUNYOU	] = {62500,	125000,	166667,	166667,	250000,	300000,	360000,	432000},
}

OfflineAward = {}

-- ��������ʱ��㣨��ʽΪtime_t��֮�������ʱ�䣨���ӣ���time1 <= time2
function OfflineAward:CalcOfflineTime(time1, time2)
	local t1 = Time2Tm(time1)
	local t2 = Time2Tm(time2)
	local date1 = Tm2Time(t1[1], t1[2], t1[3])
	local date2 = Tm2Time(t2[1], t2[2], t2[3])
	if (date1 > date2) then
		return 0
	end	
	if (date1 == date2) then
		local diff = floor((time2 - time1) / 60)
		if (diff > MAXOFFLINETIME_EVERYDAY * 60) then
			diff = MAXOFFLINETIME_EVERYDAY * 60
		end
		return diff
	end
	local minutes = floor((date2 - date1) * MAXOFFLINETIME_EVERYDAY / (60 * 24))
	if (t1[4] >= (24 - MAXOFFLINETIME_EVERYDAY)) then
		local reduce = floor(t1[4] * 60 + t1[5] - (24 - MAXOFFLINETIME_EVERYDAY) * 60)
		minutes = minutes - reduce
	end
	if (t2[4] >= MAXOFFLINETIME_EVERYDAY) then
		minutes = minutes + floor(MAXOFFLINETIME_EVERYDAY * 60)
	else
		local add = floor(t2[4] * 60 + t2[5])
		minutes = minutes + add
	end
	return minutes
end

function OfflineAward:CheckCondition(player)
	if (player:GetLevel() >= 50 or player:IsTransLife() == 1) then
		return 1
	else
		return 0
	end
end

function OfflineAward:Time2String(t)
	local tb = Time2Tm(t)
	return format("%d/%d/%d-%d/%d/%d", tb[3], tb[2], tb[1], tb[4], tb[5], tb[6])
end

TIME_START = Tm2Time(2014, 2, 28, 0, 0, 0)

function OfflineAward:GetLastOfflineTime(player)
	local time_offline = player:GetLastOfflineTime()
	local time_exchange = player:GetLastExchangeTime()
	if (time_offline < time_exchange) then
		time_offline = time_exchange
	end
---	if (time_offline < TIME_START) then
---		time_offline = TIME_START
---	end
	return time_offline
end

function OfflineAward:Login(player)
	local time_offline = self:GetLastOfflineTime(player)
	local time_login = player:GetLoginTime()
	if (time_login < time_offline) then
		time_login = time_offline
	end
	if (time_offline == 0) then
		time_offline = time_login
	end
	local time = self:CalcOfflineTime(time_offline, time_login)
	if (time > 0) then
		player:SetOfflineLowTime(time)
		if (player:GetOfflineAdvTime() + time > LIMIT_LIST.MAX_ADVTIME) then
			player:SetOfflineAdvTime(LIMIT_LIST.MAX_ADVTIME)
		else
			player:AddOfflineAdvTime(time)
		end
	else
		player:SetOfflineLowTime(0)
	end
	if (OfflineAward:CheckCondition(player) == 1) then
		dlg_offlineaward(player)
	end
end

-- ������Ѿ���
function OfflineAward:CalcExp(type, itr, level, tran_count)
	local tb = AWARDEXP_LIST[type]
	if (itr <= 0 or not tb) then
		return 0
	end
	local index = 1
	if (level >= 151) then
		index = tran_count + 3
	elseif (level >= 131) then
		index = 2
	elseif (level >= 50) then
		index = 1
	else
		return 0
	end
	local exp = tb[index] * itr
	return exp
end

function dlg_menu(player)
	if (OfflineAward:CheckCondition(player) == 1) then
		dlg_offlineaward(player)
	else
		player:Say("<color=red>50������(����50��) <color>�������<color=red>����ת�����������콱.")
	end
end

function dlg_offlineaward(player)
	local time_offline = OfflineAward:GetLastOfflineTime(player)
	local time_login = player:GetLoginTime()
	if (time_login < time_offline) then
		time_login = time_offline
	end
	if (time_offline == 0) then
		time_offline = time_login
	end
	local line1 = format("�ϴ�����: <color=red>%s<color><enter>Ŀǰ��½: <color=red>%s<color>",
					OfflineAward:Time2String(time_offline),
					OfflineAward:Time2String(time_login))

	local itr_offline = floor((time_login - time_offline) / 60)
	local itr_effective_offline = OfflineAward:CalcOfflineTime(time_offline, time_login)
	local line2 = format("����ʱ��: <color=red>%d<color> ���ӣ�����ʱ����Ч: <color=red>%d<color> ����",
						itr_offline,
						itr_effective_offline)

	local level = player:GetLevel()
	local tran_count = player:GetTransLifeCount()
	local exp = OfflineAward:CalcExp(
						AWARDTYPE_FREE,
						itr_effective_offline,
						level,
						tran_count)
	local line3 = format("��ѻ�þ���ֵ <color=red>%d<color> (ע�⣺ת��ͼ����ʧȥ)", exp)

	local itr_advtime = player:GetOfflineAdvTime()
	local line4 = format("������������ <color=red>%d<color> ���ӣ�����ʹ���ɵ�����ȡ����:", itr_advtime)
	
	local exp_format = "ʹ�� %s ��� <color=red>%.0f<color>����."
	local line5 = format(exp_format,
						PILL_LIST[AWARDTYPE_SIHAIXIAOYAO].Name,
						OfflineAward:CalcExp(AWARDTYPE_SIHAIXIAOYAO, itr_advtime, level, tran_count))

	local line6 = format(exp_format,
						PILL_LIST[AWARDTYPE_WUZHOULINGKONG].Name,
						OfflineAward:CalcExp(AWARDTYPE_WUZHOULINGKONG, itr_advtime, level, tran_count))

	local line7 = format(exp_format,
						PILL_LIST[AWARDTYPE_JIUTIANYUNYOU].Name,
						OfflineAward:CalcExp(AWARDTYPE_JIUTIANYUNYOU, itr_advtime, level, tran_count))

	local caption = format("%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s<enter>%s",
						line1,
						line2,
						line3,
						line4,
						line5,
						line6,
						line7)
	local option = "ʹ��%s/#action_usepill(%d)"
	player:Describe(caption, 5,
		"��ѻ�þ��齱/action_takefreeexp",
		format(option, PILL_LIST[AWARDTYPE_SIHAIXIAOYAO].Name, AWARDTYPE_SIHAIXIAOYAO),
		format(option, PILL_LIST[AWARDTYPE_WUZHOULINGKONG].Name, AWARDTYPE_WUZHOULINGKONG),
		format(option, PILL_LIST[AWARDTYPE_JIUTIANYUNYOU].Name, AWARDTYPE_JIUTIANYUNYOU),
		"�ر�/Cancel")
end

function action_takefreeexp()
	local player = Player:New(PlayerIndex)
	if (OfflineAward:CheckCondition(player) == 0) then
		player:Say("�������콱����")
		return
	end
	local lowtime = player:GetOfflineLowTime()
	if (lowtime <= 0) then
		player:Say("��ʹ��������ʱ��.")
		return
	end
	local exp = OfflineAward:CalcExp(
					AWARDTYPE_FREE,
					lowtime,
					player:GetLevel(),
					player:GetTransLifeCount())
	player:StackExp(exp)
	player:ClearOfflineLowTime()
end

function action_usepill(type)
	local inf = PILL_LIST[type]
	if (not inf) then
		return
	end
	local player = Player:New(PlayerIndex)
	if (OfflineAward:CheckCondition(player) == 0) then
		player:Say("�������콱����")
		return
	end
	local advtime = player:GetOfflineAdvTime()
	local item_count = player:CalcEquiproomItemCount(
							inf.ID[1],
							inf.ID[2],
							inf.ID[3],
							inf.ID[4])
	local caption = format("����ʱ��: <color=red>%d<color> ����<enter>%s: <color=red>%d<color>",
							advtime,
							inf.Name,
							item_count)
	CHOICE_LIST[PlayerIndex] = {type, advtime, item_count}
	player:Say(caption,
		2,
		"ͬ��/confirm_usepill",
		"�˳�/Cancel")
end

function confirm_usepill()
	local tb = CHOICE_LIST[PlayerIndex]
	if (not tb) then
		return
	end
	local type = tb[1]
	local advtime = tb[2]
	local item_count = tb[3]
	local inf = PILL_LIST[type]
	if (not inf) then
		return
	end
	if (item_count == 0) then
		Say(format("���µ�װ��û��<color=red>%s<color>.", inf.Name))
		return
	elseif (advtime < inf.Time) then
		Say(format("ʹ��1 <color=red>%s<color> ��Ҫ <color=red>%d ��<color> ����ʱ�䣬�������ʱ�䲻��.",
			inf.Name,
			inf.Time))
		return
	end
	local count = floor(advtime / inf.Time)
	if (count > item_count) then
		count = item_count
	end
	--ʹ�þ������ε���������Ϊ99�� - Modified by DinhHQ - 20111110 
	AskClientForNumber(inf.CallBack, 1, 99, "ʹ�ô���")
end

function apply_usepill(player, type, count)
--ʹ�þ������ε���������Ϊ99�� - Modified by DinhHQ - 20111110 
if count > 99 then
	Talk(1, "", "�����������Ϊ99.")
	return
end
	local inf = PILL_LIST[type]
	if (not inf or count <= 0) then
		return
	end
	local advtime = player:GetOfflineAdvTime()
	local item_count = player:CalcEquiproomItemCount(
							inf.ID[1],
							inf.ID[2],
							inf.ID[3],
							inf.ID[4])
	if (advtime < count * inf.Time or item_count < count) then
		return
	end
	if (player:ConsumeEquiproomItem(count, inf.ID[1], inf.ID[2], inf.ID[3], inf.ID[4]) ~= 1) then
		WriteLog(format(
			"[ERROR OFFLINEAWARD]failed to consume %s: player(%s), count(%d)",
			inf.Name,
			player:GetName(),
			count))
		return
	end
	local use_time = inf.Time * count
	local exp = OfflineAward:CalcExp(type, use_time, player:GetLevel(), player:GetTransLifeCount())
	player:StackExp(exp)
	player:ReduceOfflineAdvTime(use_time)
	WriteLog(format("[OFFLINEAWARD]%s(%s) use %s(%d), get exp(%d)",
		player:GetAccount(),
		player:GetName(),
		inf.Name,
		count,
		exp))
end

function apply_usesihaixiaoyao(count)
	local player = Player:New(PlayerIndex)
	apply_usepill(player, AWARDTYPE_SIHAIXIAOYAO, count)
end

function apply_usewuzhoulingkong(count)
	local player = Player:New(PlayerIndex)
	apply_usepill(player, AWARDTYPE_WUZHOULINGKONG, count)
end

function apply_usejiutianyunyou(count)
	local player = Player:New(PlayerIndex)
	apply_usepill(player, AWARDTYPE_JIUTIANYUNYOU, count)
end

function login(playerindex, exchange)
	local player = Player:New(playerindex)
	if (exchange == 0) then
		OfflineAward:Login(player)
	else
		player:SetOfflineLowTime(0)
	end
	CHOICE_LIST[playerindex] = nil
end

function logout(playerindex)
	CHOICE_LIST[playerindex] = nil
end

if GetTripMode() ~= TRIP_MODE_SERVER then
	AddLoginFileFunction("\\script\\global\\offlineaward.lua", "login")
end
