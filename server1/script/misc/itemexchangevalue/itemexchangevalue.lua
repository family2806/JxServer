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
	
	--加8以上白金不能兑换
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
	
	-- 如果是紫裝
	if (nQuality == 2) then
		nExchangeValue = nExchangeValue/150;
	end
	
	nExchangeValue = nExchangeValue * tbItemExchangValue.ExchangeDiscount;
	
	return nExchangeValue
end

function exchange_olditem()
	GiveItemUI("换精炼宝箱", "每次只能换取一个无使用期限的装备及不锁成精炼宝箱", "exchange_olditem_compose")
end

function exchange_olditem_compose(nCount)
	if (nCount <= 0) then
		Talk(1, "", "请放入可以换取的装备.");
		return
	end
	
	if (nCount > 1) then
		Talk(1, "", "每次只能用一个装备换成精炼宝箱");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1);
	
	if (nItemIndex == nil or nItemIndex <= 0) then
		Talk(1, "", "请放入可以换取的装备.");
		return
	end
	
	local nBindState = GetItemBindState(nItemIndex);
	
	if (nBindState ~= 0) then
		Talk(1, "", "只能用不锁的装备及无时间限制的装备换精炼宝箱");
		return
	end
	
	local nUseTime = ITEM_GetLeftUsageTime(nItemIndex);
	local nExpireTime = ITEM_GetExpiredTime(nItemIndex);
	
	if ((nUseTime > 0 and nUseTime ~= 4294967295)or (nExpireTime > 0)) then
		Talk(1, "", "只能用不锁的装备及无时间限制的装备换精炼宝箱");
		return
	end
	
	local nExchangeValue = GetItemExchangeValue(nItemIndex);
	
	if (nExchangeValue <= 0) then
		Talk(1, "", "请放入可以换取的装备.");
		return
	end
	
	exchange_olditem_compse_confirm_dlg(nItemIndex, nExchangeValue);
end

function exchange_olditem_compse_confirm_dlg(nItemIndex, nExchangeValue)
	local tbSay = {};
	tbSay[1] = format("<dec><npc>确认想换 <color=red>%s<color>成存有精炼石的精炼宝箱<color=red>%d<color> ？", GetItemName(nItemIndex), nExchangeValue);
	
	tinsert(tbSay, format("确认/#exchange_olditem_compse_confirm(%d, %d)",nItemIndex,nExchangeValue));
	
	tinsert(tbSay, "让我仔细想想/OnExit");
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
	WriteLog(format("%s\t%s\t%s\t%d\t%s\t%s\t%d\t%s\t%s",GetAccount(), GetName(), "换精炼宝箱", GetItemQuality(nItemIndex), szLogMsg, GetItemName(nItemIndex), 0, format("{6,1,2356,1,0,0,%d,0,0,0,0,0}", nExchangeValue), "精炼宝箱"))
	
	local szLog = format("%d\t%s\t%u", nExchangeValue, GetItemName(nItemIndex), uRandSeed)
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		return
	end
	
	tbAwardTemplet:GiveAwardByList({szName="精炼宝箱", tbProp={6,1,2356,1,0,0}, tbParam={nExchangeValue,0,0,0,0,0},nBindState=nBind}, format("换精炼宝箱 (%d)",nExchangeValue));
	_WritePlayerLog("Equip Exchange ", szLog)
end

tbExchangeLingPai = 
{
	["青驹令"] = 
	{
		tbItem = {szName="青驹令", tbProp={6,1,2369,1,0,0}},
		szComposFunc = "exchange_lingpai_qingju",
		nRequireJingLianShi = 40,
	},
	["云鹿令"] = 
	{
		tbItem = {szName="云鹿令", tbProp={6,1,2353,1,0,0}},
		szComposFunc = "exchange_lingpai_yunlu",
		nRequireJingLianShi = 100,
	},
	["苍狼令"] = 
	{
		tbItem = {szName="苍狼令", tbProp={6,1,2352,1,0,0}},
		szComposFunc = "exchange_lingpai_canglang",
		nRequireJingLianShi = 300,
	},
	["玄猿令"] = 
	{
		tbItem = {szName="玄猿令", tbProp={6,1,2351,1,0,0}},
		szComposFunc = "exchange_lingpai_xuanyuan",
		nRequireJingLianShi = 1000,
	},
	["紫莽令"] = 
	{
		tbItem = {szName="紫莽令", tbProp={6,1,2350,1,0,0}},
		szComposFunc = "exchange_lingpai_zimang",
		nRequireJingLianShi = 2400,
	},
	["金乌令"] = 
	{
		tbItem = {szName="金乌令", tbProp={6,1,2349,1,0,0}},
		szComposFunc = "exchange_lingpai_wujin",
		nRequireJingLianShi = 6000,
	},
	["白虎令"] = 
	{
		tbItem = {szName="白虎令", tbProp={6,1,2357,1,0,0}},
		szComposFunc = "exchange_lingpai_baihu",
		nRequireJingLianShi = 12000,
	},
	["赤麟令"] = 
	{
		tbItem = {szName="赤麟令", tbProp={6,1,2370,1,0,0}},
		szComposFunc = "exchange_lingpai_chilin",
		nRequireJingLianShi = 24000,
	},
	["五黄令"] = 
	{
		tbItem = {szName="五黄令", tbProp={6,1,30226,1,0,0}},
		szComposFunc = "exchange_lingpai_wuhuang",
		nRequireJingLianShi = 6000,
	},
	["马虎令"] = 
	{
		tbItem = {szName="马虎令", tbProp={6,1,30227,1,0,0}},
		szComposFunc = "exchange_lingpai_mahu",
		nRequireJingLianShi = 6000,
	},
	["炎皇令"] = 
	{
		tbItem = {szName="炎皇令", tbProp={6,1,30228,1,0,0}},
		szComposFunc = "exchange_lingpai_yanhuang",
		nRequireJingLianShi = 6000,
	},
--	["紫莽上戒指图谱"] = 
--	{
--		tbItem = {szName="紫莽上戒指图谱", tbProp={6,1,2721,1,0,0}},
--		szComposFunc = "exchange_Dopho_Tumang_Thuonggioi",
--		nRequireJingLianShi = 100000,
--	},
--	["紫莽下戒指图谱"] = 
--	{
--		tbItem = {szName="紫莽下戒指图谱", tbProp={6,1,2722,1,0,0}},
--		szComposFunc = "exchange_Dopho_Tumang_Hagioi",
--		nRequireJingLianShi = 100000,
--	},
--	["紫莽器械图谱"] = 
--	{
--		tbItem = {szName="紫莽器械图谱", tbProp={6,1,2723,1,0,0}},
--		szComposFunc = "exchange_Dopho_Tumang_Khigioi",
--		nRequireJingLianShi = 100000,
--	},
}

function exchange_lingpai()
	local tbSay = {};
	tbSay[1] = "<dec><npc>一次只能用一个精炼宝箱换一个令牌.";
	-- format("<enter>云鹿令:需要一个至少灌注了<color=green>%d<color>精炼石的精炼宝箱<enter>苍狼令:需要一个至少灌注了<color=green>%d<color>精炼石的精炼宝箱<enter>玄猿令:需要一个至少灌注了<color=green>%d<color>精炼石的精炼宝箱<enter>紫蟒令:需要一个至少灌注了<color=green>%d<color>精炼石的精炼宝箱<enter>金乌令:需要一个至少灌注了<color=green>%d<color>精炼石的精炼宝箱", 800,2600,9300,22000,24000)
	
--	for sz_key, tb in tbExchangeLingPai do
--		tbSay[1] = tbSay[1].."<enter>"..format("%s:需要一个至少灌注了<color=green>%d<color>精炼石的精炼宝箱", sz_key, tb.nRequireJingLianShi);
--		tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')",sz_key,sz_key));
--	end
	
	
	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "青驹令", tbExchangeLingPai["青驹令"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "云鹿令", tbExchangeLingPai["云鹿令"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "苍狼令", tbExchangeLingPai["苍狼令"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "玄猿令", tbExchangeLingPai["玄猿令"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "紫莽令", tbExchangeLingPai["紫莽令"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "金乌令", tbExchangeLingPai["金乌令"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "白虎令", tbExchangeLingPai["白虎令"].nRequireJingLianShi);
---	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "赤麟令", tbExchangeLingPai["赤麟令"].nRequireJingLianShi);
	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "五黄令", tbExchangeLingPai["五黄令"].nRequireJingLianShi);
---	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "马虎令", tbExchangeLingPai["马虎令"].nRequireJingLianShi);
---	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "炎皇令", tbExchangeLingPai["炎皇令"].nRequireJingLianShi);
	
	--DinhHQ
	--20110413: 卖图谱
--	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "紫莽上戒指图谱", tbExchangeLingPai["紫莽上戒指图谱"].nRequireJingLianShi);
--	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "紫莽下戒指图谱", tbExchangeLingPai["紫莽下戒指图谱"].nRequireJingLianShi);
--	tbSay[1] = tbSay[1].."<enter>"..format("%s: 最少需要一个精炼宝箱含有<color=green>%d<color> 精炼石", "紫莽器械图谱", tbExchangeLingPai["紫莽器械图谱"].nRequireJingLianShi);
	
	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","青驹令","青驹令"));
	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","云鹿令","云鹿令"));
	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","苍狼令","苍狼令"));
	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","玄猿令","玄猿令"));
	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","紫莽令","紫莽令"));
	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","金乌令","金乌令"));
---	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","白虎令","白虎令"));
---	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","赤麟令","赤麟令"));
	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","五黄令","五黄令"));
---	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","马虎令","马虎令"));
---	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","炎皇令","炎皇令"));
		
	--DinhHQ
	--20110413: 卖图谱
--	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","紫莽上戒指图谱","紫莽上戒指图谱"));
--	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","紫莽下戒指图谱","紫莽下戒指图谱"));
--	tinsert(tbSay, format("换取%s/#exchange_lingpai_main_dlg('%s')","紫莽器械图谱","紫莽器械图谱"));
	
	tinsert(tbSay, "让我仔细想想/OnExit");
	CreateTaskSay(tbSay);
end

function exchange_lingpai_main_dlg(szLingpai)
	local tbLingpai = tbExchangeLingPai[szLingpai];
	
	if (tbLingpai == nil) then
		return
	end
	
	local szComposeFun = tbExchangeLingPai[szLingpai].szComposFunc;
	
	GiveItemUI(format("换 %s",szLingpai), format("一次最少只能用含有%d精炼石的精炼宝箱来换%s.", tbLingpai.nRequireJingLianShi, szLingpai), szComposeFun)
end

function exchange_lingpai_compose(nCount, szLingpai)
	if (nCount <= 0) then
		Talk(1, "", format("请放入精炼宝箱最少含有<color=green>%d<color> 精炼石.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	if (nCount > 1) then
		Talk(1, "", "每次只能放入一个精炼宝箱.");
		return
	end
	
	local nItemIndex = GetGiveItemUnit(1);
	
	if (nItemIndex == nil or nItemIndex <= 0) then
		Talk(1, "", format("请放入精炼宝箱最少含有<color=green>%d<color> 精炼石.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex);
	
	if (nGenre ~= 6 or nDetailType ~= 1 or nParticular ~= 2356) then
		Talk(1, "", format("请放入精炼宝箱最少含有<color=green>%d<color> 精炼石.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	local nJinglianshiCount = GetItemMagicLevel(nItemIndex, 1);
	
	if (nJinglianshiCount < tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		Talk(1, "", format("请放入精炼宝箱最少含有<color=green>%d<color> 精炼石.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	exchange_lingpai_confirm_dlg(nItemIndex, szLingpai);
end

function exchange_lingpai_qingju(nCount)
	exchange_lingpai_compose(nCount, "青驹令");
end

function exchange_lingpai_yunlu(nCount)
	exchange_lingpai_compose(nCount, "云鹿令");
end

function exchange_lingpai_canglang(nCount)
	exchange_lingpai_compose(nCount, "苍狼令");
end

function exchange_lingpai_xuanyuan(nCount)
	exchange_lingpai_compose(nCount, "玄猿令");
end

function exchange_lingpai_zimang(nCount)
	exchange_lingpai_compose(nCount, "紫莽令");
end

function exchange_lingpai_wujin(nCount)
	exchange_lingpai_compose(nCount, "金乌令");
end

function exchange_lingpai_baihu(nCount)
	exchange_lingpai_compose(nCount, "白虎令");
end

function exchange_lingpai_chilin(nCount)
	exchange_lingpai_compose(nCount, "赤麟令");
end

function exchange_lingpai_wuhuang(nCount)
	exchange_lingpai_compose(nCount, "五黄令");
end

function exchange_lingpai_mahu(nCount)
	exchange_lingpai_compose(nCount, "马虎令");
end

function exchange_lingpai_yanhuang(nCount)
	exchange_lingpai_compose(nCount, "炎皇令");
end

function exchange_Dopho_Tumang_Thuonggioi(nCount)
	exchange_lingpai_compose(nCount, "紫莽上戒指图谱");
end

function exchange_Dopho_Tumang_Hagioi(nCount)
	exchange_lingpai_compose(nCount, "紫莽下戒指图谱");
end

function exchange_Dopho_Tumang_Khigioi(nCount)
	exchange_lingpai_compose(nCount, "紫莽器械图谱");
end

function exchange_lingpai_confirm_dlg(nItemIndex, szLingpai)
	local nJinglianshiCount = GetItemMagicLevel(nItemIndex, 1);
	local tbSay = {};
	tbSay[1] = format("<dec><npc>确认想用含有<color=red>%d<color> 精炼石的精炼宝箱换成<color=red>%s<color>?", nJinglianshiCount, szLingpai);
	if (nJinglianshiCount > tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		tbSay[1] = format("%s<enter><color=red>精炼宝箱含的精炼石数量超过要换的数量<color=yellow>%s<color>, 需要的数量为<color=green>%d<color>, 剩余的将还回来，大侠想换吗？<color>", tbSay[1], szLingpai, tbExchangeLingPai[szLingpai].nRequireJingLianShi);
	end
	tinsert(tbSay, format("确认/#exchange_lingpai_confirm(%d, '%s')",nItemIndex,szLingpai));
	
	tinsert(tbSay, "让我仔细想想/OnExit");
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
		Talk(1, "", format("请放入最少含有<color=green>%d<color> 精炼石的精炼宝箱.",tbExchangeLingPai[szLingpai].nRequireJingLianShi));
		return
	end
	
	WriteLog(format("[%s]\t%s\tName:%s\tAccount:%s\t%s",format("换 %s",szLingpai),GetLocalDate("%Y-%m-%d %H:%M"),GetName(), GetAccount(),format("用精炼宝箱(%d) 换成%s",nJinglianshiCount,szLingpai)))
	
	if (RemoveItemByIndex(nItemIndex) ~= 1) then
		return
	end
	
	if (nJinglianshiCount > tbExchangeLingPai[szLingpai].nRequireJingLianShi) then
		tbAwardTemplet:GiveAwardByList({szName="精炼宝箱", tbProp={6,1,2356,1,0,0}, tbParam={nJinglianshiCount-tbExchangeLingPai[szLingpai].nRequireJingLianShi,0,0,0,0,0}, nBindState=nBind}, format("用精炼宝箱 (%d) 换 %s 归还精炼宝箱有%d 精炼石",nJinglianshiCount,szLingpai,nJinglianshiCount-tbExchangeLingPai[szLingpai].nRequireJingLianShi));
	end
		
	local tbLinPaiItem = clone(tbExchangeLingPai[szLingpai].tbItem);
	tbLinPaiItem.nBindState = nBind;
	tbAwardTemplet:GiveAwardByList(tbLinPaiItem, format("用精炼宝箱(%d) 换成%s",nJinglianshiCount,szLingpai));

	local szLog = format("%s\t%d",tbLinPaiItem.szName, tbExchangeLingPai[szLingpai].nRequireJingLianShi)
	
	_WritePlayerLog("Exchange Token", szLog)
end

function OnExit()
end
