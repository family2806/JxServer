--������ ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld38 = GetByte(GetTask(38),2)
	if (GetFaction() == "shaolin") or (Uworld38 == 127) then
		Say("��Ȼ˵�����书��ǿ���壬����Ҳ��������ʱ�����ԣ���Ҫ�и���ҩƷ.", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������ҩƷֻ����ͬ��")
	end
end;

function yes()
Sale(71)
end;

function no()
end;
