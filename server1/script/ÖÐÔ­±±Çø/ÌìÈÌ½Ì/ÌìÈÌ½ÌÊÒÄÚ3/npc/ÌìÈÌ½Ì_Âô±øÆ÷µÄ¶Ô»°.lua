--��ԭ���� ���̽� �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("���ﺱ����Щ�������Ǵ�����õĹ�������ģ�����һ����", 2, "����/yes", "������/no");
	else
		Talk(1,"","���������������ֻ�������ҳϵ���.")
	end
end;

function yes()
Sale(60)
end;

function no()
end;
