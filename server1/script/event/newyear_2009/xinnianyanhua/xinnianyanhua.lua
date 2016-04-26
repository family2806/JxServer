Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\newyear_2009\\taskctrl.lua");
Include("\\script\\lib\\gb_taskfuncs.lua")

yanhua_gbtask	= "newyear0901";

tb_yanhua_specialreward	=
{
	{szName	= "���ؿ�ʯ", 		tbProp = {6, 1, 398, 1, 0, 0}},
	{szName = "���ؿ�ʯ", 		tbProp = {6, 1, 398, 1, 0, 0}},
	{szName = "6��������ʯ", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6��������ʯ", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6��������ʯ", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6��������ʯ", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6��������ʯ", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6��������ʯ", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6��������ʯ", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6��������ʯ",	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6��������ʯ", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "6��������ʯ", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "7��������ʯ", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "7��������ʯ", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "7��������ʯ", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "7��������ʯ", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "7��������ʯ", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "8��������ʯ", 	tbProp = {6, 1, 147, 8, 0, 0}},
	{szName = "8��������ʯ", 	tbProp = {6, 1, 147, 8, 0, 0}},
	{szName = "�����ؼ�", 		tbProp = {6, 1, 26, 1, 0, 0}},
	{szName = "�����ؼ�", 		tbProp = {6, 1, 26, 1, 0, 0}},
	{szName = "ϴˮ��", 		tbProp = {6, 1, 22, 1, 0, 0}},
	{szName = "ϴˮ��", 		tbProp = {6, 1, 22, 1, 0, 0}},
	{szName="�����������",	nQuality=1,	tbProp={0, 164}},
	{szName="���Ѫʯ��ָ", nQuality=1, tbProp={0, 167}},
	{szName="����ջ�ʯָ��", nQuality=1, tbProp={0, 165}},
	{szName="����ջ�ʯָ��", nQuality=1, tbProp={0, 165}},
	{szName="�����������", 	nQuality=1, tbProp={0, 190}},
	{szName="��ˮ��", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="��ˮ��", 			tbProp={4, 240, 1, 1, 0, 0}},
	{nExp = 20000000},
	{nExp = 20000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
};

tb_yanhua_randomaward	= tb_yanhua_specialreward;

function newyear0901_yanhua_dialogmain(nItemIndex, szDescLink)
	local n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	if (gb_GetTask(yanhua_gbtask, 1) ~= n_dateD) then
		gb_SetTask(yanhua_gbtask, 1, n_dateD);
		gb_SetTask(yanhua_gbtask, 2, 0);
		gb_SetTask(yanhua_gbtask, 3, 0);
		newyear0901_random_spaward();
	end
	
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbTalk = {"<dec>"..szDescLink.."��ڼ��������һ�����ƺ���Ϳ��Եõ�1���̻���ͬʱ�л���õ�һ���ر����ע�⣺ÿ��ֻ��ʹ��1�����ƺ�����ر���ֻ����21:00����ȡ.",
		"���ͷ��ƺ��/newyear0901_give_facaihongbao",
		"��ȡ�ر���/newyear0901_get_specialaward",
		"��ֻ��·��./OnCancel"};
	CreateTaskSay(tbTalk);
end

function newyear0901_give_facaihongbao()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("����δ��50��������δ��ֵ����˲��ܲμӻ", 0);
		return
	end
	
	local n_dateD = tonumber(GetLocalDate("%Y%m%d"));
	if (GetTask(newyear0901_TSK_GetYanhuaDate) == n_dateD) then
		Say("���������Ѿ��������ƺ������Ҳ����ȡ�ش��̻���.", 0);
		return
	end
	
	local n_dateH	= tonumber(GetLocalDate("%H"));
	if (n_dateH >= 21) then
		Say("������ȡ�ش��̻���ʱ���Ѿ����ˣ���ȵ������.", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("���������ռ䲻��!",0);
		return
	end
	
	local nCount = CalcItemCount(3, 6, 1, 1893, -1); -- ���� gdp���ߵĸ���
	if (nCount <= 0) then
		Say("�����ı����ﻹû�з��ƺ��!", 0);
		return 
	end
	
	local bP = ConsumeItem(3, 1, 6, 1, 1893, -1); --  ����1�۳��ɹ�������0ʧ�ܣ�nCountΪָ���۳������� 
	if (bP <= 0) then
		print("�۳����ƺ��ʧ��!");
		return
	end
	
	local n_itemid = AddItem(6, 1, 1929, 1, 0, 0);
	ITEM_SetExpiredTime(n_itemid, 20090216);
	SyncItem(n_itemid);
	Say("��ϲ�����õ�1���ش��̻�.", 0);
	
	AddOwnExp(1000000);
	n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	SetTask(newyear0901_TSK_GetYanhuaDate, n_dateD);
	gb_SetTask(yanhua_gbtask, 2, gb_GetTask(yanhua_gbtask, 2) + 1);
end

function newyear0901_get_specialaward()
	local n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	local n_dateH	= tonumber(GetLocalDate("%H"));
	if (n_dateH < 21) then
		Say("���ڲ����콱ʱ�䣬����������.", 0);
		return
	end
	
	if (GetTask(newyear0901_TSK_GetYanhuaDate) ~= n_dateD) then
		Say("���������û�н����ƺ�����ң�����û�л����콱.", 0);
		return
	end
	
	if (GetTask(newyear0901_TSK_GetSpAwardDate)	== n_dateD)	then
		Say("�����Ѿ������˽�����ر��콱.", 0);
		return
	end
	
	if (gb_GetTask(yanhua_gbtask, 3) >= 60) then
		Say("������ر����Ѿ��������ˣ��ȵ�����������.", 0);
		return
	end
	
	SetTask(newyear0901_TSK_GetSpAwardDate, n_dateD);
	local n_rd_value = random(gb_GetTask(yanhua_gbtask, 2));
	local tb_award = tb_yanhua_randomaward[gb_GetTask(yanhua_gbtask, 3) + 1];
	if (n_rd_value <= 60) then
		tbAwardTemplet:GiveAwardByList(tb_award, "newyear0901_yanhua_specialaward");
		gb_SetTask(yanhua_gbtask, 3, gb_GetTask(yanhua_gbtask, 3) + 1);
		if (tb_award.nExp) then
			Say(format("�����õ� %d����.", tb_award.nExp));
		else
			Say(format("��ϲ�����õ� %s", tb_award.szName));
		end
	else
		Say("���ϧ������û�еõ�������ر���������Ŭ���ɣ�", 0);
	end
end

function newyear0901_random_spaward()
	local tb_award	= tb_yanhua_specialreward;
	local n_id1		= 0;
	local n_id2		= 0;
	local tb_tmp	= {};
	
	for i = 1, 100 do
		n_id1	= random(getn(tb_award));
		n_id2	= random(getn(tb_award));
		tb_tmp	= tb_award[n_id1];
		tb_award[n_id1] = tb_award[n_id2];
		tb_award[n_id2]	= tb_tmp;
	end
	
	tb_yanhua_randomaward	= tb_award;
end

function newyear0901_yanhua_IsActDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20090116 or nDate > 20090215) then
		return 0;
	else
		return 1;
	end
end