Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\newyear_2009\\head.lua");

tb_facaihongbao_award	=
{
	{szName="1 ����", 			nRepute = 1, 		nRate = 1},
	{szName="2 ����", 			nRepute = 2, 		nRate = 2},
	{szName="3 ����", 			nRepute = 3, 		nRate = 3},
	{szName="10 ����",			nRepute = 10, 		nRate = 3.07},
	{szName="50 ����",		 	nRepute = 50, 		nRate = 1},
	{szName="������ɰ����", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.2},
	{szName="������ɴ����", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.5},
	{szName="������������", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 1},
	{szName="���������ѥ",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.8},
	{szName="�������ٻ���", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 1.5},
	{szName="�������ʯ����",	tbProp={0, 164},	nQuality = 1,	nRate = 0.03},
	{szName="���Ѫʯ��ָ",	tbProp={0, 167},	nQuality = 1,	nRate = 0.08},
	{szName="����ջ�ʯָ��",	tbProp={0, 165},	nQuality = 1,	nRate = 0.08},
	{szName="�������ʯ����",	tbProp={0, 166},	nQuality = 1,	nRate = 0.1},
	{szName="�����������Ȧ",	tbProp={0, 146},	nQuality = 1,	nRate = 0.05},
	{szName="����׽�����",	tbProp={0, 145},	nQuality = 1,	nRate = 0.05},
	{szName="����׽������",	tbProp={0, 143},	nQuality = 1,	nRate = 0.05},
	{szName="�������Ǭ����",	tbProp={0, 144},	nQuality = 1,	nRate = 0.05},
	{szName="6��������ʯ",		tbProp={6, 1, 147, 6, 0, 0},		nRate = 8},
	{szName="7��������ʯ",		tbProp={6, 1, 147, 7, 0, 0},		nRate = 2},
	{szName="8��������ʯ",		tbProp={6, 1, 147, 8, 0, 0},		nRate = 0.5},
	{szName="�����ؼ�", 		tbProp={6, 1, 26, 1, 0, 0},	 		nRate = 0.5},
	{szName="ϴ�辭", 			tbProp={6, 1, 22, 1, 0, 0}, 		nRate = 0.5},
	{szName="�����ľ�",			tbProp={6, 1, 398, 1, 0, 0},		nRate = 0.02},
	{szName="��������",			tbProp={6, 1, 1915, 1, 0, 0},		nRate = 15,		nExpiredTime = newyear0901_lazhu_expiredtime},
	{szName="��������",			tbProp={6, 1, 1916, 1, 0, 0},		nRate = 7,		nExpiredTime = newyear0901_lazhu_expiredtime},
	{szName="ç��", 			tbProp={6, 1, 1886, 1, 0, 0},		nRate = 12, 	nExpiredTime = newyear0901_item_expiredtime},
	{szName="Ҭ��", 			tbProp={6, 1, 1887, 1, 0, 0},		nRate = 7, 		nExpiredTime = newyear0901_item_expiredtime},
	{szName="ľ��", 			tbProp={6, 1, 1888, 1, 0, 0},		nRate = 7, 		nExpiredTime = newyear0901_item_expiredtime},
	{szName="â��", 			tbProp={6, 1, 1889, 1, 0, 0},		nRate = 7, 		nExpiredTime = newyear0901_item_expiredtime},
	{szName="�޻���", 			tbProp={6, 1, 1890, 1, 0, 0},		nRate = 17,		nExpiredTime = newyear0901_item_expiredtime},
	{szName="�ϵ�����", 		tbProp={6, 1, 1894, 1, 0, 0},		nRate = 0.3,	nExpiredTime = newyear0901_item_expiredtime},
	{szName="��������Ƭ(1/9) /9)",	tbProp={4, 594, 1, 1, 0, 0},	nRate = 0.01},
	{szName="��������Ƭ (2/9) /9)",	tbProp={4, 595, 1, 1, 0, 0},	nRate = 0.01},
	{szName="��������Ƭ (4/9) /9)",	tbProp={4, 597, 1, 1, 0, 0},	nRate = 0.01},
	{szName="��������Ƭ (6/9) /9)",	tbProp={4, 599, 1, 1, 0, 0},	nRate = 0.01},
	{szName="��������Ƭ (8/9) /9)",	tbProp={4, 601, 1, 1, 0, 0},	nRate = 0.01},
	{szName="������ָ�ɵ���Ƭ (1/9)",		tbProp={4, 980, 1, 1, 0, 0},	nRate = 0.05},
	{szName="������ָ�ɵ���Ƭ (3/9)",		tbProp={4, 982, 1, 1, 0, 0},	nRate = 0.05},
	{szName="������ָ�ɵ���Ƭ (4/9)",		tbProp={4, 983, 1, 1, 0, 0},	nRate = 0.05},
	{szName="������ָ�ɵ���Ƭ (7/9)",		tbProp={4, 986, 1, 1, 0, 0},	nRate = 0.05},
	{szName="������ָ�ɵ���Ƭ (8/9)",		tbProp={4, 987, 1, 1, 0, 0},	nRate = 0.05},
	{szName="�Ŀս�ħ�䵶��Ƭ(1/9) /9)",		tbProp={4, 585, 1, 1, 0, 0},	nRate = 0.03},
	{szName="�Ŀս�ħ�䵶��Ƭ(4/9) /9)",		tbProp={4, 588, 1, 1, 0, 0},	nRate = 0.03},
	{szName="�Ŀս�ħ�䵶��Ƭ(5/9) /9)",		tbProp={4, 589, 1, 1, 0, 0},	nRate = 0.03},
	{szName="�Ŀս�ħ�䵶��Ƭ (7/9) /9)",		tbProp={4, 591, 1, 1, 0, 0},	nRate = 0.03},
	{szName="�Ŀս�ħ�䵶��Ƭ (9/9) /9)",		tbProp={4, 593, 1, 1, 0, 0},	nRate = 0.03},
	{szName="��ڤǹ��Ƭ(1/9) /9)",	tbProp={4, 684, 1, 1, 0, 0},	nRate = 0.05},
	{szName="��ڤǹ��Ƭ (3/9) /9)",	tbProp={4, 686, 1, 1, 0, 0},	nRate = 0.05},
	{szName="��ڤǹ��Ƭ(5/9) /9)",	tbProp={4, 688, 1, 1, 0, 0},	nRate = 0.05},
	{szName="��ڤǹ��Ƭ (6/9) /9)",	tbProp={4, 689, 1, 1, 0, 0},	nRate = 0.05},
	{szName="��ڤǹ��Ƭ (8/9) /9)",	tbProp={4, 691, 1, 1, 0, 0},	nRate = 0.05},
	{szName="ǧ�꺮����Ƭ (1/9) /9)",		tbProp={4, 702, 1, 1, 0, 0},	nRate = 0.03},
	{szName="ǧ�꺮����Ƭ (4/9) /9)",		tbProp={4, 705, 1, 1, 0, 0},	nRate = 0.03},
	{szName="ǧ�꺮����Ƭ (5/9) /9)",		tbProp={4, 706, 1, 1, 0, 0},	nRate = 0.03},
	{szName="ǧ�꺮����Ƭ (7/9) /9)",		tbProp={4, 708, 1, 1, 0, 0},	nRate = 0.03},
	{szName="ǧ�꺮����Ƭ(8/9) /9)",		tbProp={4, 709, 1, 1, 0, 0},	nRate = 0.03},
	{szName="ϴ�������Ƭ (2/6) /6)",		tbProp={4, 802, 1, 1, 0, 0},	nRate = 0.04},
	{szName="ϴ�������Ƭ (3/6) /6)",		tbProp={4, 803, 1, 1, 0, 0},	nRate = 0.04},
	{szName="ϴ�������Ƭ (4/6) /6)",		tbProp={4, 804, 1, 1, 0, 0},	nRate = 0.04},
	{szName="ϴ�������Ƭ (5/6) /6)",		tbProp={4, 805, 1, 1, 0, 0},	nRate = 0.04},
	{szName="�ܻ˷��ǵ���Ƭ (2/9) /9)",		tbProp={4, 631, 1, 1, 0, 0},	nRate = 0.05},
	{szName="�ܻ˷��ǵ���Ƭ(5/9) /9)",		tbProp={4, 634, 1, 1, 0, 0},	nRate = 0.05},
	{szName="�ܻ˷��ǵ���Ƭ(7/9) /9)",		tbProp={4, 636, 1, 1, 0, 0},	nRate = 0.05},
	{szName="�ܻ˷��ǵ���Ƭ (8/9) /9)",		tbProp={4, 637, 1, 1, 0, 0},	nRate = 0.05},
	{szName="�ܻ˷��ǵ���Ƭ(9/9) /9)",		tbProp={4, 638, 1, 1, 0, 0},	nRate = 0.05},
	{szName="���ʽ��߷�����Ƭ (1/6) /6)",		tbProp={4, 825, 1, 1, 0, 0},	nRate = 0.05},
	{szName="���ʽ��߷�����Ƭ (2/6) /6)",		tbProp={4, 826, 1, 1, 0, 0},	nRate = 0.05},
	{szName="���ʽ��߷�����Ƭ (4/6) /6)",		tbProp={4, 828, 1, 1, 0, 0},	nRate = 0.05},
	{szName="���ʽ��߷�����Ƭ(6/6) /6)",		tbProp={4, 830, 1, 1, 0, 0},	nRate = 0.05},
	{szName="ͬ����������Ƭ (2/6) /6)",		tbProp={4, 856, 1, 1, 0, 0},	nRate = 0.02},
	{szName="ͬ����������Ƭ(3/6) /6)",		tbProp={4, 857, 1, 1, 0, 0},	nRate = 0.02},
	{szName="ͬ����������Ƭ (4/6) /6)",		tbProp={4, 858, 1, 1, 0, 0},	nRate = 0.02},
	{szName="ͬ����������Ƭ (5/6) /6)",		tbProp={4, 859, 1, 1, 0, 0},	nRate = 0.02},
	{szName="�����޼���������Ƭ  (1/6) /6)",	tbProp={4, 879, 1, 1, 0, 0},	nRate = 0.02},
	{szName="�����޼���������Ƭ  (2/6) /6)",	tbProp={4, 880, 1, 1, 0, 0},	nRate = 0.02},
	{szName="�����޼���������Ƭ (4/6) /6)",	tbProp={4, 882, 1, 1, 0, 0},	nRate = 0.02},
	{szName="�����޼���������Ƭ  (6/6) /6)",	tbProp={4, 884, 1, 1, 0, 0},	nRate = 0.02},
};


tb_tree_itemid	=
{
	[1]	= 1917,
	[2]	= 1918,
};

tb_openhongbao_mapid	=
{
	[11]	= 1,
	[1] 	= 1,
	[37] 	= 1,
	[176] 	= 1,
	[162] 	= 1,
	[78] 	= 1,
	[80] 	= 1,
	[174] 	= 1,
	[121] 	= 1,
	[153] 	= 1,
	[101] 	= 1,
	[99] 	= 1,
	[100] 	= 1,
	[20]	= 1,
	[53] 	= 1,
	[54] 	= 1,
	[175] 	= 1,
	[55] 	= 1,
};

function main()
	newyear0901_resettask();
	
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_lazhu_expiredtime) then
		Msg2Player("����Ʒ�ѹ���.");
		return 0;
	end
	
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("������Ȼ����50��������Ȼδ��ֵ�����Բ���ʹ�÷��ƺ��.", 0);
		return 1;
	end
	
	local subworld, x, y	= GetWorldPos();
	if (tb_openhongbao_mapid[subworld] == nil) then
		Say("���ƺ��ֻ�ڳ��кʹ���ʹ��.", 0);
		return 1;
	end
	
	if (CalcFreeItemCellCount() < 20) then
		Say("������װ�����㣬������20����λ", 0);
		return 1;
	end
	
	if (300 + GetTask(newyear0901_TSK_GetExp_Hongbao) <= GetTask(newyear0901_TSK_GetExpUpLimit))	then
		SetTask(newyear0901_TSK_GetExp_Hongbao, 300 + GetTask(newyear0901_TSK_GetExp_Hongbao));
		AddOwnExp(3000000);
		tbAwardTemplet:GiveAwardByList(tb_facaihongbao_award, "���ƺ��");
		
		
    	subworld = SubWorldID2Idx(subworld);
    	local n_tree_idx		= random(1, 2);
    	local n_itemid 			= tb_tree_itemid[n_tree_idx];
    	local nItemIdx 			= DropItem(subworld, x * 32, y * 32, -1, 6, 1, n_itemid, 1, 0, 0, 0);
	else
		Say("�����Ѵﾭ��������ޣ����Բ�����ʹ�÷��ƺ����.", 0);
		return 1;
	end
end
