-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ�ϰ� - ��ͱ���
-- �ļ�������tianci_baoxiang.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2009-05-21 14:38:37

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\awardtemplet.lua")

local tbItem = 
{
	{szName="��", tbProp={6, 1, 2062, 1, 0, 0}, nRate = 25, nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
	{szName="��", tbProp={6, 1, 2063, 1, 0, 0}, nRate = 25,  nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
	{szName="��", tbProp={6, 1, 2064, 1, 0, 0}, nRate = 25,  nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
	{szName="��", tbProp={6, 1, 2065, 1, 0, 0}, nRate = 25,  nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
}

function main(nItemIndex)
		
	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "����Ʒ�ѹ���")
		return 0
	end
	if CalcFreeItemCellCount() < 1 then
		Talk(1,"", format("װ����λ����%d ��λ�������°���һ��.", 1))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbItem, "use "..GetItemName(nItemIndex));
	
end

function IsPickable(nItemIndex)
	
	local nExpiredTime = tbBirthday0905.tbTask.item_expiredtime1;
	if tonumber(GetLocalDate("%Y%m%d")) >= nExpiredTime then
		Msg2Player("����Ʒ�ѹ���");
		return 0
	end
	
	if ITEM_GetExpiredTime(nItemIndex) == 0 then
		tbAwardTemplet:ITEM_SetExpiredTime(nItemIndex, nExpiredTime);
	end
	
	return 1
end