--������ ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) then
		Say("�뿴�����÷��·��������򲻵���.", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������װ��ֻ����ͬ��.")
	end
end;

function yes()
Sale(67)
end;

function no()
end;
