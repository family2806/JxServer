-- ���Է�ɽ���Թ� ս��NPC ɽ��СͷĿ ����40������
-- by��Dan_Deng(2003-07-30)

function OnDeath()
	UTask_kl = GetTask(9);
	if (UTask_kl == 40*256+10) then			--��������
		SetTask(9,40*256+20)
		Msg2Player("���ɽ��СͷĿ��Ѫ���񽣱�ɽ��СͷĿ��������")
		AddNote("���ɽ��СͷĿ��Ѫ���񽣱�ɽ��СͷĿ�������� ")
	end
end;
