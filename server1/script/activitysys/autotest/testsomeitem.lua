Include("\\script\\lib\\unittest.lua")






tbItemList = 
{
	["ľ�ʱ���"] = {tbProp={6,1,2318,1,0,0},},
	["ͭ�Ʊ���"] = {tbProp={6,1,2319,1,0,0},},
	["���Ʊ���"] = {tbProp={6,1,2320,1,0,0},},
	["�ƽ���"] = {tbProp={6,1,2321,1,0,0},},
	["�׽���"] = {tbProp={6,1,2322,1,0,0},},
	["Ұ�ŵ����ر���"] = {tbProp={6,1,2374,1,0,0},},
	["����ս���"] = {tbProp={6,1,2377,1,0,0},},
	["�����ر�"] = {tbProp={6,1,2375,1,0,0},},
	["ˮ���Ʊ�"] = {tbProp={6,1,2376,1,0,0},},
	["������"] = {tbProp={6,1,2373,1,0,0},},
	
}

tbRequireList = 
{
	["ľ�ʱ���"] = {nMinCell = 1, },
	["ͭ�Ʊ���"] = {nMinCell = 1, },
	["���Ʊ���"] = {nMinCell = 1, },
	["�ƽ���"] = {nMinCell = 1, },
	["�׽���"] = {nMinCell = 1, },
	["Ұ�ŵ����ر���"] = 
	{
		nMinCell = 1, 
		tbItem = {tbProp={6,1,2348,1,-1,0}, nCount = 6},
	},
	["����ս���"] = {nMinCell = 1, },
	["�����ر�"] = 
	{
		nMinCell = 1, 
		tbItem = {tbProp={6,1,2348,1,-1,0}, nCount = 12},
	},
	["ˮ���Ʊ�"] = {nMinCell = 1},
	["������"] = {nMinCell = 1,},

	
}

local tbTestAward = {}

function tbTestAward:GiveAwardByList(tbItem, szLogTitle, nAwardCount)
	self.tbItem = tbItem
	self.szLogTitle = szLogTitle
	self.nAwardCount = nAwardCount
	
	
end


suite = TestSuite:new("�Զ����Իϵͳ����")



ItemCase = {}

function ItemCase:new(szName)
	local tb = TestCase:new("ʹ��"..szName, self)
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


--�����ռ䲻�㲻��ʹ�õ���
function ItemCase:test_Use2_1()
	local tbItem = {}
	
	for nCell=0, 1 do
		for i=1, CalcFreeItemCellCount() + nCell - self.tbRequire.nMinCell  do
			local nItemIndex = AddItemNoStack(6,0,1,1,0,0,0)
			tinsert(tbItem, nItemIndex)
		end
		local nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
		
		if nCell == 0 then
			self:assertTrue(nRet ~= 1, "װ�������ǲ���ʹ��")
		else
			self:assertTrue(nRet == 1, "δ���װ����λ����")
		
			for i=1, getn(tbItem) do
				RemoveItemByIndex(tbItem[i])
			end
		end
	end
end

--û��������߲���ʹ��
function ItemCase:test_Use3()
	local tbRequireItem = self.tbRequire.tbItem
	
	
	if not tbRequireItem then
		return 
	end
	local tbProp = tbRequireItem.tbProp
	ConsumeEquiproomItem(tbRequireItem.nCount - 1, tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	
	local nOldCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	
	
	local nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
	
	self:assertTrue(nRet == 1, "ԭ�ϲ���Ҳ����ʹ��"..nRet)
	local nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	self:assertEquals(nCount, nOldCount, "ʹ��ʧ�ܻ���ԭ��")
	
	ConsumeEquiproomItem(nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4])
	
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\lib\\awardtemplet.lua", "tbAwardTemplet:GiveAwardByList", tbRequireItem, "testitem", 2)	
	
	nRet = DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)

	
	self:assertTrue(nRet ~= 1, "ԭ����Ҳ����ʹ��")
	
	nCount = CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3],tbProp[4])
	self:assertEquals(nCount, tbRequireItem.nCount, "�۳�������Ҫԭ��")	
	
	
end


function ItemCase:test_Use1()
	
	
	
	
	
	DynamicExecuteByPlayer(PlayerIndex, self.szExePath, "main", self.nItemIndex)
	self:assertTrue(%tbTestAward.szLogTitle ~= nil, format("ʹ��%s �յ���Ʒ��û�м�¼", GetItemName(self.nItemIndex)))	
	local tbItem = %tbTestAward.tbItem
	local nTotalRate = 0
	self:assertTrue(tbItem ~= nil, format("ʹ�� %s �ղ�����Ʒ", GetItemName(self.nItemIndex)))
	
	if not tbItem then
		return
	end
	
	for i=1, getn(tbItem) do
		nTotalRate = nTotalRate + tbItem[i].nRate	
	end
	self:assertEquals(nTotalRate, 100, format("��Ʒ%s ���ʲ��� 100%%", GetItemName(self.nItemIndex)) )
end


for key, value in tbItemList do
	suite:add(ItemCase:new(key))
end