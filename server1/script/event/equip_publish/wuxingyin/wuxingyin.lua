
-- Ngò hµnh ÊnÉı¼¶
-- 2011.04.25

--Change the name "Ngò hµnh Ên" to "Hoµng kim Ên" - Modified by DinhHQ - 20110605

Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")

tbWuxingyin = tbActivityCompose:new()

local tbSuccessRate = {
	[1] = 35,		
	[2] = 45,
	[3] = 55,
	[4] = 65,
	[5] = 75,
	}
	
local tbLogAction = {
	[1] = "Hoµng kim ÊnÇ¿»¯2¼¶³É¹¦",
	[2] = "Hoµng kim ÊnÇ¿»¯3¼¶³É¹¦",
	[3] = "Hoµng kim ÊnÇ¿»¯4¼¶³É¹¦",
	[4] = "Hoµng kim ÊnÇ¿»¯5¼¶³É¹¦",
	[5] = "Hoµng kim ÊnÇ¿»¯6¼¶³É¹¦",
	[6] = "Hoµng kim ÊnÈõ»¯2¼¶³É¹¦",
	[7] = "Hoµng kim ÊnÈõ»¯3¼¶³É¹¦",
	[8] = "Hoµng kim ÊnÈõ»¯4¼¶³É¹¦",
	[9] = "Hoµng kim ÊnÈõ»¯5¼¶³É¹¦",
	[10] = "Hoµng kim ÊnÈõ»¯6¼¶³É¹¦",
	[11] = "Hoµng kim ÊnÇ¿»¯2¼¶Ê§°Ü",
	[12] = "Hoµng kim ÊnÇ¿»¯3¼¶Ê§°Ü",
	[13] = "Hoµng kim ÊnÇ¿»¯¼¶Ê§°Ü",
	[14] = "Hoµng kim ÊnÇ¿»¯5¼¶Ê§°Ü",
	[15] = "Hoµng kim ÊnÇ¿»¯6¼¶Ê§°Ü",
	[16] = "Hoµng kim ÊnÈõ»¯2¼¶Ê§°Ü",
	[17] = "Hoµng kim ÊnÈõ»¯3¼¶Ê§°Ü",
	[18] = "Hoµng kim ÊnÈõ»¯4¼¶Ê§°Ü",
	[19] = "Hoµng kim ÊnÈõ»¯5¼¶Ê§°Ü",
	[20] = "Hoµng kim ÊnÈõ»¯6¼¶Ê§°Ü",
	}	

local tbMaterialA = {
		[1]={szName="Hoµng kim Ên ( 1¼¶Ç¿»¯)",tbProp={0,3205,},nQuality=1,},		-- level 1
		[2]={szName="Hoµng kim Ên ( 2¼¶Ç¿»¯)",tbProp={0,3206,},nQuality=1,},
		[3]={szName="Hoµng kim Ên ( 3¼¶Ç¿»¯)",tbProp={0,3207,},nQuality=1,},
		[4]={szName="Hoµng kim Ên ( 4¼¶Ç¿»¯)",tbProp={0,3208,},nQuality=1,},
		[5]={szName="Hoµng kim Ên ( 1¼¶Ç¿»¯)",tbProp={0,3209,},nQuality=1,},
		[6]={szName="Hoµng kim Ên ( 1¼¶Èõ»¯)",tbProp={0,3215,},nQuality=1,},		-- level 1	
		[7]={szName="Hoµng kim Ên ( 2¼¶Èõ»¯)",tbProp={0,3216,},nQuality=1,},
		[8]={szName="Hoµng kim Ên ( 3¼¶Èõ»¯)",tbProp={0,3217,},nQuality=1,},
		[9]={szName="Hoµng kim Ên ( 4¼¶Èõ»¯)",tbProp={0,3218,},nQuality=1,},
		[10]={szName="Hoµng kim Ên ( 5¼¶Èõ»¯)",tbProp={0,3219,},nQuality=1,},
		}

local tbAdditive = {szName="V­¬ng ThiÕt T­îng LÖnh Phï",tbProp={6,1,2839,},}	-- V­¬ng ThiÕt T­îng LÖnh Phï

local tbFormulaList = {
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 1,
	
	tbMaterial = {},
	
	tbProduct = {
		[1]={szName="Hoµng kim Ên ( 2¼¶Ç¿»¯)",tbProp={0,3206,},nQuality=1,nExpiredTime=7*24*60,},		-- level 2
		[2]={szName="Hoµng kim Ên ( 3¼¶Ç¿»¯)",tbProp={0,3207,},nQuality=1,nExpiredTime=7*24*60,},
		[3]={szName="Hoµng kim Ên ( 4¼¶Ç¿»¯)",tbProp={0,3208,},nQuality=1,nExpiredTime=7*24*60,},
		[4]={szName="Hoµng kim Ên ( 5¼¶Ç¿»¯)",tbProp={0,3209,},nQuality=1,nExpiredTime=7*24*60,},
		[5]={szName="Hoµng kim Ên ( 6¼¶Ç¿»¯ )",tbProp={0,3210,},nQuality=1,nExpiredTime=30*24*60,},
		[6]={szName="Hoµng kim Ên ( 2¼¶Èõ»¯)",tbProp={0,3216,},nQuality=1,nExpiredTime=7*24*60,},		-- level 2
		[7]={szName="Hoµng kim Ên ( 3¼¶Èõ»¯)",tbProp={0,3217,},nQuality=1,nExpiredTime=7*24*60,},
		[8]={szName="Hoµng kim Ên ( 4¼¶Èõ»¯)",tbProp={0,3218,},nQuality=1,nExpiredTime=7*24*60,},
		[9]={szName="Hoµng kim Ên ( 5¼¶Èõ»¯)",tbProp={0,3219,},nQuality=1,nExpiredTime=7*24*60,},
		[10]={szName="Hoµng kim Ên ( 6¼¶Èõ»¯)",tbProp={0,3220,},nQuality=1,nExpiredTime=30*24*60,},
		}
	}
	
function tbWuxingyin:GetRealLevel(nLevel)
	local nMaxLevel = 5
	if nLevel > nMaxLevel then
		nLevel = nLevel - nMaxLevel
	end
	return nLevel
end

-- ÅĞ¶ÏÊÇ·ñÉı¼¶³É¹¦
function tbWuxingyin:CanCompose(nLevel)
	nLevel = self:GetRealLevel(nLevel)
	local nNumber = random(1,100)
	if nNumber <= %tbSuccessRate[nLevel] then
		return 1
	end
	return 0	
end

function tbWuxingyin:CalcItemCount(tbRoomItems, tbItem)
	local nTotalCount = 0
	for i=1, getn(tbRoomItems) do
		local nItemIndex = tbRoomItems[i]
		if nItemIndex and nItemIndex > 0 then
			local nCount = GetItemStackCount(nItemIndex)
			local nItemBindState = GetItemBindState(nItemIndex)	--»ñÈ¡°ó¶¨×´Ì¬,°ó¶¨µÄÎïÆ·²»¼ÆËã
			if nItemBindState == 0 and self:CheckItem(tbItem ,nItemIndex) == 1 then
				nTotalCount = nTotalCount + nCount
			end
		end
	end
	return nTotalCount	
end

-- ÅĞ¶¨UI¸øÓë½çÃæÖĞÊÇ·ñÓĞtbItem
function tbWuxingyin:CheckItemLegal(tbItem)
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nItemNeedCount = tbItem.nCount or 1
	if nItemNeedCount > 0 then
		local tbProp = tbItem.tbProp
		tbProp[4] = tbProp[4] or -1		
		local nCurCount = self:CalcItemCount(tbRoomItems, tbItem)
		if nCurCount < nItemNeedCount then
			return 0
		end	
	end			
	return 1
end

-- ¼ì²éÊÇ·ñºÏ·¨£¬ÈôºÏ·¨£¬·µ»ØºÏ³ÉµÄµÈ¼¶
function tbWuxingyin:CheckLegal()
	local tbItem = self.tbAdditive

	-- ÅĞ¶Ï²ÄÁÏµÄµÈ¼¶£¬ÊÇ·ñ°ó¶¨
	local tbMaterial = self.tbFormula.tbMaterial
	for i=1, getn(tbMaterial) do
		local tbSubMaterial = tbMaterial[i]
		local bLeap = 1
		for j=1, getn(tbSubMaterial) do
			tbItem = tbSubMaterial[j]
			if self:CheckItemLegal(tbItem) ~= 1 then
				bLeap = 0
				break
			end
		end
		
		if bLeap == 1 then
			return i
		end
	end
	return 0
end

-- Éı¼¶ÖĞĞèÒªÔö¼ÓÅĞ¶¨ºÏ³É¸ÅÂÊ£¬ÒÑ¾­ĞŞ¸Ä²ÄÁÏ±íµÈ
function tbWuxingyin:Compose(nComposeCount, nLevel)
	
	local tbMaterial	= self.tbFormula.tbMaterial[nLevel]	-- ¶¯Ì¬Éú³ÉºÏ³ÉµÄ²ÄÁÏ±í
	local tbProduct		= self.tbFormula.tbProduct[nLevel]
	
	nComposeCount = nComposeCount or 1
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
		Talk(1, "", szMsg)
		return 0;
	end
	
	-- ¶¯Ì¬ÉèÖÃÏûºÄ±í
	local bSuccess = self:CanCompose(nLevel)
	
	local tbConsume = {}
	if bSuccess ~= 1 then
		tinsert(tbConsume, tbMaterial[2])		-- ºÏ³ÉÊ§°ÜÖ»ÏûºÄV­¬ng ThiÕt T­îng LÖnh Phï	
	else
		tbConsume = tbMaterial
	end
--	print("compose nLevel = " .. tostring(nLevel))
	if self:ConsumeMaterial(tbConsume, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	
	if bSuccess == 1 then
		if type(tbProduct) == "table" then
			tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
		end
		
		if type(self.tbFormula.pProductFun) == "function" then
			self.tbFormula:pProductFun(nComposeCount)
		end
	else
		local szMsg = format("<color=red>Hîp thµnh thÊt b¹i, mÊt ®i")
		for i=1,getn(tbConsume) do
			szMsg = szMsg .. tbConsume[i].szName
		end
		szMsg = szMsg .. "<color>"
		Msg2Player(szMsg)
	end
	
	self:Log(nLevel, bSuccess)		-- ÊÂ¼şÈÕÖ¾
	return bSuccess
end

function tbWuxingyin:Log(nLevel, bSuccess)
	if bSuccess == 0 then
		nLevel = nLevel + 10
	end
	tbLog:PlayerActionLog("HoangKimAn", %tbLogAction[nLevel])		-- ÈÕÖ¾
end

-- ĞŞ¸ÄÉı¼¶ÖĞµÄÌáÊ¾µÀ¾ßÃû
function tbWuxingyin:ComposeGiveUI()
	
	local szTitle = "Éı¼¶Hoµng kim Ên"
	local szContent = ""
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

-- ÅĞ¶¨Ëù¸øµÄÎïÆ·ÊÇ·ñ·ûºÏÒªÇó
function tbWuxingyin:GiveUIOk(nCount)
	local nLevel = self:CheckLegal()
--	print("nLeve = " .. tonumber(nLevel))
	if nLevel > 0 then
		self:Compose(1, nLevel)
	else
		CreateNewSayEx("<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>", {})
	end
	return 
end


function tbWuxingyin:Register()
	local tbOpt = {}
	-- Éı¼¶Ngò hµnh ÊnµÄ¶Ô»°ÄÚÈİ£¬°üÀ¨Éı¼¶¹«Ê½µÈ
	local szMsg = "Hoµng kim ÊnÉıÒ»¼¶V­¬ng ThiÕt T­îng LÖnh PhïÓĞÒ»¶¨ÅĞ¶¨¸ÅÂÊ,Èç¹ûÉı¼¶Ê§°Ü½«»áÊ§È¥V­¬ng ThiÕt T­îng LÖnh Phï£¬¾ßÌåÇé¿öÈçÏÂ:\n"
	for i=1,5 do 
		szMsg = szMsg .. format("Hoµng kim Ên %d ¼¶ ( Èõ»¯/Ç¿»¯) +1 V­¬ng ThiÕt T­îng LÖnh Phï= Hoµng kim Ên %d ¼¶ ( Èõ»¯/Ç¿»¯ )\n",i,(i+1))
	end
	
	%tbFormulaList.tbMaterial = {}
	local tbProduct = %tbFormulaList.tbProduct
	
	for i=1,getn(%tbMaterialA) do
		
		local tbMaterial = {}
		tinsert(tbMaterial, %tbMaterialA[i])
		tinsert(tbMaterial, %tbAdditive)
		tinsert(%tbFormulaList.tbMaterial, tbMaterial)		-- ºÏ³É¹«Ê½µÄ²ÄÁÏ±í
		
	end
	
	local p = tbWuxingyin:new(%tbFormulaList, "shengjiwuxingyin", INVENTORY_ROOM.room_giveitem)
	
	tinsert(tbOpt, {"Éı¼¶Hoµng kim Ên", p.ComposeGiveUI, {p}})
	tinsert(tbOpt, {"Hñy bá "})
	nItem2EquipRegId = pEventType:Reg("Thî rÌn trong thµnh", "Éı¼¶Hoµng kim Ên", CreateNewSayEx, {szMsg, tbOpt})
end


tbWuxingyin:Register()