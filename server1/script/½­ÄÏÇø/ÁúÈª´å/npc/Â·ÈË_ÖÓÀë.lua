--��Ȫ�� ·�� ����
--��Ȫ����������������ѩ��
-- By: Dan_Deng(2003-09-03)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world20 = GetTask(20)
	if (UTask_world20 == 0) and (GetLevel() >= 5) then 		--��������
		Talk(2,"W20_get","���»�û���Ҳ�������ʳ��. ������һ����������ѩ����һֱ������","��ô������?")
	elseif (UTask_world20 == 5) then
		if (HaveItem(231) == 1) and (HaveItem(232) == 1) then		-- �������
			SetTask(20,10)
			DelItem(231)
			DelItem(232)
			Talk(1,"","������֥! ��ѩ�ٺ�. ���! ��֪����ô��л��. ����һ�����⣬������")
			AddNote("��������֥�Ͱ�ѩ�ٺϽ������룬�������")
			Msg2Player("��������֥�Ͱ�ѩ�ٺϽ������룬�������")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
			if(GetSex() == 0) then
				AddItem(0, 9, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("�õ�һ������")
			else
				AddItem(0, 9, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("�õ�һ����ɫ�����")
			end
			AddRepute(8)
			Msg2Player("�����������8��")
		else
			Talk(1,"","ʲô�������������㶼�һ����˰�?")
		end
	elseif (UTask_world20 == 10) then		-- �����Ѿ����
		Talk(1,"","���л��")
	else
		Talk(1,"","�߱����£��Ա����¡��ұ�����Ѫ���ǳԾ�������ʳ")
	end
end;

function W20_get()
	Say("�����Ҫ��������֥�Ͱ�ѩ�ٺ�,��˵ֻ����Ȫ�����������. �����˺ܾö���û���ҵ�",2,"������/W20_get_yes","û����/W20_get_no")
end

function W20_get_yes()
	SetTask(20,5)
	Talk(1,"","����������!")
	AddNote("���������������������֥�Ͱ�ѩ�ٺ�")
	Msg2Player("���������������������֥�Ͱ�ѩ�ٺ�")
end

function W20_get_no()
end
