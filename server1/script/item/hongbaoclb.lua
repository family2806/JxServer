Include("\\script\\lib\\awardtemplet.lua")

tbItemAward = {
	{szName = "��ç��", tbProp = {6, 1, 2350, 1, 0, 0}, nRate = 0.01},	
	{szName = "��Գ��", tbProp = {6, 1, 2351, 1, 0, 0}, nRate = 0.05},	
	{szName = "������", tbProp = {6, 1, 2352, 1, 0, 0}, nRate = 1},	
	{szName = "��¹��", tbProp = {6, 1, 2353, 1, 0, 0}, nRate = 3},	
	{szName = "��Ԫ��¶", tbProp = {6, 1, 2312, 1, 0, 0}, nRate = 10},	
	{szName = "������", tbProp = {6, 0, 3, 1, 0, 0}, nRate = 5},	
	{szName = "������", tbProp = {6, 0, 6, 1, 0, 0}, nRate = 5},	
	{szName = "�ƽ�֮��", tbProp = {6, 1, 907, 1, 0, 0}, nRate = 10, nExpiredTime = 10080},	
	{szName = "ǧ��ƽ�֮��", tbProp = {6, 1, 2270, 1, 0, 0}, nRate = 20},	
	{szName = "����ƽ�֮��", tbProp = {6, 1, 2271, 1, 0, 0}, nRate = 7.94},	
	{szName = "����ƽ�֮��", tbProp = {6, 1, 2269, 1, 0, 0}, nRate = 30},	
	{szName = "���ؿ�ʯ", tbProp = {6, 1, 398, 1, 0, 0}, nRate = 1},	
	{szName = "���浤", tbProp = {6, 1, 1678, 1, 0, 0}, nRate = 5, tbParam={15e8}},	
	{szName = "�Ͻ��浤", tbProp = {6, 1, 2263, 1, 0, 0}, nRate = 2, tbParam={20e8}},	
}

tbExpAward = {szName = "�i����ֵ", nExp_tl = 50000000}

TASK_USECOUNT = 2789
TASK_MONTH = 2790


function main(nItemIndex)
	local nMonth =tonumber(GetLocalDate("%m"))

	local n_item_date = tonumber(FormatTime2String("%Y%m%d%H%M",ITEM_GetExpiredTime(nItemIndex)));
	local n_cur_date = tonumber(GetLocalDate("%Y%m%d%H%M"));
	if n_cur_date > n_item_date then
		Msg2Player("����Ʒ����ʹ���ڣ��Զ���ʧ.")
		return 0;
	end
	
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "������װ������1����λ!.");
		return 1
	end
	
	if (GetTask(TASK_MONTH) ~= nMonth) then
		SetTask(TASK_MONTH, nMonth)
		SetTask(TASK_USECOUNT, 0)
	end
	
	if (GetTask(TASK_USECOUNT) < 9) then
		SetTask(TASK_USECOUNT, GetTask(TASK_USECOUNT)+1)
		tbAwardTemplet:GiveAwardByList(tbExpAward , "��ú�����ֲ�");
		tbAwardTemplet:GiveAwardByList(tbItemAward , "��ú�����ֲ�");
		return 0
	else
		Msg2Player("��Ʒ���ֻ��һ����ʹ��9��!")
		return 1
	end
	
end
