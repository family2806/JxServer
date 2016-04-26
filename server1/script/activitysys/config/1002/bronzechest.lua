Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")

function main(nItemIdx)
	local tbSay = {
		format("��ç��еͼ��/#BronzeChest_GetAward(%d, %d)", nItemIdx, 1),
		format("��ç��/#BronzeChest_GetAward(%d, %d)", nItemIdx, 2),
		"��ng/OnCancel",
	}
	Say("��ѡ����:", getn(tbSay), tbSay)
	return 1
end

function BronzeChest_GetAward(nIdx, nSelectedOption)
	local tbBronzeChest = {
		{szName="��ç��еͼ��",tbProp={6,1,2723,1,0,0},nCount=1,
			CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "ʹ��ͭ����", GetItemName(nItemIdx), 1) end},
		{szName="��ç��",tbProp={6,1,2350,1,0,0},nCount=1,
			CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_ѩ���ǻ/", %nPromotionID, "ʹ��ͭ����", GetItemName(nItemIdx), 1) end},
	}
	local tbAward = tbBronzeChest[nSelectedOption]
	if not tbAward then 
		return
	end
	if IsMyItem(nIdx) ~= 1 or RemoveItemByIndex(nIdx) ~= 1 then
		return
	end
	tbAwardTemplet:Give(tbAward, 1, {"Event_NgoiSaoTuyet", "ʹ��ͭ����"})
end