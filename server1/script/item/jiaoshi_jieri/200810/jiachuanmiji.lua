--�Ҵ��ؼ�
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\lib\\lib.lua")
Include("\\script\\event\\jiaoshi_jieri\\200810\\taskctrl.lua")
Include("\\script\\lib\\pay.lua")
local tbAwardList = 
{
	[1] = {nExp = 1000000},
	[2] =
	{
		{szName="�����������", nQuality=1, nRate=0.002, tbProp={0, 164}},
		{szName="���Ѫʯ��ָ", nQuality=1, nRate=0.005, tbProp={0, 167}},
		{szName="����ջ�ʯָ��", nQuality=1, nRate=0.005, tbProp={0, 165}},
		{szName="�������ʯ����", nQuality=1, nRate=0.01, tbProp={0, 166}},
		{szName="������ɳ����", nQuality=1, nRate=0.005, tbProp={0, 160}},
		{szName="������ɴ����", nQuality=1, nRate=0.008, tbProp={0, 159}},
		{szName="������������", nQuality=1, nRate=0.2, tbProp={0, 163}},
		{szName="���������ѥ", nQuality=1, nRate=0.05, tbProp={0, 161}},
		{szName="�������ٻ���", nQuality=1, nRate=0.2, tbProp={0, 162}},
		{szName="�����������", nQuality=1, nRate=0.002, tbProp={0, 190}},
		{szName="�����������", nQuality=1, nRate=0.01, tbProp={0, 193}},
		{szName="������ǽ�ָ", nQuality=1, nRate=0.2, tbProp={0, 192}},
		{szName="������Ů����", nQuality=1, nRate=0.15, tbProp={0, 191}},
		{szName="���������", nQuality=1, nRate=0.01, tbProp={0, 189}},
		{szName="������Ѫ��", nQuality=1, nRate=0.1, tbProp={0, 186}},
		{szName="���ǵ��Ľ�", nQuality=1, nRate=0.1, tbProp={0, 188}},
		{szName="���Ƕ��黷", nQuality=1, nRate=0.5, tbProp={0, 187}},
		{szName="3��������ʯ", nRate=5, tbProp={6, 1, 147, 3, 0, 0}},
		{szName="4��������ʯ", nRate=3, tbProp={6, 1, 147, 4, 0, 0}},
		{szName="5��������ʯ", nRate=2, tbProp={6, 1, 147, 5, 0, 0}},
		{szName="�����ؼ�", nRate=0.1, tbProp={6, 1, 26, 1, 0, 0}},
		{szName="ϴ�辭", nRate=0.1, tbProp={6, 1, 22, 1, 0, 0}},
	}
}

function main(nItemIndex)
	jiaoshi0810_ResetTask()
	local nDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate >= GetItemParam(nItemIndex, 1) then
		Talk(1,"","����Ʒ�ѹ���");
		return 0
	end
	if GetLevel() < 50 or IsCharged() == 0 then
		Talk(1, "", "ֻ��50�������ѳ�ֵ��Ҳ���ʹ�øõ���.")
		return 1
	end
	local nCurExp = GetTask(jiaoshi0810_TSK_ExpLimit)
	if nCurExp >= jiaoshi0810_MaxExpLimit then
		Talk(1, "", format("ÿ������ʹ�ø���Ʒ���ֻ���%s ����.", jiaoshi0810_TransferDigit2CnNum(jiaoshi0810_MaxExpLimit)))
		return 1;
	end
	tbAwardTemplet:GiveAwardByList(%tbAwardList, "use "..GetItemName(nItemIndex))
	SetTask(jiaoshi0810_TSK_ExpLimit, nCurExp + %tbAwardList[1].nExp)
end