-- 文件名　：compose_grass.lua
-- 创建者　：wangjingjun
-- 内容　　：用各种玫瑰花兑换绿草
-- 创建时间：2012-02-15 15:00:45

Include("\\script\\lib\\composeex.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\config\\40\\head.lua")
Include("\\script\\activitysys\\config\\40\\variables.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

tbFormulaList = {
	nWidth = 1,
	nHeight = 1,
	nFreeItemCellLimit = 0.02,
	
	tbProduct = {szName="绿草",tbProp={6,1,3124,1,0,0},nExpiredTime=20120401,},
}

tbMaterial_Rose = {
	[1]={szName="白玫瑰",tbProp={6,1,3117,1,0,0}, nCount=50,},
	[2]={szName="黄玫瑰",tbProp={6,1,3119,1,0,0}, nCount=50,},
	[3]={szName="蓝玫瑰",tbProp={6,1,3118,1,0,0}, nCount=50,},
	[4]={szName="红玫瑰",tbProp={6,1,3120,1,0,0}, nCount=50,},
	}

tbMaterial_Jxb = {
	[1]={szName="银两",nJxb=300000, nCount = 1,},
	[2]={szName="银两",nJxb=600000, nCount = 1,},
	[3]={szName="银两",nJxb=1000000, nCount = 1,},
	}	
	
tbSelectMoney = {
	[1] = "3 万两",
	[2] = "6 万两",
	[3] = "10 万两",
	}	

pActivity.tbCompose = {}
function pActivity:composegrassdialog()
	
	local nSelectCount = getn(%tbSelectMoney)
	local szTitle = format("换绿草有%d种模式", nSelectCount)
	for i=1, nSelectCount do
		szTitle = format("%s, 种物品%d 要求 %s", szTitle, i, %tbSelectMoney[i])
		if i ~= nSelectCount then
			szTitle = format("%s, 每日最多换%d 次", szTitle, %MAX_TB_DAILY_COMPOSE_GRASS[i])
		else
			szTitle = format("%s,此方法不限制换取次数", szTitle)	
		end
	end
	
	local tbOpt = {}
	for i=1, nSelectCount do
		tinsert(tbOpt, {%tbSelectMoney[i], self.selectrose, {self, i}})
	end
	tinsert(tbOpt, {"离开", cancel})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:selectrose(nMoneyIndex)
	
	local nSelectCount = getn(%tbMaterial_Rose)
	local szTitle = "请选择想换取的玫瑰种类"

	local tbOpt = {}
	for i=1, nSelectCount do
		tinsert(tbOpt, {%tbMaterial_Rose[i].szName, self.tocompose, {self, nMoneyIndex,i}})
	end
	tinsert(tbOpt, {"返回", self.composegrassdialog, {self}})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function pActivity:InitCompose()
	self.tbCompose = {}
	
	for i=1,getn(%tbMaterial_Jxb) do
		tbCompose = {}
		for j=1,getn(%tbMaterial_Rose) do
		
			local tbFormulaList = {
				nWidth = 1,
				nHeight = 1,
				nFreeItemCellLimit = 0.02,
				tbProduct = {szName="绿草",tbProp={6,1,3124,1,0,0},nCount=10, nExpiredTime=20120401,},
			}
			
			tbFormulaList.tbMaterial = {}
			tinsert(tbFormulaList.tbMaterial, %tbMaterial_Rose[j])
			tinsert(tbFormulaList.tbMaterial, %tbMaterial_Jxb[i])
			
			local nTskIndex = %TSK_TB_DAILY_COMPOSE_GRASS[i]
			tbFormulaList.nTskIndex = nTskIndex
			tbFormulaList.pProductFun = function(pCompose, nComposeCount)
				--%self:AddTask(pCompose.nTskIndex, nComposeCount)
				%self:AddTaskDaily(pCompose.nTskIndex, nComposeCount)
			end
			
			p = tbActivityCompose:new(tbFormulaList, %ACTION_COMPOSE_GRASS, INVENTORY_ROOM.room_equipment)
			tinsert(tbCompose, j, p)
		end
		tinsert(self.tbCompose, i, tbCompose)
	end

end

function pActivity:tocompose(nMoneyIndex, nRoseIndex)

	local nTskIndex = %TSK_TB_DAILY_COMPOSE_GRASS[nMoneyIndex]
	local nMaxCount = %MAX_TB_DAILY_COMPOSE_GRASS[nMoneyIndex]
	-- 第一和第二种兑换方式有最大次数限制
	if nMoneyIndex < getn(%tbMaterial_Jxb) then
	 	--nMaxCount = nMaxCount - self:GetTask(nTskIndex)
	 	nMaxCount = nMaxCount - self:GetTaskDaily(nTskIndex)
	end
	
	if nMaxCount <= 0 then
		Say("通过此种方法您已换取的绿草达到上限，请试试其他方法!")
		return
	end
	local bAskNumber = 1
	--self.tbCompose[nMoneyIndex][nRoseIndex]:ComposeDailog(bAskNumber, nMaxCount)
	self.tbCompose[nMoneyIndex][nRoseIndex]:ComposeDailog(0)
end
