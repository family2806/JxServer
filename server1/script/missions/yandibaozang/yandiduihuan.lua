-- �ļ�������yandiduihuan.lua
-- �����ߡ���zhongchaolong
-- ����ʱ�䣺2008-05-14 16:38:43
--�׵�װ������
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("ITEM")
yandiduihuan_tbItemList = 
{
	{szName="����֮��ѪԪ���", nQuality=1, tbProp={0, 442}},
	{szName="����֮������", nQuality=1, tbProp={0, 443}},
	{szName="����֮����ѥ", nQuality=1, tbProp={0, 445}},
	{szName="����֮������⬻���", nQuality=1, tbProp={0, 446}},
	{szName="����֮��Ӱ��", nQuality=1, tbProp={0, 455}},
	{szName="����֮������а��", nQuality=1, tbProp={0, 456}},
	{szName="����֮����", nQuality=1, tbProp={0, 457}},
	{szName="Ů�֮���շ���", nQuality=1, tbProp={0, 463}},
	{szName="Ů�֮������������", nQuality=1, tbProp={0, 464}},
	{szName="Ů�֮����", nQuality=1, tbProp={0, 467}},
	{szName="ף��֮����ŭ��װ", nQuality=1, tbProp={0, 472}},
	{szName="ף��֮���˲���צ", nQuality=1, tbProp={0, 476}},
	{szName="ף��֮����", nQuality=1, tbProp={0, 477}},
	{szName="��ũ֮�����ػ���", nQuality=1, tbProp={0, 482}},
	{szName="��ũ֮ŭ��ͷ��", nQuality=1, tbProp={0, 483}},
	{szName="��ũ֮Ԧ����", nQuality=1, tbProp={0, 485}},
	{szName="��ũ֮ն��", nQuality=1, tbProp={0, 487}},
}

yandiduihuan_Material = 
{
	{szName="�����", tbProp={6, 1, 1746}},
	{szName="������ʯ", tbProp={6, 1, 147, 8}},
	{szName="����ʯ��Ƭ (��)", tbProp={6, 1, 1309}},
	{szName="���ؿ�ʯ", tbProp={6, 1, 398}},
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
		Msg2Player("������������.")
		return Say("��������Ĳ��ϲ��ԣ����ܽ������������������׵ۻƽ�װ����ԭ���ǣ�1���׵ۻƽ�װ����1������鳣�1��8��������1������ʯ��Ƭ���У�", 0)
	end
	
	local tbAwardItem, nCheckedId = yandiduihuan_checkGoldItem(nCount)
	
	if tbAwardItem == nil then
		Msg2Player("������׵�װ��������Ҫ��.")
		return Say("������׵�װ��������Ҫ��.", 0)
	end
	
	for i=1,nCount do
		if i ~= nCheckedId then
			local tbItem = yandiduihuan_MakeItemTable(GetGiveItemUnit(i))
			local nId,nItemCount = yandiduihuan_checkItem(tbMaterial, tbItem)
			if nId > 0 and tbNeedCount[nId] >= nItemCount then
				nNeedCount = nNeedCount - nItemCount
				tbNeedCount[nId] = tbNeedCount[nId] - nItemCount
			else
				Msg2Player("����ԭ�ϲ���");
				return Say(format("���ҵ�ԭ�ϲ��ԣ����Բ�������������ԭ�ϣ�<color=yellow>%s<color>l?1 <color=yellow>%s<color>, 1������鳣�1��8��������1������ʯ��Ƭ����), 1000������", tbAwardItem.szName, tbAwardItem.szName), 0)
			end
		end
			
	end	
	if (nNeedCount == 0) then
		if  Pay(yandiduihuan_CostMoney) == 1 then 
			local nItemIndex = GetGiveItemUnit(nCheckedId)
			yandiduihuan_LogEquip(nItemIndex, "�׵�����֮ǰ")
			for i = 1, nCount do
				RemoveItemByIndex(GetGiveItemUnit(i))
			end
			tbAwardItem.CallBack = yandiduihuan_LogEquip
			tbAwardTemplet:GiveAwardByList(tbAwardItem, "�׵�����֮��")
			return Say(format("��Ʒ <color=yellow>%s<color> �������ɹ�", tbAwardItem.szName), 0)
		else
			return Say("����Ǯ��������.", 0)
		end
				
	else
		Msg2Player("������Ʒ����Ҫ��");
	end
end


function yandiduihuan_MakeItemTable(nItemIndex)
	local tbItem = {}
	tbItem.szName		= GetItemName(nItemIndex)
	tbItem.nQuality		= GetItemQuality(nItemIndex);
	tbItem.nBindState	= GetItemBindState(nItemIndex);
	tbItem.nCount		= GetItemStackCount(nItemIndex) or 1
	tbItem.tbProp = {}
	if tbItem.nQuality == 0 then -- ��ͨ��Ʒ
		tbItem.tbProp[1], tbItem.tbProp[2], tbItem.tbProp[3], tbItem.tbProp[4], tbItem.tbProp[5], tbItem.tbProp[6] = GetItemProp(nItemIndex)
	elseif tbItem.nQuality == 1 or tbItem.nQuality == 4 then --�ƽ� or �׽�
		local nGenre = GetItemProp(nItemIndex)
		if nGenre == 7 then
			tbItem.tbProp[1] = nGenre
		else
			tbItem.tbProp[1], tbItem.tbProp[2] = 0, GetGlodEqIndex(nItemIndex)	
		end
	elseif tbItem.nQuality == 2 then -- ��ɫװ��
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
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t%s",szLogTitle or "�׵�������",GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),szLogMsg))	
	
end


function yandiduihuan_main()
	GiveItemUI("�׵ۻƽ�װ����������", "1������鳣�1��8��������1������ʯ��Ƭ����), 1 �����ؿ�ʯ, 1000 ������, 1���׵ۻƽ�װ��", "yandiduihuan_GiveStep", "yandiduihuan_OnCancel", 1)
end


function yandiduihuan_shuoming()
	local tbSay = 
	{
		"<dec><npc>�׵�װ������, ��Ҫ1������鳣�1��8��������1������ʯ��Ƭ����), 1 �����ؿ�ʯ, 1000 ������, 1���׵ۻƽ�װ��.<enter>�׵�װ�������������������װ����һ�ֻƽ�װ�������ʹ������֮��ѪԪ�����������һ���������֮��ѪԪ���װ����������ԡ�",
		"��֪����/yandiduihuan_OnCancel",
	}
	CreateTaskSay(tbSay)
end

function yandiduihuan_OnCancel()
	
end