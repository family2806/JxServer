Include("\\script\\event\\other\\jilixinwanjia\\200908\\head.lua")
Include("\\script\\global\\seasonnpc.lua");
Include("\\script\\lib\\awardtemplet.lua")

tbJILIWanJia0908.tbData = 
{
	[1] = 
	{
		nLevel = 30,
		pLimit = function ()
			return  GetLastFactionNumber() > -1, "应该要加入门派"
		end,
		tbAward = 
		{
			{nExp_tl = 16e6},
			{szName="初入红包", tbProp={6, 1, 2101, 1, 0, 0}, nExpiredTime = 20090923},
		}
	},
	[2] = 
	{
		nLevel = 70,
		pLimit = function ()
			return GetTong() ~= nil and GetTong() ~= "", "各位还未加入帮会"
		end,
		tbAward = 
		{
			{nExp_tl = 2e8},
			{szName="幸运红包", tbProp={6, 1, 2102, 1, 0, 0}, nExpiredTime = 20090923},
		}
	},
	[3] = 
	{
		nLevel = 100,
		pLimit = function ()
			return GetLeadLevel() >= 30 and GetTask(151) >= 1000, "需要30个以上的统帅点和1000个福缘"
		end,
		tbAward = 
		{
			{nExp_tl = 11e8},
			{szName="富贵红包", tbProp={6, 1, 2103, 1, 0, 0}, nExpiredTime = 20090923},
		}
	},
	[4] = 
	{
		nLevel = 125,
		pLimit = function ()
			return GetTask(2463) > 0, "应该要学习120级技能"
		end,
		tbAward = 
		{
			{nExp_tl = 14e8},
			{szName="团圆红包", tbProp={6, 1, 2104, 1, 0, 0}},
		}
	},
	[5] = 
	{
		nLevel = 140,
		pLimit = function ()
			return GetRepute() > 455 and tl_counttasklinknum(1) >= 300, "达到455的名望和完成300的野叟任务."
		end,
		tbAward = 
		{
			{nExp_tl = 42e8},
			{szName="安康红包", tbProp={6, 1, 2105, 1, 0, 0}},
		}
	},
}

function tbJILIWanJia0908:DailogMain()
	
	
--	if not tbJILIWanJia0908:IsActDate() then
--		return Talk(1, "", "活动已结束.")
--	end
	
	local nDay = tonumber(GetLocalDate("%Y%m%d"))
	if nDay >= 20090923 then
		return Talk(1, "", "活动已结束.")
	end
	
	tbSay = 
	{
		"请领取你的奖励！",
		"我来领取30级奖励/#tbJILIWanJia0908:GetAwardById(1)",
		"我来领取70级奖励/#tbJILIWanJia0908:GetAwardById(2)",
		"我来领取100级奖励/#tbJILIWanJia0908:GetAwardById(3)",
		"我来领取125级奖励/#tbJILIWanJia0908:GetAwardById(4)",
		"我来领取140级奖励/#tbJILIWanJia0908:GetAwardById(5)",
		"取消/OnCancel"
		
	}
	CreateTaskSay(tbSay)
end

function tbJILIWanJia0908:GetAwardById(nId)
	local tbAwardData = self.tbData[nId]
	if self.tbTask:GetAwardState(nId) == 1 then
		return Talk(1, "", "大侠已领取过奖励了.")
	end
	
	
	local nResult, szFailMsg = self:IsPlayerEligible()
	if not nResult then
		return Talk(1, "", szFailMsg)
	end
	
	if CalcFreeItemCellCount() < 1 then 
		return Talk(1, "",  format("背包空间不够 %d请整理一下.", 1))
	end
	
	if GetLevel() < tbAwardData.nLevel then
		return Talk(1, "", format("大侠不够 %d级.", tbAwardData.nLevel))
	end

	local nResult, szFailMsg = tbAwardData.pLimit()
	if not nResult then
		return Talk(1, "", szFailMsg)
	end
	
	tbAwardTemplet:GiveAwardByList(tbAwardData.tbAward, "jili xin wanjia")
	
	self.tbTask:SetAwardState(nId, 1)
end
