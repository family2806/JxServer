--��ԭ���� ���̽� ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("��ң���Щ���ǹ���Ĺ�Ů�����ַ��Ƶģ����ƣ��ֹ��ྫϸ����", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������װ��ֻ�������ҳϵ���.")
	end
end;

function yes()
Sale(61)
end;

function no()
end;
