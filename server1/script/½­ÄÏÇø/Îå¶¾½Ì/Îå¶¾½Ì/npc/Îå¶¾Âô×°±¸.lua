--�嶾�� ��װ���ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("���ǲ�Ҫ̫�����������õ�װ������ʹ�����.", 2, "����/yes", "������/no")
	else
		Talk(1,"","��������: ���ɵ�װ��������������")
	end
end;

function yes()
	Sale(79)
end;

function no()
end;
