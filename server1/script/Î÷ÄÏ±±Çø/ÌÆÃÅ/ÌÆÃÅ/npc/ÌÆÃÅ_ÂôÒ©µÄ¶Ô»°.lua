--���ϱ��� ���� ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetFaction() == "tangmen") or (Uworld37 == 127) then
		Say(" �ƶ������ž����ŵ�ҽ����ν�������£������Ƶ���Щҩ�裬�ٺ٣�˵�ǻ�������׹�Ҳ��Ϊ������", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������ҩƷ������������!")
	end
end;

function yes()
Sale(56)
end;

function no()
end;
