--description: ���ִ�_³ү
--author: wangzg	
--date: 2003/7/21
---70	UTask_world42
--update 2003/7/24 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world42=GetTask(70)
	if (UTask_world42==0) then
		Say("��������û�к��鿴�������ģ����ϵ��ϸ����һ�����飬����������������ȥ��", 2, "��ȥ�����/yes", "�뿴���Ҫȥ��. /no")
	elseif (UTask_world42==2) then
		Talk(1,"","�����Ļ�����лл���ˣ�����ͷ�����ϵ��ϱ�.")
	elseif (UTask_world42==4) then
		Talk(2, "step2", "����˵�����ļ�־������¼.","����Ϻ��꣬��Ϊ���ң��ðɣ��鷳���ȥ����")
	elseif ((UTask_world42 == 6) and (HaveItem(189) == 0)) then		-- �鶪��
		Talk(1,"","С�ӣ���������Ϊʲô��������ܣ�")
		AddEventItem(189)
		Msg2Player("�õ��ļ�־")
	elseif ((UTask_world42==8) and  (HaveItem(188) == 1)) then
		Talk(3, "WTask70_prise", "³���壬������Ҫ����.", "̫����","����ţƤ���������ò��ţ��͸���ɡ�")
	else
		Talk(1,"","�����ˣ���������Ҫ����飬��Ҫ����ĥ��ĥ����")
	end
end;

function yes()
	Talk(1,"","�����Ļ�����лл���ˣ�����ͷ�����ϵ��ϱ�.")
	SetTask(70,2)
	AddNote("���������³��ͷ�������Ҹ���ͷ����. ")
	Msg2Player("���������³��ͷ�������Ҹ���ͷ����. ")
end

function no()
end

function step2()
	AddEventItem(189)
	Msg2Player("�õ��ļ�־")
	SetTask(70,6)
	AddNote("��³�ϴ��õ��ļ�־")
end

function WTask70_prise()
	DelItem(188)
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	AddItem(0,6,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
	SetTask(70,10)
	AddRepute(5)		-- ������5��
	AddNote("�ѻ���¼��³ү��������񣬵õ�һ��ţƤ�����u. ")
	Msg2Player("�õ�һ��ţƤ�����u. ")
	Msg2Player("�����������5��")
end
