--��ԭ���� ���̽� ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld30 = GetByte(GetTask(30),1)
	if (GetFaction() == "tianren") or (Uworld30 == 127) then
		Say("���ӣ����Ǵ�����ҽ���ɲ����ι�ѷɫ����ҽ���٣���ҩҲ�ܶࡪ��", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������ҩֻ�������ҳϵ���.")
	end
end;

function yes()
Sale(62)
end;

function no()
end;
