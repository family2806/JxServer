--ؤ�� ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("�������е�ҩƷ����ؤ���ֵ�����", 2, "����/yes", "������/no")
	else
		Talk(1,"","��������������е�ҩƷ������������")
	end
end;

function yes()
	Sale(74)
end;

function no()
end;
