--description: ��������ʹ�Űء�����30������
--author: yuanlan	
--date: 2003/4/25
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if ((UTask_tw == 30*256) and (GetLevel() >= 30) and (GetFaction() == "tianwang")) then
			Say("˵�������ǵ�ù����ǰЩ����ȥ��һ��<color=Red>���Ӷ�<color>,�����С�İ�<color=Red>������<color>. ��Ū���ˣ��������Ǳ����������䵽�����ϲ�������ϣ������������!..", 2, "����Ѱ��������/L30_get_yes", "��������!/L30_get_no")
		elseif (UTask_tw == 30*256+20) and (HaveItem(145) == 1 ) then
			L30_prise()
		elseif (UTask_tw > 30*256) and (UTask_tw < 40*256) then					--�Ѿ��ӵ�30��������δ���
			Talk(1,"","<color=Red>������<color>����<color=Red>�������Ӷ�<color>��ʧ�ģ�������ܰ����һ������ұ��������ƶ�ͷ��.")
		elseif (UTask_tw >= 40*256) then					--�Ѿ����30��������δ��ʦ
			Talk(1,"","���ֵܣ��������һ����æ!")
		else
			Talk(1,"","���Ǳ���������Ϸ��γ���������ս��������")
		end
	elseif (UTask_tw >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","��ʦ֮��Ҫ���ǳ���ʦ�ſ����ֵ���")
	else
		Talk(1,"","�𿴰����Ǹ�Ů��֮�������������������ʩ���ͷ�������������ж�ͦ��η����.")
	end
end;

function L30_get_yes()
	Talk(1,"","<color=Red>������<color>����<color=Red>�������Ӷ�<color>��ʧ�ģ�������ܰ����һ������ұ��������ƶ�ͷ��.")
	SetTask(3, 30*256+20)
	AddNote("��������Ž�<color=red>����������<color>, �����Ӷ���������")
	Msg2Player("��������Ž�����������, �����Ӷ���������")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","��ʵ�������ڴ��̶���ǿ��Ū���ˣ����˵��������һ����ˣ���Ȼ�Ļ��ᱻ������ֵģ������ǰ�����һ����æ����ʹ˵���㻰��һ���������ƶ�����.")
	DelItem(145)
	SetRank(46)
	SetTask(3, 40*256)
--	AddMagic(37)
--	AddMagic(35)
--	AddMagic(31)
	add_tw(40)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("����������Űأ�������������񡣱���Ϊ���ƶ����졣ѧ��˷�ն���������������ƾ�. ")
	AddNote("��������������������Űأ�������񣬱���Ϊ���ƶ�����")
end;
