Include("\\script\\vng_feature\\getgoldequip.lua")
tbParam2EquipType = {
	[1] = 0,
	[2] = 1,	
	[3] = 2,
	[4] = 3,
	[5] = 4,
	[6] = 5,
	[7] = 6,
	[8] = 7,
	[9] = 8,
	[10] = 9,
--	[11] = 10,
--	[12] = 0,
--	[13] = 1,
--	[14] = 2,
--	[15] = 3,
--	[16] = 4,
--	[17] = 5,
--	[18] = 6,
--	[19] = 7,
--	[20] = 8,
--	[21] = 9,
--	[22] = 10,
}
function main(nItemIdx)
	local n_param = tonumber(GetItemParam(nItemIdx, 1 ))
	local tb = {nSpecificItem = tbParam2EquipType[n_param], nItem2Consume = nItemIdx}
	tb.tbLog={"½ðÎÚ±¦Ïä","Ê¹ÓÃ½ðÎÚ±¦Ïä"}
	if n_param <= 0 or n_param == 11 then
		return
	end	
	tbVNGetGoldEquip:GetGoldEquip(6, random(1,23), tb)
	return 1
end

function GetGoldEquip()
	
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[1] = "½ðÎÚÏîÁ´±¦Ïä",
		[2] = "½ðÎÚ¿ø±¦Ïä",	
		[3] = "½ðÎÚÉÏ½ä±¦Ïä",
		[4] = "½ðÎÚ»¤Íó±¦Ïä",
		[5] = "½ðÎÚÑü´ø±¦Ïä",
		[6] = "½ðÎÚÒÂ±¦Ïä",		
		[7] = "½ðÎÚÎäÆ÷±¦Ïä",
		[8] = "½ðÎÚÐ¬±¦Ïä",
		[9] = "½ðÎÚÅå±¦Ïä",
		[10] = "½ðÎÚÏÂ½ä±¦Ïä",
	}
	szDesc = szDesc..format("<color=yellow>%s<color>", tbItemName[n_param]);
	return szDesc;
end