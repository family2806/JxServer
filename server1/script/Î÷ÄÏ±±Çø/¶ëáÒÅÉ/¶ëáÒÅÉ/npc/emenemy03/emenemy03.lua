--description: �����ɻ��ˮ�����
--author: yuanlan	
--date: 2003/3/5
-- Update: Dan_Deng(2003-08-12)

function OnDeath()
	UTask_em = GetTask(1)
	if (UTask_em == 30*256+50) and (HaveItem(120) == 0) and (random(0,99) < 50) then
		if (HaveItem(119) == 0) then			--û�м���
			Msg2Player("�ҵ����������û�м��ȣ�������ϸ�İ������")
		else							--�м���		
			DelItem(119)
			AddEventItem(120) 
			Msg2Player("�ȳ����")
--			SetTask(1, 38)
			AddNote("�ں�ɽ�����������ߣ��ҵ������")
		end			
	end
end;	
