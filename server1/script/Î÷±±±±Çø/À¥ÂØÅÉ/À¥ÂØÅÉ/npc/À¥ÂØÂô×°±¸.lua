--������ ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetFaction() == "kunlun") or (Uworld31 == 127) then
		Say("˵����ʦ���ۣ������������ĵ�Ȼ�����µ�һ�����䵱�����ռ���ɵ��Ʒ�", 2, "����/yes", "������/no")
	else
		Talk(1,"","�������װ��ֻ������ͬ��.")
	end
end;

function yes()
Sale(76)
end;

function no()
end;
