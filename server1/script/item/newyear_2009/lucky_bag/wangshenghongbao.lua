Include("\\script\\lib\\awardtemplet.lua");
Include("\\script\\item\\newyear_2009\\head.lua");

tb_wangshenghongbao_award	=
{
	{szName="1 ����", 			nRepute = 1, 		nRate = 25},
	{szName="2 ����", 			nRepute = 2, 		nRate = 20},
	{szName="3 ����", 			nRepute = 3, 		nRate = 15},
	{szName="10 ����",			nRepute = 10, 		nRate = 3},
	{szName="50 ����",		 	nRepute = 50, 		nRate = 0.1},
	{szName="3��������ʯ", 		tbProp={6, 1, 147, 3, 0, 0}, 	nRate = 5},
	{szName="4��������ʯ", 		tbProp={6, 1, 147, 4, 0, 0},	nRate = 3},
	{szName="5��������ʯ", 		tbProp={6, 1, 147, 5, 0, 0},	nRate = 2},
	{szName="������ӡ��",		tbProp={6, 1, 18,  1, 0, 0},	nRate = 3},
	{szName="������",			tbProp={6, 0, 6,   1, 0, 0}, 	nRate = 5},
	{szName="������",			tbProp={6, 0, 3,   1, 0, 0}, 	nRate = 5},
	{szName="�����ؼ�", 		tbProp={6, 1, 26, 1, 0, 0},	 	nRate = 0.1},
	{szName="ϴ�辭", 			tbProp={6, 1, 22, 1, 0, 0}, 	nRate = 0.1},
	{szName="�����ľ�", 		tbProp={6, 1, 12, 1, 0, 0}, 	nRate = 1},
	{szName="���޺�", 			tbProp={6, 1, 23, 1, 0, 0}, 	nRate = 3},
	{szName="���ش���", 		tbProp={6, 1, 402,1, 0, 0}, 	nRate = 7.779},
	{szName="������ɰ����", 	tbProp={0, 160},	nQuality = 1,	nRate = 0.008},
	{szName="������ɴ����", 	tbProp={0, 159},	nQuality = 1,	nRate = 0.01},
	{szName="������������", 	tbProp={0, 163}, 	nQuality = 1,	nRate = 0.1},
	{szName="���������ѥ",	tbProp={0, 161}, 	nQuality = 1,	nRate = 0.015},
	{szName="�������ٻ���", 	tbProp={0, 162}, 	nQuality = 1,	nRate = 0.2},
	{szName="�����������", 	tbProp={0, 190}, 	nQuality = 1,	nRate = 0.008},
	{szName="�����������", 	tbProp={0, 193}, 	nQuality = 1,	nRate = 0.07},
	{szName="������ǽ�ָ", 	tbProp={0, 192}, 	nQuality = 1,	nRate = 0.3},
	{szName="������Ů����", 	tbProp={0, 191}, 	nQuality = 1,	nRate = 0.4},
	{szName="���������", 	tbProp={0, 189}, 	nQuality = 1,	nRate = 0.01},
	{szName="������Ѫ��", 	tbProp={0, 186}, 	nQuality = 1,	nRate = 0.1},
	{szName="���ǵ��Ľ�", 	tbProp={0, 188}, 	nQuality = 1,	nRate = 0.3},
	{szName="���Ƕ�����", 	tbProp={0, 187}, 	nQuality = 1,	nRate = 0.4},
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
		Say("������Ȼ����50��������Ȼδ��ֵ�����Բ���ʹ���������.", 0);
		return 1;
	end
	
	local subworld, x, y	= GetWorldPos();
	if (tb_openhongbao_mapid[subworld] == nil) then
		Say("�������ֻ�ڳ��кʹ���ʹ��.", 0);
		return 1;
	end
	
	if (CalcFreeItemCellCount() < 20) then
		Say("������װ������!", 0);
		return 1;
	end
	
	if (100 + GetTask(newyear0901_TSK_GetExp_Hongbao) <= GetTask(newyear0901_TSK_GetExpUpLimit))	then
		SetTask(newyear0901_TSK_GetExp_Hongbao, 100 + GetTask(newyear0901_TSK_GetExp_Hongbao));
		AddOwnExp(1000000);
		
    	subworld = SubWorldID2Idx(subworld);
    	local n_tree_idx		= random(1, 2);
    	local n_itemid 			= tb_tree_itemid[n_tree_idx];
    	local nItemIdx 			= DropItem(subworld, x * 32, y * 32, -1, 6, 1, n_itemid, 1, 0, 0, 0);
			
		tbAwardTemplet:GiveAwardByList(tb_wangshenghongbao_award, "�������");	
	else
		Say("�����Ѵﾭ��������ޣ����Բ�����ʹ�����������.", 0);
		return 1;
	end
end