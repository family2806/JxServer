
Include("\\script\\missions\\dangboss\\dangbaossclass.lua")

Include("\\script\\lib\\composeclass.lua")
Include("\\script\\event\\qingren_jieri\\200902\\event.lua");	


if not tbDangBossDailog then
	tbDangBossDailog = tbBaseClass:new()
end




function tbDangBossDailog:_init(tbTaskCtrl)
	self.szClassName = "tbDangBossDailog"
	self.tbTask = tbTaskCtrl
	self.nStartDate = 090117
	self.nEndDate = 090217
end

function tbDangBossDailog:IsActDay()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	--return self.nStartDate <= nDate and nDate <= self.nEndDate
	return 1
end

function tbDangBossDailog:Main()
	Talk(1, "", "暂闭活动.")
	do return end
	if self:IsOpenModule() ~= 1 then
		return Talk(1, "", "暂闭活动.")
	end
	
	if self:IsActDay() ~= 1 then
		return Talk(1, "", "活动已结束.")
	end
	
	local tbSay = 
	{
		"<dec><npc>今日官府在江边组织斗鱼活动，阁下想要去吗?",
		format("我想报名参加斗鱼活动/#%s:DailogSignUp(1)", self.szClassName),
		format("我是赢家来领奖/#%s:GetAward(1)", self.szClassName),
		format("我想了解斗鱼活动/#%s:Explain()", self.szClassName),
		"结束对话/OnCancel",
		
	}
	
	CreateTaskSay(tbSay)
end

function tbDangBossDailog:Explain(nStep)
	local tbSay = 
	{
		"<dec><npc>每晚20:00-21:00活动开始. 从20:00到20:00和21:00到21:10;80级以上的充值者可以到这报名, 每层只要100人. 一个人将变成金鱼, 别的人将斗鱼. 如果在5分钟之内打败金鱼将获得金鱼宝箱. 如果没有打败那么变成金鱼的人将得到官府的重赏.",
		"知道了/OnCancel",
	}
	
	CreateTaskSay(tbSay)
end


function tbDangBossDailog:DailogSignUp(nStep)
	
	local nMapId = 895
	local nMoney = 0
	
	local nCurMatchId = tbDangBoss:GetMissionV(tbDangBoss.tbMissionV.MATCH_ID, nMapId)
	local nContinueCount = self.tbTask:GetContinueCount(nCurMatchId) + 1
	local nMissionState = tbDangBoss:GetMissionState(nMapId)
	local nPlayerCount = tbDangBoss:GetMSPlayerCount(0, nMapId)
	if nStep == 1 then
		if nMissionState == 2 then
			nMoney = nContinueCount * 1e5
			local tbSay = 
			{
				format("<dec><npc>报名时间已过, 现在要付 %d银两才可以进入. 确认支付？", nMoney),
				format("当然, 我要去报仇/#%s:DailogSignUp(2)", self.szClassName),
				"不必了!/OnCancel",
			}
			return CreateTaskSay(tbSay)
		end
		
	elseif nStep == 2 then
		if nMissionState == 2 then
			nMoney = nContinueCount * 1e5
		end
		
		if GetCash() < nMoney then
			return Talk(1, "", format("银两不够,需要 %d", nMoney))
		end
	end	
	
	if tbDangBoss:IsPlayerEligible() ~= 1 then
		Talk(1, "", format("%d级以上和%s 才可以参加", tbDangBoss.nMinLevel, (tbDangBoss.bIsCharged == 1 and "上交") or ""))
		return 0
	end
	
	if nMissionState ~= tbDangBoss.READY_STATE and nMissionState ~= tbDangBoss.BATTLE_STATE then
		Talk(1, "", "真可惜报名时间已过. 等下场吧")
		return 0
	end
	if nPlayerCount >= tbDangBoss.nMaxPlayerCount then
		Talk(1, "", format("报名人数已达到  %d. 真可惜, 等下场吧", tbDangBoss.nMaxPlayerCount))
		return 0
	end
	
	
	
	local nMapId, nPosX16, nPosY16 = GetWorldPos()
	self.tbTask:SetLastPos(nMapId, nPosX16, nPosY16)
	tbDangBoss:GotoBattlePlace()
end

local tbItem = 
{
	{nExp = 1e7},
	{
		{szName="一纪乾坤符", tbProp={6, 1, 2126, 1, 0, 0}, nExpiredTime = 60*24*30, nRate = 0.5},
		{szName="天晶白驹丸", tbProp={6, 1, 2183, 1, 0, 0}, nRate = 3},
		
		{szName="8级玄晶矿石", tbProp={6, 1, 147, 8, 0, 0}, nRate = 16},
		{szName="7级玄晶矿石", tbProp={6, 1, 147, 7, 0, 0}, nRate = 21},
		{nExp = 1e7, nRate = 10},
		
		{nExp = 2e7, nRate = 8},
		
	
		
		{nExp = 5e7, nRate = 2},
		
		
		{szName="武林秘籍", tbProp={6, 1, 26, 1, 0, 0}, nRate = 8},
		{szName="洗髓经", tbProp={6, 1, 22, 1, 0, 0}, nRate = 8},
		{szName="黄金之果", tbProp={6, 1, 907, 1, 0, 0}, nRate = 5, nExpiredTime = 60*24*7},
		{szName="天然辉煌果", tbProp={6, 1, 2270, 1, 0, 0} , nExpiredTime = 60*24*7, nRate= 18.5},
	}
}

function tbDangBossDailog:GetAward(nStep, nCurCount)
	local nTotalCount = self.tbTask:GetAwardCount()
	
	if nTotalCount == 0 then
		return Talk(1, "", "真遗憾, 这次的斗鱼比赛赢家不是你或者你已领过奖.")
	end
	
	if nStep == 1 then
		local tbSay = 
		{
			format("<dec><npc>今日可领 %d 奖品, <color=red>(如果今天不领明天就没有了)<color>我想:", nTotalCount),
			format("领全部#%s:GetAward(2, %d)", self.szClassName, nTotalCount),
			format("只领1份/#%s:GetAward(2, 1)", self.szClassName, 1),
			"结束对话/OnCancel"
		}
		CreateTaskSay(tbSay)
	elseif nStep == 2 then
		if CalcFreeItemCellCount() >= nCurCount then
			tbAwardTemplet:GiveAwardByList(%tbItem, "领金鱼生存奖品", nCurCount)
			self.tbTask:PayAwardCount(nCurCount)
		else
			Talk(1, "", format("背包空间不够领取 %d 奖品", nTotalCount))
		end
	end	
end

function tbDangBossDailog:IsOpenModule()
	return gb_GetModule("chunjie2009_dangboss")
end

tbDangBossDailog:_init(tbDangBossTaskCtrl)
