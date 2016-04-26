Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\common.lua")

tbGoodsList = 
{
	{ szName="特别行军丹", nJxb = 0, tbItem = { tbProp={6,1,1957,1,0,0},}},
	{ szName="交换天地锦囊", nJxb = 500000, tbItem = { tbProp={6,1,1781,1,0,0}, tbParam={60},}},
	{ szName="回天再造丹", nJxb = 10000, tbItem = { tbProp={1,8,0,4,0,0},}},
}

--军需官
function main()
	local szTitle = "你需要什么 <enter>"..format("%s%s<enter>", strfill_left("物品 ", 30), strfill_left("总价（两）", 20))
	local tbOpt = {}
	for i=1, getn(tbGoodsList) do
		
		local pGoods = tbGoodsList[i]
		local pOpt = {}
		szTitle = szTitle..format("%s%s<enter>", strfill_left(pGoods.szName, 30), strfill_left(pGoods.nJxb, 20))
		pOpt = {pGoods.szName, _buy_ask_number, {pGoods}}
		tinsert(tbOpt, pOpt)
	end
	tinsert(tbOpt, {"不需要！谢谢!"})
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
	
	g_AskClientNumberEx(1, nMaxCount, "请输入号码", {_buy_call_back, {pGoods}})
end

function _buy_call_back(pGoods, nCount)
	if CalcFreeItemCellCount() < nCount then
		return Talk(1, "", format("最少要有<color=yellow>%d<color> 背包空格", nCount))
	end
	if nCount <= 0 then
		return
	end
	
	local nMoney = nCount * pGoods.nJxb
	if GetCash() < nMoney then
		return Talk(1, "", format("大侠背包里的银两不够买 %d 个 %s", nCount, pGoods.szName))
	end
	if nMoney == 0 or Pay(nMoney) == 1 then
		tbAwardTemplet:Give(pGoods.tbItem, nCount, {"TRIP", "BUY"})
	end
end