--������ ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("�ɵ�ʥҩ��������ͳ�ɵ����ﶼ��", 2, "����/yes", "������/no")
	else
		Talk(1,"","�������ҩƷֻ������ͬ��.")
	end
end;

function yes()
Sale(77)
end;

function no()
end;
