--description: ���ִ�_С��
--author: wangzg	
--date: 2003/7/22
--update 2003/7/28 yuanlan
--Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world45=GetTask(73)
	if (UTask_world45 == 1) then
		Talk(4, "Fpay", "����С�����ҽ�������������ȥ��!", "�һ�����أ�������10�����������ǣ������Ұ�ǮŪ���ˣ��������ҵ�","�����˺ܾã�û���ҵ�������...","���õ��ģ��Ҹ���10��!")
	else
		Talk(1,"","�����Һܺã�����������!")
	end
end

function Fpay()
	if (GetCash() < 10) then
		Talk(1,"","��ûǮ�����ܰ�����!")
	else
		Pay(10)
		Talk(1,"","лл�㣬�������������ò��ţ������!")
		SetTask(73,10)
		AddNote("�ҵ�С��������Ǯ��˵�����ؼң��������. ")
		Msg2Player("�ҵ�С��������Ǯ��˵�����ؼң��������. ")
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
		AddItem(0,6,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("���һ��Ƥ����. ")
		AddRepute(5)
		Msg2Player("�����������5�� ")
	end				
end

function no()
end
