--ؤ�� ��װ���ĵ��ӶԻ�

function main(sel)
	Uworld30 = GetByte(GetTask(30),2)
	if (GetFaction() == "gaibang") or (Uworld30 == 127) then
		Say("��Ϊؤ����ӣ���Ҫ������ά������", 2, "����/yes", "������/no")
	else
		Talk(1,"","���������������װ��������������")
	end
end;

function yes()
Sale(73)
end;

function no()
end;
