--���ϱ��� ������ �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("���飺���ɵ��Ӷ�������Ů���������ʹ�ı��д�������ɡ�", 2, "����/yes", "������/no")
	else
		Talk(1,"","����������ɱ���ֻ����ͬ�Ž���!")
	end
end;

function yes()
Sale(51)
end;

function no()
end;
