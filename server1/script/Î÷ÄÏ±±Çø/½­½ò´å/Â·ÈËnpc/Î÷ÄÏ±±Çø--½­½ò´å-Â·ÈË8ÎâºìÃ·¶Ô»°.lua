--���ϱ��� ����� ·��8���÷�Ի�
--����������������ϵ���ҩ
--suyu
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world21 = GetTask(49);
	if (UTask_world21 == 3) then
		Talk(1,"","лл����ҵ�ץҩ�������Ҹ�����Ь����Ҫ�ǲ����������Ű�!")
		SetTask(49, 10)
		AddRepute(6)
		AddNote("��ɰ�����ץҩ����")
		Msg2Player("��ɰ�����ץҩ����")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		if(GetSex() == 0)then
			AddItem(0,5,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("���һ�Բ�Ь")
		else
			AddItem(0,5,2,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("���һ���廨Ь")
		end
		Msg2Player("�����������6��")
	else
		Talk(1,"","���÷���������������⣬��������ĺ���û�������������Ǻã�")
	end
end;
