--���ϱ��� ������ ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld36 = GetByte(GetTask(36),1)
	if (GetFaction() == "emei") or (Uworld36 == 127) then
		Say("���ģ���Щ��ȹЬñ�ɶ��Ǳ��ɵ������һ��һ�����ַ��ƶ��ɵģ���ϸ�ú��ġ���", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������װ��ֻ����ͬ�Ž���!")
	end
end;

function yes()
Sale(52)
end;

function no()
end;
