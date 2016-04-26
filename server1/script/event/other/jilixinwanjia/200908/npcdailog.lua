Include("\\script\\event\\other\\jilixinwanjia\\200908\\head.lua")
Include("\\script\\global\\seasonnpc.lua");
Include("\\script\\lib\\awardtemplet.lua")

tbJILIWanJia0908.tbData = 
{
	[1] = 
	{
		nLevel = 30,
		pLimit = function ()
			return  GetLastFactionNumber() > -1, "Ӧ��Ҫ��������"
		end,
		tbAward = 
		{
			{nExp_tl = 16e6},
			{szName="������", tbProp={6, 1, 2101, 1, 0, 0}, nExpiredTime = 20090923},
		}
	},
	[2] = 
	{
		nLevel = 70,
		pLimit = function ()
			return GetTong() ~= nil and GetTong() ~= "", "��λ��δ������"
		end,
		tbAward = 
		{
			{nExp_tl = 2e8},
			{szName="���˺��", tbProp={6, 1, 2102, 1, 0, 0}, nExpiredTime = 20090923},
		}
	},
	[3] = 
	{
		nLevel = 100,
		pLimit = function ()
			return GetLeadLevel() >= 30 and GetTask(151) >= 1000, "��Ҫ30�����ϵ�ͳ˧���1000����Ե"
		end,
		tbAward = 
		{
			{nExp_tl = 11e8},
			{szName="������", tbProp={6, 1, 2103, 1, 0, 0}, nExpiredTime = 20090923},
		}
	},
	[4] = 
	{
		nLevel = 125,
		pLimit = function ()
			return GetTask(2463) > 0, "Ӧ��Ҫѧϰ120������"
		end,
		tbAward = 
		{
			{nExp_tl = 14e8},
			{szName="��Բ���", tbProp={6, 1, 2104, 1, 0, 0}},
		}
	},
	[5] = 
	{
		nLevel = 140,
		pLimit = function ()
			return GetRepute() > 455 and tl_counttasklinknum(1) >= 300, "�ﵽ455�����������300��Ұ������."
		end,
		tbAward = 
		{
			{nExp_tl = 42e8},
			{szName="�������", tbProp={6, 1, 2105, 1, 0, 0}},
		}
	},
}

function tbJILIWanJia0908:DailogMain()
	
	
--	if not tbJILIWanJia0908:IsActDate() then
--		return Talk(1, "", "��ѽ���.")
--	end
	
	local nDay = tonumber(GetLocalDate("%Y%m%d"))
	if nDay >= 20090923 then
		return Talk(1, "", "��ѽ���.")
	end
	
	tbSay = 
	{
		"����ȡ��Ľ�����",
		"������ȡ30������/#tbJILIWanJia0908:GetAwardById(1)",
		"������ȡ70������/#tbJILIWanJia0908:GetAwardById(2)",
		"������ȡ100������/#tbJILIWanJia0908:GetAwardById(3)",
		"������ȡ125������/#tbJILIWanJia0908:GetAwardById(4)",
		"������ȡ140������/#tbJILIWanJia0908:GetAwardById(5)",
		"ȡ��/OnCancel"
		
	}
	CreateTaskSay(tbSay)
end

function tbJILIWanJia0908:GetAwardById(nId)
	local tbAwardData = self.tbData[nId]
	if self.tbTask:GetAwardState(nId) == 1 then
		return Talk(1, "", "��������ȡ��������.")
	end
	
	
	local nResult, szFailMsg = self:IsPlayerEligible()
	if not nResult then
		return Talk(1, "", szFailMsg)
	end
	
	if CalcFreeItemCellCount() < 1 then 
		return Talk(1, "",  format("�����ռ䲻�� %d������һ��.", 1))
	end
	
	if GetLevel() < tbAwardData.nLevel then
		return Talk(1, "", format("�������� %d��.", tbAwardData.nLevel))
	end

	local nResult, szFailMsg = tbAwardData.pLimit()
	if not nResult then
		return Talk(1, "", szFailMsg)
	end
	
	tbAwardTemplet:GiveAwardByList(tbAwardData.tbAward, "jili xin wanjia")
	
	self.tbTask:SetAwardState(nId, 1)
end
