--������ tianwang�� ��ͷ���ڶԻ�

function main(sel)
	UTask_tw = GetTask(3);
	if (UTask_tw >= 60*256+20) and (GetFaction() == "tianwang") then
	Say("tianwang���ڣ�Ҫ����ȥ���", 3, "Ba L�ng huy�n/yes", "Thanh Loa ��o/yes1", "Kh�ng r�i ��o /no")
	else
	Say("tianwang���ڣ�Ҫ����ȥ���", 2, "Ba L�ng huy�n/yes", "Kh�ng r�i ��o /no")
	end
end;

function yes()
	if (GetFaction() == "tianwang") then						--��������tianwang����ӣ���������Ǯ
		Say("tianwang���ڣ��ֵܣ������ˣ�", 2, "���c r�i! /ok1","Kh�ng r�i ��o /no")
	else
	Say("tianwang���ڣ����Ǳ����ֵܣ������ɲ�����ѵġ�", 1, "���c. /ok2")
	end
end;

function yes1()
if (GetFaction() == "tianwang��") then						--��������tianwang����ӣ���������Ǯ
	Say("tianwang���ڣ����ݵ��ɲ��ô�����׼��������", 1, "Chu�n b� xong r�i /ok3")
else	
	Say("tianwang���ڣ����Ǳ����ֵܣ������ɲ�����ѵġ�", 1, "�ð�/ok4")
end;
end;

function no()
end;

function ok1()
NewWorld(53, 1793, 3159)						--�ذ�����
SetFightState(1)							--ת��Ϊս��״̬
end;

function ok2()
if (GetCash() >= 100) then						--�ο�ֵ
	Pay(100)
	NewWorld(53, 1793, 3159)					--�ذ�����
	SetFightState(1)						--ת��Ϊս��״̬
else
	Say("tianwang���ڣ�ûǮ�������ҹ䣿���ǳ��������İɣ�", 0)		
end;
end;

function ok3()
NewWorld(68, 1634, 3242)						--ȥ���ݵ�
SetFightState(1)							--ת��Ϊս��״̬
end;

function ok4()
if (GetCash() >= 500) then						--�ο�ֵ
	Pay(500)
	NewWorld(68, 1634, 3242)					--ȥ���ݵ�
	SetFightState(1)						--ת��Ϊս��״̬
else
	Say("tianwang���ڣ�ûǮ�������ҹ䣿", 0)		
end;
end;
