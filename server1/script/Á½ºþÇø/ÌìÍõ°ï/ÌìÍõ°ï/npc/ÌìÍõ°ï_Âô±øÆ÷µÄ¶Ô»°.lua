--������ ������ �������İ��ڶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld38 = GetByte(GetTask(38),1)
	if (GetFaction() == "tianwang") or (Uworld38 == 127) then
		Say("�������ڣ����������������ֵ��Ǵ���ı����ɣ�", 2, "����/yes", "������/no")
	else
		Talk(1,"","��������������ֻ����ͬ���ֵ�")
	end
end;

function yes()
Sale(57);  			
end;

function no()
end;






