Include("\\script\\lib\\composeex.lua")
Include("\\script\\activitysys\\config\\41\\head.lua")
Include("\\script\\activitysys\\config\\41\\variables.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\progressbar.lua")

tbMaterial_Medal = {
	[1]={szName="1级徽号",tbProp={6,1,3133,1,0,0},nExpiredTime=20120501,nCount=2,},
	[2]={szName="2级徽号",tbProp={6,1,3134,1,0,0},nExpiredTime=20120501,nCount=1,},
	}
tbMaterial_Shijin = {szName="石金",tbProp={6,1,3136,1,0,0},nExpiredTime=20120501,nCount=1,}
	
tbProduct = {
	[1] = {szName=" 2级徽号",tbProp={6,1,3134,1,0,0},nExpiredTime=20120501,},
	[2] = {szName=" 3级徽号",tbProp={6,1,3135,1,0,0},nExpiredTime=20120501,}
	}

tbMedalLevelUpRate = {50,35 }	

tbMedalLog = {
	[1] = {
		szSuccess = "升级成功2级徽号",
		szFail = "升级失败2级徽号",
		},
	[2] = {
		szSuccess = "升级成功3级徽号",
		szFail = "升级失败3级徽号",
		},
	}

pActivity.tbUpdateCompose = {}
tbUpdateXunZhang = tbActivityCompose:new()

function tbUpdateXunZhang:ComposeDailog()
	--如果输入为空，使用默认值
	if self.nRoomType == INVENTORY_ROOM.room_giveitem then
		return self:ComposeGiveUI()
	end
	local tbMaterial = self.tbFormula.tbMaterial
	local tbProduct = self.tbFormula.tbProduct
	
	local szComposeTitle = self.tbFormula.szComposeTitle or format("换 %s", tbProduct.szName)
	
	local szMsg = format("%s 要求: <enter>%s", szComposeTitle ,self:GetMaterialList(tbMaterial))
	local tbOpt = {}
	tbOpt[1] = {"确认", self.OpenProgressBar, {self}}
	tbOpt[2] = {"放弃"}
	CreateNewSayEx(szMsg, tbOpt)
	
end


function tbUpdateXunZhang:OpenProgressBar()
	local tbMaterial	= self.tbFormula.tbMaterial
	local nComposeCount = 1
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>大侠带的原料不足了!<color>"
		Talk(1, "", szMsg)
		return 0;
	end
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\41\\update_xunzhang.lua",  "tbProgressBar:OpenByConfig", 14, self.WantCompose, {self, GetName()})
end

function tbUpdateXunZhang:CanCompose()
	local nRate = random(1,100)
	if nRate <= self.tbFormula.nRate then
		return 1
	else
		return 0
	end
end

function tbUpdateXunZhang:WantCompose(szName)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex <= 0 then
		return 
	end
	CallPlayerFunction(nPlayerIndex, self.Compose, self)
end

function tbUpdateXunZhang:Compose()
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbProduct		= self.tbFormula.tbProduct
	
	nComposeCount = nComposeCount or 1
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	local nFreeItemCellLimit = self.tbFormula.nFreeItemCellLimit or 1
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("为了确保大侠的财产安全，请留空%d %dx%d 装备", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	if self:CheckMaterial(tbMaterial, nComposeCount) ~=1 then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>大侠所带原料不足了!<color>"
		Talk(1, "", szMsg)
		return 0;
	end
	if self:ConsumeMaterial(tbMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		Msg2Player("制造失败，失去一些原料.")
		return 0;
	end
	local bSuccess = self:CanCompose()
	if bSuccess == 0 then
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, self.tbFormula.tbLog.szFail)
		Msg2Player("真遗憾，升级失败")
		return 0
	else
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, self.tbFormula.tbLog.szSuccess)
		Msg2Player("恭喜，升级成功")
	end
	
	if type(tbProduct) == "table" then
		tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
	end
	
	if type(self.tbFormula.pProductFun) == "function" then
		
		self.tbFormula:pProductFun(nComposeCount)

	end
	return 1;
end
function pActivity:InitUpdateCompose()
	self.tbUpdateCompose = {}
	for nType=1,getn(%tbMaterial_Medal) do
		tbFormulaList = {	
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02,
			}
		tbFormulaList.tbMaterial = {}
		tbFormulaList.tbProduct = {}
		tinsert(tbFormulaList.tbMaterial, %tbMaterial_Medal[nType])
		tinsert(tbFormulaList.tbMaterial, %tbMaterial_Shijin)
		
		tbFormulaList.tbProduct = %tbProduct[nType]
		tbFormulaList.nRate = %tbMedalLevelUpRate[nType]
		tbFormulaList.tbLog = %tbMedalLog[nType]
		p = %tbUpdateXunZhang:new(tbFormulaList, "updatemedal", INVENTORY_ROOM.room_equipment)
		tinsert(self.tbUpdateCompose, nType, p)
	end

end

function pActivity:toUpdatecompose(nType)
	self.tbUpdateCompose[nType]:ComposeDailog()
end

pActivity.nPak = curpack()