-- �����޺����Թ� ս��NPC ??01�����ֳ�ʦ����
-- by��Dan_Deng(2003-08-04)

function OnDeath()
	UTask_sl = GetTask(7)
	if (UTask_sl == 60*256+10) then 		-- and (random(0,99) < 50)) then			-- �������У�50%����
		i = random(0,4)
		if (i == 1) and (HaveItem(217) == 0) then
			AddEventItem(217)
			Msg2Player("��������")
			AddNote("��������")
		elseif (i == 2) and (HaveItem(215) == 0) then
			AddEventItem(215)
			Msg2Player("��������. ")
			AddNote("��������. ")
		elseif (i == 3) and (HaveItem(216) == 0) then
			AddEventItem(216)
			Msg2Player("����ľ�� ")
			AddNote("����ľ��")
		elseif (i == 4) and (HaveItem(214) == 0) then
			AddEventItem(214)
			Msg2Player("���ò���. ")
			AddNote("���ò���. ")
		else			-- ����0ʱ����������
			return 0
		end
	end
end;
