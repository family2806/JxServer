Include("\\script\\misc\\timeline\\timelinemanager.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\log.lua")

IncludeLib("ITEM")
Include("\\script\\lib\\log.lua")
if (tbItemExchangValue == nil) then
	tbItemExchangValue = {}
	tbItemExchangValue.ExchangeDiscount = 0;
end


function CalcItemExchangValue(nItemIndex, nExchangeValue)
--	if (tbItemExchangValue.ExchangeDiscount == nil or tbItemExchangValue.ExchangeDiscount == 0) then
--		local tbExchange1 = tbTimeLineManager:GetTimeLine("ItemExchange1");
--		local tbExchange2 = tbTimeLineManager:GetTimeLine("ItemExchange2");
--		local tbExchange3 = tbTimeLineManager:GetTimeLine("ItemExchange3");
--		local tbExchange4 = tbTimeLineManager:GetTimeLine("ItemExchange4");
--		local tbExchange5 = tbTimeLineManager:GetTimeLine("ItemExchange5");
		
--		if (tbExchange5 ~= nil and tbExchange5:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.5;
--		elseif (tbExchange4 ~= nil and tbExchange4:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.6;
--		elseif (tbExchange3 ~= nil and tbExchange3:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.7;
--		elseif (tbExchange2 ~= nil and tbExchange2:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.8;
--		elseif (tbExchange1 ~= nil and tbExchange1:IsBegin() == 1) then
--			tbItemExchangValue.ExchangeDiscount = 0.9;
--		else
			tbItemExchangValue.ExchangeDiscount = 1;
--		end
		
--	end
	
	local nQuality = GetItemQuality(nItemIndex);
	
	if (nExchangeValue <= 0) then
		return 0
	end
	
	--��8���ϰ׽��ܶһ�
	local nPlatinaLevel = GetPlatinaLevel(nItemIndex);
	if (nQuality == 4 and nPlatinaLevel > 8) then
		return 0
	end
	
	if (nQuality == 4 and (nPlatinaLevel >= 6 and nPlatinaLevel <= 7)) then
		local nPtMagicAttrExValue = GetPtMagicAttrExValue(nItemIndex);
		if (nPtMagicAttrExValue and nPtMagicAttrExValue > 0) then
			nExchangeValue = nExchangeValue + nPtMagicAttrExValue;
		end
	end
	
	-- ��������b
	if (nQuality == 2) then
		nExchangeValue = nExchangeValue/150;
	end
	
	nExchangeValue = nExchangeValue * tbItemExchangValue.ExchangeDiscount;
	
	return nExchangeValue
end

function exchange_olditem()
	GiveItemUI("����������", "ÿ��ֻ�ܻ�ȡһ����ʹ�����޵�װ���������ɾ�������", "exchange_olditem_compose")
end

function exchange_olditem_compose(nCount)
	if (nCount <= 0) then
		Talk(1, "", "�������Ի�ȡ��װ��.");
		return
	end
	
	if (nCount > 1) then
		Talk(1, "", "ÿ��ֻ����һ��װ�����ɾ�������");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1);
	
	if (nItemIndex == nil or nItemIndex <= 0) then
		Talk(1, "", "�������Ի�ȡ��װ��.");
		return
	end
	
	local nBindState = GetItemBindState(nItemIndex);
	
	if (nBindState ~= 0) then
		Talk(1, "", "ֻ���ò�����װ������ʱ�����Ƶ�װ������������");
		return
	end
	
	local nUseTime = ITEM_GetLeftUsageTime(nItemIndex);
	local nExpireTime = ITEM_GetExpiredTime(nItemIndex);
	
	if ((nUseTime > 0 and nUseTime ~= 4294967295)or (nExpireTime > 0)) then
		Talk(1, "", "ֻ���ò�����װ������ʱ�����Ƶ�װ������������");
		return
	end
	
	local nExchangeValue = GetItemExchangeValue(nItemIndex);
	
	if (nExchangeValue <= 0) then
		Talk(1, "", "�������Ի�ȡ��װ��.");
		return
	end
	
	exchange_olditem_compse_confirm_dlg(nItemIndex, nExchangeValue);
end

function exchange_olditem_compse_confirm_dlg(nItemIndex, nExchangeValue)
	local tbSay = {};
	tbSay[1] = format("<dec><npc>ȷ���뻻 <color=red>%s<color>�ɴ��о���ʯ�ľ�������<color=red>%d<color> ��", GetItemName(nItemIndex), nExchangeValue);
	
	tinsert(tbSay, format("ȷ��/#exchange_olditem_compse_confirm(%d, %d)",nItemIndex,nExchangeValue));
	
	tinsert(tbSay, "������ϸ����/OnExit");
	CreateTaskSay(tbSay);
end

function exchange_olditem_compse_confirm(nItemIndex, nExchangeValue)
	if (IsMyItem(nItemIndex) ~= 1) then
		return 
	end
	local nBind = GetItemBindState(nItemIndex);
	--local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex);
	--local arynMagLvl = GetItemAllParams(nItemIndex);
	--local nQuality = GetItemQuality(nItemIndex);
	local uRandSeed = ITEM_GetItemRandSeed(nItemIndex)
	--local szLogMsg = format("{%d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d, %d,%d}", 4,uRandSeed,nQuality,nGenre,nDetailType,nParticular,nLevel,nSeries,nLuck,unpack(arynMagLvl))
	local szLogMsg = getItemInfo(nItemIndex);
	WriteLog(format("%s\t%s\t%s\t%d\t%s\t%s\t%d\t%s\t%s",GetAccount(), GetName(), "����������", GetItemQuality(nItemIndex), szLogMsg, GetItemName(nItemIndex), 0, format("{6,1,2356,1,0,0,%d,0,0,0,0,0}", nExchangeValue), "��������"))
	
	local szLog = format("%d\t%s\t%u", nExchangeValue, GetItemName(nItemIndex), uRandSeed)
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		return
	end
	
	tbAwardTemplet:GiveAwardByList({szName="��������", tbProp={6,1,2356,1,0,0}, tbParam={nExchangeValue,0,0,0,0,0},nBindState=nBind}, format("���������� (%d)",nExchangeValue));
	_WritePlayerLog("Equip Exchange ", szLog)
end

tbExchangeLingPai = 
{
	["�����"] = 
	{
		tbItem = {szName="�����", tbProp={6,1,2369,1,0,0}},
		szComposFunc = "exchange_lingpai_qingju",
		nRequireJingLianShi = 40,
	},
	["��¹��"] = 
	{
		tbItem = {szName="��¹��", tbProp={6,1,2353,1,0,0}},
		szComposFunc = "exchange_lingpai_yunlu",
		nRequireJingLianShi = 100,
	},
	["������"] = 
	{
		tbItem = {szName="������", tbProp={6,1,2352,1,0,0}},
		szComposFunc = "exchange_lingpai_canglang",
		nRequireJingLianShi = 300,
	},
	["��Գ��"] = 
	{
		tbItem = {szName="��Գ��", tbProp={6,1,2351,1,0,0}},
		szComposFunc = "exchange_lingpai_xuanyuan",
		nRequireJingLianShi = 1000,
	},
	["��ç��"] = 
	{
		tbItem = {szName="��ç��", tbProp={6,1,2350,1,0,0}},
		szComposFunc = "exchange_lingpai_zimang",
		nRequireJingLianShi = 2400,
	},
	["������"] = 
	{
		tbItem = {szName="������", tbProp={6,1,2349,1,0,0}},
		szComposFunc = "exchange_lingpai_wujin",
		nRequireJingLianShi = 6000,
	},
	["�׻���"] = 
	{
		tbItem = {szName="�׻���", tbProp={6,1,2357,1,0,0}},
		szComposFunc = "exchange_lingpai_baihu",
		nRequireJingLianShi = 12000,
	},
	["������"] = 
	{
		tbItem = {szName="������", tbProp={6,1,2370,1,0,0}},
		szComposFunc = "exchange_lingpai_chilin",
		nRequireJingLianShi = 24000,
	},
	["�����"] = 
	{
		tbItem = {szName="�����", tbProp={6,1,30226,1,0,0}},
		szComposFunc = "exchange_lingpai_wuhuang",
		nRequireJingLianShi = 6000,
	},
	["����"] = 
	{
		tbItem = {szName="����", tbProp={6,1,30227,1,0,0}},
		szComposFunc = "exchange_lingpai_mahu",
		nRequireJingLianShi = 6000,
	},
	["�׻���"] = 
	{
		tbItem = {szName="�׻���", tbProp={6,1,30228,1,0,0}},
		szComposFunc = "exchange_lingpai_yanhuang",
		nRequireJingLianShi = 6000,
	},
--	["��ç�Ͻ�ָͼ��"] = 
--	{
--		tbItem = {szName="��ç�Ͻ�ָͼ��", tbProp={6,1,2721,1,0,0}},
--		szComposFunc = "exchange_Dopho_Tumang_Thuonggioi",
--		nRequireJingLianShi = 100000,
--	},
--	["��ç�½�ָͼ��"] = 
--	{
--		tbItem = {szName="��ç�½�ָͼ��", tbProp={6,1,2722,1,0,0}},
--		szComposFunc = "exchange_Dopho_Tumang_Hagioi",
--		nRequireJingLianShi = 100000,
--	},
--	["��ç��еͼ��"] = 
--	{
--		tbItem = {szName="��ç��еͼ��", tbProp={6,1,2723,1,0,0}},
--		szComposFunc = "exchange_Dopho_Tumang_Khigioi",
--		nRequireJingLianShi = 100000,
--	},
}

function exchange_lingpai()
	local tbSay = {};
	tbSay[1] = "<dec><npc>һ��ֻ����һ���������任һ������.";
	-- format("<enter>��¹��:��Ҫһ�����ٹ�ע��<color=green>%d<color>����ʯ�ľ�������<enter>������:��Ҫһ�����ٹ�ע��<color=green>%d<color>����ʯ�ľ�������<enter>��Գ��:��Ҫһ�����ٹ�ע��<color=green>%d<color>����ʯ�ľ�������<enter>������:��Ҫһ�����ٹ�ע��<color=green>%d<color>����ʯ�ľ�������<enter>������:��Ҫһ�����ٹ�ע��<color=green>%d<color>����ʯ�ľ�������", 800,2600,9300,22000,24000)
	
--	for sz_key, tb in tbExchangeLingPai do
--		tbSay[1] = tbSay[1].."<enter>"..format("%s:��Ҫһ�����ٹ�ע��<color=green>%d<color>����ʯ�ľ�������", sz_key, tb.nRequireJingLianShi);
--		tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')",sz_key,sz_key));
--	end
	
	
	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "�����", tbExchangeLingPai["�����"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "��¹��", tbExchangeLingPai["��¹��"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "������", tbExchangeLingPai["������"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "��Գ��", tbExchangeLingPai["��Գ��"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "��ç��", tbExchangeLingPai["��ç��"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "������", tbExchangeLingPai["������"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "�׻���", tbExchangeLingPai["�׻���"].nRequireJingLianShi);
---	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "������", tbExchangeLingPai["������"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "�����", tbExchangeLingPai["�����"].nRequireJingLianShi);
---	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "����", tbExchangeLingPai["����"].nRequireJingLianShi);
---	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "�׻���", tbExchangeLingPai["�׻���"].nRequireJingLianShi);
	
	--DinhHQ
	--20110413: ��ͼ��
--	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "��ç�Ͻ�ָͼ��", tbExchangeLingPai["��ç�Ͻ�ָͼ��"].nRequireJingLianShi);
--	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "��ç�½�ָͼ��", tbExchangeLingPai["��ç�½�ָͼ��"].nRequireJingLianShi);
--	tbSay[1] = tbSay[1].."<enter>"..format("%s: ������Ҫһ���������京��<color=green>%d<color> ����ʯ", "��ç��еͼ��", tbExchangeLingPai["��ç��еͼ��"].nRequireJingLianShi);
	
	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","�����","�����"));
	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","��¹��","��¹��"));
	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","������","������"));
	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","��Գ��","��Գ��"));
	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","��ç��","��ç��"));
	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","������","������"));
---	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","�׻���","�׻���"));
---	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","������","������"));
	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","�����","�����"));
---	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","����","����"));
---	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","�׻���","�׻���"));
		
	--DinhHQ
	--20110413: ��ͼ��
--	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","��ç�Ͻ�ָͼ��","��ç�Ͻ�ָͼ��"));
--	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","��ç�½�ָͼ��","��ç�½�ָͼ��"));
--	tinsert(tbSay, format("��ȡ%s/#exchange_lingpai_main_dlg('%s')","��ç��еͼ��","��ç��еͼ��"));
	
	tinsert(tbSay, "������ϸ����/OnExit");
	CreateTaskSay(tbSay);
end

function exchange_lingpai_main_dlg(szLingpai)
	local tbLingpai = tbExchangeLingPai[szLingpai];
	
	if (tbLingpai == nil) then
		return
	end
	
	local szComposeFun = tbExchangeLingPai[szLingpai].szComposFunc;
	
	GiveItemUI(format("�� %s",szLingpai), format("һ������ֻ���ú���%d����ʯ�ľ�����������%s.", tbLingpai.nRequireJingLianShi, szLingpai), szComposeFun)
end

function exchange_lingpai_compose(nCount, szLingpai)
	if (nCount <= 0) then
		Talk(1, "", format("����뾫���������ٺ���<color=green>%d<color> ����ʯ.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	if (nCount > 1) then
		Talk(1, "", "ÿ��ֻ�ܷ���һ����������.");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1);
	
	if (nItemIndex == nil or nItemIndex <= 0) then
		Talk(1, "", format("����뾫���������ٺ���<color=green>%d<color> ����ʯ.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex);
	
	if (nGenre ~= 6 or nDetailType ~= 1 or nParticular ~= 2356) then
		Talk(1, "", format("����뾫���������ٺ���<color=green>%d<color> ����ʯ.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	local nJinglianshiCount = GetItemMagicLevel(nItemIndex, 1);
	
	if (nJinglianshiCount < tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		Talk(1, "", format("����뾫���������ٺ���<color=green>%d<color> ����ʯ.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	exchange_lingpai_confirm_dlg(nItemIndex, szLingpai);
end

function exchange_lingpai_qingju(nCount)
	exchange_lingpai_compose(nCount, "�����");
end

function exchange_lingpai_yunlu(nCount)
	exchange_lingpai_compose(nCount, "��¹��");
end

function exchange_lingpai_canglang(nCount)
	exchange_lingpai_compose(nCount, "������");
end

function exchange_lingpai_xuanyuan(nCount)
	exchange_lingpai_compose(nCount, "��Գ��");
end

function exchange_lingpai_zimang(nCount)
	exchange_lingpai_compose(nCount, "��ç��");
end

function exchange_lingpai_wujin(nCount)
	exchange_lingpai_compose(nCount, "������");
end

function exchange_lingpai_baihu(nCount)
	exchange_lingpai_compose(nCount, "�׻���");
end

function exchange_lingpai_chilin(nCount)
	exchange_lingpai_compose(nCount, "������");
end

function exchange_lingpai_wuhuang(nCount)
	exchange_lingpai_compose(nCount, "�����");
end

function exchange_lingpai_mahu(nCount)
	exchange_lingpai_compose(nCount, "����");
end

function exchange_lingpai_yanhuang(nCount)
	exchange_lingpai_compose(nCount, "�׻���");
end

function exchange_Dopho_Tumang_Thuonggioi(nCount)
	exchange_lingpai_compose(nCount, "��ç�Ͻ�ָͼ��");
end

function exchange_Dopho_Tumang_Hagioi(nCount)
	exchange_lingpai_compose(nCount, "��ç�½�ָͼ��");
end

function exchange_Dopho_Tumang_Khigioi(nCount)
	exchange_lingpai_compose(nCount, "��ç��еͼ��");
end

function exchange_lingpai_confirm_dlg(nItemIndex, szLingpai)
	local nJinglianshiCount = GetItemMagicLevel(nItemIndex, 1);
	local tbSay = {};
	tbSay[1] = format("<dec><npc>ȷ�����ú���<color=red>%d<color> ����ʯ�ľ������任��<color=red>%s<color>?", nJinglianshiCount, szLingpai);
	if (nJinglianshiCount > tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		tbSay[1] = format("%s<enter><color=red>�������京�ľ���ʯ��������Ҫ��������<color=yellow>%s<color>, ��Ҫ������Ϊ<color=green>%d<color>, ʣ��Ľ��������������뻻��<color>", tbSay[1], szLingpai, tbExchangeLingPai[szLingpai].nRequireJingLianShi);
	end
	tinsert(tbSay, format("ȷ��/#exchange_lingpai_confirm(%d, '%s')",nItemIndex,szLingpai));
	
	tinsert(tbSay, "������ϸ����/OnExit");
	CreateTaskSay(tbSay);
end

function exchange_lingpai_confirm(nItemIndex, szLingpai)
	if (IsMyItem(nItemIndex) ~= 1) then
		return 
	end
	if (PlayerFunLib:CheckFreeBagCell(1, "default") ~= 1) then
			return 0;
	end
	
	local nBind = GetItemBindState(nItemIndex);
	local nJinglianshiCount = GetItemMagicLevel(nItemIndex, 1);
	--20110419: modified by DinhHQ
	--Fix bug using 1 Soul Stone to buy 2 Lingpai
	if (nJinglianshiCount < tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		Talk(1, "", format("��������ٺ���<color=green>%d<color> ����ʯ�ľ�������.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t%s",format("�� %s",szLingpai),GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),format("�þ�������(%d) ����%s",nJinglianshiCount,szLingpai)))
	
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		return
	end
	
	if (nJinglianshiCount > tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		tbAwardTemplet:GiveAwardByList({szName="��������", tbProp={6,1,2356,1,0,0}, tbParam={nJinglianshiCount-tbExchangeLingPai[szLingpai].nRequireJingLianShi,0,0,0,0,0}, nBindState=nBind}, format("�þ������� (%d) �� %s �黹����������%d ����ʯ",nJinglianshiCount,szLingpai,nJinglianshiCount-tbExchangeLingPai[szLingpai].nRequireJingLianShi));
	end
		
	local tbLinPaiItem = clone(tbExchangeLingPai[szLingpai].tbItem);
	tbLinPaiItem.nBindState = nBind;
	tbAwardTemplet:GiveAwardByList(tbLinPaiItem, format("�þ�������(%d) ����%s",nJinglianshiCount,szLingpai));

	local szLog = format("%s\t%d",tbLinPaiItem.szName, tbExchangeLingPai[szLingpai].nRequireJingLianShi)
	
	_WritePlayerLog("Exchange Token", szLog)
end

function OnExit()
end
