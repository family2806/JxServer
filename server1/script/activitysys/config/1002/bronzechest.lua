Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")

function main(nItemIdx)
	local tbSay = {
		format("×ÏÃ§Æ÷ÐµÍ¼Æ×/#BronzeChest_GetAward(%d, %d)", nItemIdx, 1),
		format("×ÏÃ§Áî/#BronzeChest_GetAward(%d, %d)", nItemIdx, 2),
		"§ãng/OnCancel",
	}
	Say("ÇëÑ¡Ôñ½±Àø:", getn(tbSay), tbSay)
	return 1
end

function BronzeChest_GetAward(nIdx, nSelectedOption)
	local tbBronzeChest = {
		{szName="×ÏÃ§Æ÷ÐµÍ¼Æ×",tbProp={6,1,2723,1,0,0},nCount=1,
			CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_EventNgoiSaoTuyet/", %nPromotionID, "Ê¹ÓÃÍ­±¦Ïä", GetItemName(nItemIdx), 1) end},
		{szName="×ÏÃ§Áî",tbProp={6,1,2350,1,0,0},nCount=1,
			CallBack = function(nItemIdx) %tbVngTransLog:Write("201107_Ñ©ÐÇÐÇ»î¶¯/", %nPromotionID, "Ê¹ÓÃÍ­±¦Ïä", GetItemName(nItemIdx), 1) end},
	}
	local tbAward = tbBronzeChest[nSelectedOption]
	if not tbAward then 
		return
	end
	if IsMyItem(nIdx) ~= 1 or RemoveItemByIndex(nIdx) ~= 1 then
		return
	end
	tbAwardTemplet:Give(tbAward, 1, {"Event_NgoiSaoTuyet", "Ê¹ÓÃÍ­±¦Ïä"})
end