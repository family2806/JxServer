--description: ���������з�
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 20) then					--��������
		Msg2Player("�����з�ĵڶ������飬�ǻش�3����������������")
		Say("��֪�������黭�������������㣺��֪��������һ���������������������", 3, "��������/False4", "��ɽ��ˮ/False4", "ʮ�����/True4")
	elseif (Uworld36 == 40) then 					--�������������ǰ����
		Talk(1,"","�����㵹����һ�����ˣ�������Ҫ<color=Red>����Ʈ<color>ʦ�ÿ����㣬�����������<color=Red>��ɽ�� <color>!")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--��δ����
--		Talk(1,"","���з磺Ҫ����뱾�ɣ�������ͨ��������Ŀ��飬Ȼ���ٴ������µõ��������⣬�㶼��������")
	elseif (GetFaction() == "emei") then   				--�Ѿ����ţ���δ��ʦ
		Talk(1,"","ʦ�ã��п�����һ���д��������?")
	else							-- �����Ի�
		Talk(1,"","�������¸����١�֪���٣��Ҷ���˭��?")
	end
end;

function False4()
	Say("���ԡ�", 3, "��������/False4", "��ɽ��ˮ//False4", "ʮ�����/True4");
end;

function True4()
	Say("����ˡ��ڶ������⣺�����ĸ��������Ĵ����٣�", 3, "����/True5", "���/False5", "��β/False5");
end;

function False5()
	Say("�𲻳�������", 3, "����/True5", "���/False5", "��β/False5");
end;

function True5()
	Say("�ⶼ�Ѳ����㣿������Ҫ���������࿴�ˡ���֪������������ɢ����˭д����", 3, "����/False6", "����/True6", "��ԭ /False6");
end;

function False6()
	Say("��֪���˰ɣ��ҿ��㻹��֪�Ѷ��˰ɣ�", 3, "����/False6", "����/True6", "��ԭ/False6");
end;

function True6()
	Talk(1,"","�����㵹����һ�����ˣ�������Ҫ<color=Red>����Ʈ<color>ʦ�ÿ����㣬�����������<color=Red>��ɽ��<color>!")
	Uworld36 = SetByte(GetTask(36),1,40)
	SetTask(36,Uworld36)
	AddNote("��ӭ��ʯ�����з磬�ش���ȷ�����������������⣬���ڶ���")
	Msg2Player("��ӭ��ʯ�����з磬�ش���ȷ�����������������⣬���ڶ��أ�����ɽ�½Ӻ���Ʈ�Ŀ���. ")
end;
