--���ϱ��� ���� ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say("���᣺���ŵ��������飬������Ϊ��ϰ�����Ƕ��ž�ѧ������������Щ����װ������", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������װ��ֻ����ͬ��!")
	end
end;

function yes()
Sale(55)
end;

function no()
end;
