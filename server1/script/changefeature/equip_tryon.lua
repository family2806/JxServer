
IncludeLib("FILESYS")
tbEquipTryOn = {}

tbEquipTryOn.tbTemplate = {}

function tbEquipTryOn:GetCalss(szType)
	return self.tbTemplate[szType] or self
end

function tbEquipTryOn:NewTemplate(szType)
	local tb = {}
	for key, value in self do
		tb[key] = value
	end
	self.tbTemplate[szType] = tb
	return tb
end


tbEquipTryOn.nCountPerPage = 5
tbEquipTryOn.szType = ""
tbEquipTryOn.tbData_Male = 
{
	--{nFeature = 0, szName = "1", nPrice = 1},
}
tbEquipTryOn.tbData_Female = 
{
	--{nFeature = 0, szName = "1", nPrice = 1},
}
--对话菜单
function tbEquipTryOn:DailogMenu(nPage)
	
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	local nTotalCount = getn(tbData)
	
	
	
	local nCountPerPage = self.nCountPerPage
	local nStart = (nPage - 1) * nCountPerPage + 1
	local nEnd = nStart + nCountPerPage - 1
	
	if nStart > nTotalCount then
		return
	end
	if nEnd > nTotalCount then
		nEnd = nTotalCount
	end

	local szTitle = format("正在看外形 %d~%d", nStart, nEnd)
	local tbOpt = {}
	
	
	for i=nStart, nEnd do
		local opt = 
		{
			format("%d\%s", i, tbData[i].szName),
			self.TryOnDailog,
			{self, i}
		}
		tinsert(tbOpt, opt)
	end
	
	if nStart > 1 then
		tinsert(tbOpt, {"上一页", self.DailogMenu, {self, nPage - 1}})
	end
	
	if nEnd < nTotalCount then
		tinsert(tbOpt, {"下一页 ", self.DailogMenu, {self, nPage + 1}})
	end
	
	tinsert(tbOpt, {"结束对话"})
	
	CreateNewSayEx(szTitle, tbOpt)
end


function tbEquipTryOn:TryOnDailog(nIdx)
	
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	
	self:TryOn(tbData[nIdx].nFeature)
	
	local szTitle = format("阁下觉得如何？满意吗？想练习此外形需要<color=yellow>%d<color> 精炼石.", tbData[nIdx].nPrice)
	local nPage = ceil(nIdx/self.nCountPerPage)
	local tbOpt = 
	{
		{"很合适，快给我做.", self.GiveEquip, {self, nIdx}},
		{"让我再看看.", self.DailogMenu, {self, nPage}}
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function tbEquipTryOn:ChangeFeature(nNewHelmType, nNewArmorType, nNewWeaponType, nNewHorseType)
	local nHelmType, nArmorType, nWeaponType, nHorseType = GetPlayerFeature(PlayerIndex)
	
	local nSettingsIdx = -1 - GetSex()
	
	if nNewHelmType == -1 then
		nNewHelmType = nHelmType
	end
	if nNewArmorType == -1 then
		nNewArmorType = nArmorType
	end
	if nNewWeaponType == -1 then
		nNewWeaponType = nWeaponType
	end
	if nNewHorseType == -1 then
		nNewHorseType = nHorseType
	end
	
	ChangeOwnFeature( 0, -1, nSettingsIdx,  nNewHelmType, nNewArmorType, nNewWeaponType, nNewHorseType)
end
--需要重载试穿
function tbEquipTryOn:TryOn(nNo)
	
end

--注入道具里
function tbEquipTryOn:InjectToItem(nItemIndex, nNo)
	SetItemNewFeature(nItemIndex, nNo)
end

--还原
function tbEquipTryOn:RestoreItem(nItemIndex)
	SetItemNewFeature(nItemIndex, -1)
end

function tbEquipTryOn:GiveEquip(nIdx)
	
	g_GiveItemUI("更换装备外形","请进入需要更换的装备", {self.Proc, {self, nIdx}})
	
end

function tbEquipTryOn:Proc(nIdx, nCount)
	if nCount ~= 1 then
		Talk(1, "", "只能换一件需要更换的装备.")
		return
	end
	
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	local pData =  tbData[nIdx]
	if not pData then
		Talk(1, "", "选择外形错误.")
		return 
	end
	
	local nItemIndex = GetGiveItemUnit(1)
	
	if self:CheckEquip(nItemIndex) ~= 1 then
		return 
	end
	--local tbItem = {szName="精炼石", tbProp={6, 1, 2280, -1}}
	--local tbProp = tbItem.tbProp
	local nCount = pData.nPrice
--	--检查石头
--	if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < nCount then
--		Talk(1, "", format("你没有带够精炼石啊，需要%d个", nCount))
--		return 
--	end

	if GetEnergy() < nCount then
		Talk(1, "", format("阁下依然没有带够精炼石，需要 %d 精炼石", nCount))
		return
	end
	
	--扣石头
	ReduceEnergy(nCount)
	
	
	if pData.nFeature then
		self:InjectToItem(nItemIndex, pData.nFeature)
		Msg2Player(format("装备外形 %s 已更换", GetItemName(nItemIndex)))
	end
	
end

function tbEquipTryOn:CheckEquip()
	
end

function tbEquipTryOn:AskFeatureNo()
	local tbData = self.tbData_Male
	if GetSex() == 1 then
		tbData = self.tbData_Female
	end
	
	
	local nMaxCount = getn(tbData)
	g_AskClientNumberEx(1, nMaxCount, "请选择外形号", {self.GiveEquip, {self}})
end


function tbEquipTryOn:LoadFile()
	self.tbData_Male = {}
	self.tbData_Female = {}
	self:LoadOneFile( self.tbData_Male, self.szFile_Male)
	self:LoadOneFile( self.tbData_Female, self.szFile_Female)
	
end

function tbEquipTryOn:LoadOneFile( tbData, szFile)
	
	if TabFile_Load(szFile, szFile) == 0 then
		WriteLog(format("Load %s is fail", szFile))
		return 0;
	end
	local nRowCount = TabFile_GetRowCount(szFile)
	for i=2, nRowCount do
		local szName	= TabFile_GetCell(szFile, i, "Name")
		local nFeature	= tonumber(TabFile_GetCell(szFile, i, "Feature"))
		local nPrice	= tonumber(TabFile_GetCell(szFile, i, "Price"))
		
		local tb = {nFeature = nFeature, szName = szName, nPrice = nPrice}
		
		tinsert(tbData, tb)
		
	end
end
