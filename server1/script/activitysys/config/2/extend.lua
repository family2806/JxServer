

Include("\\script\\activitysys\\config\\2\\head.lua")
Include("\\script\\activitysys\\config\\2\\variables.lua")
Include("\\script\\activitysys\\config\\2\\gift_pos.lua")
Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\missions\\elanggu\\elangguworld.lua")
Include("\\script\\activitysys\\config\\2\\award.lua")

pActivity.nPak = curpack()
pActivity.nRefreshGiftStartTime = 1900
pActivity.nRefreshGiftEndTime = 2300
pActivity.nRefreshCount = 60

function pActivity:GetNextTime()
	local nCurTime = GetCurServerTime()
	local szTime = tostring(self.nStartDate)
	local nYear = strsub(szTime, 1, 4)
	local nMonth = strsub(szTime, 5, 6)
	local nDay = strsub(szTime, 7, 8)
	local nHour = floor(self.nRefreshGiftStartTime/100)
	local nMinute = mod(self.nRefreshGiftStartTime,100)
	local nTagetTime = Tm2Time(nYear, nMonth, nDay, nHour, nMinute)
	local nTime = nTagetTime - nCurTime
	if nTime < 0 then
		local nHM = tonumber(GetLocalDate("%H%M"))
		if self.nRefreshGiftStartTime <= nHM and nHM < self.nRefreshGiftEndTime then
			nTime = 30 - mod(tonumber(GetLocalDate("%S")), 30) 
		else
			nTime = mod(nTime, 24 * 60 * 60) + 24 * 60 * 60
		end
	end
	return nTime
end

function pActivity:SetRefreshNpcTimer()
	if self:IsExpired() then
		return
	end
	local nMapIndex = SubWorldID2Idx(%GIFT_MAPID)
	if nMapIndex < 0 then
		return
	end
	local nTime = pActivity:GetNextTime()
	AddTimer(nTime*18, "pActivity:OnTime", 0)
end

function pActivity:OnTime()
	if self:IsExpired() then
		return 0
	end
	local nHM = tonumber(GetLocalDate("%H%M"))
	if self.nRefreshGiftStartTime <= nHM and nHM < self.nRefreshGiftEndTime then
		self:AddGift(self.nRefreshCount)
		return 30 * 18
	else
		return self:GetNextTime() * 18
	end
end

function pActivity:AddGift(nCount)
	local nMapIndex = SubWorldID2Idx(%GIFT_MAPID)
	if nMapIndex < 0 then
		return
	end
	local szNpcName = "LÔ VËt Gi¸ng Sinh"
	ClearMapNpcWithName(%GIFT_MAPID, szNpcName)
	for i=1, nCount do
		local j = random(1, getn(%GIFT_POS))
		GIFT_POS[i], GIFT_POS[j] = GIFT_POS[j], GIFT_POS[i] 
	end
	for i=1, nCount do
		local nX, nY = %GIFT_POS[i][1], %GIFT_POS[i][2]
		local nNpcIndex = AddNpc(1288, 1, nMapIndex, nX*32, nY*32, 0, szNpcName);
		SetNpcScript(nNpcIndex, "\\script\\activitysys\\config\\2\\npc_gift.lua")
	end
end

function pActivity:UseTree()
	local nX32, nY32, nMapIndex =  GetPos()
	DynamicExecute("\\script\\activitysys\\config\\2\\tree.lua", "Tree:Create", GetName(), nMapIndex, nX32, nY32)
end

function pActivity:CreateAmbienceNpc()
	DynamicExecute("\\script\\activitysys\\config\\2\\ambience.lua", "tbAmbience:CreateNpc")
end

function pActivity:UsePiLiDan()	
	tbAwardTemplet:Give({nExp = 6000000}, 1, {EVENT_LOG_TITLE, "use pilidan"})
	tbAwardTemplet:Give(%tbAwardList["PiLiDanAward"], 1, {EVENT_LOG_TITLE, "use pilidan"})	
end

function pActivity:CheckTaskbyTime(nTSKI_ID,nCoolDown)
	local nTime = self:GetTask(nTSKI_ID)
	local nCurTime = GetCurServerTime()
	if nTime <= nCurTime - nCoolDown then
		return 1
	else
		local szMsg = format("Cßn %d gi©y míi cã thÓ sö dông", nTime + nCoolDown - nCurTime)
		Talk(1, "", szMsg)
	end
end

function pActivity:SetTaskByNowTime(nTSKI_ID)
	self:SetTask(nTSKI_ID, GetCurServerTime())
end
AutoFunctions:Add(pActivity.SetRefreshNpcTimer, pActivity)
