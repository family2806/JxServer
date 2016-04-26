-- �ļ�������jinengmiji_90.lua
-- �����ߡ���wangjingjun
-- ���ݡ����������ɵ��ؼ��� ����ѧϰ90������
-- ����ʱ�䣺2011-07-12 15:59:01

Include("\\script\\dailogsys\\dailogsay.lua")
--������0 ����1  ����2  �嶾3   ��ü4  ����5   ؤ��6   ����7   �䵱8   ����9��
sbook_list =
{	-- ��ʽ��{����ID, ���ܵȼ�, ����ID, ���輶��, ����������, ��������}
	[2959] = {	
		{318, 1, 0, 90, "�����ؼ�", "�����Ʒ�-��Ħ�ɽ�"},
		{319, 1, 0, 90, "�����ؼ�", "���ֹ���-��ɨǧ��"},
		{321, 1, 0, 90, "�����ؼ�", "���ֵ���-����ն"},
	},
	[2960] = {	
		{322, 1, 1, 90, "�����ؼ�", "��������-����ն"},
		{323, 1, 1, 90, "�����ؼ�", "����ǹ��-׷������"},
		{325, 1, 1, 90, "�����ؼ�", "��������-׷���"},
	},
	[2961] = {	 
		{339, 1, 2, 90, "�����ؼ� ", "���ŷɵ�-�����Ӱ"},
		{302, 1, 2, 90, "�����ؼ� ", "�������-�����滨"},
		{342, 1, 2, 90, "�����ؼ� ", "���ŷ���-�Ź�����"},
		{351, 1, 2, 90, "�����ؼ� ", "���ź���-�һ���"},
	},
	[2962] = {	 
		{353, 1, 3, 90, "�嶾�ؼ�", "�嶾�Ʒ�-����ʴ��"},
		{355, 1, 3, 90, "�嶾�ؼ�", "�嶾����-����ն"},
		{390, 1, 3, 90, "�嶾�ؼ�", "�嶾������-�Ͻ��"},
	},
	[2963] = {	 
		{328, 1, 4, 90, "��ü�ؼ�", "��ü����-������ѩ"},
		{380, 1, 4, 90, "��ü�ؼ�", "��ü�Ʒ�-��˪��Ӱ"},
		{332, 1, 4, 90, "��ü�ؼ�h", "��ü�ն�-�ն�����"},
	},
	[2964] = {	 
		{336, 1, 5, 90, "�����ؼ�", "���̵���-������Ӱ"},
		{337, 1, 5, 90, "�����ؼ�", "����˫��-��������"},
	},
	[2965] = {	 
		{357, 1, 6, 90, "ؤ���ؼ�", "ؤ���Ʒ�-��������"},
		{359, 1, 6, 90, "ؤ���ؼ�", "ؤ�����-�����޹�"},
	},
	[2966] = {	 
		{361, 1, 7, 90, "�����ؼ�", "����ì��-������"},
		{362, 1, 7, 90, "�����ؼ�", "���̵���-��������"},
		{391, 1, 7, 90, "�����ؼ�", "��������-�������"},
	},
	[2967] = {	 
		{365, 1, 8, 90, "�䵱�ؼ�", "�䵱�Ʒ�-��ѩ����"},
		{368, 1, 8, 90, "�䵱�ؼ�", "�䵱����-�˽���һ"},
	},
	[2968] = {	 
		{372, 1, 9, 90, "�����ؼ�", "��������-��ѩ����"},
		{375, 1, 9, 90, "�����ؼ�", "��������-�׶�����"},
		{394, 1, 9, 90, "�����ؼ�", "��������-���ɴ��"},
	},
}

function LearnSkillByBook(index, list, nItemIndex, nPlayerIndex)

	if(GetLastFactionNumber() ~= list[index][3]) then							-- ����ָ������
		Msg2Player("������"..list[index][5].."�о����죬���Ҳ��᲻��ʲô")
		return 1
	end
	if(GetLevel() < list[index][4]) then							-- ��δ��ָ������
		Msg2Player("������"..list[index][5].."�о����죬������һ��. ")
		return 1
	end
	if(HaveMagic(list[index][1]) ~= -1) then							-- ��ѧ���ü���
		Msg2Player("������"..list[index][5].."�о����о�ȥ������Ҳûѧ��ʲô�� ")
		return 1
	end
	
	-- �жϵ�ǰ����Ʒ�Ƿ�Ϊ�����ؼ���������ɾ���������Ӽ���
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("���������ؼ�ʧ��")
		return 
	end
	
	AddMagic(list[index][1], list[index][2])										-- ѧ�Ἴ��

	WriteLog(date("%H%M%S")..": �˺�:"..GetAccount()..", ����:"..GetName()..", ʹ��: "..list[index][5].."��ѧ��: "..list[index][6]);
	Msg2Player("��ѧ������"..list[index][6].."'. ")
	return 0
end

function selectskill(list, nItemIndex, nPlayerIndex)
	local szTitle = "������ѧ���ּ���"
	local tbOpt = {}
	for index,v in list do
		tinsert(tbOpt, {v[6], LearnSkillByBook, {index, list, nItemIndex, PlayerIndex}})
	end
	tinsert(tbOpt, {"����ú�����", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function main(nItemIndex)
	Genre, DetailType, Particular=GetItemProp(nItemIndex)
	selectskill(sbook_list[Particular], nItemIndex, PlayerIndex)
	return 1
end
