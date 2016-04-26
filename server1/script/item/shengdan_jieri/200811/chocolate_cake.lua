Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

tb_chocolate_award	=
{
	{szName="1 ����", 			nRepute = 1, 		nRate = 9.8545},
	{szName="2 ����", 			nRepute = 2, 		nRate = 23},
	{szName="3 ����", 			nRepute = 3, 		nRate = 25},
	{szName="10 ����",			nRepute = 10, 		nRate = 8},
	{szName="50 ����",		 	nRepute = 50, 		nRate = 1},
	{szName="������ɰ����", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.006},
	{szName="������ɴ����", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.02},
	{szName="������������", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="���������ѥ",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.04},
	{szName="�������ٻ���", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.1},
	{szName="�������ʯ����",	tbProp={0, 164},	nQuality = 1,	nRate = 0.005},
	{szName="���Ѫʯ��ָ",	tbProp={0, 167},	nQuality = 1,	nRate = 0.015},
	{szName="����ջ�ʯָ��",	tbProp={0, 165},	nQuality = 1,	nRate = 0.015},
	{szName="�������ʯ����",	tbProp={0, 166},	nQuality = 1,	nRate = 0.02},
	{szName="�����������Ȧ",	tbProp={0, 146},	nQuality = 1,	nRate = 0.007},
	{szName="����׽�����",	tbProp={0, 145},	nQuality = 1,	nRate = 0.007},
	{szName="����׽������",	tbProp={0, 143},	nQuality = 1,	nRate = 0.007},
	{szName="�������Ǭ����",	tbProp={0, 144},	nQuality = 1,	nRate = 0.007},
	{szName="6��������ʯ",					tbProp={6, 1, 147, 6, 0, 0},	nRate = 1},
	{szName="7��������ʯ",					tbProp={6, 1, 147, 7, 0, 0},	nRate = 0.2},
	{szName="8��������ʯ",					tbProp={6, 1, 147, 8, 0, 0},	nRate = 0.05},
	{szName="С����",						tbProp={6, 1, 1850, 1, 0, 0},	nRate = 0.07,	nExpiredTime = 20090111},
	{szName="���ؿ�ʯ",						tbProp={6, 1, 398, 1, 0, 0},	nRate = 0.002},
	{szName="��ɫ����",						tbProp={6, 1, 1851, 1, 0, 0},	nRate = 6,	nExpiredTime = 20090111},
	{szName="��ɫ����",						tbProp={6, 1, 1852, 1, 0, 0},	nRate = 3,	nExpiredTime = 20090111},
	{szName="��������Ƭ(1/9) /9)",	tbProp={4, 594, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="��������Ƭ (3/9) /9)",	tbProp={4, 596, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="��������Ƭ (5/9) /9)",	tbProp={4, 598, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="��������Ƭ (6/9) /9)",	tbProp={4, 599, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="��������Ƭ (8/9) /9)",	tbProp={4, 601, 1, 1, 0, 0},	nRate = 0.0015},
	{szName="������ָ�ɵ���Ƭ (2/9)",		tbProp={4, 981, 1, 1, 0, 0},	nRate = 0.005},
	{szName="������ָ�ɵ���Ƭ (3/9)",		tbProp={4, 982, 1, 1, 0, 0},	nRate = 0.005},
	{szName="������ָ�ɵ���Ƭ (4/9)",		tbProp={4, 983, 1, 1, 0, 0},	nRate = 0.005},
	{szName="������ָ�ɵ���Ƭ (7/9)",		tbProp={4, 986, 1, 1, 0, 0},	nRate = 0.005},
	{szName="������ָ�ɵ���Ƭ (9/9)",		tbProp={4, 988, 1, 1, 0, 0},	nRate = 0.005},
	{szName="�Ŀս�ħ�䵶��Ƭ(1/9) /9)",		tbProp={4, 585, 1, 1, 0, 0},	nRate = 0.005},
	{szName="�Ŀս�ħ�䵶��Ƭ (4/9) /9)",		tbProp={4, 588, 1, 1, 0, 0},	nRate = 0.005},
	{szName="�Ŀս�ħ�䵶��Ƭ (6/9) /9)",		tbProp={4, 590, 1, 1, 0, 0},	nRate = 0.005},
	{szName="�Ŀս�ħ�䵶��Ƭ (8/9) /9)",		tbProp={4, 592, 1, 1, 0, 0},	nRate = 0.005},
	{szName="�Ŀս�ħ�䵶��Ƭ(9/9) /9)",		tbProp={4, 593, 1, 1, 0, 0},	nRate = 0.005},
	{szName="��ڤǹ��Ƭ (2/9) /9)",	tbProp={4, 685, 1, 1, 0, 0},	nRate = 0.008},
	{szName="��ڤǹ��Ƭ (3/9) /9)",	tbProp={4, 686, 1, 1, 0, 0},	nRate = 0.008},
	{szName="��ڤǹ��Ƭ(5/9) /9)",	tbProp={4, 688, 1, 1, 0, 0},	nRate = 0.008},
	{szName="��ڤǹ��Ƭ (6/9) /9)",	tbProp={4, 689, 1, 1, 0, 0},	nRate = 0.008},
	{szName="��ڤǹ��Ƭ (9/9) /9)",	tbProp={4, 692, 1, 1, 0, 0},	nRate = 0.008},
	{szName="ǧ�꺮����Ƭ (3/9) /9)",		tbProp={4, 704, 1, 1, 0, 0},	nRate = 0.004},
	{szName="ǧ�꺮����Ƭ (4/9) /9)",		tbProp={4, 705, 1, 1, 0, 0},	nRate = 0.004},
	{szName="ǧ�꺮����Ƭ (5/9) /9)",		tbProp={4, 706, 1, 1, 0, 0},	nRate = 0.004},
	{szName="ǧ�꺮����Ƭ (7/9) /9)",		tbProp={4, 708, 1, 1, 0, 0},	nRate = 0.004},
	{szName="ǧ�꺮����Ƭ (9/9) /9)",		tbProp={4, 710, 1, 1, 0, 0},	nRate = 0.004},
	{szName="ϴ�������Ƭ (2/6) /6)",		tbProp={4, 802, 1, 1, 0, 0},	nRate = 0.005},
	{szName="ϴ�������Ƭ (4/6) /6)",		tbProp={4, 804, 1, 1, 0, 0},	nRate = 0.005},
	{szName="ϴ�������Ƭ (5/6) /6)",		tbProp={4, 805, 1, 1, 0, 0},	nRate = 0.005},
	{szName="ϴ�������Ƭ (6/6) /6)",		tbProp={4, 806, 1, 1, 0, 0},	nRate = 0.005},
	{szName="�ܻ˷��ǵ���Ƭ (1/9) /9)",		tbProp={4, 630, 1, 1, 0, 0},	nRate = 0.01},
	{szName="�ܻ˷��ǵ���Ƭ(3/9) /9)",		tbProp={4, 632, 1, 1, 0, 0},	nRate = 0.01},
	{szName="�ܻ˷��ǵ���Ƭ (4/9) /9)",		tbProp={4, 633, 1, 1, 0, 0},	nRate = 0.01},
	{szName="�ܻ˷��ǵ���Ƭ (6/9) /9)",		tbProp={4, 635, 1, 1, 0, 0},	nRate = 0.01},
	{szName="���ʽ��߷�����Ƭ  (2/6) /6)",		tbProp={4, 826, 1, 1, 0, 0},	nRate = 0.007},
	{szName="���ʽ��߷�����Ƭ (3/6) /6)",		tbProp={4, 827, 1, 1, 0, 0},	nRate = 0.007},
	{szName="���ʽ��߷�����Ƭ (4/6) /6)",		tbProp={4, 828, 1, 1, 0, 0},	nRate = 0.007},
	{szName="���ʽ��߷�����Ƭ (6/6) /6)",		tbProp={4, 830, 1, 1, 0, 0},	nRate = 0.007},
	{szName="ͬ����������Ƭ(1/6) /6)",		tbProp={4, 855, 1, 1, 0, 0},	nRate = 0.003},
	{szName="ͬ����������Ƭ (2/6) /6)",		tbProp={4, 856, 1, 1, 0, 0},	nRate = 0.003},
	{szName="ͬ����������Ƭ (3/6) /6)",		tbProp={4, 857, 1, 1, 0, 0},	nRate = 0.003},
	{szName="ͬ����������Ƭ (5/6) /6)",		tbProp={4, 859, 1, 1, 0, 0},	nRate = 0.003},
	{szName="����������������Ƭ(1/6)",	tbProp={4, 1152, 1, 1, 0, 0},	nRate = 0.007},
	{szName="����������������Ƭ(3/6)",	tbProp={4, 1154, 1, 1, 0, 0},	nRate = 0.007},
	{szName="����������������Ƭ (5/6)",	tbProp={4, 1156, 1, 1, 0, 0},	nRate = 0.007},
	{szName="����������������Ƭ (6/6)",	tbProp={4, 1157, 1, 1, 0, 0},	nRate = 0.007},
	{szName="�����޼���������Ƭ (1/6) /6)",	tbProp={4, 879, 1, 1, 0, 0},	nRate = 0.003},
	{szName="�����޼���������Ƭ (2/6) /6)",	tbProp={4, 880, 1, 1, 0, 0},	nRate = 0.003},
	{szName="�����޼���������Ƭ(4/6) /6)",	tbProp={4, 882, 1, 1, 0, 0},	nRate = 0.003},
	{szName="������������", 				tbProp={6, 1, 1257, 1, 0, 0},	nRate = 10},
	{szName="��ͭ��������",				tbProp={6, 1, 1256, 1, 0, 0}, 	nRate = 1},
	{szName="������������",				tbProp={6, 1, 1255, 1, 0, 0}, 	nRate = 1},
	{szName="�ƽ���������", 				tbProp={6, 1, 1254, 1, 0, 0}, 	nRate = 0.02},
	{szName="�����ؼ�h", 					tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.1},
	{szName="ϴ�辭", 						tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.1},
	{szName="�����ľ�", 					tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 2},
	{szName="���޺�", 						tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 5},
	{szName="���ش���", 					tbProp={6, 1, 402,1, 0, 0}, 	nRate = 3},

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
	if (100 + GetTask(christmas_getexp_taskid) <= GetTask(christmas_bingjing_taskid))	then
		SetTask(christmas_getexp_taskid, 100 + GetTask(christmas_getexp_taskid));
		AddOwnExp(1000000);
		tbAwardTemplet:GiveAwardByList(tb_chocolate_award, "Ho�t ��ng gi�ng sinh 2008_B�nh Kem Socola");
	else
		Say("�����ѵ�����߾������ޣ����ܼ���ʹ�õ�����.", 0);
		return 1;
	end
end