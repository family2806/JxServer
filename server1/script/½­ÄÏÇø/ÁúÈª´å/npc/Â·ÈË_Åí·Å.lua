--��Ȫ�� ·�� ���
--��Ȫ�����������޵�
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world19 = GetTask(19)
	if (UTask_world19 == 0) and (GetLevel() >= 2) then 		--�޵���������
		if (GetSex() == 0) then
			W19_rank = "����"
		else
			W19_rank = "����"
		end
		Talk(2,"W19_get","���:"..W19_rank.."���԰���������?","��ʲô��? ")
	elseif (UTask_world19 == 2) and (HaveItem(229) == 0) then
		AddEventItem(229)
		Talk(1,"", 10903)
	elseif (UTask_world19 == 8) and HaveItem(230) then		-- �������
		Talk(1,"", 10904)
		DelItem(230)
		SetTask(19,10)
		AddNote("���޺õı��������, �������")
		Msg2Player("���޺õı��������, �������")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0) then
			AddItem(0, 8, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("�õ���Ƥ����")
		else
			AddItem(0, 8, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("�õ���Ƥ����")
		end
		AddRepute(6)
		Msg2Player("�������������6��")
	else
		Talk(1,"", 10905)
	end
end;

function W19_get()
	Say(10906 ,2,"������! /W19_get_yes","��Ҫ��ԥ/W19_get_no")
end

function W19_get_yes()
	SetTask(19,2)
	AddEventItem(229)
	Talk(1,"", 10907)
	AddNote("�������񣺰�����Ŵ���ȥ��")
	Msg2Player("�������񣺰�����Ŵ���ȥ��")
end

function W19_get_no()
end
