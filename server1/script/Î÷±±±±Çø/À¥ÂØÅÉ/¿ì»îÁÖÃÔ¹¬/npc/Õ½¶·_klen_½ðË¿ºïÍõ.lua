-- �����������Թ� ս��NPC ��˿���� ��������
-- by��Dan_Deng(2003-07-30)

function OnDeath()
	Uworld31 = GetByte(GetTask(31),2)
	if (Uworld31 == 10) then
		if (HaveItem(8) == 0) and (HaveItem(117) == 1) then
			DelItem(117)
			AddEventItem(8)
			Msg2Player("��˿���ռ��ɽ��죬��û�ȥץ����˿��. ")
			AddNote("ץ����˿��. ")
		else
			Msg2Player("��˿����㲻ע��������. ")
		end
	end
end;
