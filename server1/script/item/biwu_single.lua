Include("\\script\\event\\wulin_final_match\\createleague.lua")
IncludeLib("ITEM")
function main( nItemIdx )
	local curzoneid = wl_zonename2zoneid(GetTong())
	local zoneid =  ITEM_GetItemExParam(nItemIdx,1)
	if ( zoneid ~= curzoneid or zoneid == 0 ) then
		Say("����Ʊ�����������������ģ��㲻��ʹ�á�", 0)
		return 1
	end
	matchtype = ITEM_GetItemExParam(nItemIdx,2)
	Say("��Ҫ�����μ�����", 2, "��Ҫ�齨�ҵ�"..TAB_TICKETINFO[matchtype][1].."/#wl_createleague("..matchtype..")","�����ݽ������㱨�����´ΰ�/OnCancel")
	return 1;
end