--������ �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("���ɵ���ע����������������Ա����书���Ǻܾ�ͨ", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������ֻ������ͬ��.")
	end
end;

function yes()
	Sale(75)
end;

function no()
end;
