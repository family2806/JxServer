--description: ���ִ�_��ԥ
--author: wangzg	
--date: 2003/7/21
--update 2003/7/25 yuanlan
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ
-- Update: Dan_Deng(2003-09-20) Ϊ��VSS��δ���£���д�޸���������

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world69=GetTask(69)
	if ((UTask_world69 == 0) and (GetLevel() >= 5)) then
		Talk(3, "select", "�����´������ղ��ڣ�Ϊ����������","��λ��磬������������?","����ֻ��ϧ���������������κα�ʾ��Ϊʲô���������������ô���ҵ���?")
	elseif (UTask_world69 == 4) then
		Talk(4,"W69_step2","�����һ������㣺�´������ղ��ڣ����ʫ�����������ֽ�ʲô?","��ʵ�����벻����!","��ô����ô�򵥵�����Ҳ����?","�治����˼������԰�����?")
	elseif (UTask_world69 == 8) then
		Talk(2, "prise", "��������Ѿ������������������㵽�������ͣ���ϲ��ϲ!","�����ָ���ҵ�һ�����⣬�������£�")
	elseif (UTask_world69 == 2) then
		Talk(1,"","���д��㣬ס�����ӵĶ��ߡ���Ѻɻ������ҵ�����鷳����ҽ�����.")
	elseif (UTask_world41==10) then
		Talk(1,"","������������ͻݣ���Ȣ������ʲô���Ȳ��ϵ�!")
	else
		Talk(1,"","�¼�˭��ô����!")
	end
end

function select()
	Say("���ܰ�������ת��������?", 2, "�ҿ��԰������˵. /yes", "���æ�Ұﲻ��. /no")
end;

function yes()
	Talk(1,"","���д��㣬ס�����ӵĶ��ߡ���Ѻɻ������ҵ�����鷳����ҽ�����.")
	AddEventItem(190)
	Msg2Player("�����񣺰���ԥ������������㣬����ԥ������ɻ��ȸ�����. ")
	SetTask(69,2)
	AddNote("�����񣺰���ԥ������������㣬����ԥ������ɻ��ȸ�����. ")
end

function no()
end

function W69_step2()
	Talk(1,"","����!")
	SetTask(69,6)
	AddNote("��ԥ�ش𲻳����⣬������ش�. ")
	Msg2Player("��ԥ�ش𲻳����⣬������ش�. ")
end

function prise()
	SetTask(69,10)
	AddRepute(7)		-- ������7��
	AddNote("�Ѵ���Ļش������ԥ���������. ")
	Msg2Player("�Ѵ���Ļش������ԥ���������. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if (random(0,3) == 0) then
		AddItem(0, 3, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("�õ������ָ")
	else
		AddItem(0, 3, 0, 2, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("�õ�ʯ��ָ")
	end
	Msg2Player("��Ľ�����������7���� ")
end
