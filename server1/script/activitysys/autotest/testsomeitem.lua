Include("\\script\\lib\\unittest.lua")






tbItemList = 
{
	["木质宝盒"] = {tbProp={6,1,2318,1,0,0},},
	["铜制宝盒"] = {tbProp={6,1,2319,1,0,0},},
	["银制宝盒"] = {tbProp={6,1,2320,1,0,0},},
	["黄金宝箱"] = {tbProp={6,1,2321,1,0,0},},
	["白金宝箱"] = {tbProp={6,1,2322,1,0,0},},
	["野叟的神秘宝箱"] = {tbProp={6,1,2374,1,0,0},},
	["攻城战礼包"] = {tbProp={6,1,2377,1,0,0},},
	["至尊秘宝"] = {tbProp={6,1,2375,1,0,0},},
	["水贼财宝"] = {tbProp={6,1,2376,1,0,0},},
	["风火锦囊"] = {tbProp={6,1,2373,1,0,0},},
	
}

tbRequireList = 
{
	["木质宝盒"] = {nMinCell = 1, },
	["铜制宝盒"] = {nMinCell = 1, },
	["银制宝盒"] = {nMinCell = 1, },
	["黄金宝箱"] = {nMinCell = 1, },
	["白金宝箱"] = {nMinCell = 1, },
	["野叟的神秘宝箱"] = 
	{
		nMinCell = 1, 
		tbItem = {tbProp={6,1,2348,1,-1,0}, nCount = 6},
	},
	["攻城战礼包"] = {nMinCell = 1, },
	["至尊秘宝"] = 
	{
		nMinCell = 1, 
		tbItem = {tbProp={6,1,2348,1,-1,0}, nCount = 12},
	},
	["水贼财宝"] = {nMinCell = 1},
	["风火锦囊"] = {nMinCell = 1,},

	
}

local tbTestAward = {}

function tbTestAward:GiveAwardByList(tbItem, szLogTitle, nAwardCount)
	self.tbItem = tbItem
	self.szLogTitle = szLogTitle
	self.nAwardCount = nAwardCount
	
	
end


suite = TestSuite:new("自动测试活动系统道具")



ItemCase = {}

function ItemCase:new(szName)
	local tb = TestCase:new("使用"..szName, self)
	tb.szName = szName
	tb.szExePath = "\\script\\item\\activityitem.lua"
	tb.tbRequire = tbRequireList[szName]
	
	
	return tb
end


function ItemCase:setUp()
	ThrowAllItem()

	if not self.tbAwardClass then
		self.tbAwardClass = DynamicExecute(self.szExePath, "getglobal", "tbAwardTemplet")	
	end
	
	
	DynamicExecute(self.szExePath, "setglobal", "tbAwardTemplet", %tbTestAward)
	
	
	local tbItem = tbItemList[self.szName]
	local tbItemProp = tbItem.tbProp
	local nItemIndex = AddItemNoStack(unpack(tbItemProp))
	self.nItemIndex = nItemIndex
	
	
	if self.tbRequire.tbItem then
		DynamicExecuteByPlayer(PlayerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", self.tbRequire.tbItem, "testitem")
	end
end

function ItemCase:tearDown()
	
	DynamicExecute(self.szExePath, "setglobal", "tbAwardTemplet", self.tbAwardClass)
	
	
	
	RemoveItemByIndex(self.nItemIndex)
	
	if self.tbRequire.tbItem then
		local tbProp = self.tbRequire.tbItem.tbProp
		local nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
		ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3],tbProp[4])
		
		
	end
	
end


--背包空间不足不能使用道具
function ItemCase:test_Use2_1()
	local tbItem = {}
	
	for nCell=0, 1 do
		for i=1, CalcFreeItemCellCount() + nCell - self.tbRequire.nMinCell  do
			local nItemIndex = AddItemNoStack(6,0,1,1,0,0,0)
			tinsert(tbItem, nItemIndex)
		end
		local nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
		
		if nCell == 0 then
			self:assertTrue(nRet ~= 1, "装备够但是不能使用")
		else
			self:assertTrue(nRet == 1, "未添加装备空位上限")
		
			for i=1, getn(tbItem) do
				RemoveItemByIndex(tbItem[i])
			end
		end
	end
end

--没有需求道具不能使用
function ItemCase:test_Use3()
	local tbRequireItem = self.tbRequire.tbItem
	
	
	if not tbRequireItem then
		return 
	end
	local tbProp = tbRequireItem.tbProp
	ConsumeEquiproomItem(tbRequireItem.nCount - 1, tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	
	local nOldCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	
	
	local nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
	
	self:assertTrue(nRet == 1, "原料不足也可以使用"..nRet)
	local nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	self:assertEquals(nCount, nOldCount, "使用失败还扣原料")
	
	ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", tbRequireItem, "testitem", 2)	
	
	nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)

	
	self:assertTrue(nRet ~= 1, "原料足也不能使用")
	
	nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	self:assertEquals(nCount, tbRequireItem.nCount, "扣除更多需要原料")	
	
	
end


function ItemCase:test_Use1()
	
	
	
	
	
	DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
	self:assertTrue(%tbTestAward.szLogTitle ~= nil, format("使用%s 收到奖品，没有记录", GetItemName(self.nItemIndex)))	
	local tbItem = %tbTestAward.tbItem
	local nTotalRate = 0
	self:assertTrue(tbItem ~= nil, format("使用 %s 收不到奖品", GetItemName(self.nItemIndex)))
	
	if not tbItem then
		return
	end
	
	for i=1, getn(tbItem) do
		nTotalRate = nTotalRate + tbItem[i].nRate	
	end
	self:assertEquals(nTotalRate, 100, format("奖品%s 几率不够 100%%", GetItemName(self.nItemIndex)) )
end


for key, value in tbItemList do
	suite:add(ItemCase:new(key))
end