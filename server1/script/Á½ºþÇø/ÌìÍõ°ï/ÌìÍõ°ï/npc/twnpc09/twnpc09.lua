--description: ������ػ����ĳϡ�����50������
--author: yuanlan	
--date: 2003/4/28
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
-- Update: Dan_Deng(2003-08-16)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 50*256) and (GetLevel() >= 50) then
			Say("���ˮկ��ʢ����ͥ������<color=Red>ˮ��<color>�������˸���������񣬸�����Ļ̻̣���Ը��ȥ����һ���������", 2, "Ը��/L50_get_yes", "������������/L50_get_no")
		elseif (UTask_tw == 50*256+20) and (HaveItem(95) == 1) then
			L50_prise()
		elseif (UTask_tw > 50*256) and (UTask_tw < 60*256) then					--�Ѿ��ӵ�50��������δ���
			Talk(1,"","�кü����˿���<color=Red>ˮ��<color>����<color=Red>����<color>�ĺ����û����������ͷ�����и�<color=Red>ͨ����ͥ���׵�ɽ��<color>���һ��ɶ����йŹ�!")
		else					--�Ѿ����50��������δ��ʦ��ȱʡ�Ի���
			Talk(1,"","������¾��Ʒ��ң���Ը���ӱ���")
		end
	elseif (UTask_tw >= 70*256) then							--�Ѿ���ʦ
		Talk("һ��Ϊ�ֵܣ����������㣬��Ҫ�ౣ��")
	else
		Talk(1,"","���������ϳ����������â����֪�����Ǽ�")
	end
end;

function L50_get_yes()
	Talk(1,"","�кü����˿���<color=Red>ˮ��<color>����<color=Red>����<color>�ĺ����û����������ͷ�����и�<color=Red>ͨ����ͥ���׵�ɽ��<color>���һ��ɶ����йŹ�!")
	SetTask(3, 50*256+20)
	AddNote("������̨���߼��ĳϣ���<color=Red>ˮ������<color>, ����ͥ������ȥ������ʵ��. ")
	Msg2Player("������̨���߼��ĳϣ���ˮ�����񣬵���ͥ������ȥ������ʵ��")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(1,"","������ʯ�������԰������ģ�������Ϊ������������������ӱ��ﰡ!")
	DelItem(95)
	SetTask(3, 60*256)
	SetRank(48)
--	AddMagic(42)
	add_tw(60)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("���ˮ�����񣬳�Ϊ���̽�����ѧ���书������. ")
	AddNote("�ص�����������ʯ�����ĳ�������񣬳�Ϊ���̽���. ")
end;
