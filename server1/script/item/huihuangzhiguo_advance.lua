Include("\\script\\activitysys\\playerfunlib.lua");

huihuangzhiguo_advance = {}

huihuangzhiguo_advance.nDailyCountLimit = 5;
huihuangzhiguo_advance.nLevelLimit = 120;
huihuangzhiguo_advance.tbEXP =  --���Ӷ�Ӧ�����
{
	{15000000, "����Ի͹�"},
	{23000000, "ǧ��Ի͹�"},
	{30000000, "����Ի͹�"},
};

huihuangzhiguo_advance.tbZhenLuTSK =  --ʹ����¶TSKID�͸����Ӧ��Ʒ��
{
	{2669, {tbProp={6,1,2269,1,0,0}}, "������¶", "����Ի͹�"},
	{2670, {tbProp={6,1,2270,1,0,0}}, "ǧ����¶", "ǧ��Ի͹�"},
	{2671, {tbProp={6,1,2271,1,0,0}}, "������¶", "����Ի͹�"},
};

function huihuangzhiguo_advance:UseGuoZi(nGuoziLevel)
	if (self:CheckLevelLimit() ~= 1) then
		return 0;
	end
	
	if (self:CheckCountLimit() ~= 1) then
		return 0;
	end
	
	if (self.tbEXP[nGuoziLevel] == nil) then
		return 0;
	end
	
	PlayerFunLib:AddExp(self.tbEXP[nGuoziLevel][1], 0, format("%s ����",self.tbEXP[nGuoziLevel][2]));
	SetTask(2313, GetTask(2313) + 1)
	return 1;
end

function huihuangzhiguo_advance:UseZhenLu(nZhenLuLevel)
	if (self:CheckLevelLimit() ~= 1) then
		return 0;
	end
	
	self:AddZhenLuCount(nZhenLuLevel);
	Msg2Player(format("ʹ��%d %s, ��Ի͹�ʱ���ܻ��%d %s, ��״̬����0ʱ��ʧ", 
										PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[nZhenLuLevel][1]), self.tbZhenLuTSK[nZhenLuLevel][3], 
										PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[nZhenLuLevel][1]), self.tbZhenLuTSK[nZhenLuLevel][4]));
	return 1;
end

function huihuangzhiguo_advance:CheckLevelLimit()
	if (GetLevel() < self.nLevelLimit) then
		lib:ShowMessage(format("��%d ����(����%d) ����ʹ��!", self.nLevelLimit, self.nLevelLimit));
		return 0;
	end
	
	return 1;
end

function huihuangzhiguo_advance:CheckCountLimit()
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(2312) ~= nDate ) then
		SetTask(2312, nDate)
		SetTask(2313, 0)
	end
	
	if (GetTask(2313) >= self.nDailyCountLimit) then
		lib:ShowMessage(format("���������ʹ��%d�Ի͹��ˣ��������ӹ���Ҳ�ᱻ������Ŷ��������������Ŷ", self.nDailyCountLimit));
		return 0;
	end
	
	return 1;
end

function huihuangzhiguo_advance:AddZhenLuCount(nZhenLuLevel)
	if (self.tbZhenLuTSK[nZhenLuLevel] ~= nil) then
		PlayerFunLib:AddTaskDaily(self.tbZhenLuTSK[nZhenLuLevel][1], 1);
	end
end

function huihuangzhiguo_advance:ReduceZhenLuCount(nZhenLuLevel)
	if (self.tbZhenLuTSK[nZhenLuLevel] ~= nil) then
		PlayerFunLib:AddTaskDaily(self.tbZhenLuTSK[nZhenLuLevel][1], -1);
	end
end

function huihuangzhiguo_advance:GetGuoZiAvd()
	local nCount = 0;
	for i=getn(self.tbZhenLuTSK),1,-1 do --�Ӹ߼����ͼ�����
		local nZhenLu = PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[i][1]);
		if (nZhenLu > 0) then
			tbAwardTemplet:GiveAwardByList(self.tbZhenLuTSK[i][2], "��Ի͹�");
			self:ReduceZhenLuCount(i);
			nCount = 1;
			break;
		end
	end
	
	return nCount;
end