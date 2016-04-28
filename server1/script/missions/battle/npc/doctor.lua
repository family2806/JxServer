Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\common.lua")

tbGoodsList = 
{
	{ szName="Hµnh Qu©n §¬n ®Æc biÖt", nJxb = 0, tbItem = { tbProp={6,1,1957,1,0,0},}},
	{ szName="CÈm nang thay ®æi trêi ®Êt", nJxb = 500000, tbItem = { tbProp={6,1,1781,1,0,0}, tbParam={60},}},
	{ szName="Håi Thiªn T¸i T¹o §¬n", nJxb = 10000, tbItem = { tbProp={1,8,0,4,0,0},}},
}

--¾üÐè¹Ù
function main()
	local szTitle = "Ng­¬i cã cÇn g× kh«ng? <enter>"..format("%s%s<enter>", strfill_left("vËt phÈm ", 30), strfill_left("Gi¸ c¶ ( l­îng )", 20))
	local tbOpt = {}
	for i=1, getn(tbGoodsList) do
		
		local pGoods = tbGoodsList[i]
		local pOpt = {}
		szTitle = szTitle..format("%s%s<enter>", strfill_left(pGoods.szName, 30), strfill_left(pGoods.nJxb, 20))
		pOpt = {pGoods.szName, _buy_ask_number, {pGoods}}
		tinsert(tbOpt, pOpt)
	end
	tinsert(tbOpt, {"Kh«ng cÇn ®©u! C¶m ¬n!"})
	CreateNewSayEx(szTitle, tbOpt)
end

function _buy_ask_number(pGoods)
	local nMaxCount = CalcFreeItemCellCount()
	if pGoods.nJxb > 0 then
		local nCount = floor(GetCash() / pGoods.nJxb)
		if nMaxCount > nCount then
			nMaxCount = nCount
		end
	end
	
	g_AskClientNumberEx(1, nMaxCount, "Xin mêi nhËp sè", {_buy_call_back, {pGoods}})
end

function _buy_call_back(pGoods, nCount)
	if CalcFreeItemCellCount() < nCount then
		return Talk(1, "", format("Ýt nhÊt cÇn ph¶i cã <color=yellow>%d<color> « trèng hµnh trang", nCount))
	end
	if nCount <= 0 then
		return
	end
	
	local nMoney = nCount * pGoods.nJxb
	if GetCash() < nMoney then
		return Talk(1, "", format("Xin ®¹i hiÖp l­îng thø ng©n l­îng trong hµnh trang kh«ng ®ñ ®Ó mua %d c¸i %s", nCount, pGoods.szName))
	end
	if nMoney == 0 or Pay(nMoney) == 1 then
		tbAwardTemplet:Give(pGoods.tbItem, nCount, {"TRIP", "BUY"})
	end
end