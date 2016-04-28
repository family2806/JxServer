-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏÊÕ·Ñ°æ - µÀ¾ß:É±ÊÖÃØ±¦
-- ÎÄ¼þÃû¡¡£ºshashou_mibao.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2010-05-24 11:40:18

-- ======================================================

Include("\\script\\lib\\awardtemplet.lua");		-- ½±ÀøÄ£°å
local n_XuanTian_Chui = 6;

tbItem_Mibao = {
	{szName = " tiªn th¶o lé ",tbProp = {6,1,71,1,1,0}, nRate = 15.873},--ok
	{szName = " tö m·ng lµm ", tbProp = {6,1,2350,1,1,0}, nRate = 0.2},--ok
	{szName = " huyÒn viªn lµm ", tbProp = {6,1,2351,1,1,0}, nRate = 0.5},--ok
	{szName = " tö m·ng lµm ", tbProp = {6,1,2350,1,1,0}, nRate = 0.1},--ok
	{szName = " huyÒn viªn lµm ", tbProp = {6,1,2351,1,1,0}, nRate = 0.1},--ok
	{szName = " ®¹i lùc hoµn ", tbProp = {6,0,3,1,1,0}, nRate = 25},--ok
	{szName = " nhanh chãng hoµn ", tbProp = {6,0,6,1,1,0}, nRate = 25},--ok
	{szName = " khiªu chiÕn lÔ tói ", tbProp = {6,1,2006,1,1,0}, nRate = 20},--ok
	{szName = " huy hoµng qu¶ ( cao ) ", tbProp = {6,1,906,1,1,0}, nRate = 10, nExpiredTime = 10080},--ok
	{szName = " hoµng kim chi qu¶ ", tbProp = {6,1,907,1,1,0}, nRate = 0.5, nExpiredTime = 10080},--ok
	{szName = " håi thiªn t¸i t¹o cÈm nang ", tbProp = {6,1,1781,1,1,0}, nRate = 3, tbParam = {60}},	-- ½õÄÒ°üº¬60¸ö--ok
}

function main(nItemIdx)
	local n_curcnt = CalcItemCount(3, 6,1,2348,-1);
	if (n_curcnt < %n_XuanTian_Chui) then
		Msg2Player(format("CÇn %d %s, c¸c h¹ së mang sè l­îng kh«ng ®ñ !", %n_XuanTian_Chui, "HuyÒn thiªn chïy "));
		return 1
	end
	if (CalcFreeItemCellCount() >= 3 and ConsumeItem(3, %n_XuanTian_Chui, 6,1,2348,-1)) then
		tbAwardTemplet:GiveAwardByList(tbItem_Mibao, format("USE %s", "D· tÈu ®Ých bÝ b¶o "))
		AddStatData("baoxiangxiaohao_kaishashoumibao", 1)		-- Êý¾ÝÂñµãµÚÒ»ÆÚ
	else
		Msg2Player("Tói bªn trong chç trèng ch­a ®ñ ! ");
		return 1
	end
end
