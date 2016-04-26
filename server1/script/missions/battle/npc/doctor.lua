Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\common.lua")

tbGoodsList = 
{
	{ szName="�ر��о���", nJxb = 0, tbItem = { tbProp={6,1,1957,1,0,0},}},
	{ szName="������ؽ���", nJxb = 500000, tbItem = { tbProp={6,1,1781,1,0,0}, tbParam={60},}},
	{ szName="�������쵤", nJxb = 10000, tbItem = { tbProp={1,8,0,4,0,0},}},
}

--�����
function main()
	local szTitle = "����Ҫʲô <enter>"..format("%s%s<enter>", strfill_left("��Ʒ ", 30), strfill_left("�ܼۣ�����", 20))
	local tbOpt = {}
	for i=1, getn(tbGoodsList) do
		
		local pGoods = tbGoodsList[i]
		local pOpt = {}
		szTitle = szTitle..format("%s%s<enter>", strfill_left(pGoods.szName, 30), strfill_left(pGoods.nJxb, 20))
		pOpt = {pGoods.szName, _buy_ask_number, {pGoods}}
		tinsert(tbOpt, pOpt)
	end
	tinsert(tbOpt, {"����Ҫ��лл!"})
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
	
	g_AskClientNumberEx(1, nMaxCount, "���������", {_buy_call_back, {pGoods}})
end

function _buy_call_back(pGoods, nCount)
	if CalcFreeItemCellCount() < nCount then
		return Talk(1, "", format("����Ҫ��<color=yellow>%d<color> �����ո�", nCount))
	end
	if nCount <= 0 then
		return
	end
	
	local nMoney = nCount * pGoods.nJxb
	if GetCash() < nMoney then
		return Talk(1, "", format("��������������������� %d �� %s", nCount, pGoods.szName))
	end
	if nMoney == 0 or Pay(nMoney) == 1 then
		tbAwardTemplet:Give(pGoods.tbItem, nCount, {"TRIP", "BUY"})
	end
end