--���ϱ��� ���� �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say("��ȱ����Щ���ж��Ǳ��Ű������ͻ���������ģ��ڱ𴦿ɲ��������", 2, "����/yes", "������/no")
	else
		Talk(1,"","����������ű���������������!")
	end
end;

function yes()
Sale(54)
end;

function no()
end;
