--description: ������ǰ�� ����������10������
--author: yuanlan	
--date: 2003/4/24
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3);
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 10*256) and (GetLevel() >= 10) then
			Say("�����¼��뱾����ֵܰɣ�Ҫ��Ϊ�����������������ȥ<color=Red>������ɽ��<color> �õ�<color=Red>������Ѫʯ<color>. ���е������������ս��?", 2, "��Ȼ��. /L10_get_yes", "�������ٶ�ĥ��һ��ʱ��/L10_get_no")
		elseif (UTask_tw == 10*256+20) and (GetItemCount(91) >= 3 ) then				--��Ѫʯ��Ŀ����Ϊ3
			L10_prise()
		elseif (UTask_tw > 10*256) and (UTask_tw < 10*256+50) then					--�Ѿ��ӵ�10��������δ���
			Talk(1,"","�� <color=Red>����ɽ��<color> �õ�<color=Red>������Ѫʯ<color> ֮����������!")
		else					--�Ѿ����10��������δ��ʦ��ȱʡ�Ի���
			Talk(1,"","�����ֵܶ����д󱧸��ģ��Ϸ���޵ľ��Ǽ�������֮��")
		end
	elseif (UTask_tw >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","���Ӻ����ɷ����߽���Ҫ�������أ���Ҫ������ʲôΥ������������Ϸ�һ�����Ź���")
	else
		Talk(1,"","�Ϸ��Ӱ���Ϊ�Լ�������Ů����������ʲô���Ϸ򶼻ᾡ��������")
	end
end;

function L10_get_yes()
	Talk(1,"","�ܺã���������Ӻ�����<color=Red>������ɽ��<color> �õ�<color=Red>3�ż�Ѫʯ<color>֮���ٻ�������!")
	SetTask(3, 10*256+20)
	AddNote("��������ǰ��(201, 198) ������������ <color=red>��Ѫʯ����<color>, �����ϵ�ɽ����3�ż�Ѫʯ ")
	Msg2Player("��������ǰ�������������ܼ�Ѫʯ���񵽵��ϵ�ɽ����3�ż�Ѫʯ . ")
end;

function L10_get_no()
end;

function L10_prise()
	Talk(1,"","���úã��Ϸ����Ϊ��������֮���кܶ࿼������㣬��Ҫ����Ŭ��")
	for i = 1, (GetItemCount(91)) do DelItem(91) end
	SetTask(3, 20*256)
	SetRank(44)
	add_tw(20)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
--	AddMagic(26)
--	AddMagic(23)
--	AddMagic(24)
	Msg2Player("��ϲ�㱻��Ϊ��������ѧ����������������ǹ������������. ")
	AddNote("�ص�ǰ���3�ż�Ѫʯ������������ɼ�Ѫʯ���񣬱���Ϊ������")
end;
