-- �嶾 ·��NPC �嶾����1 ��������
-- by��Dan_Deng(2003-08-05)

function main()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) then		-- ����������
		if ((HaveItem(227) == 1) and (HaveItem(223) == 1) and (HaveItem(225) == 1) and (HaveItem(226) == 1) and (HaveItem(227) == 1)) then
			Talk(1,"","��!��ô�ѿ�ȸ��ë�͸�����.Ӧ��Ҫ��ȥ�͸������ʦ�ֲŶ�. ")
		else
			Talk(1,"","����ʱ�䲻��������ô�ֵ�����? ������ôή�Ҳ����������ô�ܳ�Ϊ���ŵ�����?��������ΰ�. ")
		end
	elseif (Uworld37 == 0) and (GetLevel() >= 10) and (GetFaction ~= "wudu") then		--��������
		Say("Ҫ���Ϊ���ŵ���, Ҫ�����嶾��������. ����������",2,"�ǣ��������Կ�! /enroll_get_yes","������ֻ��������. /no")
	else							-- ����Ի�
		Talk(1,"","��Ҫ����. �����еĳ���������ҩ��ҽ��. ")
	end
end;

function enroll_get_yes()
	Uworld37 = SetByte(GetTask(37),2,10)
	SetTask(37,Uworld37)
	AddNote("�ӵ��嶾���������������ߵ����У���ῴ��5�����Ŀ�ȸë. ")
	Msg2Player("�ӵ��嶾���������������ߵ����У���ῴ��5�����Ŀ�ȸë. ")
end;

function no()
end;
