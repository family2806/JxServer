Include("\\script\\vng_event\\20110215_THDNB8\\acclist.lua")
Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\lib\\awardtemplet.lua")
tbVNG_THDNB8 ={}
tbVNG_THDNB8.nStartDay = 20110221
tbVNG_THDNB8.nEndDay = 20110228
tbVNG_THDNB8.nExtPointID = 4
	

tbAwardList = 
	{
		["HBAK"] = 
			{
				tbAward = {szName="安康红包",tbProp={6,1,2105,1,0,0},nCount=0},
				tbBitPos = {1, 2},
			},
		["MatNaTK"] =
			{
				tbAward = {szName="面具- 英雄战场",tbProp={0,11,482,1,0,0},nCount=0,nExpiredTime=129600},
				tbBitPos = {3},
			},
		["QuaHK"] = 
			{
				tbAward = {szName="黄金之果(100)",tbProp={6,1,30095,1,0,0},nCount=0},
				tbBitPos = {4},
			},
		["HoangChanDon"] = 
			{
				tbAward = {szName="黄真丹",tbProp={6,1,2264,1,0,0},nCount=0},
				tbBitPos = {5, 6},
			},
		["HuyenChanDon"] = 
			{
				tbAward = {szName="玄真丹",tbProp={6,1,1678,1,0,0},nCount=0, tbParam={1500000000}},
				tbBitPos = {7, 8},
			},
		["TuKimChanDon"] = 
			{
				tbAward = {szName="紫金真丹",tbProp={6,1,2263,1,0,0},nCount=0, tbParam={2e9}},
				tbBitPos = {9, 10},
			},
		["HongAnh"] = 
			{
				tbAward = 
					{
						{szName="[完美]鸿影之沈园晚醉",tbProp={0,536},nCount=0,nQuality = 1},
						{szName="[完美]鸿影之挂剑西方",tbProp={0,537},nCount=0,nQuality = 1},
						{szName="[完美]鸿影之苜蓿忘却",tbProp={0,538},nCount=0,nQuality = 1},
						{szName="[完美]鸿影之红袖招",tbProp={0,539},nCount=0,nQuality = 1},
					},
					tbBitPos = {11},
			},
	}

function tbVNG_THDNB8:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	local strAccount = GetAccount()
	if not tbAccList[strAccount] then
		return 0
	end
	
	return 1;
end

function tbVNG_THDNB8:AddDialog(tbDialog)
	if self:isActive() ~= 1 then
		return
	end
	tbDialog:AddOptEntry("领取天下第一帮奖励 8",tbVNG_THDNB8.main,{tbVNG_THDNB8})
end

function tbVNG_THDNB8:main()
	local tbAccount = tbAccList[GetAccount()]
	if not tbAccount then
		return
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)
--	tbMainDialog.szTitleMsg = "选择奖励"
	if tbAccount.nHBAK > 0 then
		local tbAward = tbAwardList["HBAK"]
		local tbBitPos = tbAward.tbBitPos
		if tbAccount.nHBAK > 60 then			
			if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[1]) == 0 then				
				tbMainDialog:AddOptEntry("奖励 [安康红包]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "HBAK",60, tbBitPos[1]})
			else 
				if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[2]) == 0 then					
					tbMainDialog:AddOptEntry("奖励 [安康红包]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "HBAK", tbAccount.nHBAK - 60, tbBitPos[2]})
				end
			end
		else
			if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[1]) == 0 then
				tbMainDialog:AddOptEntry("奖励 [安康红包]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "HBAK", tbAccount.nHBAK, tbBitPos[1]})
			end
		end		
	end
	--Mat na tong kim
	if tbAccount.nMatnaTK > 0 then
		local tbAward = tbAwardList["MatNaTK"]
		local tbBitPos = tbAward.tbBitPos
		if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[1]) == 0 then
			tbMainDialog:AddOptEntry("奖励 [面具- 英雄战场]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "MatNaTK", tbAccount.nMatnaTK, tbBitPos[1]})
		end
	end
	--Qua Hoang Kim
	if tbAccount.nQuaHK > 0 then
		local tbAward = tbAwardList["QuaHK"]
		local tbBitPos = tbAward.tbBitPos
		if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[1]) == 0 then
			tbMainDialog:AddOptEntry("奖励 [黄金之果 (100)]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "QuaHK",tbAccount.nQuaHK, tbBitPos[1]})
		end
	end
	--Hoang chan don
	if tbAccount.nHoangChanDon > 0 then
		local tbAward = tbAwardList["HoangChanDon"]
		local tbBitPos = tbAward.tbBitPos
		if tbAccount.nHoangChanDon > 60 then			
			if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[1]) == 0 then				
				tbMainDialog:AddOptEntry("奖励 [黄真丹]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "HoangChanDon",60, tbBitPos[1]})
			else 
				if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[2]) == 0 then					
					tbMainDialog:AddOptEntry("奖励 [黄真丹]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "HoangChanDon", tbAccount.nHoangChanDon - 60, tbBitPos[2]})
				end
			end
		else
			if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[1]) == 0 then
				tbMainDialog:AddOptEntry("奖励 [黄真丹]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "HoangChanDon", tbAccount.nHoangChanDon, tbBitPos[1]})
			end
		end
	end
	--Huyen chan don
	if tbAccount.nHuyenChanDon > 0 then
		local tbAward = tbAwardList["HuyenChanDon"]
		local tbBitPos = tbAward.tbBitPos
		if tbAccount.nHuyenChanDon > 60 then			
			if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[1]) == 0 then				
				tbMainDialog:AddOptEntry("奖励 [玄真丹]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "HuyenChanDon",60, tbBitPos[1]})
			else 
				if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[2]) == 0 then					
					tbMainDialog:AddOptEntry("奖励 [玄真丹]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "HuyenChanDon", tbAccount.nHuyenChanDon - 60, tbBitPos[2]})
				end
			end
		else
			if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[1]) == 0 then
				tbMainDialog:AddOptEntry("奖励 [玄真丹]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "HuyenChanDon", tbAccount.nHuyenChanDon, tbBitPos[1]})
			end
		end
	end
	--Tu kim chan don
	if tbAccount.nTuKimChanDon > 0 then
		local tbAward = tbAwardList["TuKimChanDon"]
		local tbBitPos = tbAward.tbBitPos
		if tbAccount.nTuKimChanDon > 60 then			
			if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[1]) == 0 then				
				tbMainDialog:AddOptEntry("奖励 [紫金真丹]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "TuKimChanDon",60, tbBitPos[1]})
			else 
				if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[2]) == 0 then					
					tbMainDialog:AddOptEntry("奖励 [紫金真丹]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "TuKimChanDon", tbAccount.nTuKimChanDon - 60, tbBitPos[2]})
				end
			end
		else
			if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[1]) == 0 then
				tbMainDialog:AddOptEntry("奖励 [紫金真丹]",tbVNG_THDNB8.GetAward,{tbVNG_THDNB8, "TuKimChanDon", tbAccount.nTuKimChanDon, tbBitPos[1]})
			end
		end
	end
	if tbAccount.nHongAnhHoanMy > 0 then
		local tbAward = tbAwardList["HongAnh"]
		local tbBitPos = tbAward.tbBitPos
		if tbExtPointLib:GetBitValue(self.nExtPointID, tbBitPos[1]) == 0 then
			tbMainDialog:AddOptEntry("奖励 [完美鸿影]",tbVNG_THDNB8.GetGoldEquip,{tbVNG_THDNB8, "HongAnh", tbAccount.nHongAnhHoanMy, tbBitPos[1]})
		end
	end
	tbMainDialog:Show()
	--tbMainDialog:AddOptEntry("领取天下第一帮的奖励 8",tbVNG_THDNB8.main,{tbVNG_THDNB8})
end

function tbVNG_THDNB8:GetAward(strType, nCount, nBitPos)
	if (CalcFreeItemCellCount() < nCount) then
		Talk(1, "", format("为了保护您的财产安全, 请留 <color=red>%d<color> 个空格之后再领取奖励!", nCount))
		return
	end
	local tbAwardType = tbAwardList[strType]
	if not  tbAwardType then
		return
	end
	tbExtPointLib:SetBitValue(self.nExtPointID, nBitPos, 1)
	local tbAward = tbAwardType.tbAward
	tbAward.nCount = nCount
	local strLog = format("[VNG][THDNB8][奖励 %s]", tbAward.szName)
	tbAwardTemplet:GiveAwardByList(tbAward, strLog)
end

function tbVNG_THDNB8:GetGoldEquip(strType, nCount, nBitPos)
	if (CalcFreeItemCellCount() < 60) then
		Talk(1, "", "为了保护您的财产安全, 请留 <color=red>60<color> 个空格装备槽之后再领取奖励!" )
		return
	end
	local tbAwardType = tbAwardList[strType]
	if not  tbAwardType then
		return
	end
	tbExtPointLib:SetBitValue(self.nExtPointID, nBitPos, 1)
	for i = 1, 4 do
		local tbAward = tbAwardType.tbAward[i]
		--if not tbAward then return end
		tbAward.nCount = nCount
		tbAwardTemplet:GiveAwardByList(tbAward, "[VNG][THDNB8][领取完美鸿影奖励]")
	end	
end
