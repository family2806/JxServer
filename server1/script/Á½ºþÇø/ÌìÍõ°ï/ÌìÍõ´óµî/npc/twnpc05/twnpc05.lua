--description: �������커��·��Զ ������40������
--author: yuanlan	
--date: 2003/4/26
--Dan_Deng(2003-07-22), ������������ĵȼ�Ҫ��
--Dan_Deng(2003-07-25), �����ط���������
-- Update: Dan_Deng(2003-08-16)
-- Update: Dan_Deng(2003-09-21)��������ط����������ɾ�ѧ��أ�ȡ����˽ű���ز��ݣ�

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_tw = GetTask(3)
	if (GetSeries() == 0) and (GetFaction() == "tianwang") then
		if (UTask_tw == 40*256) and (GetLevel() >= 40) then
			Talk(2, "L40_get", "·�ϻ������������˼ҳ��Ʋ�չ����ʲôΪ�ѵ�����?", "�����µ�������ʲ��ں��߲�С�ı�һ�־綾�ޱȵĳ�����ҧ�ˣ�����Σ�ڵ�Ϧ�����Ѿ�������Ϊ�����������Ƕ������ģ����ܾ�������˵ֻ��<color=Red>������<color>��<color=Red>����ҽ<color>�ܹ�ҽ��....")
		elseif (UTask_tw == 40*256+50) and (HaveItem(93) == 1) and (HaveItem(94) == 1) then
			L40_prise()
		elseif (UTask_tw > 40*256+20) and (UTask_tw < 50*256) then					--�Ѿ��ӵ�40��������δ���
			Talk(1,"","�󵽽�ҩ����?")
		elseif (UTask_tw >= 50*256) then					--�Ѿ����40��������δ��ʦ
			Talk(1,"","���⺢�Ӳ����书�����ĵ�Ҳ���õģ���ͷ���Һ�ϲ��!")
		else										--��δ��40������
			Talk(1,"","�ֽ��ǳ���������ǰ�ˣ�������Щ��ͷ�Ӷ���������!")
		end
	elseif (UTask_tw >= 70*256) then							--�Ѿ���ʦ
		Talk(1,"","ʱ����Ӣ�ۣ��������Ⱥ�۲����˲żüã��������Ϊ֮�������ɾ�һ�����춯�ص���Ϊ")
	else
		Talk(1,"","�����Ͽ��γ����������������һ��Ů�˴����Ƿ�չ����ô������ǲ�����!")
	end
end;

function L40_get()
	Say("����Ե���������<color=Red>����ҽ<color>���ҩ��?", 2, "����Ը��/L40_get_yes", "�����б������/L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","�ã����ȥ���")
	SetTask(3, 40*256+20)
	SetTask(14,0)
	AddNote("������������·��Զ����<color=red>�ҽ�ҩ����<color>, ��������������ҽ��ҩ. ")
	Msg2Player("������������·��Զ�����ҽ�ҩ����, ��������������ҽ��ҩ. ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","̫���ˣ�����ЩҪ��վ��о��ˡ�����֪��Ҫ��ô��л��!")
	DelItem(93)
	DelItem(94)
	SetRank(47)
	SetTask(3, 50*256)
--	AddMagic(40)
	add_tw(50)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("����ζҩ����·��Զ��������񣬱���Ϊˮ��ͳ�죬ѧ���һ���")
	AddNote("����ζҩ����·��Զ��������񣬱���Ϊˮ��ͳ��")
end;
