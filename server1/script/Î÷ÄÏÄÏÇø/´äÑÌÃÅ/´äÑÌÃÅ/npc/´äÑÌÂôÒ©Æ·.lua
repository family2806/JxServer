--������ ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld36 = GetByte(GetTask(36),2)
	if (GetFaction() == "cuiyan") or (Uworld36 == 127) then
		Say("װ��������ҩƷԽ�࣬��Խ����", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������ҩƷֻ����ͬ��.")
	end
end;

function yes()
Sale(68)
end;

function no()
end;
