Include("\\script\\vng_event\\VuonCaySinhNhat\\vng_award.lua")

function main(nItemIdx)
	local nItemParam = GetItemParam(nItemIdx, 1)

	if nItemParam == 1 then
		tbSpecialAward:NguyetThan2(nItemIdx)		
	elseif nItemParam == 2 then
		tbSpecialAward:BatTu2(nItemIdx)
	elseif nItemParam == 3 then
		tbSpecialAward:BachKim2(nItemIdx, 3)	
	elseif nItemParam == 4 then
		tbSpecialAward:BachKim2(nItemIdx, 4)
	elseif nItemParam == 5 then
		tbSpecialAward:BachKim2(nItemIdx, 5)	
	elseif nItemParam == 6 then
		tbSpecialAward:BachKim2(nItemIdx, 6)
	else 
		return
	end
	return 1
end

function GetDesc(nItem)	
	local szDesc = ""
	local n_param = tonumber(GetItemParam( nItem, 1 ))
	local tbItemName = 
	{
		[1] = "��çͼ��",
		[2] = "��ç��ָͼ��",
		[3] = "��ç����",
		[4] = "��ç�Ͻ�ָ",
		[5] = "��ç�½�ָ",
		[6] = "��ç��е",
	}
	szDesc = szDesc..format("\n���ش��ﱦ��: <color=yellow>%s<color>", tbItemName[n_param]);
	return szDesc;
end