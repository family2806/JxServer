--ʯ���� ·�� ��Ҷ�� ���������ͷ�
-- By: Dan_Deng(2003-09-03)

function main(sel)
	UTask_world22 = GetTask(22)
	if (UTask_world22 == 0) then		-- ��������
		if (GetSex() == 0) then
			Say("��磬�Ҹ������ڴ�����书������԰����������? ",2,"��������. /W22_get_yes","û�գ���æ. /W22_get_no")
		else
			Say("��㣬�Ҹ������ڴ�����书������԰����������? ",2,"��������. /W22_get_yes","û�գ���æ. /W22_get_no")
		end
	elseif (UTask_world22 == 5) then
		if (HaveItem(233) == 0) then		-- ���߶���
			AddEventItem(233)
			if (GetSex() == 0) then
				Talk(1,"","��磬�㲻Ҫ���Ǵ���Ŷ. ")
			else
				Talk(1,"","��㣬�㲻Ҫ���Ǵ���Ŷ. ")
			end
		else
			if (GetSex() == 0) then
				Talk(1,"","��磬���Կ���𣿷�������. ")
			else
				Talk(1,"","��㣬���Կ���𣿷�������. ")
			end
		end
	else				-- ������Ի�
		Talk(1,"","��ĸ���Ѿ������������ˣ������������������ṦҲ�ܺã��������ʹ���������. ")
	end
end;

function W22_get_yes()
	SetTask(22,5)
	AddEventItem(233)
	AddNote("�����񣺰�����Ҷ���������������ʦ. ")
	Msg2Player("�����񣺰�����Ҷ���������������ʦ. ")
end

function W22_get_no()
end
