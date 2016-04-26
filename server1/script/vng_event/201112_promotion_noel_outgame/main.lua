Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
tbNoelOnWeb = {
	nStartDate = 201112210000,
	nEndDate = 201201312400,
	nExtPointID = 6,
	tbLog = {"PromotionNoelQuaySoTrenWeb", "在礼官处领奖", {strFolder = "201112_NoelQuaySo/", nPromID = 21, nResult = 1}},
	tbBitTask = {
		nTaskID = 2917,
		nStartBit = 1,
		nBitCount = 12,
		nMaxValue = 2000,
	},
	nMaxExp = 2e9,
	tbAward = {
		[1] = {szName="翻羽马",tbProp={0,10,7,1,0,0},nCount=1, 
		nBitExtPoint = 1},
		[2] = {szName="金乌令",tbProp={6,1,2349,1,0,0},nCount=1, 
		nBitExtPoint = 2},
		[3] = {szName="乾坤双绝佩",tbProp={6,1,2219,1,0,0},nCount=1,nExpiredTime=43200, 
		nBitExtPoint = 3},
		[4] = {szName = "1亿经验值", nExp=100e6, 
		nBitExtPoint = 4},
		[5] = {szName = "3千万经验值", nExp=30e6, 
		nBitExtPoint = 5},
	},
}

function tbNoelOnWeb:IsActive()
	local nCurDate = tonumber(date("%Y%m%d%H%S"))
	if nCurDate < self.nStartDate or nCurDate >= self.nEndDate then
		return nil
	end
	return 1
end

function tbNoelOnWeb:AddDialog()
	if not self:IsActive() then
		return
	end
	local pEventType = EventSys:GetType("AddNpcOption")
	nId = pEventType:Reg("礼官", "和武林传奇一起领取节日抽奖的奖励", tbNoelOnWeb.Main,{tbNoelOnWeb})
end

function tbNoelOnWeb:Main()
	if not self:IsActive() then
		Talk(1, "", "现在无法领取.")
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
	local nFlag = 0
	local strTittle = "我们负责发放抽奖的奖励<color=yellow>武林传奇共度节日<color>. 中奖名单如下:\n\n"
	for i = 1, getn(self.tbAward) do
		local tb = self.tbAward[i]
		local nBit = tb.nBitExtPoint
		if tbExtPointLib:GetBitValue(self.nExtPointID, nBit) == 1 then
			nFlag = 1
			strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>\n", tb.szName)
			tbMainDialog:AddOptEntry(format("领取奖励 %s", tb.szName), tbNoelOnWeb.getAward, {tbNoelOnWeb, i})
		end
	end
	if nFlag == 0 then
		strTittle = strTittle..format("<color=yellow>\t\t\t\t%s<color>", "没有奖励")
	end
	tbMainDialog.szTitleMsg = strTittle	
	tbMainDialog:Show()
end

function tbNoelOnWeb:getAward(nAwardID)
	local tb = self.tbAward[nAwardID]
	if not tb then return end
	local nBit = tb.nBitExtPoint
	if tbExtPointLib:GetBitValue(self.nExtPointID, nBit) ~= 1 then
		Talk(1, "", "各位未中奖.")
		return
	end
	if nAwardID == 1 then
		if CountFreeRoomByWH(2, 3, 1) < 1 then
			Talk(1, "", "为防止财产损失，请整理好您的背包以防放不下(2x3个格）.")
			return
		end
	elseif nAwardID == 2 or nAwardID == 3 then
		if CalcFreeItemCellCount() < 1 then
			Talk(1, "", "为防止财产损失，请留出2x3的空位之后再领取奖励.")
			return
		end
	end
	if tbExtPointLib:SetBitValue(self.nExtPointID, nBit, 0) ~= 1 then
		Talk(1, "", "奖励未领取成功，请联系游戏管理委员会予以解决.")
			return
	end
	if nAwardID == 4 or nAwardID == 5 then
		local nAddExp = tb.nExp
		local nTskExp = tbVNG_BitTask_Lib:getBitTask(self.tbBitTask)*1e6
		if nTskExp + nAddExp > self.nMaxExp then
			nAddExp = self.nMaxExp - nTskExp
			Msg2Player(format("经验超过规定界限, 只能领取%d 点经验.", nAddExp))			
		end
		tbVNG_BitTask_Lib:addTask(self.tbBitTask, floor(nAddExp/1e6))		
		tb = {nExp = nAddExp}
	end
	tbAwardTemplet:Give(tb, 1, self.tbLog)
end

if tbNoelOnWeb:IsActive() then
	tbNoelOnWeb:AddDialog()
end