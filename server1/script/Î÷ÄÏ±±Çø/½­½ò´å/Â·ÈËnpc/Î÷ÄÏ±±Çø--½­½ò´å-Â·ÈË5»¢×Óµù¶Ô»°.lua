--���ϱ��� ����� ·��5���ӵ��Ի�
--������������񣺻��Ӱ�ʦ
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main(sel)
--	UTask_world20 = GetTask(48);
	UTask_world44 = GetTask(44)
	if (UTask_world44 == 0) then		-- ����������1�����ɽ�����)
		Say("�����Ǹ���ʦ���������б��°������Ǽһ��Ӵ�С���䣬Ҫ���ܰ���λ��ʦΪʦ�ͺ��ˡ����ǿ���ƽ���˼ң���֪��ѧ���ǲ��Ǻܻ����Ӱ������ܰ���ȥ������λ��ʦ��!?", 2, "���� /yes", "������ /no")
	elseif(UTask_world44 == 10) then
		Talk(1,"","��λ��ʦ���ڴ��Ӷ��ߵ�é����.")
	elseif(UTask_world44 == 20) then
		Talk(1,"","ʲô������Ӧ�ˣ���ѽ��������̫���ˣ��ⶥñ�������Լ����ģ���Ȼ��ֵʲôǮ���ı�л���!")
		SetTask(44, 100)
		AddRepute(5)
		AddNote("���߻��ӵ����Ǹ�ʦ��ͬ���ջ���Ϊͽ�ˣ��������")
		Msg2Player("���߻��ӵ����Ǹ�ʦ��ͬ���ջ���Ϊͽ�ˣ��������")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0) then
			AddItem(0,7,6,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("���һ�鲼��")
		else
			AddItem(0,7,8,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("���һ������")
		end
		Msg2Player("�����������5��")
	else			-- ������Ի�
		Talk(1,"","�Ҽ��ǿ���ʲô���ã�����ϲ��������ý!")
	end
end;

function yes()
	Talk(1,"","��λ��ʦ���ڴ��Ӷ��ߵ�é����.")
	SetTask(44, 10)
	AddNote("������ȥ�ﻢ����ѧ�书 ")
	Msg2Player("������ȥ�ﻢ����ѧ�书")
end;

function no()
end;
