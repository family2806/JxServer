--������ ·�� ��ջ�ϰ��� �������񣺽��ܹ���
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world25 = GetTask(25)
	UTask_world27 = GetTask(27)
	if (UTask_world25 == 3) then		-- ���񡰽��ܹ�����������
		Talk(5,"W25_step","�ϰ壬Ҫ���ְ�æ��?","��æ�����ڻ���һ����ɨ��С��","��������������?","Ҫ����!","����ԭ���⣬��ڷ��Բ����װ�")
	elseif (UTask_world27 == 0) and (GetLevel() >= 5) then
		Say("ȥ��������3��Ұ�������!",2,"֪����/W27_get_yes","�����ˣ��ұ���ȥ! /W27_get_no")
	elseif (UTask_world27 == 5) then
		i = GetItemCount(228)
		if (i >= 3) then
			for j = 1,i do DelItem(228) end
			Talk(1,"","Ŷ�������ܿ�������ⶥñ����Ҳ�ò������͸�����!")
			SetTask(27,10)
			AddRepute(9)
			AddNote("��Ұ�����ȥ�����ϰ壬�������")
			Msg2Player("��Ұ�����ȥ�����ϰ壬�������")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			if(GetSex() == 0) then
				AddItem(0, 7, 6, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("�õ�һ���־�")
			else
				AddItem(0, 7, 10, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("��õ�һ��Բ����")
			end
			Msg2Player("�����������9��")
		else
			Talk(1,"","����վ�����������������������!")
		end
	elseif (UTask_world25 == 6) then
		Talk(1,"","������˵�Ǹ��˽�ʲô�Ϲ���������������ﻹȷ��!")
	else				-- ������Ի�
		Talk(1,"","���ۣ��͹ٲ�ס�갡����Բ���ﻹû���ļҿ��Աȵ��������������أ����������ȥ����!")
	end
end;

function W25_step()
	Talk(1,"","���ˣ��Ͽ�ȥ��ҽ����������!")
	SetTask(25,6)
	AddNote("�ϰ��Ӧ���Ϲ�������æ�ˣ�����������Ϣ��������! ")
	Msg2Player("�ϰ��Ӧ���Ϲ�������æ�ˣ�����������Ϣ��������! ")
end

function W27_get_yes()
	SetTask(27,5)
	AddNote("�����񣡵��������õ�3��Ұ������������ϰ� ")
	Msg2Player("�����񣡵��������õ�3��Ұ������������ϰ� ")
end

function W27_get_no()
end
