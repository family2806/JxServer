--������ tianwang ��ͷ���ڶԻ�

function main(sel)
	UTask_tw = GetTask(3);
	if (UTask_tw >= 60*256+20) and (GetFaction() == "tianwang") then
	Say("Mu�n r�i ��o �i ��u?", 3, "Ba L�ng huy�n/yes", "Thanh Loa ��o/yes1", "Kh�ng r�i ��o /no")
	else
	Say("Mu�n r�i ��o �i ��u?", 2, "Ba L�ng huy�n/yes", "Kh�ng r�i ��o /no")
	end
end;

function yes()
	if (GetFaction() == "tianwang") then						--��������tianwang���ӣ���������Ǯ
		Say("Huynh ��! Ng�i ch�c nh�!", 2, "���c r�i! /ok1","Kh�ng r�i ��o /no")
	else
	Say("�������ڣ����Ǳ����ֵܣ������ɲ�����ѵġ�", 1, "���c. /ok2")
	end
end;

function yes1()
if (GetFaction() == "tianwang") then						--��������tianwang���ӣ���������Ǯ
	Say("Thanh La ��o kh�ng ph�i l� n�i d� v�o! Ng��i chu�n b� s�n s�ng ch�a?", 1, "Chu�n b� xong r�i /ok3")
else	
	Say("�������ڣ����Ǳ����ֵܣ������ɲ�����ѵġ�", 1, "�ð�/ok4")
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
	Say("Kh�ng ti�n m� ��i �i lung tung! Ng��i m�i ra giang h� �?", 0)		
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
	Say("Kh�ng ti�n m� ��i �i lung tung!", 0)		
end;
end;
