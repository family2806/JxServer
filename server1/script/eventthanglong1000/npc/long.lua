Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\EventThangLong1000\\head.lua")
tbCTL = 
{
	{szName = "��״��", tbProp = {6,1, 30048,1,0,0}, nExpiredTime = 20101025, nCount = 1},
}
function main(nItemIndex)
	local nItemData	= tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local nDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nDate > nItemData then
		Msg2Player("��Ʒ��ʹ���ڣ��Զ���ʧ.")
		return 0;
	end
	if (GetLevel() < 50) then
		Talk(1, "", "�ȼ�С��50����ʹ��!");
		return 1
	end
	if CalcFreeItemCellCount() < 10 then
			Talk(1, "", "װ������10����λ.");
			return 1
	end
	local nGenre, nDetailType, nPartType = GetItemProp(nItemIndex)
	if (nPartType == 30052) then
		TieuLongControl()
	else
		TrungDaiLongControl(nPartType)
	end
	
end

function TieuLongControl()
	if (GetTask(Task_Use_TieuLong) >= 1000) then
		Talk(1, "", "(��ʹ�ø���Ʒ����ˣ�������ʹ����!.");
		return 1
	end
	SetTask(Task_Use_TieuLong, GetTask(Task_Use_TieuLong) + 1)
	tbAwardTemplet:GiveAwardByList(tbCTL, "Event 1000 ������, Use С��");
	AddOwnExp(2000000)
	Msg2Player("����2000000 ����ֵ")
	WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 ������"..GetAccount().."\t"..GetName().."\t".."ʹ��С����ȡ2000000 ��EXP ")
end
function TrungDaiLongControl(nPartType)
	if (GetTask(Task_Use_TrungDaiLong) >= 60000) then
		Talk(1, "", "(��ʹ�ø���Ʒ����ˣ�������ʹ����!.");
		return 1
	end
	if (nPartType == 30054) then--����Ǵ���
		tbAwardTemplet:GiveAwardByList(tbCTL, "Event 1000 ������, Use ����");		
		tbAwardTemplet:GiveAwardByList(tbAwardItemUseDaiLong, "Event 1000 ������");
		local nExp, nTaskValue = GetValueByRandom(tbAwardExp)
		SetTask(Task_Use_TrungDaiLong, GetTask(Task_Use_TrungDaiLong) + nTaskValue)
		AddOwnExp(nExp)
		Msg2Player(format("�������%d ����ֵ", nExp))
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000������"..GetAccount().."\t"..GetName().."\t".."ʹ��������þ���ֵ  " .. nExp)
	else
		SetTask(Task_Use_TrungDaiLong, GetTask(Task_Use_TrungDaiLong) + 20)
		AddOwnExp(2000000)
		Msg2Player("������� 2000000 ����ֵ!")
		WriteLog(date("%Y%m%d %H%M%S").."\t".."Event 1000 ������"..GetAccount().."\t"..GetName().."\t".."ʹ��������þ���ֵ 2000000")
	end
	
	
end
