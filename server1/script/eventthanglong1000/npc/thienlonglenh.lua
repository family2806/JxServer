Include("\\script\\lib\\awardtemplet.lua")
--Include("\\script\\EventThangLong1000\\head.lua")
tbTTLDai= 
{
	{szName = "������(��)", tbProp = {6,1, 30051,1,0,0}, nExpiredTime = 20101025, nCount = 2},
}

function main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate > nItemData then
		Msg2Player("��Ʒ����ʹ���ڣ��Զ���ʧ.")
		return 0;
	end

	if CalcFreeItemCellCount() < 5 then
			Talk(1, "", "װ������5����λ.");
			return 1
	end
	tbAwardTemplet:GiveAwardByList(tbTTLDai, "Event1000������, Use ������");
	Msg2Player("������ȡ2�������� (��)")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000������"..GetAccount().."\t"..GetName().."\t".."�ɹ�ʹ��������")
end
