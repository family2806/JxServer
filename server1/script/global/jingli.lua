-- ����ʯϵͳ wangbin 2010-4-7
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\global\\playerlist.lua")

MAXCOUNT_EVERYDAY				= 30						-- ÿ��������¶�Ĵ�������
MIN_LEVEL						= 90
TIMEOUT_REFINING				= 30					-- ����һ����Ԫ��¶��Ҫ��ʱ�䣨���ӣ�
TOTALENERGY_LIMIT_PERMONTH		= 8000000					-- ÿ�������ֻ������80000�ľ���ʯ
POTION_ENERGY					= 100					-- ʹ�û�Ԫ��¶�ɻ�õľ���ʯֵ
ITEM_YUGUAN						= {6, 1, 2311, 1, 0, 0}	-- ���
ITEM_HUNYUANLINGLU 				= {6, 1, 2312, 1, 0, 0}	-- ��Ԫ��¶
TASK_HUNYUANLINGLU_STARTDATE	= 2673					-- �������������� * 1000000 + ��Ԫ��¶��ʼ�������ڣ�YYMMDD��
TASK_HUNYUANLINGLU_REFINING		= 2674					-- ��Ԫ��¶����������� * 100000 + �Ƿ��������� * 10000 + ��Ԫ��¶�ۼ�����ʱ�䣨���ӣ�
TASK_HUNYUANLINGLU_USEDATE		= 2675					-- ��һ��ʹ�û�Ԫ��¶�����ڣ�YYYYMMDD��
TASK_HUNYUANLINGLU_TOTALENERGY	= 2676					-- ��ǰʹ�û�Ԫ��¶�����˶��پ���ʯ
TASK_REFININGCOUNT				= 2793					-- �������Ļ�Ԫ��¶��Ŀ

HunyuanPotion = {}

function HunyuanPotion:New(player)
	local tb = clone(HunyuanPotion)
	tb.m_Player = player
	return tb
end

function HunyuanPotion:EncodeDateTask(count, date)
	local task = count * 1000000 + date
	self.m_Player:SetTask(TASK_HUNYUANLINGLU_STARTDATE, task)
end

function HunyuanPotion:DecodeDateTask()
	local task = self.m_Player:GetTask(TASK_HUNYUANLINGLU_STARTDATE)
	local count = floor(task / 1000000)
	local time = mod(task, 1000000)
	return count, time
end

function HunyuanPotion:EncodeRefiningTask(count, flag, time)
	local task = count * 100000 + flag * 10000 + time
	self.m_Player:SetTask(TASK_HUNYUANLINGLU_REFINING, task)
end

function HunyuanPotion:DecodeRefiningTask()
	local task = self.m_Player:GetTask(TASK_HUNYUANLINGLU_REFINING)
	local count = floor(task / 100000)
	local left = mod(task, 100000)
	local flag = floor(left / 10000)
	local time = mod(left, 10000)
	return count, flag, time
end

-- ��ѯ�Ƿ���������
function HunyuanPotion:GetRefiningFlag()
	local _, flag, _ = self:DecodeRefiningTask()
	return flag
end

-- �����Ƿ���������
function HunyuanPotion:SetRefiningFlag(flag)
	local count, _, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(count, flag, time)
end

-- ��ѯ��������������
function HunyuanPotion:GetCurrentDateRefineCount(curr_date)
	if (not curr_date) then
		curr_date = tonumber(GetLocalDate("%y%m%d"))
	end
	local count, date = self:DecodeDateTask()
	if (curr_date ~= date) then
		return 0
	else
		return count
	end
end

-- �����������������
function HunyuanPotion:ClearCurrentDateRefineCount()
	local _, date = self:DecodeDateTask()
	self:EncodeDateTask(0, date)
end

-- ���ӽ�������������
function HunyuanPotion:AddCurrentDateRefineCount(curr_date)
	if (not curr_date) then
		curr_date = tonumber(GetLocalDate("%y%m%d"))
	end
	local count, date = self:DecodeDateTask()
	if (curr_date ~= date) then
		date = curr_date
		count = 1
	else
		count = count + 1
	end
	self:EncodeDateTask(count, date)
end

-- ��ȡ��ʼ��������
function HunyuanPotion:GetRefineDate()
	local count, date = self:DecodeDateTask()
	return date
end

-- ���ÿ�ʼ��������
function HunyuanPotion:SetRefineDate(date)
	local count, _ = self:DecodeDateTask()
	self:EncodeDateTask(count, date)
end

-- ��ȡ�Ѿ�������ɵ���¶����
function HunyuanPotion:GetFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	return count
end

-- �����Ѿ�������ɵ���¶����
function HunyuanPotion:AddFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(count + 1, flag, time)
end

-- ����Ѿ�������ɵ���¶����
function HunyuanPotion:ClearFinishedCount()
	local count, flag, time = self:DecodeRefiningTask()
	self:EncodeRefiningTask(0, flag, time)
end

-- �����Ѿ�������ɵ���¶����
function HunyuanPotion:ReduceFinishedCount(count)
	local count_now, flag, time = self:DecodeRefiningTask()
	if (count_now <= count) then
		count_now = 0
	else
		count_now = count_now - count
	end
	self:EncodeRefiningTask(count_now, flag, time)
end

-- ��ѯ����ʱ�䣨���ӣ�
function HunyuanPotion:GetRefiningTime()
	local _, _, time = self:DecodeRefiningTask()
	return time
end

-- ��������ʱ�䣨���ӣ�
function HunyuanPotion:AddRefiningTime(minutes)
	local count, flag, time = self:DecodeRefiningTask()
	time = time + minutes
	self:EncodeRefiningTask(count, flag, time)
	local msg = format("�����Ļ�Ԫ��¶������ %d ������.", time)
	self.m_Player:Msg2Player(msg)
end

-- �������ʱ�䣨���ӣ�
function HunyuanPotion:ClearRefiningTime()
	local count, flag, time = self:DecodeRefiningTask()
	if (time > 0) then
		self:EncodeRefiningTask(count, flag, 0)
	end
end

-- �������
function HunyuanPotion:ConsumeYuguan(count)
	if (count <= 0 or
		self.m_Player:CalcEquiproomItemCount(
			ITEM_YUGUAN[1],
			ITEM_YUGUAN[2],
			ITEM_YUGUAN[3],
			ITEM_YUGUAN[4]) < count) then
		return 0
	end
	local result = self.m_Player:ConsumeEquiproomItem(
		count,
		ITEM_YUGUAN[1],
		ITEM_YUGUAN[2],
		ITEM_YUGUAN[3],
		ITEM_YUGUAN[4])
	if (result == 1) then
		return 1
	else
		return 0
	end
end

-- ʹ�û�Ԫ��¶
-- ���Ӿ���ʯ�Ĳ���	by wangjingjun
function HunyuanPotion:Use(nEnergy)
	-- ��nEnergyΪ�գ�����Ĭ�ϵĻ�Ԫ��¶��ֵ������Ϊ�����ӵ�ֵ
	nEnergy = nEnergy or POTION_ENERGY	 
	local player = self.m_Player
	local old_energy = player:GetEnergy()
	local nToday = GetLocalDate("%Y%m%d")
	local nLastDate = player:GetTask(TASK_HUNYUANLINGLU_USEDATE)
	local nCurAddEnergy = player:GetTask(TASK_HUNYUANLINGLU_TOTALENERGY)
	local nCurMonth = floor(nToday/100)
	local nLastMonth = floor(nLastDate/100)
	
	if (nCurMonth ~= nLastMonth) then
		nLastDate = nToday;
		nCurAddEnergy = 0;
	end
	
	if (old_energy + nEnergy > 2000000000) then
		player:Say("�i����ʯ�̵�ﵽ��ߵ㣬���ܼ���ʹ�û�Ԫ��¶��")
		return 0
	elseif (nCurAddEnergy + nEnergy > TOTALENERGY_LIMIT_PERMONTH) then
		player:Say(format("ÿ��ÿ�������ֻ��%d ����ʯ", TOTALENERGY_LIMIT_PERMONTH))
		return 0
	elseif (self.m_Player:AddEnergy(nEnergy) ~= 1) then
		player:Say("���Ӿ���ʯ��ʧ��.")
		return 0
	else
		nCurAddEnergy = nCurAddEnergy + nEnergy
		player:SetTask(TASK_HUNYUANLINGLU_USEDATE, nLastDate)
		player:SetTask(TASK_HUNYUANLINGLU_TOTALENERGY, nCurAddEnergy)
		
		local account = player:GetAccount()
		local name = player:GetName()
		local new_energy = player:GetEnergy()
		WriteLog(format("%s(%s) use hunyuanlinglu to add enery(%d=>%d) cur month energy (%d)",
			player:GetAccount(),
			player:GetName(),
			old_energy,
			self.m_Player:GetEnergy(),
			nCurAddEnergy))
		player:Msg2Player(format("���� %d ����ʯ�㣬�����ѻ��%d ����ʯ.", nEnergy, nCurAddEnergy))
		return 1
	end
end

JingliList = {m_List = {}}

function JingliList:Add(index, item)
	self.m_List[index] = item
end

function JingliList:Del(index)
	self.m_List[index] = nil
end

function JingliList:GetCount()
	local count = 0
	for key, value in self.m_List do
		if (value) then
			count = count + 1
		end
	end
	return count
end

function JingliList:Find(index)
	return self.m_List[index]
end

function JingliList:OnTime(player, id)
	local jingli = self:Find(player)
	if (not jingli) then
		return 0
	else
		local result = jingli:OnTime()
		if (result == 0) then
			jingli:Destroy()
			return 0
		else
			return result, player
		end
	end
end

Jingli = {}

function Jingli:New(player, potion)
	local tb = clone(Jingli)
	tb.m_Timeout = 18 * 60
	tb.m_Player = player
	if (not potion) then
		tb.m_Potion = HunyuanPotion:New(player)
		tb.m_Potion:AddCurrentDateRefineCount(nil)
	else
		tb.m_Potion = potion
	end
	tb.m_TimerId = AddTimer(18 * 60, "JingliList:OnTime", player.m_PlayerIndex)
	JingliList:Add(player.m_PlayerIndex, tb)
	tb.m_Potion:SetRefiningFlag(1)
	tb.m_OwnerName = player:GetName()
	
	player:Msg2Player("��ʼ������Ԫ��¶")
	WriteLog(format("%s(%s) begin hunyunlnglu refining",
		player:GetAccount(),
		player:GetName()))
	return tb
end

function Jingli:Destroy()
	if (self.m_TimerId > 0) then
		DelTimer(self.m_TimerId)
		self.m_TimerId = 0
		JingliList:Del(self.m_Player.m_PlayerIndex)
		self.m_Player = nil
		self.m_OwnerName = ""
	end
end

function Jingli:GetTime()
	return self.m_Potion:GetRefiningTime()
end

function Jingli:ClearRefining()
	self.m_Potion:ClearRefiningTime()
	self.m_Potion:SetRefiningFlag(0)
end

function Jingli:OnTime()
	local player = self.m_Player
	local potion = self.m_Potion
	local name = player:GetName()
	if (self.m_OwnerName ~= name) then
		WriteLog(format("[ERROR JINGLI]owner chanage: %s => %s", self.m_OwnerName, name))
		return 0
	end
	potion:AddRefiningTime(1)
	if (potion:GetRefiningTime() < TIMEOUT_REFINING) then
		return self.m_Timeout
	end
	self:Success()
	potion:ClearRefiningTime()
	local count = player:GetTask(TASK_REFININGCOUNT)
	if (count > 0) then
		-- ����������һ����Ԫ��¶
		player:SetTask(TASK_REFININGCOUNT, count - 1)
		potion:AddCurrentDateRefineCount(nil)
		return self.m_Timeout
	else
		-- ��������
		potion:SetRefiningFlag(0)
		player:SetTask(TASK_REFININGCOUNT, 0)
		return 0
	end
end

function Jingli:Success()
	local account = self.m_Player:GetAccount()
	local name = self.m_Player:GetName()
	local item = self.m_Player:AddItemIntoEquipmentBox(
		ITEM_HUNYUANLINGLU[1],
		ITEM_HUNYUANLINGLU[2],
		ITEM_HUNYUANLINGLU[3],
		ITEM_HUNYUANLINGLU[4],
		ITEM_HUNYUANLINGLU[5],
		ITEM_HUNYUANLINGLU[6])
	if (item > 0) then
		WriteLog(format("%s(%s) refine hunyuanlinglu ok", account, name))
		self.m_Player:Msg2Player("����������ɹ�1����Ԫ��¶")

		Jiluhunyuan(1)
	else
		self.m_Potion:AddFinishedCount()
		WriteLog(format("%s(%s) add stored hunyuanlinglu(%d)",
			account,
			name,
			self.m_Potion:GetFinishedCount()))
		self.m_Player:Msg2Player("����������ɹ�һ����Ԫ��¶���뵽<color=red>����ʿ��<color> ���� <color=red>�ߴ����<color> ��ȡ.")
	end
end

-- NPC�Ի����
function dlg_entrance(playerindex)
	local player = PlayerList:GetPlayer(playerindex)
	-- player:Say("�˹�����δ���š�")
	JingliDlg:Main(player)
end

-- ���ƻ�Ԫ��¶
function dlg_refine()
	local player = PlayerList:GetPlayer(PlayerIndex)
	return JingliDlg:Refine(player)
end

-- ��ȡ��Ԫ��¶
function dlg_get()
	local player = PlayerList:GetPlayer(PlayerIndex)
	JingliDlg:Draw(player)
end

-- ������������
function dlg_inputcount()
	local player = PlayerList:GetPlayer(PlayerIndex)
	local potion = HunyuanPotion:New(player)
	local count = JingliDlg:Check(player, potion, 0)
	if (count > 0) then
		player:AskClientForNumber(
			"callback_inputcount",
			1,
			count,
			"����������ٸ�?")
	end
end

function callback_inputcount(count)
	if (count > 0) then
		local player = PlayerList:GetPlayer(PlayerIndex)
		local potion = HunyuanPotion:New(player)
		JingliDlg:Refine(player, potion, count)
	end
end

JingliDlg = {}

function JingliDlg:Check(player, potion, count_input)
	if (player:GetLevel() < MIN_LEVEL) then
		local fmt = "�����Ԫ��¶��Ҫ�ﵽһ���书ˮƽ������%sҪ����<color=red>%d<color>�����ܵ���Ŷ"
		local msg = nil
		if (player:GetSex() == 1) then
			msg = format(fmt, "Ů��", MIN_LEVEL)
		else
			msg = format(fmt, "����", MIN_LEVEL)
		end
		player:Say(msg)
		return 0
	elseif (player:IsCharged() == 0) then
		player:Say("ֻ���ѳ�ֵ����������ƻ�Ԫ��¶")
		return 0
	elseif (potion:GetFinishedCount() > 0) then
		player:Say("����ȡ�����ƺõĻ�Ԫ��¶.")
		return 0
	end
	local count_day = potion:GetCurrentDateRefineCount(nil)	-- �����������Ĵ���
	local count_cur = player:GetTask(TASK_REFININGCOUNT)	-- ���������Ĵ���
	if (count_day >= MAXCOUNT_EVERYDAY) then
		player:Say(
			format("������������ƹ�<color=red>%d<color> ���ˣ�������������.",
			MAXCOUNT_EVERYDAY))
		return 0
	end
	local count_ok = MAXCOUNT_EVERYDAY - count_day - count_cur
	if (count_ok <= 0) then
		player:Say("���������ѹ����������������ƻ�Ԫ��¶��?")
		return 0
	elseif (count_ok < count_input) then
		player:Say(format("�������ֻ���ٶ���%d��Ԫ��¶�ˣ���������Ҫ���Ƶ�����.", count_ok))
		return 0
	else
		return count_ok
	end
end

function JingliDlg:Main(player)
	player:Say(
		"�������ﶼ��������������������޾Ϳ��Խ�����ȡ�ռ����ռ���30���Ӻ���ȡ�����Ƴɻ�Ԫ��¶��ʹ����¶�󣬿�����������!? ",
		3,
		"��ʼ����Ԫ��¶/dlg_inputcount",
		"��ȡ�ѷ��Ļ�Ԫ��¶./dlg_get",
		"�����Ի�/Cancel")
end

function JingliDlg:Refine(player, potion, count)
	if (count <= 0 or self:Check(player, potion, count) == 0) then
		return 0
	elseif (potion:ConsumeYuguan(count) ~= 1) then
		player:Say(format(
			"��ˮ�ѳɺӣ��㻹û��<color=red>%d<color> ��ޣ��Ϸ�Ҳ�����޲�<enter><color=yellow><���Ҳ���������ۣ�������Ļ���½�Բ�ո�><color>",
			count))
		return 0
	end
	if (potion:GetRefiningFlag() == 0) then	
		Jingli:New(player)
		player:AddTask(TASK_REFININGCOUNT, count - 1)
	else
		player:AddTask(TASK_REFININGCOUNT, count)
	end
	WriteLog(format("%s(%s) start hunyuanlinglu refining, count(%d)",
		player:GetAccount(),
		player:GetName(),
		count))
	player:Say(format("�����������з��䣬����ȥ�ռ���Ȼ��<color=red>%d ����<color>�������!", TIMEOUT_REFINING))
	return 1
end

function JingliDlg:Draw(player)
	local potion = HunyuanPotion:New(player)
	local count = potion:GetFinishedCount()
	if (count <= 0) then
		player:Say("�㻹û�и��һ�Ԫ��¶")
		return
	end
	local item_count = 0
	for i = 1, count do
		local idx = player:AddItemIntoEquipmentBox(
						ITEM_HUNYUANLINGLU[1],
						ITEM_HUNYUANLINGLU[2],
						ITEM_HUNYUANLINGLU[3],
						ITEM_HUNYUANLINGLU[4],
						ITEM_HUNYUANLINGLU[5],
						ITEM_HUNYUANLINGLU[6])
		if (idx <= 0) then
			break
		else
			item_count = item_count + 1
		end
	end
	if (item_count == 0) then
		player:Say("�밲�ź�װ��.")
		return
	end
	potion:ReduceFinishedCount(item_count)
	WriteLog(format("%s(%s) receive stored hunyuanlinglu, count(%d)",
		player:GetAccount(),
		player:GetName(),
		item_count))
	Jiluhunyuan(item_count)
	if (item_count < count) then
		player:Say(format("���ǻ�Ԫ��¶<color=red>%d<color> ����ҵģ���׼��װ����ȡ<color=red>%d<color> ��Ԫ��¶",
			item_count,
			count - item_count))
	else
		player:Say(format("����<color=red>%d<color>����ҵĻ�Ԫ��¶������ȡ.", item_count))
	end
end

-- ��������뿪��Ϸ����
function WorldEntranceLogin(nPlayerIndex, bExchangeIn)
	WorldEntrance(nPlayerIndex, 1)
end

function WorldEntranceLogout(nPlayerIndex)
	WorldEntrance(nPlayerIndex, 0)
end

function WorldEntrance(playerindex, in)
	if (in == 1) then
		local player = PlayerList:GetPlayer(playerindex)
		local potion = HunyuanPotion:New(player)
		Enter(player, potion)
	else
		local obj = JingliList:Find(playerindex)
		if (obj) then
			obj:Destroy()
		end
	end
end

function Enter(player, potion)
	if (potion:GetRefiningFlag() == 1) then
		Jingli:New(player, potion)
	end
end


function Jiluhunyuan(nCount)
	if nCount <= 0 then
		return
	end
	AddStatData("linluchanchu_lianzhilinlu", nCount)	--��������һ��
end
