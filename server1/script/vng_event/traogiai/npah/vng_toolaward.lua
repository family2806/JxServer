--°ïÖú°ä½±¸øÕ½Ê¤µÄÍæ¼Ò - Created by DinhHQ - 20110607
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\extpoint.lua")
tbVngToolAward = {}
tbVngToolAward.tbSeasons ={}

function tbVngToolAward:AddSeason(tbAward)
		tinsert(self.tbSeasons, tbAward)
end

function tbVngToolAward:AddDialog(tbDialog, strNpcName)
 	if getn(self.tbSeasons) <= 0 then
 		return
 	end
	local tbSeason = {}
	for i = 1, getn(self.tbSeasons) do		
		tbSeason = self.tbSeasons[i]		
		if tbSeason:IsActive() == 1 and self.tbSeasons[i].tbAccList[GetAccount()] then
			if tbDialog.szNpcName and tbDialog.szNpcName == tbSeason.strNPC then
				tbDialog:AddOptEntry(tbSeason.strName, tbVngToolAward.Show, {tbVngToolAward, i})
			elseif strNpcName and tbSeason.strNPC == strNpcName then
				tinsert(tbDialog, format("%s/#tbVngToolAward:Show(%d)", tbSeason.strName, i))
			end
		end
	end
end

function tbVngToolAward:Show(nSeasonID)
	local tbCurActive = self.tbSeasons[nSeasonID]
	if not tbCurActive.tbAccList[GetAccount()] or tbCurActive:IsActive() ~= 1 then
		return
	end
	local tbTemp = tbCurActive.tbAccList[GetAccount()]
	
	local strDesc = "Danh s¸ch phÇn th­ëng nh­ sau:"
	
	local tbDiag = {}
	local nOption = 0
	for i = 1, getn(tbTemp) do		
		if tbTemp[i] then
			nOption = nOption + 1
			strDesc = strDesc..format("\n%s %-26d%s", "PhÇn th­ëng", nOption,"Sè l­îng")			
			local tbExtPoint = tbCurActive.tbExtPointBit[i]
			if  tbExtPointLib:GetBitValue(tbExtPoint.nExtPoint, tbExtPoint.nBit) == 1 then			
				for j = 1, getn(tbTemp[i]) do
					local nAwardID = tbTemp[i][j].nAwardID
					local nAwardCount = tbTemp[i][j].nCount
					strDesc = strDesc..format("\n\t\t<color=yellow>%-36s%s<color>", tbCurActive.tbPrizeList[nAwardID].szName, nAwardCount)	--tbCurActive.tbPrizeList[nAwardID].szName.."\t"..nAwardCount					
				end
				tinsert(tbDiag, format("NhËn phÇn th­ëng %d/#tbVngToolAward:GetAward(%d, %d)", nOption, nSeasonID, i))
			else
				strDesc = strDesc.."\n<color=red>§· nhËn th­ëng<color>"
			end
		end
	end
	tinsert(tbDiag, "§ãng/OnCancel")
	Describe(strDesc, getn(tbDiag), tbDiag)
end

function tbVngToolAward:GetAward(nSeasonID, nPart)
	local tbCurActive = self.tbSeasons[nSeasonID]
	if tbCurActive:IsActive() ~= 1 then
		Talk(1, "", "Xin ®¹i hiÖp thø lçi, ®· qu¸ h¹n nhËn th­ëng!")
		return
	end

	local tbAwardList = tbCurActive.tbAccList[GetAccount()][nPart]
	--	local nFreeBagRequire = 0
--	for i = 1, getn(tbAwardList) do
--		nFreeBagRequire = nFreeBagRequire + tbAwardList[i].nCount * tbCurActive.tbFreeBagRequire[tbAwardList[i].nAwardID]
--	end
	if CalcFreeItemCellCount() < 60 then
		Talk(1, "", "Xin h·y dän trèng hµnh trang råi míi nhËn th­ëng.")
		return
	end
	local tbExtPoint = tbCurActive.tbExtPointBit[nPart]
	if (tbExtPointLib:SetBitValue(tbExtPoint.nExtPoint, tbExtPoint.nBit, 0) ~= 1)then
		return
	end
	if (tbExtPointLib:GetBitValue(tbExtPoint.nExtPoint, tbExtPoint.nBit) ~= 0)then
		return
	end
	 for i = 1, getn(tbAwardList) do
	 	local tbItem = tbCurActive:GetSingleItem(tbAwardList[i].nAwardID)
	 	if tbItem[1] and type(tbItem[1]) == "table" then
	 		for i = 1, tbAwardList[i].nCount do
	 			tbAwardTemplet:Give(tbItem, 1, tbCurActive.tbLog)
	 		end
	 	else
	 		tbItem.nCount = tbAwardList[i].nCount
	 		tbAwardTemplet:Give(tbItem, 1, tbCurActive.tbLog)
	 	end	 	
	 end
end