Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

tb_strawberry_award	=
{
	{szName="3��������ʯ", 		tbProp={6, 1, 147, 3, 0, 0}, 	nRate = 3},
	{szName="4��������ʯ", 		tbProp={6, 1, 147, 4, 0, 0},	nRate = 2},
	{szName="5��������ʯ", 		tbProp={6, 1, 147, 5, 0, 0},	nRate = 0.8},
	{szName="������������", 	tbProp={6, 1, 1257, 1, 0, 0},	nRate = 5},
	{szName="��ͭ��������",	tbProp={6, 1, 1256, 1, 0, 0}, 	nRate = 2},
	{szName="������������",	tbProp={6, 1, 1255, 1, 0, 0}, 	nRate = 0.8},
	{szName="�ƽ���������", 	tbProp={6, 1, 1254, 1, 0, 0}, 	nRate = 0.05},
	{szName="�����ؼ�", 		tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.05},
	{szName="ϴ�辭", 			tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.05},
	{szName="�����ľ�", 		tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 1},
	{szName="���޺�", 			tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 2},
	{szName="���ش���", 		tbProp={6, 1, 402,1, 0, 0}, 	nRate = 6},
	{szName="������ɰ����", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.006},
	{szName="������ɴ����", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.01},
	{szName="������������", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="���������ѥ",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.04},
	{szName="�������ٻ���", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.1},
	{szName="1����", 			nRepute = 1, 		nRate = 30},
	{szName="2 ����", 			nRepute = 2, 		nRate = 25},
	{szName="3 ����", 			nRepute = 3, 		nRate = 19},
	{szName="10 ����",			nRepute = 10, 		nRate = 2.494},
	{szName="50 ����",		 	nRepute = 50, 		nRate = 0.5},
};

function main(nItemIndex)
	christmas_resettask();
	if GetItemParam(nItemIndex, 1) ~= 0 and GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "����Ʒ�ѹ���")
		return 0
	end
	if (CalcFreeItemCellCount() < 20) then
		Say("������װ������!", 0);
		return 1;
	end
	
	if (50 + GetTask(christmas_getexp_taskid) <= GetTask(christmas_bingjing_taskid))	then
		SetTask(christmas_getexp_taskid, 50 + GetTask(christmas_getexp_taskid));
		AddOwnExp(500000);
		tbAwardTemplet:GiveAwardByList(tb_strawberry_award, "2008ʥ���-����");	
	else
		Say("�����ѻ����߾��飬���Բ�����ʹ�õ�����.", 0);
		return 1;
	end
end