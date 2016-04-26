-- 重铸白虎装备

Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
IncludeLib("ITEM")
tbBaiHuRefineEquip = {}

tbBaiHuRefineList = 
{
	[1]= {szName="白虎项链", nStone = 1, nWidth = 2, nHeight = 1, },
	[2]= {szName="白虎盔",   nStone = 1, nWidth = 2, nHeight = 2, },
	[3]= {szName="白虎上戒", nStone = 1, nWidth = 1, nHeight = 1, },
	[4]= {szName="白虎护腕", nStone = 1, nWidth = 1, nHeight = 2, },
	[5]= {szName="白虎腰带", nStone = 1, nWidth = 2, nHeight = 1, },
	[6]= {szName="白虎衣",   nStone = 1, nWidth = 2, nHeight = 3, },
	[7]= {szName="白虎武器",nStone = 1, nWidth = 2, nHeight = 4, },
	[8]= {szName="白虎鞋",   nStone = 1, nWidth = 2, nHeight = 2, },
	[9]= {szName="白虎佩",   nStone = 1, nWidth = 1, nHeight = 2, },
	[10]={szName="白虎下戒", nStone = 1, nWidth = 1, nHeight = 1, },
}

BAIHU_IDX_START = 2285
BAIHU_IDX_END = 2514


tbRefineMaterial = {szName = "白虎重练石", tbProp = {6,1,3187, -1},}

function tbBaiHuRefineEquip:ComposeGiveUI()
	
	local szTitle = format("  %-15s\t%s", "白虎装备", " 白虎重练石")
	
	local strDesc = ""
	for i=1, getn(%tbBaiHuRefineList) do
		local pTmp = %tbBaiHuRefineList[i]
		strDesc = format("%s%-21s\t%d\n", strDesc, pTmp.szName, pTmp.nStone)	
	end
	
	g_GiveItemUI(szTitle, strDesc, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbBaiHuRefineEquip:GiveUIOk(nPutCount)	
	
	if nPutCount ~= 1 then
		Talk(1, "", "只需放入1个白虎装备")
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1)
	local nItemQuality = GetItemQuality(nItemIndex)
	if nItemQuality ~= 1 then
		Talk(1, "", "你不该放入黄金装备")
		return
	end
	local nGoldEquipIdx = GetGlodEqIndex(nItemIndex)
	if %BAIHU_IDX_START > nGoldEquipIdx or nGoldEquipIdx > %BAIHU_IDX_END  then
		Talk(1, "", "你不应该放入白虎装备")
		return
	end
	--检查绑定状态
	local nBindState = GetItemBindState(nItemIndex)
	if nBindState ~= 0 then
		Talk(1, "", "你正处于绑定状态, 无法重铸.")
		return
	end
	
	--检查是否是破损装备
	local nG, _, _ = GetItemProp(nItemIndex)
	if nG == 7 then
		Talk(1, "", "你的装备已被损毁无法重炼.")
		return
	end
	if ITEM_GetExpiredTime(nItemIndex) ~= 0 then
		Talk(1, "", "不是永久装备无法重炼")
		return
	end
	
	
	local nEquType = mod(nGoldEquipIdx - %BAIHU_IDX_START, 10) + 1
	
	local nWidth = %tbBaiHuRefineList[nEquType].nWidth
	local nHeight = %tbBaiHuRefineList[nEquType].nHeight
	
	if nWidth ~= 0 and nHeight ~= 0 and CountFreeRoomByWH(nWidth, nHeight, 1) < 1 then
		Say(format("为保证大侠的财产安全, 请整理出 %d %dx%d的背包空间", 1, nWidth, nHeight))
		return
	end	

	local tbItem = 
	{
		szName = %tbRefineMaterial.szName, 
		tbProp = %tbRefineMaterial.tbProp, 
		nCount = %tbBaiHuRefineList[nEquType].nStone
	}
	local tbProp = tbItem.tbProp
	if CalcEquiproomItemCount(tbProp[1], tbProp[2], tbProp[3], tbProp[4]) < tbItem.nCount then
		Talk(1, "", format("<color=red>你放入的比例%不够. <color>", tbItem.szName))
		return
	end
	
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	RemoveItemByIndex(nItemIndex)
	if ConsumeEquiproomItem(tbItem.nCount, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1 then
		return
	end	

	tbAwardTemplet:Give({tbProp = {0, nGoldEquipIdx}, nQuality = 1}, 1, {self.szLogTitle})
end

function tbBaiHuRefineEquip:Dialog()
		
	local strDesc = "<npc>拿<color=yellow>需要重铸的白虎装备<color> 和数量<color=yellow> 相应的白虎重练石<color>放入"
	
	strDesc = format("%s\n\t\t\t\t\t%-29s%s", strDesc, "白虎装备", " 白虎重练石")
	for i=1, getn(%tbBaiHuRefineList) do
		local pTmp = %tbBaiHuRefineList[i]
		strDesc = format("%s\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", strDesc, pTmp.szName, pTmp.nStone)
	end
	local tbOpt = {}
	tinsert(tbOpt, {"重铸白虎装备", self.ComposeGiveUI, {self}})
	tinsert(tbOpt, {"销毁"})
	CreateNewSayEx(strDesc, tbOpt);
end

--暂时关闭制造白虎性能- Modified By DinhHQ - 20120511
--pEventType:Reg("神秘铁匠", "我想请您重铸白虎装备", tbBaiHuRefineEquip.Dialog, {tbBaiHuRefineEquip})