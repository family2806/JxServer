--������ ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	if (GetFaction() == "shaolin") or (Uworld38 == 127) then
		Say("�����˲������ţ���Щ��ñ�����ɸ�λʦ�ֵ�����.", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������װ��ֻ����ͬ��")
	end
end;

function yes()
Sale(70)
end;

function no()
end;
