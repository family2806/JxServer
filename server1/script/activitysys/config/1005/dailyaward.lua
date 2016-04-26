Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
PhongVanLenhBai2011 = {}
PhongVanLenhBai2011.TASK_DAILY_AWARD_TIMES1 = 3090
PhongVanLenhBai2011.TASK_DAILY_AWARD_TIMES2 = 3091
PhongVanLenhBai2011.TASK_DAILY_WEEKEND_AWARD = 3092
PhongVanLenhBai2011.TASK_COUNT_DAILY_AWARD_TIMES1 = 3093
PhongVanLenhBai2011.TASK_COUNT_DAILY_AWARD_TIMES2 = 3094
PhongVanLenhBai2011.TASK_COUNT_WEEKEND_AWARD = 3095
PhongVanLenhBai2011.tbAwardDaily1 = 
{
	[1]  =
	{
		{szName = "ɱ���( 90��)", tbProp = {6, 1, 400, 90,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "Ӣ����", tbProp = {6, 1, 1604,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "������", tbProp = {6, 1, 2256,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "�Ի͹�(��) ", tbProp = {6, 1, 906,1,0,0}, nCount = 3, nExpiredTime = 10080, nBindState = -2},
		{szName = "�ν������", tbProp = {6, 1, 190,1,0,0}, nCount = 50, nExpiredTime = 43200, nBindState = -2},
		{szName = "����", tbProp = {6, 1, 157,1,0,0}, nCount = 50, nExpiredTime = 43200, nBindState = -2},
	},
	[2] =
	{
		{szName = "����", nJxb =1000000, nRate = 34, nCount = 1},
		{szName = "����", nJxb =2000000, nRate = 33, nCount = 1},
		{szName = "����", nJxb =3000000, nRate = 33, nCount = 1},
	},
	[3] =
	{
		{szName = "�ɲ�¶", tbProp = {6,1,71,1,0,0}, nCount = 5, nRate = 50, nBindState = -2},
		{szName = "�ر��ɲ�¶", tbProp = {6,1,1181,1,0,0}, nCount = 5, nRate = 50, nBindState = -2},
	},
	[4] =
	{
		{szName = "������¶", tbProp = {6,1,2266,1,0,0}, nCount = 1, nRate =34, nExpiredTime = 10080, nBindState = -2},
		{szName = "ǧ����¶", tbProp = {6,1,2267,1,0,0}, nCount = 1, nRate =33, nExpiredTime = 10080, nBindState = -2},
		{szName = "������¶",tbProp = {6,1,2268,1,0,0}, nCount = 1, nRate =33, nExpiredTime = 10080, nBindState = -2},
	},
}

PhongVanLenhBai2011.tbAwardDaily2 =
{
	[1] =
	{
		{szName = "�������", tbProp = {6, 1, 2402,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "���", tbProp = {6, 1, 2311,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "����", tbProp = {6, 2, 1020,1,0,0}, nCount = 40, nExpiredTime = 10080, nBindState = -2, CallBack = function (nItemIndex) SetItemMagicLevel(nItemIndex, 1, random(211,216)) end},
		{szName = "ľ������", tbProp = {6, 1, 2969,1,0,0}, nCount = 40, nExpiredTime = 10080, nBindState = -2},
	},
	[2] =
	{
		{szName = "��Ѫ��", tbProp = {6,1,2117,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 10080, nBindState = -2},
		{szName = "��������", tbProp = {6,1,2115,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 10080, nBindState = -2},
		{szName = "ˮ������", tbProp = {6,1,2745,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 10080, nBindState = -2},
		{szName = "�챦����", tbProp = {6,1,2813,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 10080, nBindState = -2},
		{szName = "�׵���", tbProp = {6,1,1617,1,0,0}, nCount = 1, nRate =20, nExpiredTime = 10080, nBindState = -2},
	},
}

PhongVanLenhBai2011.tbWeekendAward = 
{
	[1] =
	{
		{szName = "�ƽ�ӡ3�� (ǿ��)", tbProp = {0,3207}, nRate = 17, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "�ƽ�ӡ4�� (ǿ��)", tbProp = {0,3208}, nRate = 17, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "�ƽ�ӡ5�� (ǿ��)", tbProp = {0,3209}, nRate = 16, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "�ƽ�ӡ3��(����)", tbProp = {0,3217}, nRate = 17, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "�ƽ�ӡ4��(����)", tbProp = {0,3218}, nRate = 17, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "�ƽ�ӡ5��(����)", tbProp = {0,3219}, nRate = 16, nQuality = 1, nExpiredTime = 10080, nBindState = -2},
	},
	[2] =
	{
		{szName = "�ƽ�֮��", tbProp = {6, 1,907,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "��Ԫ��¶", tbProp = {6, 1,2312,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "ɽ������ͼ(1000��)", tbProp = {6, 1,2514,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "Ԫ˧���", tbProp = {0, 11,447,1,0,0}, nCount = 1, nExpiredTime = 10080, nBindState = -2},
	},
	[3] =
	{
		{szName = "�׾���", tbProp = {6, 1, 74, 1, 0, 0}, nCount = 1, nExpiredTime = 10080, nRate = 34, nBindState = -2},
		{szName = "��׾���", tbProp = {6, 1, 130, 1, 0, 0}, nCount = 1, nExpiredTime = 10080, nRate = 33, nBindState = -2},
		{szName = "�ر�׾���", tbProp = {6, 1, 1157, 1, 0, 0}, nCount = 1, nExpiredTime = 10080, nRate = 33, nBindState = -2},
	},
	[4] =
	{
		{szName = "�׾��輼��", tbProp = {6, 1, 1372,1,0,0}, nRate = 34, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "��׾���(����) ", tbProp = {6, 1, 977,1,0,0}, nRate = 33, nCount = 1, nExpiredTime = 10080, nBindState = -2},
		{szName = "�׾����ر���", tbProp = {6, 1, 1182,1,0,0}, nRate = 33, nCount = 1, nExpiredTime = 10080, nBindState = -2},
	},
	[5] =
	{
		{szName = "�ĺ���ң�����", tbProp = {6, 1, 2398,1,0,0}, nCount = 1, nRate = 34, nExpiredTime = 10080, nBindState = -2},
		{szName = "�������ε����", tbProp = {6, 1, 2400,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},
		{szName = "������յ����", tbProp = {6, 1, 2399,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},
	},
	[6] =
	{
		{szName = "����Ի͹�",tbProp = {6, 1, 2269,1,0,0}, nCount = 1, nRate = 34, nExpiredTime = 10080, nBindState = -2},
		{szName = "ǧ��Ի͹�", tbProp = {6, 1, 2270,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},
		{szName = "���ܻԻ͹�", tbProp = {6, 1, 2271,1,0,0}, nCount = 1, nRate = 33, nExpiredTime = 10080, nBindState = -2},

	},
} 

function PhongVanLenhBai2011:ShowDialogDaily()
	--��������������code�� 
	if tbPVLB_Check:IsNewPlayer() ~= 1 then
		Talk(1, "", "���²��������μӻ.")
		return
	end
	local nDay = tonumber(date("%w"))
	local nTime =tonumber(GetLocalDate("%H%M"))
	local szTitle = "ÿ�ս���"
	local tbOpt = {}
	
	if (nTime >= 0 and nTime <= 1400) then
		tinsert(tbOpt,  "ÿ�ս���/#PhongVanLenhBai2011:GetDailyAwardTimes1()")
	else
		tinsert(tbOpt,  "ÿ�ս���/#PhongVanLenhBai2011:GetDailyAwardTimes2()")
	end
	
	if (nDay == 5 or nDay == 6 or nDay == 0) then
		tinsert(tbOpt,  "��ĩ�콱��/#PhongVanLenhBai2011:GetWeekendAward()")
	end
	tinsert(tbOpt,  "����Ҫʲô/#PhongVanLenhBai2011:Cancel()")
	
	Say(szTitle, getn(tbOpt), tbOpt)
end

function PhongVanLenhBai2011:GetDailyAwardTimes1()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end
	if (PlayerFunLib:CheckTransLifeCount(2,"��Ҫ�ǵڶ���ת��������ܻ�øý���","==") ~= 1) then
		return
	end
	
	 if (PlayerFunLib:CheckTaskDaily(self.TASK_DAILY_AWARD_TIMES1, 1, "��������Ѿ���ý��ˣ�����������", "<") ~= 1)then
	 	return
	 end
	 
	local nGetAwardTimes = GetTask(self.TASK_COUNT_DAILY_AWARD_TIMES1)
	if (nGetAwardTimes >= 60) then
		Talk(1, "", "�ý������ֻ����ȡ60��!")
		return
	end
	
	if CalcFreeItemCellCount() < 59 then
		Talk(1, "", "������װ������59����λ!")
		return
	end
	
	PlayerFunLib:AddTaskDaily(self.TASK_DAILY_AWARD_TIMES1, 1)
	SetTask(self.TASK_COUNT_DAILY_AWARD_TIMES1, nGetAwardTimes + 1)
	tbAwardTemplet:Give(self.tbAwardDaily1, 1, {"PhongVanLenhBai2011", "���һ��ÿ�ս���"})
	tbVngTransLog:Write("201109_EventPhongVanLenhBai/", 11, "���һ��ÿ�ս���", "N/A", 1)
end

function PhongVanLenhBai2011:GetDailyAwardTimes2()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end
	if (PlayerFunLib:CheckTransLifeCount(2,"��Ҫ�ǵڶ���ת��������ܻ�øý���","==") ~= 1) then
		return
	end
	
	 if (PlayerFunLib:CheckTaskDaily(self.TASK_DAILY_AWARD_TIMES2, 1, "��������Ѿ���ý��ˣ�����������", "<") ~= 1)then
	 	return
	 end
	 
	local nGetAwardTimes = GetTask(self.TASK_COUNT_DAILY_AWARD_TIMES2)
	if (nGetAwardTimes >= 60) then
		Talk(1, "", "�ý������ֻ����ȡ60��!")
		return
	end
	
	if CalcFreeItemCellCount() < 59 then
		Talk(1, "", "������װ������59����λ!")
		return
	end
	
	PlayerFunLib:AddTaskDaily(self.TASK_DAILY_AWARD_TIMES2, 1)
	SetTask(self.TASK_COUNT_DAILY_AWARD_TIMES2, nGetAwardTimes + 1)
	
	local _ , nTongID = GetTongName()
	if (nTongID > 0) then
		AddContribution(2000)
		Msg2Player("�����2000��ṱ�׵�")
--		WriteLog(date("%Y%m%d %H%M%S").."\t".."PhongVanLenhBai2011"..GetAccount().."\t"..GetName().."\t".."���2000��ṱ�׵�")
		tbLog:PlayerActionLog("PhongVanLenhBai", "ÿ���콱�ڶ���", "2000��ṱ�׵�")
	end
	
	tbAwardTemplet:Give(self.tbAwardDaily2, 1, {"PhongVanLenhBai2011", "NhanThuongHangNgayLan2"})
	tbVngTransLog:Write("201109_EventPhongVanLenhBai/", 11, "ÿ���콱�ڶ���", "N/A", 1)
end

function PhongVanLenhBai2011:GetWeekendAward()
	if PlayerFunLib:VnCheckInCity () ~= 1 then
		return
	end
	if (PlayerFunLib:CheckTransLifeCount(2,"��Ҫ�ǵڶ���ת��������ܻ�øý���","==") ~= 1) then
		return
	end
	
	if (PlayerFunLib:CheckTaskDaily(self.TASK_DAILY_WEEKEND_AWARD, 1, "��������Ѿ���ý��ˣ�����������", "<") ~= 1)then
	 	return
	 end
	
	local nGetAwardTimes = GetTask(self.TASK_COUNT_WEEKEND_AWARD)
	if (nGetAwardTimes >= 60) then
		Talk(1, "", "�ý������ֻ����ȡ60��!")
		return
	end
	
	if CalcFreeItemCellCount() < 59 then
		Talk(1, "", "������װ������59����λ!")
		return
	end
	
	PlayerFunLib:AddTaskDaily(self.TASK_DAILY_WEEKEND_AWARD, 1)
	SetTask(self.TASK_COUNT_WEEKEND_AWARD, nGetAwardTimes + 1)
	tbAwardTemplet:Give(self.tbWeekendAward, 1, {"PhongVanLenhBai", "��ȡ��ĩ����"})
	tbVngTransLog:Write("201109_EventPhongVanLenhBai/", 11, "��ȡ��ĩ����", "N/A", 1)
end

