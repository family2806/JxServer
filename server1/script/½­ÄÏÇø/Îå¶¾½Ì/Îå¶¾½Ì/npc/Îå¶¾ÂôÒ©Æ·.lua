--�嶾�� ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("��Ȼ���ɹ����Զ�Ϊ�����������ֻش��ĺ�ҩҲ�в��٣���Ҫ���Կ���", 2, "����/yes", "������/no")
	else
		Talk(1,"","��������: ���ҩ������������")
	end
end;

function yes()
Sale(80)
end;

function no()
end;
