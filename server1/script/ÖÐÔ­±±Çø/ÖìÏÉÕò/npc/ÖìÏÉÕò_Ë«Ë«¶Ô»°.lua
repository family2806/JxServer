--��ԭ���� ������ ·��˫˫�ĶԻ�
--��������������: ���ֻ�
--by Dan_Deng(2003-07-21)
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world40 = GetTask(68)
	if ((UTask_world40 == 0) and (GetLevel() >= 6)) then		--��������
		Say("�Ұ������ҵ��ֻ�Ū���ˣ���ô���Ҳ������ǿ�������ϲ�����ֻ�.", 2, "�Ұ�����/yes", "�����鷳/no")
	elseif ((UTask_world40 == 3) and (HaveItem(191) == 1)) then		-- �������
		DelItem(191)
		Talk(2,"finish_select","��������ֻ�ô?","�ǵģ�̫лл���ˣ��������ҵ�һ�������")
	elseif (UTask_world40 <= 3) then		-- �����е���ͨ�Ի�
		Talk(1,"","ϣ�������һ��ҵ��ֻ�. ")
	else
		i = random(0,2)
		if (i==0) then
			Talk(1,"","�������������ҵģ��Һ�ϲ��")
		elseif (i==1) then
			Talk(1,"","ȥ������ò������ˣ�ֻ��������ֻ�.")
		else
			Talk(1,"","СŮ�Ӻ����ﰡ ")
		end
	end
end;

function yes()
	SetTask(68,1)
	Msg2Player("�����񣺰���˫˫�ҵ��ֻ�. ")
	AddNote("�����񣺰���˫˫�ҵ��ֻ�. ")
end;

function no()
	Talk(1,"","�����ֻ�������������?")
end;

function finish_select()
	Say("����200����������.", 2, "����. /finish_a","�ܾ� /finish_b")
end;

function finish_a()
	Talk(1,"","��л ")
	Earn(200)
	SetTask(68,4)
	AddRepute(7)
	Msg2Player("������񣺰���˫˫�ҵ��ֻ������200������. ")
	AddNote("������񣺰���˫˫�ҵ��ֻ������200������. ")
	Msg2Player("��Ľ�����������7��")
end;

function finish_b()
	Talk(2,"","���ڽ��������������Ӧ�õģ��㲻Ҫ̫����","������һλ����֮ʿ��СŮ����һ��ţƤ�������͸������� .")
	SetTask(68,5)
	AddRepute(9)
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
	AddItem(0,6,0,2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
	Msg2Player("������񣺰���˫˫�ҵ��ֻ������һ��ţƤ����. ")
	AddNote("������񣺰���˫˫�ҵ��ֻ������һ��ţƤ����. ")
	Msg2Player("�����������9�� ")
end;
