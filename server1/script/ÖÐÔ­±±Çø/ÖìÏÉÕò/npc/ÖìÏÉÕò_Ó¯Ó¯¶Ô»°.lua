--description: ���ִ�_ӯӯ
--author: wangzg	
--date: 2003/7/22
--72	UTask_world44
--update 2003/7/28 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- Update: Dan_Deng(2003-09-09) �޸�װ���������ɷ�ʽ

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world44=GetTask(72)
	if ((UTask_world44==0) and (GetLevel() >= 2)) then		-- ������������Ҫ2������
		Talk(3, "select", "�����������������᳤�Ʋ�����¥��ߣ��������޶���չת���ߣ�������䡣����̶ϣ���˭���������?", "?..��λ���������ʲô���飬Ϊ������˸� ", "����һ���Ѿ�......��ɷ����һ��æ?")
	elseif (UTask_world44==2)  then
		Talk(1,"","�Ұ�����˿�������������Ŵ�Ԫ���������������������ϵط���������ɢ")
	elseif (UTask_world44==4) then		-- �������
		Talk(7,"prise","�Ŵ�Ԫ˵������ʶ��.","ʲô .....�o���Ƕ�����������ˮ���գ�������ǰ��̸������ʱ�����ġ����ڰá����º�ʱ����?","......����㻹����ʫ��!","�i, �������˰��ˣ���ݻ��仹�����Լ����Ű�.", "����ģ����ϵĺ����˶�����.", "��л��ĺ��ģ���˫Ь�͸����ı����⣬��......��į��룬�᳦һ���ǧ��.", "......")
	else
		Talk(1,"","�˼ҷ���˫˫������ôһ������ô��?")
	end
end;

function select()
	Say("���Ұ�����˿�������������Ŵ�Ԫ���������������������ϵط���������ɢ", 2, "�ã��Ұ��� /yes", "����������/no")
end

function yes()
	AddEventItem(192)
	SetTask(72,2)
	AddNote("�����񣺰�ӯӯ�����˿�����������Ŵ�Ԫ. ")
	Msg2Player("�����񣺰�ӯӯ�����˿�����������Ŵ�Ԫ. ")
	Msg2Player("���һ��˿��. ")
end

function no()
end

function prise()
	DelItem(192)
	SetTask(72,10)
	AddRepute(5)
	AddNote("����ӯӯ�Ŵ�Ԫ��̬�ȣ�Ȱ����Ҫ̫���ģ��������")
	Msg2Player("����ӯӯ�Ŵ�Ԫ��̬�ȣ�Ȱ����Ҫ̫���ģ��������")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if (GetSex()== 0) then
		AddItem(0,5,0,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("���һ˫��Ь ")
	else
		AddItem(0,5,2,1,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("���һ˫�廨Ь")
	end
	Msg2Player("�����������5��")
end;
