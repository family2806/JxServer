--��ԭ���� �䵱�� ��ҩ�ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld31 = GetByte(GetTask(31),1)
	if (GetFaction() == "wudang") or (Uworld31 == 127) then
		Say("���£���Щҩ�趼�����䵱ɽ�����������Ĳ�ҩ�Ƴɵģ�����ֹѪ���ˣ�����ǿ���塣", 2, "����/yes", "������/no")
	else
		Talk(1,"","�����������ֻ��������.")
	end
end;

function yes()
Sale(65);  			
end;

function no()
end;






