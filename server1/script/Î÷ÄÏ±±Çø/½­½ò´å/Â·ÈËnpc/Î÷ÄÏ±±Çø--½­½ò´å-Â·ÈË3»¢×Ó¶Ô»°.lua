--���ϱ��� ����� ·��3���ӶԻ�
--������������񣺻��ӵĵ���
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main(sel)
--	UTask_world18 = GetTask(46);
	UTask_world45 = GetTask(45)
	if ((UTask_world45 == 0) and (GetLevel() >= 5)) then		-- ������������Ҫ5������
		if(GetSex() == 0)then
	Say("���ӣ����磬���������Ӧ�͸���һ�ѵ�������֪��������û�У����ܰ���ȥ������ô��", 2 , "��æ/yes", "����/no")
		else
	Say("���ӣ����㣬���������Ӧ�͸���һ�ѵ�������֪��������û�У����ܰ���ȥ������ô��", 2 , "��æ/yes", "����/no")
		end
	elseif(UTask_world45 == 10) then
		Talk(1,"","��ȥ��������ѽ������������û��ѽ?")
	elseif(UTask_world45 == 20) then
		if(HaveItem(176) == 1) then
			Talk(1,"","̫���ˣ�̫���ˣ�һ����Ҿ�ȥ�������ȥ�����������������ڴ����ҵ��ģ�������ûʲô�þ��͸����!")
			DelItem(176)
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			AddItem(0,0,random(0,5),2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)		-- һ�������������
			SetTask(45, 100)
			AddRepute(8)
			AddNote("������񣬴�������ȥ������")
			Msg2Player("��������ȥ������")
			Msg2Player("���һ���� ")
			Msg2Player("�����������8��")
		else
			Talk(1,"","�ȴ�����������˵�������Ҫȥ������񣬲����ɲ�Ҫ���������һ����������ȥ��!")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","��ô������ѩѽ������ѩ�ҾͿ��Զ�ѩ�ˡ���ѩ�̣����������!")
		else
			Talk(1,"","������֪�����������Ӧ���ҵĵ��������û�У������������ĺܺð���������������Զ��������������������ر����!")
		end
	end
end;

function yes()
	Talk(1,"","������������Ӿ��ڴ�ڣ��������ҵ���!")
	SetTask(45, 10)
	AddNote("�����񣬰ﻢ��ȥ���������õ�����û��")
	Msg2Player("�����񣬰ﻢ��ȥ���������õ�����û��")
end;

function no()
	Talk(1,"","��ȥ������������!")
end;
