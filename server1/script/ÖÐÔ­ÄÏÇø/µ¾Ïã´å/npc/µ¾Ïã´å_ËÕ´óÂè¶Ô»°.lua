--description: ���ִ�_�մ���
--author: wangzg	
--date: 2003/7/22
--71	UTask_world43
--update 2003/7/28 yuanlan
--Update: Dan_Deng(2003-08-07)

function main()
	UTask_world43=GetTask(71)
	if ((UTask_world43==0) and (GetLevel() >= 3)) then		-- ����ȼ�����
		Talk(2, "select", "�ҵ�Ƥ�Ķ��ӣ�������ô������ʲô��?")
	elseif (UTask_world43==2) then
		Talk(2, "", "��Ȱ�յ�Ŭ��ѧϰ���㲻�õ���.", "�ܺã��Ҳ�����ô��л�㣬���ǽ�ҩ���������!")
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		SetTask(71,4)
		AddNote("���մ���˵����˵���˼��е����У��������. ")
		Msg2Player("���մ���˵����˵���˼��е����У��������. ")
		Msg2Player("��������ҩ. ")
		AddRepute(6)
		Msg2Player("��Ľ�����������3��. ")
	elseif (UTask_world43==3) then
		Talk(2, "", "���裬��֪��������־�������뵽ս��ɱ�У��ж�־���ķ������������Լ�������ȥ����.", "�i, ���Ӵ��ˣ��������ˡ�����־����Ҳ������ֹ��лл�㣬�����ҩ����ȥ��!")
		Msg2Player("��3����ҩ. ")
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		AddItem(1,0,0,1,0,0,0)
		SetTask(71,5)
		AddNote("�����մ���������е�ѡ��, �������")
		Msg2Player("�����մ���������е�ѡ��, �������")
		Msg2Player("��3����ҩ. ")
		AddRepute(4)
		Msg2Player("��Ľ�����������4��. ")
	else	
		Say("��Щ�꣬����ĸ���������࣬�뵽ս�����๫���Ҿ���ޣ�ϣ���Ҷ���ƽ������", 0)	
	end
end;

function select()
Say("�������ͺ�ѧ���������Ӿ�ɱ�У��治������ʲô?", 2, "�Ұ���ȥ����/yes", "����Ҳ���/no")
end

function yes()
SetTask(71,1)
AddNote("�����񣺰��մ����˽���ӵ��뷨. ")
Msg2Player("�����񣺰��մ����˽���ӵ��뷨. ")
end 

function no()
end
