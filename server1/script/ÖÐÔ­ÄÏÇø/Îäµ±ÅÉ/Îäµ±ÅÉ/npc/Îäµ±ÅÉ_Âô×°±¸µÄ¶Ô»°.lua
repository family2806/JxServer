--��ԭ���� �䵱�� ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("���������Ʈ�ݵ�����˭�᲻ϲ������һ���ɣ�", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������ֻ��������.")
	end
end;

function yes()
Sale(64)
end;

function no()
end;
