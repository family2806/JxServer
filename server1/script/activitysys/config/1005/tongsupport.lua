Include("\\script\\tong\\tong_header.lua");
IncludeLib("TONG")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\config\\1005\\variables.lua")

tbTongSupport = {}
tbTongSupport.tbRank = {
	[1] = 6e6,
	[2] = 10e6,
	[3] = 20e6,
	[4] = 40e6,
	[5] = 80e6,
	[6] = 100e6,
}
tbTongSupport.nTong_TSK_Item_Count = nTS_TONG_TASK_ITEM_COUNT
tbTongSupport.nMinTongJoinTime = nTS_MIN_TONG_JOIN_TIME
tbTongSupport.nTSK_Daily_Award_Count = nTS_TASK_DAILY_AWARD_COUNT
tbTongSupport.nTSK_Exp = nTS_TASK_EXP_AWARD
tbTongSupport.nMaxExp = nTS_MAX_EXP_AWARD

function tbTongSupport:GetRank()
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "����δ�μӰ�ᣬ�����콱!")
		return 0
	end
	local nItemCount = TONG_GetTaskValue(nTongID, self.nTong_TSK_Item_Count)
	if nItemCount < 10 then
		Talk(1, "", "���� <color=red>��������<color>�ɵĲ�����������������ֻ��Ľ���Ŷ")
		return 0
	end
	if nItemCount >= 10 and nItemCount <= 49 then
		return 1
	end
	if nItemCount >= 50 and nItemCount <= 99 then
		return 2
	end
	if nItemCount >= 100 and nItemCount <= 199 then
		return 3
	end
	if nItemCount >= 200 and nItemCount <= 299 then
		return 4
	end
	if nItemCount >= 300 and nItemCount <= 399 then
		return 5
	end
	if nItemCount >= 400 then
		return 6
	end
end

function tbTongSupport:CheckCondition()
	local szTongName, nTongID = GetTongName();	
	if szTongName == nil or szTongName == "" then
		Talk(1, "", "����δ�����ᣬ�����콱!")
		return nil
	end
	local nTongTime = GetJoinTongTime()
	if nTongTime < self.nMinTongJoinTime then
		Talk(1, "", "������ʱ�䲻��<color=red>1��<color>, �����콱.")
		return 0
	end
	local nTaskDailyCount = PlayerFunLib:GetTaskDailyCount(self.nTSK_Daily_Award_Count)
	if nTaskDailyCount >= 1 then
		Talk(1, "", "ÿ��ֻ�ܻ�øý�<color=red>1 <color>��, ����������.")
		return 0
	end
	local nTaskExp = GetTask(self.nTSK_Exp)*1e6
	if nTaskExp >= self.nMaxExp then
		Talk(1, "", "�����Ѵ�ý����ޣ����ܼ�������.")
		return 0
	end
	return 1
end

function tbTongSupport:main()
	local szTongName, nTongID = GetTongName();	
	local strCurrentCount = ""
	if szTongName == nil or szTongName == "" then
		strCurrentCount = "Ŀǰ: <color=red>δ������<color>\n\n"
	else
		local nItemCount = TONG_GetTaskValue(nTongID, self.nTong_TSK_Item_Count)
		strCurrentCount = format("���<color=red>���ֽ���<color> Ŀǰ: <color=yellow>%d<color>\n\n", nItemCount)
	end
	
	local strTittle = format("�����յ�����Խ�࣬����Խ��%s", strCurrentCount)
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "S?l��ng", "����")
	strTittle = strTittle..format("\t\t\t\t<color=yellow>%-16s%26s\n", "10 - 49", "6,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "50 - 99", "10,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "100 - 199", "20,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "200 - 299", "40,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s\n", "300 - 399", "80,000,000")
	strTittle = strTittle..format("\t\t\t\t%-16s%26s<color>", "400����", "100,000,000")
	local tbOpt = {}
	tinsert(tbOpt, {"��ȡ", tbTongSupport.GetAward, {tbTongSupport}})
	tinsert(tbOpt, {"��ng"})	
	CreateNewSayEx(strTittle, tbOpt)
end

function OnCancel()end

function tbTongSupport:GetAward()
	if self:CheckCondition() ~= 1 then
		return
	end
	local nTskExp = GetTask(self.nTSK_Exp) * 1e6
	local nRank = self:GetRank()
	if nRank <= 0 or nRank > 6 then
		return
	end
	local nExp = self.tbRank[nRank]	
	if not nExp then
		return
	end
	local nExpAward = nExp
	if (nExp + nTskExp) > self.nMaxExp then
		nExpAward = self.nMaxExp - nTskExp
	end
	PlayerFunLib:AddTaskDaily(self.nTSK_Daily_Award_Count, 1)
	SetTask(self.nTSK_Exp, floor((nExpAward + nTskExp)/1e6))
	--print(GetTask(self.nTSK_Exp))
	local tbAward = {szName = "�i����ֵ", nExp=nExpAward}
	tbAwardTemplet:Give(tbAward, 1, {"PhongVanLenhBai", "���������ֽ���"})
end