--ؤ�� �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("����򹷰��������£����еı��������ﶼ��", 2, "����/yes", "������/no")
	else
		Talk(1,"","����������ű���������������")
	end
end;

function yes()
	Sale(72)
end;

function no()
end;
