-- 文件名　：yandiduihuan.lua
-- 创建者　：zhongchaolong
-- 创建时间：2008-05-14 16:38:43
--炎帝装备重铸
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("ITEM")
yandiduihuan_tbItemList = 
{
	{szName="燧人之赤血元武甲", nQuality=1, tbProp={0, 442}},
	{szName="燧人之百炼盔", nQuality=1, tbProp={0, 443}},
	{szName="燧人之逐天靴", nQuality=1, tbProp={0, 445}},
	{szName="燧人之金缕软猬护腕", nQuality=1, tbProp={0, 446}},
	{szName="伏羲之幻影屐", nQuality=1, tbProp={0, 455}},
	{szName="伏羲之无量辟邪手", nQuality=1, tbProp={0, 456}},
	{szName="伏羲之碎心", nQuality=1, tbProp={0, 457}},
	{szName="女娲之红颜发带", nQuality=1, tbProp={0, 463}},
	{szName="女娲之六艺霓裳束带", nQuality=1, tbProp={0, 464}},
	{szName="女娲之寒湘", nQuality=1, tbProp={0, 467}},
	{szName="祝融之烈焰怒风装", nQuality=1, tbProp={0, 472}},
	{szName="祝融之惊炙不灭爪", nQuality=1, tbProp={0, 476}},
	{szName="祝融之破日", nQuality=1, tbProp={0, 477}},
	{szName="神农之魈阳地皇衣", nQuality=1, tbProp={0, 482}},
	{szName="神农之怒雷头环", nQuality=1, tbProp={0, 483}},
	{szName="神农之驭风履", nQuality=1, tbProp={0, 485}},
	{szName="神农之斩岳", nQuality=1, tbProp={0, 487}},
}

yandiduihuan_Material = 
{
	{szName="凤鸣槌", tbProp={6, 1, 1746}},
	{szName="玄晶矿石", tbProp={6, 1, 147, 8}},
	{szName="补天石碎片 (中)", tbProp={6, 1, 1309}},
	{szName="神秘矿石", tbProp={6, 1, 398}},
}
yandiduihuan_CostMoney = 10000000 --1QW


function yandiduihuan_CalcItemCount(tbMaterial)
	if type(tbMaterial[1]) == "table" then
		local nNeedCount = 0
		local tbNeedCount = {}
		for i = 1, getn(tbMaterial) do
			local nCount = 0
			nCount, tbNeedCount[i] = yandiduihuan_CalcItemCount(tbMaterial[i])
			nNeedCount = nNeedCount + nCount
		end
		return nNeedCount, tbNeedCount
	else
		local nCount = tbMaterial.nCount or 1
		return nCount, nCount
	end
	
end

function yandiduihuan_checkGoldItem(nCount)
	for i=1, nCount do
		local tbItem = yandiduihuan_MakeItemTable(GetGiveItemUnit(i))
		if tbItem.nQuality == 1 then
			if yandiduihuan_tbItemList ~= nil then
				for j=1,getn(yandiduihuan_tbItemList) do
					if (yandiduihuan_checkOne(yandiduihuan_tbItemList[j], tbItem) == 1) then
						return tbItem,i
					end
				end
			end
		end
	end
end


function yandiduihuan_GiveStep(nCount)

	local tbMaterial = yandiduihuan_Material
	local nNeedCount, tbNeedCount = yandiduihuan_CalcItemCount(tbMaterial)
	
	
	if nCount ~=  nNeedCount + 1 then
		Msg2Player("放入数量不对.")
		return Say("大侠放入的材料不对，不能进行重炼，用于重炼炎帝黄金装备的原料是：1个炎帝黄金装备，1个凤鸣槌，1个8级玄晶，1个补天石碎片（中）", 0)
	end
	
	local tbAwardItem, nCheckedId = yandiduihuan_checkGoldItem(nCount)
	
	if tbAwardItem == nil then
		Msg2Player("放入的炎帝装备不符合要求.")
		return Say("放入的炎帝装备不符合要求.", 0)
	end
	
	for i=1,nCount do
		if i ~= nCheckedId then
			local tbItem = yandiduihuan_MakeItemTable(GetGiveItemUnit(i))
			local nId,nItemCount = yandiduihuan_checkItem(tbMaterial, tbItem)
			if nId > 0 and tbNeedCount[nId] >= nItemCount then
				nNeedCount = nNeedCount - nItemCount
				tbNeedCount[nId] = tbNeedCount[nId] - nItemCount
			else
				Msg2Player("放入原料不对");
				return Say(format("给我的原料不对，所以不能重炼。重炼原料：<color=yellow>%s<color>l?1 <color=yellow>%s<color>, 1个凤鸣槌，1个8级玄晶，1个补天石碎片（中), 1000万银两", tbAwardItem.szName, tbAwardItem.szName), 0)
			end
		end
			
	end	
	if (nNeedCount == 0) then
		if  Pay(yandiduihuan_CostMoney) == 1 then 
			local nItemIndex = GetGiveItemUnit(nCheckedId)
			yandiduihuan_LogEquip(nItemIndex, "炎帝重炼之前")
			for i = 1, nCount do
				RemoveItemByIndex(GetGiveItemUnit(i))
			end
			tbAwardItem.CallBack = yandiduihuan_LogEquip
			tbAwardTemplet:GiveAwardByList(tbAwardItem, "炎帝重炼之后")
			return Say(format("物品 <color=yellow>%s<color> 已重炼成功", tbAwardItem.szName), 0)
		else
			return Say("不够钱进行重炼.", 0)
		end
				
	else
		Msg2Player("放入物品不合要求");
	end
end


function yandiduihuan_MakeItemTable(nItemIndex)
	local tbItem = {}
	tbItem.szName		= GetItemName(nItemIndex)
	tbItem.nQuality		= GetItemQuality(nItemIndex);
	tbItem.nBindState	= GetItemBindState(nItemIndex);
	tbItem.nCount		= GetItemStackCount(nItemIndex) or 1
	tbItem.tbProp = {}
	if tbItem.nQuality == 0 then -- 普通物品
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	elseif tbItem.nQuality == 1 or tbItem.nQuality == 4 then --黄金 or 白金
		local nGenre = GetItemProp(nItemIndex)
		if nGenre == 7 then
			tbItem.tbProp[1] = nGenre
		else
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetGlodEqIndex(nItemIndex)	
		end
	elseif tbItem.nQuality == 2 then -- 紫色装备
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	end
	return tbItem
end



function yandiduihuan_checkItem(tbMaterial,tbItem)	
	for i = 1, getn(tbMaterial) do
		if yandiduihuan_checkOne(tbMaterial[i], tbItem) == 1 then
			return i, tbItem.nCount
		end
	end
	return 0;
end

function yandiduihuan_checkOne(tbSrcItem, tbDecItem)
	if tbSrcItem == nil or tbDecItem == nil then
		return 0;
	end
	if tbSrcItem.tbProp == nil or tbDecItem.tbProp == nil then
		return 0;
	end
	if tbSrcItem.nQuality ~= nil and tbSrcItem.nQuality ~= tbDecItem.nQuality then
		return 0;
	end
	if tbSrcItem.nBindState ~= nil and tbSrcItem.nBindState ~= tbDecItem.nBindState then
		return 0;
	end
	local i;
	for i=1,getn(tbSrcItem.tbProp) do
		if (tbSrcItem.tbProp ~= nil) then
			if (tbSrcItem.tbProp[i] ~= tbDecItem.tbProp[i]) then
				return 0;
			end
		end
	end
	return 1;
end

function yandiduihuan_LogEquip(nItemIndex, szLogTitle)
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex);
	
	local arynMagLvl	= GetItemAllParams(nItemIndex);
	local nQuality		= GetItemQuality(nItemIndex);
	local uRandSeed		= ITEM_GetItemRandSeed(nItemIndex)
	local szItemName	= GetItemName(nItemIndex)
	
	local szLogMsg = format("%s, {%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d,%d}", szItemName, 4,uRandSeed,nQuality,nGenre,nDetailType,nParticular,nLevel,nSeries,nLuck,unpack(arynMagLvl))
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t%s",szLogTitle or "炎帝重炼后",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szLogMsg))	
	
end


function yandiduihuan_main()
	GiveItemUI("炎帝黄金装备重炼界面", "1个凤鸣槌，1个8级玄晶，1个补天石碎片（中), 1 个神秘矿石, 1000 万银两, 1个炎帝黄金装备", "yandiduihuan_GiveStep", "yandiduihuan_OnCancel", 1)
end


function yandiduihuan_shuoming()
	local tbSay = 
	{
		"<dec><npc>炎帝装备重炼, 需要1个凤鸣槌，1个8级玄晶，1个补天石碎片（中), 1 个神秘矿石, 1000 万银两, 1个炎帝黄金装备.<enter>炎帝装备用于重炼，重练后的装备是一种黄金装备，如果使用燧人之赤血元武甲重练，就一定会出燧人之赤血元武甲装备和随机属性。",
		"我知道了/yandiduihuan_OnCancel",
	}
	CreateTaskSay(tbSay)
end

function yandiduihuan_OnCancel()
	
end