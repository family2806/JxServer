--�嶾�� �������ĵ��ӶԻ�
-- Update: Dan_Deng(2003-08-21) ����������ֻ��������

function main(sel)
	Uworld37 = GetByte(GetTask(37),2)
	if (GetFaction() == "wudu") or (Uworld37 == 127) then
		Say("����ԭ������������ȡʤ����Ϊ��֪���������������;�����˫", 2, "����/yes", "������/no")
	else
		Talk(1,"","��������:���ɵı���������������")
	end
end;

function yes()
	Sale(78)
end;

function no()
end;
